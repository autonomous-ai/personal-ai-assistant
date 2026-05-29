---
name: device-controller
description: >
  Controls Home Assistant smart home devices including lights, switches, climate, locks, covers, and media players by calling the appropriate HA service via the REST API.
  Use when the user says "turn on the lights", "turn off the fan", "set brightness to 50%",
  "lock the front door", "set thermostat to 72", "open the blinds",
  "dim the bedroom light", "play music on the speaker", "toggle the switch",
  or wants to turn devices on/off, adjust brightness or color, set temperature, lock/unlock, or control media players.
---

# Device Controller

## Quick Start
Map the user's natural language command to the correct Home Assistant domain and service, build the service call payload, and execute it via `POST /api/services/<domain>/<service>`. Confirm the resulting state.

## Workflow
1. Parse the user's intent: identify the target device (entity_id) and desired action
2. Map the action to the correct HA domain and service (see Rules for the full map)
3. Build the JSON payload with entity_id and any additional parameters (brightness, temperature, color, etc.)
4. Call `POST /api/services/<domain>/<service>` with the payload
5. Confirm the new state by calling `GET /api/states/<entity_id>`
6. Return a structured confirmation with the before/after state

## Examples

**Example 1: Control a light with brightness**
Input: "Turn on the living room lights at 60% brightness with warm white"
Output:
```
DEVICE COMMAND
==============
Entity:  light.living_room
Service: light.turn_on
Payload: {
  "entity_id": "light.living_room",
  "brightness_pct": 60,
  "color_temp_kelvin": 2700
}

RESULT
======
Status:      200 OK
New State:   on
Brightness:  153 (60%)
Color Temp:  2700K (warm white)
```

**Example 2: Set thermostat temperature**
Input: "Set the downstairs thermostat to 72°F in cooling mode"
Output:
```
DEVICE COMMAND
==============
Entity:  climate.downstairs_thermostat
Service: climate.set_temperature
Payload: {
  "entity_id": "climate.downstairs_thermostat",
  "temperature": 72,
  "hvac_mode": "cool"
}

RESULT
======
Status:       200 OK
HVAC Mode:    cool
Target Temp:  72°F
Current Temp: 76°F
```

**Example 3: Lock the front door**
Input: "Lock the front door"
Output:
```
DEVICE COMMAND
==============
Entity:  lock.front_door
Service: lock.lock
Payload: { "entity_id": "lock.front_door" }

RESULT
======
Status:    200 OK
New State: locked
```

## Tools
- Use `WebFetch` to call `POST /api/services/<domain>/<service>` and `GET /api/states/<entity_id>`
- Use `Bash` with curl as a fallback for service calls

## Error Handling
- If entity_id is unknown → call `GET /api/states` to search for the closest match by name
- If `404` returned → entity_id does not exist; list similar entities and ask user to confirm
- If device is `unavailable` → notify user; suggest checking device power and connectivity
- If parameter out of range (e.g., brightness > 100%) → clamp to valid range and note the correction
- If `400 Bad Request` → log the payload and ask user to verify the parameters

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~home assistant | Send commands to devices via the Home Assistant REST API |
| ~~IoT platform | Control devices across multiple smart home ecosystems |
| ~~voice assistant | Accept voice commands for hands-free device control |

## Rules
**Service map by domain:**
- `light`: `turn_on` (brightness_pct 0-100, color_temp_kelvin, rgb_color, transition), `turn_off`, `toggle`
- `switch`: `turn_on`, `turn_off`, `toggle`
- `climate`: `set_temperature` (temperature, hvac_mode), `set_hvac_mode` (off/heat/cool/heat_cool/auto/dry/fan_only), `set_fan_mode`, `set_humidity`
- `lock`: `lock`, `unlock`, `open` (code optional)
- `cover`: `open_cover`, `close_cover`, `stop_cover`, `set_cover_position` (position 0-100)
- `media_player`: `turn_on`, `turn_off`, `play_media`, `media_play`, `media_pause`, `media_stop`, `volume_set` (volume_level 0-1), `volume_mute`, `media_next_track`, `media_previous_track`
- `fan`: `turn_on`, `turn_off`, `set_percentage` (percentage 0-100), `set_direction`
- `scene`: `turn_on` (entity_id is the scene entity)
- Always verify the entity's `supported_features` attribute before sending optional parameters
- Temperature defaults to Fahrenheit unless the user specifies Celsius
- Never expose the access token in command output

## Output Template
```
DEVICE COMMAND
==============
Entity:  [entity_id]
Service: [domain.service]
Payload: [JSON payload]

RESULT
======
Status:    [HTTP status]
New State: [state value]
[Additional state attributes if relevant]
```

## Related Skills
- `ha-connector` -- For establishing connection and discovering available devices
- `scene-manager` -- For activating multi-device scenes instead of controlling one device at a time
- `automation-builder` -- For automating device control based on triggers and conditions
