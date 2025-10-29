# 📋 ABCDE Task Manager for Obsidian

A **beautiful, fast, and intuitive** priority-based task management system for Obsidian. Organize tasks by **ABCDE priority** (A=Urgent, B=Important, C=Nice-to-have) with a unified creation button, Kanban board, and auto-generated dashboards.

**Status**: ✅ Production Ready | **Version**: 1.17 | **Language**: English

---

## 🎯 Features

- **📊 Beautiful Dashboard** - Real-time stats and task overview
- **🎯 Priority System** - ABCDE classification (A, B, C)
- **📦 5 Categories** - Administrative, Health, Professional, Wiki, Training
- **🎨 Dynamic Kanban** - Drag & drop board for visual task management
- **⚡ Unified Creation** - Single button to create tasks or projects
- **🔔 Smart Status** - 5 status types (In Progress, Completed, Archived, Paused, Cancelled)
- **📱 Responsive** - Works on desktop and mobile
- **🚀 Performance** - Lightweight, instant loading

---

## 📦 What's Included

```
.
├── Dashboards/
│   ├── Dashboard.md           # Main dashboard (start here!)
│   └── Kanban-Board.md        # Kanban board view
├── Projects/
│   ├── Administrative/        # Administrative tasks & projects
│   ├── Health/               # Health-related tasks
│   ├── Professional/         # Work & professional tasks
│   ├── Wiki/                 # Knowledge base & documentation
│   ├── Training/             # Learning & training tasks
│   ├── Inbox.md              # Quick task capture
│   └── .gitkeep              # Empty folder markers
├── src/
│   ├── Status-in-progress.md # Status templates
│   ├── Status-completed.md
│   ├── Status-archived.md
│   ├── Status-paused.md
│   └── Status-cancelled.md
├── .obsidian/
│   └── snippets/
│       ├── abcde-colors.css  # Beautiful color scheme
│       └── modal-fix.css     # Modal UI fixes
├── scripts/
│   └── setup-user.ps1        # User setup script (Windows)
├── README.md
└── .gitignore
```

---

## 🚀 Installation Guide (Step by Step)

### **Step 1: Clone the Repository**

```bash
git clone https://github.com/yourusername/obsidian-abcde-task-manager.git
cd obsidian-abcde-task-manager
```

Or download ZIP and extract to your preferred location.

### **Step 2: Open in Obsidian**

1. Open **Obsidian**
2. Click **"Open Folder as Vault"**
3. Select the `obsidian-abcde-task-manager` folder
4. Click **"Open"**

### **Step 3: Install Required Plugins**

**Open Obsidian Settings** > **Community Plugins** > **Browse**

Install these 2 plugins:

1. **Dataview** (by blacksmithgu)
   - Required for queries and dashboards
   
2. **Tasks** (by Obsidian Tasks Group)
   - Required for task management

1. Calendar 

### **Step 4: Configure Plugins**

**Enable Dataview JavaScript:**
1. Settings > **Dataview**
2. Toggle ON: **JavaScript Queries**

**Enable CSS Snippet:**
1. Settings > **Appearance** > **CSS Snippets**
2. Toggle ON: **abcde-colors**
3. Toggle ON: **modal-fix**

### **Step 5: Restart Obsidian**

Close and reopen Obsidian completely.

### **Step 6: Start Using!**

1. Open **Dashboards/Dashboard.md**
2. Click **"🎯 ➕ Create Task or Project"**
3. Choose task type, fill in details
4. Click **"✅ Create"**

---

## 📖 Usage Guide

### **Creating Tasks**

Click the **"🎯 ➕ Create Task or Project"** button on the Dashboard:

1. **Type**: Quick Task or Full Project
2. **Name**: Task description
3. **Category**: Choose from 5 categories
4. **Tags**: Add extra tags (optional)
5. **Priority**: A (Urgent), B (Important), C (Nice-to-have)
6. **Deadline**: Set or auto-assign based on priority

### **Task Properties**

All tasks have these frontmatter properties:

```yaml
tags:
  - task              # Task marker
  - administrative    # Category
  - A                 # Priority
status: in-progress   # Current status
created: YYYY-MM-DD   # Creation date
deadline: YYYY-MM-DD  # Deadline
priority: A           # Priority level
```

### **Changing Task Status**

Each task file has a **"💡 Quick Status Change"** section:
- Click the **status field** in Properties panel
- Choose: `in-progress`, `completed`, `archived`, `paused`, `cancelled`

### **Using the Dashboard**

**Calendar Picker**: Select any date to view tasks for that day

**Sections**:
- 🔴 **TODAY - URGENT** - Critical A-priority tasks
- 📊 **KANBAN VIEW** - Visual board (A, B, C, Completed)
- 📊 **STATISTICS** - Points earned, levels, weekly stats

### **Kanban Board**

1. Click **"📊 Kanban Board"** button on Dashboard
2. Drag tasks between columns
3. See color-coded priorities at a glance

---

## 🎨 Customization

### **Change Categories**

Edit `Dashboards/Dashboard.md` line with:
```javascript
const cats = [
    {v:"administrative",t:"Administrative",e:"🔵"},
    // Add your categories here
];
```

### **Modify Colors**

Edit `.obsidian/snippets/abcde-colors.css`:
```css
--color-primary: #your-color;
--color-success: #your-color;
/* ... more variables ... */
```

### **Adjust Priorities**

Edit default deadline days in `Dashboards/Dashboard.md`:
```javascript
const days = type === "task" ? 
    (priority==="A"?0:priority==="B"?3:7)  // Change these numbers
    : (priority==="A"?7:priority==="B"?14:30);
```

---

## 📋 File Structure Explained

| Folder | Purpose |
|--------|---------|
| **Dashboards/** | Main interface - start here |
| **Projects/** | Your actual tasks and projects |
| **src/** | Status file templates (do not modify) |
| **.obsidian/** | Obsidian config & CSS snippets |
| **scripts/** | Setup automation scripts |

---

## 🆘 Troubleshooting

**"Dashboard shows errors?"**
- Ensure Dataview & Tasks plugins are installed & enabled
- Check CSS snippets are enabled in Settings > Appearance

**"Tasks not appearing?"**
- Verify files are in correct folders (Projects/Administrative/, etc.)
- Make sure frontmatter has correct tags format

**"Create button not working?"**
- Refresh the page (Cmd/Ctrl + R)
- Close and reopen Obsidian
- Check console for errors (Developer Tools)

**"Kanban not loading?"**
- Install Kanban plugin from Community Plugins (optional but recommended)

---

## ⚙️ Requirements

- **Obsidian** v1.4.0+
- **Plugins**:
  - Dataview (required)
  - Tasks (required)
  - Kanban (optional, for board view)

---

## 📊 Statistics & Scoring

**Daily Points**:
- 🔴 A-Priority completed: **5 pts**
- 🟠 B-Priority completed: **3 pts**
- 🟡 C-Priority completed: **1 pt**

**Levels**:
- 🥉 Beginner: 0-4 pts
- 🔰 Confirmed: 5-9 pts
- 🥈 Intermediate: 10-14 pts
- 🥇 Advanced: 15-19 pts
- 👑 Champion: 20+ pts

---

## 🎯 Best Practices

1. **Create in Bulk** - Add all tasks for the week at once
2. **Use Categories** - Keep tasks organized by type
3. **Set Priorities** - Be honest about what's urgent
4. **Review Weekly** - Check statistics on Sundays
5. **Archive Old Tasks** - Keep Projects folder clean

---

## 📝 License

MIT License - Feel free to use, modify, and share!

---

## 🤝 Support

For issues or suggestions, please open an issue on GitHub.

---

## 🎉 Ready to Get Started?

1. ✅ Clone/extract repository
2. ✅ Open in Obsidian
3. ✅ Run setup script (Windows) or follow manual steps
4. ✅ Install plugins
5. ✅ Click **"🎯 ➕ Create Task or Project"**
6. ✅ Start managing tasks!

**Happy productivity! 🚀**

---

**Version**: 1.17 | **Updated**: 2025-10-29 | **Status**: Production Ready
