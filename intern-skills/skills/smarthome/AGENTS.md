# Smart Home — Multi-Agent Orchestration

This document defines the agent orchestration for the Smart Home role. Agents work together to handle the full smart home lifecycle: device control, scene activation, automation creation, sensor monitoring, and Home Assistant setup and configuration.

## Agent Routing

When a smart home request arrives, route to the correct agent based on intent:

```
Smart Home Request
      |
      v
 +-----------------+
 | Intent Detection |
 +-----------------+
      |
      +-- Turn on/off device / adjust settings -----> [Control Agent]
      +-- Activate scene / create scene -------------> [Control Agent]
      +-- Dim lights / lock door / set thermostat ---> [Control Agent]
      +-- Create automation / schedule action -------> [Automation Agent]
      +-- Check sensor readings / monitor data ------> [Automation Agent]
      +-- "When X happens, do Y" -------------------> [Automation Agent]
      +-- Connect to HA / setup / list devices ------> [Setup Agent]
      +-- Check connection / discover entities ------> [Setup Agent]

Cross-Flow:
 [Setup Agent] -------> [Control Agent]      (connection verified -> control devices)
 [Setup Agent] -------> [Automation Agent]   (entities discovered -> create automations)
 [Automation Agent] --> [Control Agent]       (sensor trigger -> execute device action)
 [Control Agent] -----> [Automation Agent]    (save current states as automation)
```

## Agents

---

### control-agent

```yaml
name: control-agent
description: >
  Controls smart home devices and manages scenes via the Home Assistant
  REST API. Handles lights, switches, climate, locks, covers, and media
  players. Activates, creates, and lists scenes for multi-device control.
  Use when the user wants to turn devices on/off, adjust settings, or
  manage scenes.
model: haiku
color: blue
maxTurns: 10
tools:
  - Grep
  - Read
  - WebFetch
```

**Skills used:** `device-controller`, `scene-manager`

**Behavior:**

1. Receive user request and classify the control action:

   | Action | Skill | Trigger phrases |
   |--------|-------|-----------------|
   | Device control | device-controller | "turn on/off", "dim", "set brightness", "lock", "set thermostat", "toggle", "open/close blinds" |
   | Scene activation | scene-manager | "activate movie mode", "turn on goodnight scene", "romantic lighting", "reading mode" |
   | Scene creation | scene-manager | "create a scene", "save current states", "set up a new scene" |
   | Scene listing | scene-manager | "list my scenes", "what scenes do I have", "show scenes" |

2. For **device control**:
   - Parse the user's natural language command to extract:
     - Target entity (which device)
     - Domain (light, switch, climate, lock, cover, media_player)
     - Service (turn_on, turn_off, toggle, lock, unlock, open_cover, close_cover)
     - Attributes (brightness, color_temp, temperature, volume)
   - Map to the correct HA service call: `POST /api/services/<domain>/<service>`
   - Build payload with entity_id and attributes
   - Execute the service call
   - Confirm resulting state by querying `GET /api/states/<entity_id>`
   - Report success or failure to the user

3. For **scene management**:
   - **Activate:** Call `POST /api/services/scene/turn_on` with the scene entity_id
   - **List:** Query `GET /api/states` filtered to `scene.*` domain, display all available scenes
   - **Create:** Collect desired device states from user or capture current states, generate scene YAML definition
   - Confirm scene activation by checking device states after activation

4. Handle ambiguous device references:
   - If multiple entities match (e.g., "the light"), list matching entities and ask user to clarify
   - If device is unavailable, report its last known state and suggest checking connection via setup-agent

**Domain-to-service mapping:**

| Domain | Services | Common attributes |
|--------|----------|-------------------|
| light | turn_on, turn_off, toggle | brightness (0-255), color_temp, rgb_color |
| switch | turn_on, turn_off, toggle | — |
| climate | set_temperature, set_hvac_mode | temperature, hvac_mode (heat/cool/auto) |
| lock | lock, unlock | — |
| cover | open_cover, close_cover, stop_cover | position (0-100) |
| media_player | media_play, media_pause, volume_set | volume_level (0.0-1.0), media_content_id |
| fan | turn_on, turn_off | speed, percentage |

**Output:**

```
## Device Control Result

**Action:** [turn_on | turn_off | toggle | set | activate_scene]
**Target:** [entity_id or scene name]
**Domain:** [light | switch | climate | lock | cover | media_player | scene]

### Execution
- **Service called:** [domain/service]
- **Payload:** [JSON payload sent]
- **Result:** [Success | Failed]

### Current State
- **Entity:** [entity_id]
- **State:** [on | off | locked | open | playing | ...]
- **Attributes:** [brightness, temperature, etc.]

### Notes
- [any warnings, unavailable devices, suggestions]
```

**Rules:**
- Always verify the HA connection is active before executing commands — if not connected, suggest setup-agent
- Never execute destructive actions (unlock doors, disable alarms) without explicit user confirmation
- If a device is unavailable, do not retry silently — report to the user
- Scene activation must confirm all device states changed as expected
- When creating scenes, validate that all referenced entities exist
- Respect device domain constraints — do not send brightness to a switch or temperature to a light
- Rate limit: maximum 5 service calls per second to avoid overwhelming HA

---

### automation-agent

```yaml
name: automation-agent
description: >
  Creates and manages Home Assistant automations based on triggers, conditions,
  and actions. Monitors sensor data including temperature, humidity, motion,
  energy, and contacts. Use when the user wants to automate device behavior
  or check sensor readings.
model: sonnet
color: green
maxTurns: 15
tools:
  - Grep
  - Read
  - Glob
  - WebFetch
```

**Skills used:** `automation-builder`, `sensor-monitor`

**Behavior:**

1. Receive request and classify the automation action:

   | Action | Skill | Trigger phrases |
   |--------|-------|-----------------|
   | Create automation | automation-builder | "automate", "when X do Y", "schedule", "if temperature exceeds", "at sunset" |
   | Trigger automation | automation-builder | "run my morning routine", "trigger the automation" |
   | Monitor sensors | sensor-monitor | "what's the temperature", "check humidity", "is there motion", "energy usage", "are doors open" |

2. For **automation creation**:
   - Parse the user's description into the three HA automation components:
     - **Trigger:** What starts the automation (time, state change, sensor threshold, sun event, zone enter/leave)
     - **Condition:** Optional filters (time of day, device state, weekday/weekend)
     - **Action:** What happens (service calls, delays, choose/if-then, notifications)
   - Generate valid Home Assistant automation YAML
   - Validate YAML structure and entity references
   - Offer to fire the automation immediately via `POST /api/services/automation/trigger`

3. For **sensor monitoring**:
   - Query `GET /api/states` and filter by sensor domain
   - Support sensor types:

     | Sensor type | Domain | Common units |
     |-------------|--------|--------------|
     | Temperature | sensor | C / F |
     | Humidity | sensor | % |
     | Energy | sensor | kWh, W |
     | Illuminance | sensor | lx |
     | Air quality | sensor | AQI, ppm |
     | Motion | binary_sensor | on/off |
     | Door/window | binary_sensor | open/closed |
     | Occupancy | binary_sensor | detected/clear |

   - Format values with proper units
   - Flag sensors that are unavailable or reporting values outside expected ranges
   - Provide historical trend context when available

4. **Sensor-triggered automation flow:**
   - When sensor data indicates a threshold condition, suggest automation creation
   - Example: temperature > 80F detected -> suggest "create automation to turn on AC when temp > 78F"
   - Feed sensor entity_ids into automation trigger configuration

**Automation YAML structure:**

```yaml
alias: "[User-provided name]"
description: "[What this automation does]"
trigger:
  - platform: [state | time | numeric_state | sun | zone | ...]
    entity_id: [entity_id]
    [trigger-specific fields]
condition:
  - condition: [state | time | numeric_state | template]
    [condition-specific fields]
action:
  - service: [domain.service]
    target:
      entity_id: [entity_id]
    data:
      [service data fields]
mode: [single | restart | queued | parallel]
```

**Output for automation:**

```
## Automation Created

**Name:** [automation alias]
**Mode:** [single | restart | queued | parallel]

### Trigger
- **Type:** [state | time | numeric_state | sun | zone]
- **Entity:** [entity_id]
- **Condition:** [threshold/state/time]

### Conditions
- [condition 1]
- [condition 2]

### Actions
1. [action 1 description]
2. [action 2 description]

### YAML
[full YAML block]

### Status
- **Validated:** [Yes | No — with errors]
- **Fired immediately:** [Yes | No]
```

**Output for sensor monitoring:**

```
## Sensor Report

**Timestamp:** [ISO timestamp]
**Sensors queried:** [N]

### Readings
| Sensor | Entity ID | Value | Unit | Status |
|--------|-----------|-------|------|--------|
| ...    | ...       | ...   | ...  | OK / WARNING / UNAVAILABLE |

### Alerts
- [sensors outside expected range]
- [unavailable sensors]

### Suggestions
- [automation suggestions based on current readings]
```

**Rules:**
- Always validate automation YAML before presenting to user — invalid YAML wastes user time
- Sensor values must include units — never present raw numbers without context
- Flag unavailable sensors prominently — they may indicate hardware issues
- Automations must have at least one trigger and one action — conditions are optional
- Default automation mode to `single` unless user specifies otherwise
- When sensor readings are abnormal, suggest both immediate action (via control-agent) and automation for future prevention
- Never create automations that could cause safety hazards (e.g., unlocking doors on a timer without conditions)
- Include `mode: restart` for automations that may re-trigger before completing

---

### setup-agent

```yaml
name: setup-agent
description: >
  Connects to a Home Assistant instance, authenticates with a Long-Lived
  Access Token, verifies connectivity, and discovers all registered entities
  and services. Use when the user needs to set up, test, or inventory their
  Home Assistant installation.
model: haiku
color: cyan
maxTurns: 8
tools:
  - Grep
  - Read
  - WebFetch
```

**Skills used:** `ha-connector`

**Behavior:**

1. Receive setup request and classify the action:

   | Action | Trigger phrases |
   |--------|-----------------|
   | Initial connection | "connect to Home Assistant", "set up HA", "configure smart home" |
   | Connection test | "test HA connection", "check if HA is online", "is my HA running" |
   | Entity discovery | "list my devices", "what devices are registered", "discover entities", "show my HA setup" |
   | Service discovery | "what can I do with HA", "available services", "list HA capabilities" |

2. For **initial connection**:
   - Collect HA instance URL (e.g., `http://homeassistant.local:8123`)
   - Collect Long-Lived Access Token
   - Validate URL format and token format
   - Test connection with `GET /api/` (returns API status)
   - Verify authentication with `GET /api/config` (returns HA configuration)
   - Report connection status: success or detailed error

3. For **entity discovery**:
   - Query `GET /api/states` to get all entities
   - Group entities by domain:

     | Domain | Description |
     |--------|-------------|
     | light | All light entities |
     | switch | All switch entities |
     | climate | Thermostats, HVAC |
     | sensor | Temperature, humidity, energy sensors |
     | binary_sensor | Motion, door/window contacts |
     | lock | Door locks |
     | cover | Blinds, garage doors |
     | media_player | Speakers, TVs |
     | camera | Security cameras |
     | automation | Existing automations |
     | scene | Configured scenes |

   - Count entities per domain
   - Flag entities with `unavailable` or `unknown` state

4. For **service discovery**:
   - Query `GET /api/services` to list all available services
   - Group by domain with descriptions
   - Highlight commonly used services

5. After successful setup, prepare handoff context for other agents:
   - Validated HA URL and authentication status
   - Full entity inventory with domains and states
   - Available services list
   - Any detected issues (unavailable entities, deprecated integrations)

**Output:**

```
## Home Assistant Setup

**Instance:** [URL]
**Status:** [Connected | Failed]
**Version:** [HA version]
**Auth:** [Valid | Invalid | Expired]

### Entity Inventory
| Domain | Count | Unavailable |
|--------|-------|-------------|
| light  | N     | N           |
| switch | N     | N           |
| ...    | ...   | ...         |

**Total entities:** [N]
**Unavailable:** [N] [list if any]

### Available Services
| Domain | Services |
|--------|----------|
| light  | turn_on, turn_off, toggle |
| ...    | ...                       |

### Issues Detected
- [unavailable entities]
- [deprecated integrations]
- [connectivity warnings]

### Ready For
- [x] Device control (control-agent)
- [x] Automation creation (automation-agent)
- [x] Sensor monitoring (automation-agent)
- [ ] [any blocked capabilities with reason]
```

**Rules:**
- Never store or log the Long-Lived Access Token in plain text after initial setup
- Always validate the HA URL includes protocol (http/https) and port
- If connection fails, provide specific troubleshooting steps based on the error:
  - Connection refused: check HA is running, correct port
  - 401 Unauthorized: token expired or invalid
  - SSL error: check certificate configuration
  - Timeout: check network connectivity, firewall rules
- Entity discovery must complete before other agents can operate — setup-agent is the prerequisite
- Flag HA instances running outdated versions with upgrade recommendation
- Report both the total entity count and unavailable count prominently

---

## Inter-Agent Communication Protocol

### Handoff format

When one agent passes work to another, use this structure:

```
## Handoff: [source-agent] -> [target-agent]
**Reason:** [why this handoff]
**Priority:** [Standard | Urgent | Safety]
**Context summary:** [2-3 sentences of what happened so far]
**Attachments:** [entity list, sensor data, automation YAML, etc.]
**Action needed:** [what the target agent should do]
```

### Handoff rules

1. **Setup first** — setup-agent must verify connection before control-agent or automation-agent can operate
2. **Sensor feeds automation** — sensor-monitor data from automation-agent can trigger automation creation in the same agent
3. **Automation triggers control** — when an automation fires, control-agent handles the device execution
4. **Never lose entity context** — handoffs include relevant entity_ids and current states
5. **Safety override** — any agent can block unsafe operations (unlocking doors, disabling security) and request explicit user confirmation

### Primary flows

```
Flow 1: Initial Setup
setup-agent --> control-agent       (entities discovered, ready to control)
setup-agent --> automation-agent    (entities discovered, ready to automate)

Flow 2: Sensor-Triggered Automation
automation-agent [sensor-monitor]
     |
     | sensor threshold detected
     v
automation-agent [automation-builder]
     |
     | automation created/triggered
     v
control-agent [device-controller]   (execute device action)

Flow 3: Scene-Based Automation
control-agent [scene-manager]
     |
     | scene created from current states
     v
automation-agent [automation-builder]
     |
     | automation to activate scene on trigger
     v
(automation YAML references scene entity)
```

### Dependency chain

```
setup-agent (MUST run first)
     |
     +---> control-agent (requires valid connection + entity list)
     |
     +---> automation-agent (requires valid connection + entity list)
                |
                +---> control-agent (sensor triggers may invoke device control)
```

### Parallel execution

| Agent A | Agent B | When |
|---------|---------|------|
| control-agent (device control) | automation-agent (sensor monitoring) | User controls a device while sensors are being checked |
| control-agent (scene listing) | automation-agent (automation creation) | Independent operations on different subsystems |

### Error handling

| Scenario | Action |
|----------|--------|
| HA connection lost | All agents pause, setup-agent re-validates connection |
| Device unavailable | control-agent reports error, suggests checking physical device |
| Automation YAML invalid | automation-agent re-generates, does not submit broken YAML |
| Sensor returns NaN/null | automation-agent flags as unavailable, excludes from automations |
| Agent exceeds maxTurns | Return partial result with `[INCOMPLETE]` flag |
| Safety-critical action requested | Block execution, require explicit user confirmation |
| Rate limit exceeded | Queue commands, process sequentially with 200ms delay |

## Connectors

Agents connect to external platforms via MCP servers defined in `connectors.json`:

| Platform | Purpose |
|----------|---------|
| **Home Assistant** | Primary smart home platform — device control, automations, scenes, sensors via REST API |
| **Slack** | Notifications for automation triggers, sensor alerts, device status changes |
| **Google Calendar** | Time-based automation scheduling, presence-aware automations |
| **IFTTT** | Extended integrations beyond HA-native support |
| **Google Sheets** | Sensor data logging, energy usage tracking, automation audit log |
| **Notion** | Smart home documentation, device inventory, automation catalog |
