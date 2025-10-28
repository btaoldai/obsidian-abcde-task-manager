#!/bin/bash

# ============================================================
# Obsidian ABCDE Task Manager - Setup Script
# Version: 1.17
# Platform: Linux/Mac (Bash)
# ============================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

print_success() { echo -e "${GREEN}$1${NC}"; }
print_info() { echo -e "${CYAN}$1${NC}"; }
print_warning() { echo -e "${YELLOW}$1${NC}"; }
print_error() { echo -e "${RED}$1${NC}"; }

print_info "============================================================"
print_info "  Obsidian ABCDE Task Manager - Setup v1.17"
print_info "============================================================"
echo ""

# Check if running in Obsidian vault
vault_indicators=(".obsidian" "Dashboards" "Projects")
is_vault=true

for indicator in "${vault_indicators[@]}"; do
    if [ ! -d "$indicator" ] && [ ! -f "$indicator" ]; then
        is_vault=false
        break
    fi
done

if [ "$is_vault" = false ]; then
    print_warning "Warning: This doesn't appear to be an Obsidian vault directory."
    print_warning "Expected to find: .obsidian, Dashboards, Projects folders"
    echo ""
    read -p "Continue anyway? (y/N): " confirm
    if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
        print_info "Setup cancelled."
        exit 0
    fi
fi

# ============================================================
# Step 1: Create folder structure
# ============================================================

print_info "[1/6] Creating folder structure..."

folders=(
    ".obsidian"
    ".obsidian/snippets"
    "Dashboards"
    "Projects"
    "Projects/Administrative"
    "Projects/Health"
    "Projects/Professional"
    "Projects/Wiki"
    "Projects/Training"
    "src"
)

for folder in "${folders[@]}"; do
    if [ ! -d "$folder" ]; then
        mkdir -p "$folder"
        print_success "  ✓ Created: $folder"
    else
        print_info "  • Exists: $folder"
    fi
done

print_success "Folder structure ready!"
echo ""

# ============================================================
# Step 2: Check required files
# ============================================================

print_info "[2/6] Checking required files..."

required_files=(
    "Dashboards/Dashboard.md"
    "Dashboards/Kanban-Board.md"
    ".obsidian/snippets/abcde-colors.css"
    "src/Status-in-progress.md"
    "src/Status-completed.md"
    "src/Status-archived.md"
    "src/Status-paused.md"
    "src/Status-cancelled.md"
)

missing_files=()

for file in "${required_files[@]}"; do
    if [ ! -f "$file" ]; then
        missing_files+=("$file")
        print_warning "  ✗ Missing: $file"
    else
        print_success "  ✓ Found: $file"
    fi
done

if [ ${#missing_files[@]} -gt 0 ]; then
    print_error ""
    print_error "ERROR: Missing ${#missing_files[@]} required file(s)."
    print_error "Please ensure all files from the repository are present."
    print_error ""
    print_error "Missing files:"
    for file in "${missing_files[@]}"; do
        print_error "  - $file"
    done
    exit 1
fi

print_success "All required files present!"
echo ""

# ============================================================
# Step 3: Create Inbox.md if not exists
# ============================================================

print_info "[3/6] Setting up Inbox..."

inbox_path="Projects/Inbox.md"

if [ ! -f "$inbox_path" ]; then
    cat > "$inbox_path" << 'EOF'
# 📥 Quick Task Inbox

> Quick tasks created from Dashboard appear here with auto-generated project page links.

---

## Active Tasks

<!-- Tasks will be added here automatically -->

---

**Last updated**: $(date '+%Y-%m-%d %H:%M')
EOF
    print_success "  ✓ Created Inbox.md"
else
    print_info "  • Inbox.md already exists"
fi

echo ""

# ============================================================
# Step 4: Check Obsidian plugins
# ============================================================

print_info "[4/6] Checking Obsidian plugins..."

plugins_path=".obsidian/plugins"

if [ ! -d "$plugins_path" ]; then
    mkdir -p "$plugins_path"
    print_info "  • Created plugins directory"
fi

echo ""
print_warning "MANUAL STEP REQUIRED: Install Obsidian plugins"
echo ""
echo "Required plugins:"
echo "  [REQUIRED] Dataview"
echo "  [REQUIRED] Tasks"
echo "  [OPTIONAL] Kanban"
echo ""
print_info "To install plugins:"
print_info "1. Open Obsidian"
print_info "2. Settings → Community plugins → Browse"
print_info "3. Search and install: Dataview, Tasks, Kanban"
print_info "4. Enable each plugin after installation"
echo ""

# ============================================================
# Step 5: Configure Dataview
# ============================================================

print_info "[5/6] Configuring Dataview..."

dataview_config_path=".obsidian/plugins/dataview/data.json"

if [ -f "$dataview_config_path" ]; then
    if command -v jq &> /dev/null; then
        js_enabled=$(jq -r '.enableJavascript // false' "$dataview_config_path")
        
        if [ "$js_enabled" != "true" ]; then
            jq '.enableJavascript = true' "$dataview_config_path" > "${dataview_config_path}.tmp"
            mv "${dataview_config_path}.tmp" "$dataview_config_path"
            print_success "  ✓ Enabled Dataview JavaScript"
        else
            print_info "  • Dataview JavaScript already enabled"
        fi
    else
        print_warning "  ⚠ jq not found, cannot auto-configure Dataview"
        print_warning "  Please enable manually: Settings → Dataview → Enable JavaScript Queries"
    fi
else
    print_warning "  ⚠ Dataview not installed yet"
    print_warning "  After installing Dataview:"
    print_warning "  Settings → Dataview → Enable JavaScript Queries → ON"
fi

echo ""

# ============================================================
# Step 6: Enable CSS snippet
# ============================================================

print_info "[6/6] Enabling CSS snippet..."

appearance_config_path=".obsidian/appearance.json"

if [ -f "$appearance_config_path" ]; then
    if command -v jq &> /dev/null; then
        snippet_enabled=$(jq -r '.enabledCssSnippets[]? | select(. == "abcde-colors")' "$appearance_config_path")
        
        if [ -z "$snippet_enabled" ]; then
            jq '.enabledCssSnippets += ["abcde-colors"]' "$appearance_config_path" > "${appearance_config_path}.tmp"
            mv "${appearance_config_path}.tmp" "$appearance_config_path"
            print_success "  ✓ Enabled abcde-colors CSS snippet"
        else
            print_info "  • CSS snippet already enabled"
        fi
    else
        print_warning "  ⚠ jq not found, cannot auto-enable CSS snippet"
        print_warning "  Please enable manually: Settings → Appearance → CSS snippets → abcde-colors"
    fi
else
    print_warning "  ⚠ Appearance config not found"
    print_warning "  Please enable manually: Settings → Appearance → CSS snippets → abcde-colors"
fi

echo ""

# ============================================================
# Setup Complete
# ============================================================

print_success "============================================================"
print_success "  Setup Complete!"
print_success "============================================================"
echo ""

print_info "Next steps:"
print_info "1. Install required plugins (Dataview, Tasks)"
print_info "2. Enable Dataview JavaScript Queries"
print_info "3. Restart Obsidian"
print_info "4. Open: Dashboards/Dashboard.md"
echo ""

print_info "Documentation:"
print_info "• README.md (English)"
print_info "• README.fr.md (French)"
echo ""

print_success "🚀 Ready to use ABCDE Task Manager!"
echo ""
