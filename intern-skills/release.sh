#!/bin/bash
set -euo pipefail

# ============================================================
#  release.sh - Release a new version of intern-skills
#  Usage:
#    ./release.sh patch   # 1.0.0 -> 1.0.1
#    ./release.sh minor   # 1.0.0 -> 1.1.0
#    ./release.sh major   # 1.0.0 -> 2.0.0
#    ./release.sh 2.3.1   # exact version
# ============================================================

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
VERSION_FILE="$ROOT_DIR/version.txt"
MANIFEST_FILE="$ROOT_DIR/manifest.json"
SKILLS_DIR="$ROOT_DIR/skills"
ZIP_DIR="$ROOT_DIR/skills_zip"
PLUGIN_DIR="$ROOT_DIR/openclaw_plugin"
PLUGIN_ZIP_DIR="$ROOT_DIR/plugin_zip"

# ---- Colors ----
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

log()   { echo -e "${GREEN}[✓]${NC} $1"; }
warn()  { echo -e "${YELLOW}[!]${NC} $1"; }
error() { echo -e "${RED}[✗]${NC} $1" >&2; exit 1; }
info()  { echo -e "${CYAN}[i]${NC} $1"; }

# ---- Read current version ----
CURRENT_VERSION=$(tr -d '[:space:]' < "$VERSION_FILE")
info "Current version: ${CYAN}$CURRENT_VERSION${NC}"

IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT_VERSION"

# ---- Compute new version ----
BUMP="${1:-}"

if [[ -z "$BUMP" ]]; then
  error "Usage: ./release.sh <patch|minor|major|x.y.z>"
fi

case "$BUMP" in
  patch) NEW_VERSION="$MAJOR.$MINOR.$((PATCH + 1))" ;;
  minor) NEW_VERSION="$MAJOR.$((MINOR + 1)).0" ;;
  major) NEW_VERSION="$((MAJOR + 1)).0.0" ;;
  *)
    if [[ "$BUMP" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
      NEW_VERSION="$BUMP"
    else
      error "Invalid argument: '$BUMP'. Use patch, minor, major, or x.y.z"
    fi
    ;;
esac

info "New version:     ${CYAN}$NEW_VERSION${NC}"
echo ""

# ---- Step 1: Update version.txt ----
echo "$NEW_VERSION" > "$VERSION_FILE"
log "Updated version.txt"

# ---- Step 2: Update manifest.json ----
if command -v jq &> /dev/null; then
  tmp=$(mktemp)
  jq --arg v "$NEW_VERSION" '.version = $v' "$MANIFEST_FILE" > "$tmp" && mv "$tmp" "$MANIFEST_FILE"
else
  sed -i.bak "s/\"version\": \"$CURRENT_VERSION\"/\"version\": \"$NEW_VERSION\"/" "$MANIFEST_FILE"
  rm -f "$MANIFEST_FILE.bak"
fi
log "Updated manifest.json"

# ---- Step 3: Rebuild zip files ----
info "Rebuilding skill zip files..."
mkdir -p "$ZIP_DIR"

GENERIC_DIR="$SKILLS_DIR/generic"

for role_dir in "$SKILLS_DIR"/*/; do
  role_name=$(basename "$role_dir")
  zip_file="$ZIP_DIR/$role_name.zip"

  rm -f "$zip_file"

  if [[ "$role_name" == "generic" ]]; then
    # Generic role: pack only its own skills
    (cd "$SKILLS_DIR" && zip -r -q "$zip_file" "$role_name"/)
  else
    # Other roles: copy generic skills into role dir, zip, then clean up
    for generic_skill in "$GENERIC_DIR"/*/; do
      skill_name=$(basename "$generic_skill")
      if [[ ! -d "$role_dir/$skill_name" ]]; then
        cp -r "$generic_skill" "$role_dir/$skill_name"
      fi
    done
    # Also copy generic AGENTS.md as AGENTS-generic.md if exists
    if [[ -f "$GENERIC_DIR/AGENTS.md" ]]; then
      cp "$GENERIC_DIR/AGENTS.md" "$role_dir/AGENTS-generic.md"
    fi

    (cd "$SKILLS_DIR" && zip -r -q "$zip_file" "$role_name"/)

    # Clean up: remove copied generic skills
    for generic_skill in "$GENERIC_DIR"/*/; do
      skill_name=$(basename "$generic_skill")
      rm -rf "$role_dir/$skill_name"
    done
    rm -f "$role_dir/AGENTS-generic.md"
  fi
  log "Packed ${CYAN}$role_name.zip${NC}"
done

# ---- Step 3b: Rebuild openclaw plugin zip files ----
if [[ -d "$PLUGIN_DIR" ]]; then
  info "Rebuilding openclaw plugin zip files..."
  mkdir -p "$PLUGIN_ZIP_DIR"

  for plugin_dir in "$PLUGIN_DIR"/*/; do
    plugin_name=$(basename "$plugin_dir")

    # Skip non-plugin directories (no openclaw.plugin.json)
    if [[ ! -f "$plugin_dir/openclaw.plugin.json" ]]; then
      continue
    fi

    zip_file="$PLUGIN_ZIP_DIR/$plugin_name.zip"
    rm -f "$zip_file"

    # Update version in openclaw.plugin.json
    if command -v jq &> /dev/null; then
      tmp=$(mktemp)
      jq --arg v "$NEW_VERSION" '.version = $v' "$plugin_dir/openclaw.plugin.json" > "$tmp" \
        && mv "$tmp" "$plugin_dir/openclaw.plugin.json"
    else
      sed -i.bak "s/\"version\": \"[^\"]*\"/\"version\": \"$NEW_VERSION\"/" "$plugin_dir/openclaw.plugin.json"
      rm -f "$plugin_dir/openclaw.plugin.json.bak"
    fi

    (cd "$PLUGIN_DIR" && zip -r -q "$zip_file" "$plugin_name"/ -x "*/.DS_Store" "*/.__*")
    log "Packed plugin ${CYAN}$plugin_name.zip${NC}"
  done
else
  warn "No openclaw_plugin/ directory found, skipping plugin zips"
fi

# ---- Step 4: Git operations ----
echo ""
info "Staging changes..."
cd "$ROOT_DIR"
git add version.txt manifest.json skills_zip/ plugin_zip/ openclaw_plugin/

warn "Ready to commit & tag version ${CYAN}v$NEW_VERSION${NC}"
read -rp "Proceed with commit and tag? [y/N] " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
  git commit -m "release: v$NEW_VERSION"
  git tag -a "v$NEW_VERSION" -m "Release v$NEW_VERSION"
  log "Committed and tagged ${CYAN}v$NEW_VERSION${NC}"

  read -rp "Push to remote (with tags)? [y/N] " push_confirm
  if [[ "$push_confirm" =~ ^[Yy]$ ]]; then
    git push && git push --tags
    log "Pushed to remote"
  else
    warn "Skipped push. Run manually:"
    echo "  git push && git push --tags"
  fi
else
  warn "Skipped commit. Changes are staged — commit manually when ready."
fi

echo ""
log "Release ${CYAN}v$NEW_VERSION${NC} done!"
