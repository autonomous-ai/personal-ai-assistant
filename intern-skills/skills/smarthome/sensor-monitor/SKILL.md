---
name: sensor-monitor
description: >
  Queries and monitors Home Assistant sensor states including temperature, humidity, motion, energy consumption, door/window contacts, and air quality.
  Use when the user says "what's the temperature", "check humidity levels",
  "is there motion in the hallway", "show energy usage", "are any doors open",
  "what are my sensor readings", "is the garage door closed", "air quality check",
  "how much power am I using", or wants to read sensor values, check binary sensor states, or monitor environmental data.
---

# Sensor Monitor

## Quick Start
Fetch sensor states from `GET /api/states`, filter by domain or entity_id, format the values with their units, and flag any sensors that are unavailable or outside expected ranges.

## Workflow
1. Identify the target: specific entity_id, a domain (sensor, binary_sensor), or a keyword (e.g., "temperature", "energy")
2. Call `GET /api/states/<entity_id>` for a single sensor or `GET /api/states` for bulk queries
3. Extract `state`, `unit_of_measurement`, `device_class`, and relevant attributes
4. Apply formatting based on device_class (temperature, humidity, power, energy, illuminance, etc.)
5. Flag sensors that are `unavailable`, `unknown`, or outside the expected range
6. Present a structured reading or comparison table

## Examples

**Example 1: Read all temperature sensors**
Input: "What are the current temperatures in my house?"
Output:
```
TEMPERATURE SENSORS — 03/24/2026 09:15 AM
==========================================
Sensor                        | Value  | Status
------------------------------|--------|--------
sensor.living_room_temp       | 72.3°F | Normal
sensor.bedroom_temp           | 69.8°F | Normal
sensor.outdoor_temp           | 58.1°F | Normal
sensor.basement_temp          | 64.2°F | Normal
sensor.attic_temp             | 81.5°F | Warning (>80°F)

Alerts: 1 sensor above threshold
```

**Example 2: Energy usage snapshot**
Input: "Show me today's energy consumption"
Output:
```
ENERGY SENSORS — 03/24/2026
=============================
Sensor                         | Value      | Unit
-------------------------------|------------|------
sensor.grid_consumption_today  | 12.4       | kWh
sensor.solar_production_today  | 8.7        | kWh
sensor.net_consumption_today   | 3.7        | kWh
sensor.current_power_draw      | 1,240      | W
sensor.monthly_consumption     | 287.6      | kWh

Solar is covering 70.2% of today's usage.
```

**Example 3: Check motion sensors**
Input: "Are any motion sensors triggered right now?"
Output:
```
BINARY SENSORS — motion (03/24/2026 09:15 AM)
================================================
Sensor                          | State | Last Changed
--------------------------------|-------|---------------------
binary_sensor.motion_hallway    | on    | 09:14:32 AM (43s ago)
binary_sensor.motion_kitchen    | off   | 08:55:10 AM
binary_sensor.motion_garage     | off   | 07:30:00 AM
binary_sensor.motion_front_door | off   | 09:00:15 AM

Active: 1 sensor (hallway)
```

## Tools
- Use `WebFetch` to call `GET /api/states` and `GET /api/states/<entity_id>`
- Use `Bash` with curl for bulk state fetches if WebFetch has size limits

## Error Handling
- If entity is `unavailable` → report it as unavailable and suggest checking device connectivity
- If entity is `unknown` → the sensor has not reported a value yet; note the last_updated timestamp
- If no sensors match the search term → list all sensors by device_class and ask user to pick
- If unit_of_measurement is missing → display raw state value with a note

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~home assistant | Read real-time sensor data from the Home Assistant REST API |
| ~~IoT platform | Monitor sensors across multiple smart home ecosystems |
| ~~voice assistant | Ask for sensor readings via voice and receive spoken responses |

## Rules
- Temperature: display as °F by default (convert from °C if `unit_of_measurement` is °C)
- Energy: display kWh for cumulative, W for instantaneous power
- Binary sensors: display `on`/`off` as active/inactive with last-changed timestamp
- Flag sensors as Warning if value exceeds common thresholds:
  - Temperature: <32°F or >95°F (indoor), >100°F (attic/outdoor)
  - Humidity: <20% or >70%
  - CO2: >1000 ppm
- Always show `last_updated` timestamp for each sensor reading
- Sort sensors alphabetically within each device_class group

## Output Template
```
[DEVICE CLASS] SENSORS — [MM/DD/YYYY HH:MM AM/PM]
===================================================
Sensor                  | Value | Unit | Status
------------------------|-------|------|--------
[entity_id]             | [val] | [u]  | [Normal / Warning / Unavailable]

Summary: [X] sensors active, [Y] warnings, [Z] unavailable
```

## Related Skills
- `automation-builder` -- For creating automations triggered by sensor thresholds
- `device-controller` -- For controlling devices based on sensor readings
- `ha-connector` -- For discovering all available sensors in the entity registry
