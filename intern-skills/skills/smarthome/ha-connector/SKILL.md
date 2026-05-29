---
name: ha-connector
description: >
  Connects to a Home Assistant instance, authenticates via Long-Lived Access Token, verifies connectivity, and discovers all registered entities and services.
  Use when the user says "connect to Home Assistant", "set up HA", "check if HA is online",
  "list my smart home devices", "discover all entities", "test HA connection",
  "what devices are registered", "show me my HA setup",
  or wants to set up, verify, or inventory a Home Assistant instance.
---

# HA Connector

## Quick Start
Establish and verify a connection to Home Assistant using its REST API. Authenticate with a Long-Lived Access Token and return a full inventory of entities and available services grouped by domain.

## Workflow
1. Collect connection details: base URL (e.g., `http://homeassistant.local:8123`) and Long-Lived Access Token
2. Verify connectivity by calling `GET /api/` — check for `{"message": "API running."}`
3. Fetch all entity states via `GET /api/states`
4. Fetch all available services via `GET /api/services`
5. Group entities by domain (light, switch, climate, lock, media_player, sensor, cover, etc.)
6. Return a structured inventory with entity counts per domain and connection status

## Examples

**Example 1: Test connection and list devices**
Input: "Connect to my Home Assistant at http://192.168.1.10:8123 with token abc123"
Output:
```
HOME ASSISTANT CONNECTION
==========================
URL:    http://192.168.1.10:8123
Status: Connected
HA Version: 2024.3.0

ENTITY INVENTORY (42 total)
============================
Domain          | Count | Sample Entities
----------------|-------|------------------------------------------
light           |  8    | light.living_room, light.bedroom_main
switch          |  6    | switch.coffee_maker, switch.garden_pump
climate         |  2    | climate.downstairs_thermostat
sensor          | 14    | sensor.outdoor_temp, sensor.humidity
lock            |  2    | lock.front_door, lock.back_door
cover           |  3    | cover.living_room_blinds
media_player    |  4    | media_player.living_room_tv
binary_sensor   |  3    | binary_sensor.motion_hallway

AVAILABLE SERVICE DOMAINS (12)
================================
light, switch, climate, lock, cover, media_player,
scene, automation, script, notify, input_boolean, homeassistant
```

**Example 2: Connection failure**
Input: "Connect to http://192.168.1.99:8123"
Output:
```
HOME ASSISTANT CONNECTION
==========================
URL:    http://192.168.1.99:8123
Status: FAILED — Connection refused (host unreachable or wrong port)

Suggestions:
- Verify the IP address and port (default: 8123)
- Ensure Home Assistant is running
- Check firewall rules allow port 8123
- Try using the hostname: http://homeassistant.local:8123
```

## Tools
- Use `WebFetch` to call the Home Assistant REST API endpoints
- Use `Bash` to test reachability with a curl command if WebFetch is unavailable

## Error Handling
- If base URL not provided → ask for the HA instance URL
- If token not provided → explain how to generate one: Profile → Long-Lived Access Tokens → Create Token
- If `401 Unauthorized` → token is invalid or expired; ask user to regenerate
- If connection times out → suggest checking URL, port, and network reachability
- If `api/states` returns empty → warn that no entities are registered yet

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~home assistant | Authenticate and communicate with the Home Assistant REST API |
| ~~IoT platform | Discover devices across multiple smart home platforms |
| ~~voice assistant | Enable voice-triggered connection status checks and device discovery |

## Rules
- Always include `Authorization: Bearer <token>` header in every request
- Base URL must not have a trailing slash
- Default port is 8123; HTTPS on 443 if using HA Cloud or reverse proxy
- entity_id format: `<domain>.<name>` (e.g., `light.kitchen`, `switch.fan`)
- Never log or expose the access token in output
- Token generation path: HA Profile page → Long-Lived Access Tokens section

## Output Template
```
HOME ASSISTANT CONNECTION
==========================
URL:    [HA Base URL]
Status: [Connected / FAILED — reason]
HA Version: [version or N/A]

ENTITY INVENTORY ([total] total)
=================================
Domain          | Count | Sample Entities
----------------|-------|----------------

AVAILABLE SERVICE DOMAINS ([count])
=====================================
[comma-separated domain list]
```

## Related Skills
- `device-controller` -- For controlling devices after connection is established
- `sensor-monitor` -- For reading sensor data from discovered entities
- `scene-manager` -- For listing and activating scenes found in the entity registry
