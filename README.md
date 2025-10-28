# 📋 Obsidian ABCDE Task Manager

> **Version 1.17** | A comprehensive priority-based task management system for Obsidian  
> Created by Btaoldai | [MIT License](LICENSE)

**[🇫🇷 Version française](README.fr.md)**

---

## 🎯 Overview

**ABCDE Task Manager** is an advanced task management system for Obsidian that implements the ABCDE priority method. It provides a unified dashboard, intelligent Kanban boards, dynamic project creation, and automated status tracking.

### ✨ Key Features

- **🎯 ABCDE Priority System**: A (Urgent - 7 days), B (Important - 14 days), C (Nice-to-have - 30 days)
- **📊 Unified Dashboard**: Single-click access to all tasks, projects, and statistics
- **🔄 Dynamic Categories**: Add custom categories on-the-fly during project creation
- **📈 Smart Kanban Board**: Status-based filtering with drag & drop support
- **🎨 Visual Status Management**: Color-coded badges and quick-change buttons
- **📱 Real-time Stats**: Points system, progress tracking, and gamification
- **🔗 Auto-linking**: Tasks automatically linked to project pages
- **🕸️ Graph View**: Visual project relationships and dependencies

---

## 📦 What's Included

```
obsidian-abcde-task-manager/
├── .obsidian/
│   └── snippets/
│       └── abcde-colors.css          # Color scheme for status badges
├── Dashboards/
│   ├── Dashboard.md                   # Main dashboard (v1.17)
│   └── Kanban-Board.md               # Interactive Kanban board
├── Projects/
│   ├── Administrative/               # Administrative projects
│   ├── Health/                       # Health-related projects
│   ├── Professional/                 # Professional projects
│   ├── Wiki/                         # Wiki/Documentation
│   ├── Training/                     # Training & Learning
│   └── Inbox.md                      # Quick task inbox
├── src/
│   ├── Status-in-progress.md         # Status: In Progress
│   ├── Status-completed.md           # Status: Completed
│   ├── Status-archived.md            # Status: Archived
│   ├── Status-paused.md              # Status: Paused
│   ├── Status-cancelled.md           # Status: Cancelled
│   └── Dashboard-Graph-View.md       # Graph view configuration
├── scripts/
│   ├── setup.ps1                     # Windows setup script
│   └── setup.sh                      # Linux/Mac setup script
├── README.md                         # This file (English)
├── README.fr.md                      # French version
├── LICENSE                           # MIT License
└── .gitignore                        # Git ignore rules
```

---

## 🚀 Quick Start

### Option A: Automated Setup (Recommended)

#### Windows (PowerShell)
```powershell
# 1. Clone repository into your Obsidian vault
cd "C:\Path\To\Your\Obsidian\Vault"
git clone https://github.com/yourusername/obsidian-abcde-task-manager .

# 2. Run setup script
.\scripts\setup.ps1
```

#### Linux/Mac (Bash)
```bash
# 1. Clone repository into your Obsidian vault
cd ~/path/to/your/obsidian/vault
git clone https://github.com/yourusername/obsidian-abcde-task-manager .

# 2. Run setup script
chmod +x scripts/setup.sh
./scripts/setup.sh
```

### Option B: Manual Setup

1. **Clone repository** into your Obsidian vault directory
2. **Install required plugins**:
   - Dataview (required)
   - Tasks (required)
   - Kanban (optional, for drag & drop)
3. **Enable CSS snippet**:
   - Settings → Appearance → CSS snippets → Enable `abcde-colors`
4. **Enable Dataview JavaScript**:
   - Settings → Dataview → Enable JavaScript Queries
5. **Restart Obsidian**
6. **Open Dashboard**: `Dashboards/Dashboard.md`

---

## 📚 User Guide

### Creating a Project

1. Open `Dashboards/Dashboard.md`
2. Click **"🎯 ➕ Create Task or Project"**
3. Select **"🎯 Full Project"**
4. Fill in:
   - **Name**: Project title
   - **Category**: Choose from default or add custom
   - **Priority**: A (Urgent), B (Important), C (Nice-to-have)
   - **Tags**: Additional tags (optional)
   - **Deadline**: Custom date (optional)
5. Click **"✅ Create"**

**Result**: Project file created with:
- Properties (tags, status, priority, deadline)
- Quick status change buttons
- Task checklist
- Objectives, Notes, Resources sections

### Creating a Quick Task

1. Open `Dashboards/Dashboard.md`
2. Click **"🎯 ➕ Create Task or Project"**
3. Select **"⚡ Quick Task"**
4. Fill in details
5. Click **"✅ Create"**

**Result**: 
- Task added to `Projects/Inbox.md`
- Project page created with link
- Appears in Dashboard "Today" section

### Changing Project Status

**Method 1: Quick Buttons** (Fastest)
1. Open project file
2. Section "💡 Quick Status Change"
3. Click desired status button:
   - 🔵 In Progress
   - ✅ Completed
   - 📦 Archived
   - ⏸️ Paused
   - ❌ Cancelled

**Method 2: Properties Dropdown**
1. Open project file
2. Click `status: in-progress` in Properties
3. Select new status from dropdown

### Using Kanban Board

**Dashboard View** (Read-only):
- `Dashboards/Dashboard.md` → Section "📊 KANBAN"
- Filtered by status + priority
- Sections: In Progress (A/B/C), Paused, Completed

**Interactive Board** (Drag & Drop):
1. Dashboard → Click **"📊 Kanban"** button
2. Opens `Dashboards/Kanban-Board.md`
3. Drag tasks between columns
4. Drop in "✅ Completed" to mark done

---

## 🎨 Customization

### Adding Custom Categories

**During Project Creation**:
The modal allows adding custom categories on-the-fly. Simply type a new category name when prompted.

**Permanent Categories**:
Edit `Dashboards/Dashboard.md` and add to `cats` array:

```javascript
const cats = [
    {v:"administrative",t:"🔵 Administrative"},
    {v:"health",t:"🟢 Health"},
    {v:"professional",t:"🟣 Professional"},
    {v:"wiki",t:"🔷 Wiki"},
    {v:"training",t:"🟠 Training"},
    {v:"yourcategory",t:"🎯 Your Category"}  // Add here
];
```

### Changing Color Scheme

Edit `.obsidian/snippets/abcde-colors.css`:

```css
/* Status colors */
.status-in-progress { background: #3B82F6; }  /* Blue */
.status-completed { background: #10B981; }    /* Green */
.status-archived { background: #6B7280; }     /* Gray */
.status-paused { background: #F59E0B; }       /* Orange */
.status-cancelled { background: #EF4444; }    /* Red */
```

### Adding Status Values

1. Create file in `src/`: `Status-yourvalue.md`
2. Content:
```yaml
---
status: yourvalue
tags:
  - reference
  - status
---

# Your Status Name
```
3. Restart Obsidian
4. Dropdown will include new status

---

## 📊 Priority System Explained

### A - Urgent (🔴)
- **Deadline**: 7 days from creation
- **Points**: 5 points when completed
- **Use**: Critical tasks, time-sensitive projects
- **Example**: Security incident response, deadline submissions

### B - Important (🟠)
- **Deadline**: 14 days from creation
- **Points**: 3 points when completed
- **Use**: Important but not urgent, strategic projects
- **Example**: Feature development, documentation updates

### C - Nice-to-have (🟡)
- **Deadline**: 30 days from creation
- **Points**: 1 point when completed
- **Use**: Low priority, improvement tasks
- **Example**: Code refactoring, nice-to-have features

### Points & Gamification

**Daily Stats**:
- Total points earned today
- Tasks completed count
- Level based on points (Beginner → Champion)

**Weekly Stats**:
- Total tasks completed this week
- Total points accumulated

**Levels**:
- 🥉 Beginner: 0-4 points
- 🔰 Confirmed: 5-9 points
- 🥈 Intermediate: 10-14 points
- 🥇 Advanced: 15-19 points
- 👑 Champion: 20+ points

---

## 🔌 Required Plugins

### Dataview
**Required** | [Install](https://github.com/blacksmithgu/obsidian-dataview)

Enables dashboard queries, dynamic tables, and smart filtering.

**Configuration**:
- Settings → Dataview → Enable JavaScript Queries → **ON**

### Tasks
**Required** | [Install](https://github.com/obsidian-tasks-group/obsidian-tasks)

Provides task management, due dates, and filtering capabilities.

### Kanban
**Optional** | [Install](https://github.com/mgmeyers/obsidian-kanban)

Enables drag & drop functionality in Kanban board.

---

## 🐛 Troubleshooting

### Dashboard Not Loading

**Issue**: Dashboard shows code instead of rendered view  
**Solution**: 
1. Enable Dataview plugin
2. Settings → Dataview → Enable JavaScript Queries → **ON**
3. Restart Obsidian

### Status Dropdown Empty

**Issue**: Properties dropdown shows no status values  
**Solution**:
1. Verify 5 status files exist in `src/`
2. Open each status file once (forces scan)
3. Restart Obsidian
4. Wait 10 seconds for indexing

### Buttons Not Working

**Issue**: Status buttons don't change status  
**Solution**:
1. Enable Dataview JavaScript (see above)
2. Check browser console for errors (Ctrl+Shift+I)
3. Verify file has `status:` property in frontmatter

### Tasks Not Appearing in Dashboard

**Issue**: Created tasks don't show up  
**Solution**:
1. Verify task has correct tags (`#task`, `#categoryname/A1`)
2. Check due date format: `📅 YYYY-MM-DD`
3. Refresh dashboard (close and reopen)

---

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

**Created by Btaoldai**

---

## 🙏 Acknowledgments

- ABCDE Priority Method
- Obsidian Community
- Dataview Plugin by blacksmithgu
- Tasks Plugin by Obsidian Tasks Group
- Kanban Plugin by mgmeyers

---

## 📮 Contact & Support

- **GitHub Issues**: [Report bugs or request features](https://github.com/Btaoldai/obsidian-abcde-task-manager/issues)
- **Discussions**: [Ask questions and share ideas](https://github.com/Btaoldai/obsidian-abcde-task-manager/discussions)

---

## 🗺️ Roadmap

### Version 1.18 (Planned)
- [ ] Templates system for common project types
- [ ] Import/Export functionality
- [ ] Mobile optimization
- [ ] Dashboard themes

### Version 2.0 (Future)
- [ ] Multi-language support (FR, ES, DE)
- [ ] Advanced filtering and search
- [ ] Calendar integration
- [ ] Team collaboration features

---

**⭐ If this project helps you, please star the repository!**
