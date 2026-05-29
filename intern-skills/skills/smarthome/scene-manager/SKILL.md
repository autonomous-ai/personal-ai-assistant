---
name: scene-manager
description: >
  Manages and activates Home Assistant scenes, creates new scenes from current device states, lists all available scenes, and handles room-level device grouping.
  Use when the user says "activate movie mode", "turn on the goodnight scene",
  "create a new scene", "set up reading mode", "list my scenes",
  "save current device states as a scene", "romantic lighting please",
  "what scenes do I have", or wants to activate, create, list, or manage multi-device scenes in Home Assistant.
---

# Scene Manager

## Quick Start
Activate scenes via `POST /api/services/scene/turn_on`, list all scenes via `GET /api/states` filtered to the `scene` domain, and generate scene YAML definitions from current device states or user-specified device configurations.

## Workflow
1. Identify the request type: activate, list, create, or describe a scene
2. **Activate:** map the user's scene name to a `scene.*` entity_id, then call `scene.turn_on`
3. **List:** fetch all states, filter by `scene` domain, and return a formatted list with descriptions
4. **Create from current state:** fetch current states of the target devices, build scene YAML, present for user review
5. **Create from specification:** build scene YAML from user-described device configurations
6. Confirm activation result or present the generated YAML for the user to add to HA

## Examples

**Example 1: Activate a scene**
Input: "Activate movie mode"
Output:
```
SCENE ACTIVATION
================
Scene:   scene.movie_mode
Service: scene.turn_on

Result: 200 OK — Scene activated

Devices updated:
- light.living_room    → dimmed to 20%, warm white (2200K)
- light.hallway        → off
- cover.living_room_blinds → closed (position: 0)
- media_player.living_room_tv → on
```

**Example 2: List all scenes**
Input: "Show me all available scenes"
Output:
```
AVAILABLE SCENES (8 total)
===========================
Scene Entity                  | Friendly Name       | Last Activated
------------------------------|---------------------|---------------------
scene.morning_routine         | Morning Routine     | 03/24/2026 06:30 AM
scene.movie_mode              | Movie Mode          | 03/23/2026 08:15 PM
scene.dinner_time             | Dinner Time         | 03/23/2026 06:45 PM
scene.goodnight               | Goodnight           | 03/23/2026 11:00 PM
scene.away_mode               | Away Mode           | 03/22/2026 09:00 AM
scene.romantic                | Romantic            | 03/20/2026 07:30 PM
scene.bright_work             | Bright Work         | 03/24/2026 08:00 AM
scene.kids_bedtime            | Kids Bedtime        | 03/23/2026 08:30 PM
```

**Example 3: Create a new scene**
Input: "Create a 'reading' scene: living room light at 70% cool white, all other lights off"
Output:
```yaml
# Add this to your scenes.yaml or via HA UI → Scenes → Add Scene
- name: Reading
  entities:
    light.living_room:
      state: "on"
      brightness_pct: 70
      color_temp_kelvin: 4000
    light.bedroom_main:
      state: "off"
    light.kitchen:
      state: "off"
    light.hallway:
      state: "off"
```
Scene entity_id will be: `scene.reading`

## Tools
- Use `WebFetch` to call `POST /api/services/scene/turn_on` and `GET /api/states`
- Use `Write` to save generated scene YAML to a file if the user requests it

## Error Handling
- If scene name is ambiguous → list scenes with similar names and ask user to confirm
- If scene entity_id is not found → search `GET /api/states` for `scene.*` entities and suggest matches
- If a device in the scene is `unavailable` → activate the scene anyway and flag the unavailable device
- If user asks to "save" a new scene → present YAML and explain: add to `scenes.yaml` or use HA UI → Configuration → Scenes

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~home assistant | Activate and create scenes via the Home Assistant REST API |
| ~~IoT platform | Coordinate scenes across multiple smart home ecosystems |
| ~~voice assistant | Activate scenes with voice commands like "Hey Google, movie time" |

## Rules
- Scene entity_id format: `scene.<name_with_underscores>`
- `scene.turn_on` accepts optional `transition` parameter (seconds) for smooth lighting changes
- When creating scenes from current state, only include entities that are not in `unavailable` or `unknown` state
- For room-level grouping use `area_id` or list all `entity_id` values in the room
- Scenes override only the attributes specified — unspecified devices are not affected
- Do not include sensitive entities (locks, alarms) in scenes without explicit user confirmation

## Output Template
```
SCENE ACTIVATION
================
Scene:   [scene.entity_id]
Service: scene.turn_on

Result: [HTTP status] — [success message or error]

Devices updated:
- [entity_id] → [new state / attributes]
```

## Related Skills
- `device-controller` -- For controlling individual devices outside of scenes
- `automation-builder` -- For automating scene activation based on triggers
- `sensor-monitor` -- For checking sensor states before creating or activating scenes
