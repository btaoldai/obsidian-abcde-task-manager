# ============================================================
# DEVELOPER SETUP - Obsidian ABCDE Task Manager v1.17
# For developers only - Complete folder creation + file placement guide
# ============================================================

$ErrorActionPreference = "Stop"

function Write-Success { Write-Host $args -ForegroundColor Green }
function Write-Info { Write-Host $args -ForegroundColor Cyan }
function Write-Warning { Write-Host $args -ForegroundColor Yellow }
function Write-Section { Write-Host "`n$args`n" -ForegroundColor Magenta -BackgroundColor Black }

Write-Section "=" * 60
Write-Section "   DEVELOPER SETUP - ABCDE Task Manager v1.17"
Write-Section "=" * 60

# ============================================================
# Step 1: Create ALL folders
# ============================================================

Write-Info "[STEP 1/3] Creating complete folder structure..."
Write-Host ""

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
    "src",
    "scripts"
)

$created = 0
foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
        Write-Success "  [CREATED] $folder"
        $created++
    } else {
        Write-Info "  [EXISTS]  $folder"
    }
}

Write-Host ""
Write-Success "Folder structure created ($created new folders)"
Write-Host ""

# ============================================================
# Step 2: Create .gitkeep files
# ============================================================

Write-Info "[STEP 2/3] Creating .gitkeep files for empty folders..."
Write-Host ""

$gitkeepFolders = @(
    "Projects\Administrative",
    "Projects\Health",
    "Projects\Professional",
    "Projects\Wiki",
    "Projects\Training"
)

foreach ($folder in $gitkeepFolders) {
    $gitkeepPath = Join-Path $folder ".gitkeep"
    if (-not (Test-Path $gitkeepPath)) {
        New-Item -ItemType File -Path $gitkeepPath -Force | Out-Null
        Write-Success "  [CREATED] $folder\.gitkeep"
    }
}

Write-Host ""
Write-Success ".gitkeep files created (prevents Git from ignoring empty folders)"
Write-Host ""

# ============================================================
# Step 3: File Placement Guide
# ============================================================

Write-Info "[STEP 3/3] Displaying file placement guide..."
Write-Host ""

Write-Section "FILE PLACEMENT CHECKLIST"
Write-Host ""

$filesToPlace = @(
    @{
        Category = "DASHBOARDS (2 files)"
        Files = @(
            "Dashboard-v1.17.md       -> Dashboards\Dashboard.md",
            "Kanban-Board.md          -> Dashboards\Kanban-Board.md"
        )
    },
    @{
        Category = "CSS STYLING (1 file)"
        Files = @(
            "abcde-colors.css         -> .obsidian\snippets\abcde-colors.css"
        )
    },
    @{
        Category = "STATUS FILES (5 files)"
        Files = @(
            "Status-in-progress.md    -> src\Status-in-progress.md",
            "Status-completed.md      -> src\Status-completed.md",
            "Status-archived.md       -> src\Status-archived.md",
            "Status-paused.md         -> src\Status-paused.md",
            "Status-cancelled.md      -> src\Status-cancelled.md"
        )
    }
)

foreach ($category in $filesToPlace) {
    Write-Host "  [ $($category.Category) ]" -ForegroundColor Yellow
    foreach ($file in $category.Files) {
        Write-Host "    $file"
    }
    Write-Host ""
}

# ============================================================
# Summary and Instructions
# ============================================================

Write-Section "NEXT STEPS"
Write-Host ""

Write-Warning "ACTION ITEMS FOR DEVELOPER:"
Write-Host ""
Write-Info "1. MOVE/COPY FILES TO CORRECT FOLDERS"
Write-Info "   Use Windows Explorer or command:"
Write-Info ""
Write-Info "   Example: copy Dashboard-v1.17.md Dashboards\Dashboard.md"
Write-Info ""
Write-Info "2. VERIFY ALL FILES ARE IN PLACE"
Write-Info "   After placement, run: setup-user.ps1"
Write-Info ""
Write-Info "3. COMMIT TO GIT"
Write-Info "   git add ."
Write-Info "   git commit -m 'Complete installation: all 24 files ready for distribution'"
Write-Info "   git push origin main"
Write-Info ""
Write-Info "4. CREATE GITHUB RELEASE"
Write-Info "   - Tag: v1.17"
Write-Info "   - Title: Version 1.17 - Complete & Ready"
Write-Info "   - Description: See README.md"
Write-Host ""

Write-Section "STATUS CHECKLIST"
Write-Host ""

$checklist = @(
    "[ ] All 8 files placed in correct folders",
    "[ ] .gitkeep files present in empty project folders",
    "[ ] README.md updated with correct paths",
    "[ ] .gitignore includes necessary files",
    "[ ] [Your Name] replaced in LICENSE and README files",
    "[ ] Git add/commit done",
    "[ ] Pushed to GitHub origin/main",
    "[ ] Created GitHub release v1.17"
)

foreach ($item in $checklist) {
    Write-Host "  $item"
}

Write-Host ""
Write-Success "Developer setup complete!"
Write-Host ""

Read-Host "Press Enter when files are placed and ready for testing"
