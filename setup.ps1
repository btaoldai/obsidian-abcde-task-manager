# ============================================================
# Obsidian ABCDE Task Manager - Setup Script
# Version: 1.17
# Platform: Windows (PowerShell 5.1+)
# ============================================================

$ErrorActionPreference = "Stop"

# Colors for output
function Write-Success { Write-Host $args -ForegroundColor Green }
function Write-Info { Write-Host $args -ForegroundColor Cyan }
function Write-Warning { Write-Host $args -ForegroundColor Yellow }
function Write-Error { Write-Host $args -ForegroundColor Red }

Write-Info "============================================================"
Write-Info "  Obsidian ABCDE Task Manager - Setup v1.17"
Write-Info "============================================================"
Write-Host ""

# Check if running in Obsidian vault
$vaultIndicators = @(".obsidian", "Dashboards", "Projects")
$isVault = $true

foreach ($indicator in $vaultIndicators) {
    if (-not (Test-Path $indicator)) {
        $isVault = $false
        break
    }
}

if (-not $isVault) {
    Write-Warning "Warning: This doesn't appear to be an Obsidian vault directory."
    Write-Warning "Expected to find: .obsidian, Dashboards, Projects folders"
    Write-Host ""
    $confirm = Read-Host "Continue anyway? (y/N)"
    if ($confirm -ne "y" -and $confirm -ne "Y") {
        Write-Info "Setup cancelled."
        exit 0
    }
}

# ============================================================
# Step 1: Create folder structure
# ============================================================

Write-Info "[1/6] Creating folder structure..."

$folders = @(
    ".obsidian",
    ".obsidian\snippets",
    "Dashboards",
    "Projects",
    "Projects\Administrative",
    "Projects\Health",
    "Projects\Professional",
    "Projects\Wiki",
    "Projects\Training",
    "src"
)

foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
        Write-Success "  ✓ Created: $folder"
    } else {
        Write-Info "  • Exists: $folder"
    }
}

Write-Success "Folder structure ready!"
Write-Host ""

# ============================================================
# Step 2: Check required files
# ============================================================

Write-Info "[2/6] Checking required files..."

$requiredFiles = @(
    "Dashboards\Dashboard.md",
    "Dashboards\Kanban-Board.md",
    ".obsidian\snippets\abcde-colors.css",
    "src\Status-in-progress.md",
    "src\Status-completed.md",
    "src\Status-archived.md",
    "src\Status-paused.md",
    "src\Status-cancelled.md"
)

$missingFiles = @()

foreach ($file in $requiredFiles) {
    if (-not (Test-Path $file)) {
        $missingFiles += $file
        Write-Warning "  ✗ Missing: $file"
    } else {
        Write-Success "  ✓ Found: $file"
    }
}

if ($missingFiles.Count -gt 0) {
    Write-Error ""
    Write-Error "ERROR: Missing $($missingFiles.Count) required file(s)."
    Write-Error "Please ensure all files from the repository are present."
    Write-Error ""
    Write-Error "Missing files:"
    foreach ($file in $missingFiles) {
        Write-Error "  - $file"
    }
    exit 1
}

Write-Success "All required files present!"
Write-Host ""

# ============================================================
# Step 3: Create Inbox.md if not exists
# ============================================================

Write-Info "[3/6] Setting up Inbox..."

$inboxPath = "Projects\Inbox.md"

if (-not (Test-Path $inboxPath)) {
    $inboxContent = @"
# 📥 Quick Task Inbox

> Quick tasks created from Dashboard appear here with auto-generated project page links.

---

## Active Tasks

<!-- Tasks will be added here automatically -->

---

**Last updated**: $(Get-Date -Format "yyyy-MM-dd HH:mm")
"@

    Set-Content -Path $inboxPath -Value $inboxContent -Encoding UTF8
    Write-Success "  ✓ Created Inbox.md"
} else {
    Write-Info "  • Inbox.md already exists"
}

Write-Host ""

# ============================================================
# Step 4: Check Obsidian plugins
# ============================================================

Write-Info "[4/6] Checking Obsidian plugins..."

$pluginsPath = ".obsidian\plugins"

if (-not (Test-Path $pluginsPath)) {
    New-Item -ItemType Directory -Path $pluginsPath -Force | Out-Null
    Write-Info "  • Created plugins directory"
}

Write-Host ""
Write-Warning "MANUAL STEP REQUIRED: Install Obsidian plugins"
Write-Host ""
Write-Host "Required plugins:"
Write-Host "  [REQUIRED] Dataview"
Write-Host "  [REQUIRED] Tasks"
Write-Host "  [OPTIONAL] Kanban"
Write-Host ""
Write-Info "To install plugins:"
Write-Info "1. Open Obsidian"
Write-Info "2. Settings → Community plugins → Browse"
Write-Info "3. Search and install: Dataview, Tasks, Kanban"
Write-Info "4. Enable each plugin after installation"
Write-Host ""

# ============================================================
# Step 5: Configure Dataview
# ============================================================

Write-Info "[5/6] Configuring Dataview..."

$dataviewConfigPath = ".obsidian\plugins\dataview\data.json"

if (Test-Path $dataviewConfigPath) {
    try {
        $dataviewConfig = Get-Content $dataviewConfigPath -Raw | ConvertFrom-Json
        
        if ($dataviewConfig.enableJavascript -ne $true) {
            $dataviewConfig.enableJavascript = $true
            $dataviewConfig | ConvertTo-Json -Depth 10 | Set-Content $dataviewConfigPath -Encoding UTF8
            Write-Success "  ✓ Enabled Dataview JavaScript"
        } else {
            Write-Info "  • Dataview JavaScript already enabled"
        }
    } catch {
        Write-Warning "  ⚠ Could not auto-configure Dataview"
        Write-Warning "  Please enable manually: Settings → Dataview → Enable JavaScript Queries"
    }
} else {
    Write-Warning "  ⚠ Dataview not installed yet"
    Write-Warning "  After installing Dataview:"
    Write-Warning "  Settings → Dataview → Enable JavaScript Queries → ON"
}

Write-Host ""

# ============================================================
# Step 6: Enable CSS snippet
# ============================================================

Write-Info "[6/6] Enabling CSS snippet..."

$appearanceConfigPath = ".obsidian\appearance.json"

if (Test-Path $appearanceConfigPath) {
    try {
        $appearanceConfig = Get-Content $appearanceConfigPath -Raw | ConvertFrom-Json
        
        if (-not $appearanceConfig.enabledCssSnippets) {
            $appearanceConfig | Add-Member -MemberType NoteProperty -Name "enabledCssSnippets" -Value @() -Force
        }
        
        if ($appearanceConfig.enabledCssSnippets -notcontains "abcde-colors") {
            $appearanceConfig.enabledCssSnippets += "abcde-colors"
            $appearanceConfig | ConvertTo-Json -Depth 10 | Set-Content $appearanceConfigPath -Encoding UTF8
            Write-Success "  ✓ Enabled abcde-colors CSS snippet"
        } else {
            Write-Info "  • CSS snippet already enabled"
        }
    } catch {
        Write-Warning "  ⚠ Could not auto-enable CSS snippet"
        Write-Warning "  Please enable manually: Settings → Appearance → CSS snippets → abcde-colors"
    }
} else {
    Write-Warning "  ⚠ Appearance config not found"
    Write-Warning "  Please enable manually: Settings → Appearance → CSS snippets → abcde-colors"
}

Write-Host ""

# ============================================================
# Setup Complete
# ============================================================

Write-Success "============================================================"
Write-Success "  Setup Complete!"
Write-Success "============================================================"
Write-Host ""

Write-Info "Next steps:"
Write-Info "1. Install required plugins (Dataview, Tasks)"
Write-Info "2. Enable Dataview JavaScript Queries"
Write-Info "3. Restart Obsidian"
Write-Info "4. Open: Dashboards/Dashboard.md"
Write-Host ""

Write-Info "Documentation:"
Write-Info "• README.md (English)"
Write-Info "• README.fr.md (French)"
Write-Host ""

Write-Success "🚀 Ready to use ABCDE Task Manager!"
Write-Host ""

Read-Host "Press Enter to exit"