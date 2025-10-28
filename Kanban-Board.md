# 📊 ABCDE Kanban Board

> **Version 1.17** | Interactive drag & drop task board

```kanban
---
kanban-plugin: board
---

## 🔴 URGENT (A)

- [ ] #task #priority-a Sample urgent task 📅 2025-10-29 ⏫


## 🟠 IMPORTANT (B)

- [ ] #task #priority-b Sample important task 📅 2025-11-05 🔼


## 🟡 NICE-TO-HAVE (C)

- [ ] #task #priority-c Sample nice-to-have task 📅 2025-11-15


## ⏸️ PAUSED

- [ ] #task #paused Sample paused task


## ✅ COMPLETED

- [x] #task Sample completed task ✅ 2025-10-28


## 📦 ARCHIVED

- [x] #task Sample archived task (archived)

```

---

## 📝 Instructions

### Using the Kanban Plugin

1. **Install Kanban Plugin**:
   - Settings → Community plugins → Browse
   - Search "Kanban"
   - Install and enable

2. **Drag & Drop**:
   - Click and hold a task card
   - Drag to another column
   - Drop to move task

3. **Add New Task**:
   - Click "+ Add a card" at bottom of column
   - Type task name
   - Press Enter

4. **Edit Task**:
   - Click on task card
   - Edit in modal window
   - Save changes

### Column Meanings

- **🔴 URGENT (A)**: Critical tasks, deadline within 7 days
- **🟠 IMPORTANT (B)**: Important tasks, deadline within 14 days
- **🟡 NICE-TO-HAVE (C)**: Low priority, deadline within 30 days
- **⏸️ PAUSED**: Temporarily on hold
- **✅ COMPLETED**: Finished tasks (move here to mark done)
- **📦 ARCHIVED**: Long-term storage for completed tasks

### Keyboard Shortcuts

- `Ctrl/Cmd + Enter`: Create new card
- `Ctrl/Cmd + K`: Archive card
- `Escape`: Close card editor

---

## 🔗 Integration with Dashboard

This Kanban board is linked to the main Dashboard:

- **From Dashboard**: Click "📊 Kanban Board" button to open this view
- **Task Sync**: Tasks created from Dashboard appear here automatically
- **Status Updates**: Moving cards between columns updates task status

---

## 🎨 Customization

### Add Custom Columns

Edit this file in Source Mode (Ctrl/Cmd + E) and add:

```markdown
## 🟣 YOUR COLUMN

- [ ] #task Your task here
```

### Change Colors

Modify `.obsidian/snippets/abcde-colors.css` to customize column colors.

### Filter by Category

Add category tags to filter:
- `#administrative`
- `#health`
- `#professional`
- `#wiki`
- `#training`

---

**Kanban Board v1.17** | **ABCDE Task Manager**  
**Last updated**: 2025-10-28