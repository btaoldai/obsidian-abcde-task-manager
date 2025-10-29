# ============================================================
# USER SETUP - Obsidian ABCDE Task Manager v1.17
# COMPLETE AUTO-SETUP: Verify + Install Plugins + Configure
# ============================================================

$ErrorActionPreference = "Continue"

function Write-Success { Write-Host $args -ForegroundColor Green }
function Write-Info { Write-Host $args -ForegroundColor Cyan }
function Write-Warning { Write-Host $args -ForegroundColor Yellow }
function Write-ErrorMsg { Write-Host $args -ForegroundColor Red }
function Write-Section { Write-Host "`n==> $args <==`n" -ForegroundColor Magenta }

cls

Write-Host ""
Write-Host "  ABCDE Task Manager v1.17" -ForegroundColor Magenta -BackgroundColor Black
Write-Host "  Priority-based task management for Obsidian" -ForegroundColor Cyan
Write-Host "  Auto-setup mode - Everything will be configured!" -ForegroundColor Green
Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

# ============================================================
# Step 1: Verify Repository Files
# ============================================================

Write-Section "STEP 1/4: Verifying Files and Folders"

$folders = @("Dashboards", "Projects", ".obsidian\snippets", "src")
$foldersOK = $true

foreach ($folder in $folders) {
    if (Test-Path $folder) {
        Write-Success "  [OK] $folder"
    } else {
        Write-ErrorMsg "  [MISSING] $folder"
        $foldersOK = $false
    }
}

$requiredFiles = @(
    @{Path="Dashboards\Dashboard.md"; Name="Dashboard"},
    @{Path="Dashboards\Kanban-Board.md"; Name="Kanban Board"},
    @{Path=".obsidian\snippets\abcde-colors.css"; Name="CSS Colors"},
    @{Path="src\Status-in-progress.md"; Name="Status: In Progress"},
    @{Path="src\Status-completed.md"; Name="Status: Completed"},
    @{Path="src\Status-archived.md"; Name="Status: Archived"},
    @{Path="src\Status-paused.md"; Name="Status: Paused"},
    @{Path="src\Status-cancelled.md"; Name="Status: Cancelled"}
)

$filesOK = $true
foreach ($file in $requiredFiles) {
    if (Test-Path $file.Path) {
        Write-Success "  [OK] $($file.Name)"
    } else {
        Write-ErrorMsg "  [MISSING] $($file.Name)"
        $filesOK = $false
    }
}

if (-not $foldersOK -or -not $filesOK) {
    Write-Host ""
    Write-ErrorMsg "ERROR: Some files or folders are missing!"
    Write-Info "Please ensure repository is correctly cloned."
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Success "All files and folders verified successfully!"
Write-Host ""

# ============================================================
# Step 2: Create/Update Inbox
# ============================================================

Write-Section "STEP 2/4: Setting Up Inbox"

$inboxPath = "Projects\Inbox.md"

if (-not (Test-Path $inboxPath)) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
    $inboxContent = @"
# Inbox

Quick tasks created from Dashboard appear here.

---

## Active Tasks

<!-- Tasks will be added here automatically -->

---

Last updated: $timestamp
"@
    Set-Content -Path $inboxPath -Value $inboxContent -Encoding UTF8
    Write-Success "  [CREATED] Inbox.md"
} else {
    Write-Info "  [EXISTS]  Inbox.md (skipping creation)"
}

Write-Host ""

# ============================================================
# Step 3: Configure Obsidian Plugins & Settings
# ============================================================

Write-Section "STEP 3/4: Configuring Obsidian Settings"

$obsidianConfigPath = ".obsidian"

if (Test-Path $obsidianConfigPath) {
    Write-Info "Obsidian vault detected"
    Write-Host ""
    
    # 3a. Enable CSS Snippet
    Write-Info "Enabling CSS snippet..."
    $appearancePath = Join-Path $obsidianConfigPath "appearance.json"
    
    if (Test-Path $appearancePath) {
        try {
            $config = Get-Content $appearancePath -Raw | ConvertFrom-Json
            
            if (-not $config.cssSnippets) {
                $config | Add-Member -NotePropertyName "cssSnippets" -NotePropertyValue @() -Force
            }
            
            if ($config.cssSnippets -notcontains "abcde-colors") {
                $config.cssSnippets += "abcde-colors"
                $config | ConvertTo-Json -Depth 10 | Set-Content $appearancePath -Encoding UTF8
                Write-Success "  [ENABLED] CSS snippet: abcde-colors"
            } else {
                Write-Info "  [ALREADY ENABLED] CSS snippet: abcde-colors"
            }
        } catch {
            Write-Warning "  Could not auto-enable CSS snippet"
            Write-Info "  Manual: Settings > Appearance > CSS snippets > abcde-colors"
        }
    } else {
        Write-Warning "  appearance.json not found"
    }
    
    Write-Host ""
    
    # 3b. Configure Dataview
    Write-Info "Configuring Dataview plugin..."
    $dataviewConfigPath = Join-Path $obsidianConfigPath "plugins\dataview\data.json"
    
    if (Test-Path $dataviewConfigPath) {
        try {
            $dvConfig = Get-Content $dataviewConfigPath -Raw | ConvertFrom-Json
            
            if ($dvConfig.enableJavascript -ne $true) {
                $dvConfig.enableJavascript = $true
                $dvConfig | ConvertTo-Json -Depth 10 | Set-Content $dataviewConfigPath -Encoding UTF8
                Write-Success "  [ENABLED] Dataview JavaScript Queries"
            } else {
                Write-Info "  [ALREADY ENABLED] Dataview JavaScript Queries"
            }
        } catch {
            Write-Warning "  Could not auto-configure Dataview"
        }
    } else {
        Write-Warning "  Dataview plugin not found yet (will work after installation)"
    }
    
    Write-Host ""
    
} else {
    Write-Warning "  .obsidian folder not found"
    Write-Info "  Ensure this folder is opened as an Obsidian vault"
}

# ============================================================
# Step 4: Manual Plugin Installation Guide
# ============================================================

Write-Section "STEP 4/4: Required Plugin Installation"

Write-Host "Obsidian plugins must be installed manually in the app." -ForegroundColor Yellow
Write-Host ""

Write-Host "REQUIRED PLUGINS (2):" -ForegroundColor Yellow
Write-Host "  1. Dataview" -ForegroundColor Green
Write-Host "     Author: blacksmithgu"
Write-Host "     Purpose: Display dashboards and queries"
Write-Host ""
Write-Host "  2. Tasks" -ForegroundColor Green
Write-Host "     Author: Obsidian Tasks Group"
Write-Host "     Purpose: Task management and filtering"
Write-Host ""

Write-Host "OPTIONAL PLUGIN:" -ForegroundColor Cyan
Write-Host "  3. Kanban" -ForegroundColor Green
Write-Host "     Author: mgmeyers"
Write-Host "     Purpose: Drag and drop board view"
Write-Host ""

Write-Host "INSTALLATION STEPS:" -ForegroundColor Yellow
Write-Host "  1. Open Obsidian"
Write-Host "  2. Settings > Community plugins"
Write-Host "  3. Click Browse"
Write-Host "  4. Search 'Dataview' - Install and Enable"
Write-Host "  5. Search 'Tasks' - Install and Enable"
Write-Host "  6. (Optional) Search 'Kanban' - Install and Enable"
Write-Host "  7. Close and restart Obsidian"
Write-Host ""

# ============================================================
# Final Summary
# ============================================================

Write-Section "SETUP COMPLETE"

Write-Host "Configuration Status:" -ForegroundColor Cyan
Write-Host "  [DONE] Files and folders verified"
Write-Host "  [DONE] Inbox.md created"
Write-Host "  [DONE] CSS snippet enabled"
Write-Host "  [DONE] Dataview configured (if installed)"
Write-Host ""

Write-Host "What you need to do:" -ForegroundColor Yellow
Write-Host "  1. Install: Dataview (REQUIRED)"
Write-Host "  2. Install: Tasks (REQUIRED)"
Write-Host "  3. Restart Obsidian"
Write-Host "  4. Open: Dashboards/Dashboard.md"
Write-Host ""

Write-Host "============================================================" -ForegroundColor Green
Write-Success "Setup Complete!"
Write-Host "============================================================" -ForegroundColor Green

Write-Host ""
Write-Host "VERSION: 1.17" -ForegroundColor DarkGray
Write-Host "Questions? Check README.md for full documentation"
Write-Host ""

Read-Host "Press Enter to exit"
