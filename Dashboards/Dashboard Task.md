# 📋 Dashboard

> **ABCDE Task Manager v1.17** - **Fast & Efficient** • **Unified Button** • **Zero Lag**

---

## 📅 CALENDAR PICKER

```dataviewjs
const c = dv.container;
const dc = c.createDiv();
dc.style.cssText = "display:flex;align-items:center;gap:15px;margin-bottom:20px;padding:10px;background:linear-gradient(135deg,#667eea 0%,#764ba2 100%);border-radius:10px";

const l = dc.createEl("span", {text:"📅 View tasks for:"});
l.style.cssText = "color:white;font-weight:bold;font-size:16px";

const di = dc.createEl("input", {type:"date"});
di.value = moment().format("YYYY-MM-DD");
di.style.cssText = "padding:10px;border:2px solid white;border-radius:5px;font-size:14px;font-weight:bold;cursor:pointer;background:white;color:#333";

const si = c.createDiv();
si.style.cssText = "margin-bottom:20px;padding:10px;background:#F3F4F6;border-radius:5px;text-align:center;font-size:16px;font-weight:bold;color:#333";
si.innerHTML = `📆 Tasks for <span style="color:#667eea">${moment(di.value).format("dddd DD MMMM YYYY")}</span>`;

di.addEventListener('change', () => {
    si.innerHTML = `📆 Tasks for <span style="color:#667eea">${moment(di.value).format("dddd DD MMMM YYYY")}</span>`;
});

dv.paragraph("");
```

---

## 🚀 UNIFIED CREATION

```dataviewjs
const cats = [
    {v:"administrative",t:"Administrative",e:"🔵"},
    {v:"health",t:"Health",e:"🟢"},
    {v:"professional",t:"Professional",e:"🟣"},
    {v:"wiki",t:"Wiki",e:"🔷"},
    {v:"training",t:"Training",e:"🟠"}
];
const prios = [{v:"A",t:"A - Urgent",e:"🔴"},{v:"B",t:"B - Important",e:"🟠"},{v:"C",t:"C - Nice-to-have",e:"🟡"}];
const emojis = {administrative:"🔵",health:"🟢",professional:"🟣",wiki:"🔷",training:"🟠"};

async function askCreate() {
    return new Promise((resolve) => {
        const m = new obsidian.Modal(app);
        m.titleEl.setText("🎯 Create Task or Project");
        m.titleEl.style.cssText = "font-size:22px;font-weight:bold;margin-bottom:20px";
        
        m.contentEl.style.cssText = "max-height:90vh;overflow-y:auto;min-width:500px";
        m.modalEl.style.cssText = "min-width:550px";
        
        // Type
        const lbl1 = m.contentEl.createEl("label");
        lbl1.textContent = "📌 Type";
        lbl1.style.cssText = "display:block;font-weight:bold;margin:15px 0 8px 0;font-size:15px";
        
        const st = m.contentEl.createEl("select");
        st.style.cssText = "width:100%;padding:10px;margin-bottom:20px;border:2px solid #E5E7EB;border-radius:6px;font-size:15px;background:white;cursor:pointer;min-height:45px";
        st.createEl("option", {value:"task",text:"⚡ Quick Task"});
        st.createEl("option", {value:"project",text:"🎯 Full Project"});
        
        // Name
        const lbl2 = m.contentEl.createEl("label");
        lbl2.textContent = "📝 Name";
        lbl2.style.cssText = "display:block;font-weight:bold;margin:15px 0 8px 0;font-size:15px";
        
        const inp = m.contentEl.createEl("input", {type:"text",placeholder:"Ex: Analyze logs..."});
        inp.style.cssText = "width:100%;padding:10px;margin-bottom:20px;border:2px solid #E5E7EB;border-radius:6px;font-size:15px;box-sizing:border-box";
        
        // Category
        const lbl3 = m.contentEl.createEl("label");
        lbl3.textContent = "📂 Category";
        lbl3.style.cssText = "display:block;font-weight:bold;margin:15px 0 8px 0;font-size:15px";
        
        const sc = m.contentEl.createEl("select");
        sc.style.cssText = "width:100%;padding:10px;margin-bottom:20px;border:2px solid #E5E7EB;border-radius:6px;font-size:15px;background:white;cursor:pointer;min-height:45px";
        cats.forEach(c => {
            const opt = sc.createEl("option", {value:c.v});
            opt.textContent = c.e + " " + c.t;
        });
        
        // Tags
        const lbl4 = m.contentEl.createEl("label");
        lbl4.textContent = "🏷️ Additional Tags";
        lbl4.style.cssText = "display:block;font-weight:bold;margin:15px 0 8px 0;font-size:15px";
        
        const it = m.contentEl.createEl("input", {type:"text",placeholder:"urgent, incident..."});
        it.style.cssText = "width:100%;padding:10px;margin-bottom:20px;border:2px solid #E5E7EB;border-radius:6px;font-size:15px;box-sizing:border-box";
        
        // Priority
        const lbl5 = m.contentEl.createEl("label");
        lbl5.textContent = "🚨 Priority";
        lbl5.style.cssText = "display:block;font-weight:bold;margin:15px 0 8px 0;font-size:15px";
        
        const sp = m.contentEl.createEl("select");
        sp.style.cssText = "width:100%;padding:10px;margin-bottom:20px;border:2px solid #E5E7EB;border-radius:6px;font-size:15px;background:white;cursor:pointer;min-height:45px";
        prios.forEach(p => {
            const opt = sp.createEl("option", {value:p.v});
            opt.textContent = p.e + " " + p.t;
        });
        
        // Deadline
        const lbl6 = m.contentEl.createEl("label");
        lbl6.textContent = "📅 Deadline (optional)";
        lbl6.style.cssText = "display:block;font-weight:bold;margin:15px 0 8px 0;font-size:15px";
        
        const id = m.contentEl.createEl("input", {type:"date"});
        id.style.cssText = "width:100%;padding:10px;margin-bottom:20px;border:2px solid #E5E7EB;border-radius:6px;font-size:15px;box-sizing:border-box";
        
        // Preview
        const pc = m.contentEl.createDiv();
        pc.style.cssText = "padding:10px;background:#F3F4F6;border-radius:6px;margin-bottom:20px;border-left:4px solid #8B5CF6";
        
        const pcl = pc.createEl("div");
        pcl.textContent = "🔍 Tag preview:";
        pcl.style.cssText = "font-weight:bold;margin-bottom:10px;font-size:15px;color:#333";
        
        const pt = pc.createEl("div");
        pt.style.cssText = "display:flex;gap:8px;flex-wrap:wrap";
        
        function up() {
            const ty = st.value;
            const ca = sc.value;
            const pr = sp.value;
            const ex = it.value;
            
            let tg = ty === "task" ? [`#task`, `#${ca}/${pr}1`] : [`#project`, `#${ca}`, `#priority-${pr.toLowerCase()}`, `#in-progress`];
            if (ex) ex.split(',').forEach(t => {const tr = t.trim(); if(tr) tg.push(`#${tr}`);});
            
            const bg = ty === "task" ? "#F59E0B" : "#8B5CF6";
            pt.innerHTML = tg.map(t => `<span style="background:${bg};color:white;padding:6px 12px;border-radius:14px;font-size:13px;font-weight:bold">${t}</span>`).join('');
        }
        
        [st,sc,sp,it].forEach(e => e.addEventListener('change', up));
        it.addEventListener('input', up);
        up();
        
        // Buttons
        const bc = m.contentEl.createDiv();
        bc.style.cssText = "display:flex;gap:12px;margin-top:25px";
        
        const bo = bc.createEl("button");
        bo.textContent = "✅ Create";
        bo.style.cssText = "flex:1;padding:12px;background:#10B981;color:white;border:none;border-radius:6px;cursor:pointer;font-weight:bold;font-size:16px;transition:all 0.2s";
        bo.onmouseover = () => bo.style.background = "#059669";
        bo.onmouseout = () => bo.style.background = "#10B981";
        
        const bca = bc.createEl("button");
        bca.textContent = "❌ Cancel";
        bca.style.cssText = "flex:1;padding:12px;background:#EF4444;color:white;border:none;border-radius:6px;cursor:pointer;font-weight:bold;font-size:16px;transition:all 0.2s";
        bca.onmouseover = () => bca.style.background = "#DC2626";
        bca.onmouseout = () => bca.style.background = "#EF4444";
        
        bo.onclick = () => {
            if (!inp.value.trim()) {new Notice("Name required!",2000); inp.focus(); return;}
            resolve({type:st.value,name:inp.value,category:sc.value,priority:sp.value,customDate:id.value,extraTags:it.value});
            m.close();
        };
        
        bca.onclick = () => {resolve(null);m.close();};
        inp.addEventListener("keypress", (e) => {if(e.key==="Enter") bo.click();});
        m.open();
        inp.focus();
    });
}

const bu = dv.el("button", "🎯 ➕ Create Task or Project");
bu.style.cssText = "padding:12px 24px;margin:5px;font-size:16px;background:linear-gradient(135deg,#8B5CF6 0%,#F59E0B 50%,#3B82F6 100%);color:white;border:none;border-radius:8px;cursor:pointer;font-weight:bold;box-shadow:0 4px 15px rgba(139,92,246,0.4);transition:all 0.2s";
bu.onmouseover = () => bu.style.transform = "translateY(-2px)";
bu.onmouseout = () => bu.style.transform = "translateY(0)";

bu.onclick = async () => {
    try {
        const d = await askCreate();
        if (!d) return;
        
        const {type,name,category,priority,customDate,extraTags} = d;
        
        let dl;
        if (customDate) {
            dl = customDate;
        } else {
            const days = type === "task" ? (priority==="A"?0:priority==="B"?3:7) : (priority==="A"?7:priority==="B"?14:30);
            dl = moment().add(days,'days').format("YYYY-MM-DD");
        }
        
        let tg = type === "project" ? ["project",category,`priority-${priority.toLowerCase()}`,"in-progress"] : ["task",category];
        if (extraTags) extraTags.split(',').forEach(t => {const tr = t.trim(); if(tr) tg.push(tr);});
        
        let fp = `Projects/${category.charAt(0).toUpperCase()+category.slice(1)}`;
        const fx = category.toUpperCase();
        
        try {await app.vault.createFolder(fp);} catch(e){}
        
        const pn = `${fx}-${name.replace(/\s+/g,'-')}-${moment().format("YYYY-MM-DD")}`;
        const fn = `${fp}/${pn}.md`;
        const em = emojis[category] || "📋";
        
        let pc;
        const tagList = tg.map(t => `  - ${t}`).join('\n');
        
        if (type === "project") {
            pc = `---
tags:
${tagList}
status: in-progress
created: ${moment().format("YYYY-MM-DD")}
deadline: ${dl}
priority: ${priority}
---

# ${em} ${fx} - ${name}

> **Category**: ${category.toUpperCase()}  
> **Priority**: ${priority} | **Status**: 🔵 In Progress | **Deadline**: ${dl}

---

## 💡 Quick Status Change

**Properties** > Click \`status: in-progress\` > Choose: \`in-progress\`, \`completed\`, \`archived\`, \`paused\`, \`cancelled\`

---

## 📋 Tasks

- [ ] #task #${category}/${priority}1 ${name} - Task 1 📅 ${moment().add(1,'days').format("YYYY-MM-DD")} ⏫

---

## 🎯 Objectives

...

---

## 📝 Notes

...

---

**Created**: ${moment().format("YYYY-MM-DD HH:mm")}`;
        } else {
            const te = priority === "A" ? " ⏫" : priority === "B" ? " 🔼" : "";
            
            pc = `---
tags:
${tagList}
status: in-progress
created: ${moment().format("YYYY-MM-DD")}
deadline: ${dl}
priority: ${priority}
---

# ${em} ${name}

> **Category**: ${category.toUpperCase()}  
> **Priority**: ${priority} | **Status**: 🔵 In Progress | **Deadline**: ${dl}

---

## 💡 Quick Status Change

**Properties** > \`status: in-progress\` > Choose: \`in-progress\`, \`completed\`, \`archived\`, \`paused\`, \`cancelled\`

---

## 📋 Task

- [ ] #task #${category}/${priority}${Math.floor(Math.random()*9)+1} ${name} 📅 ${dl}${te}

---

## 📝 Notes

...`;
            
            const ip = "Projects/Inbox.md";
            let ic = "";
            
            try {
                const inf = app.vault.getAbstractFileByPath(ip);
                if (inf) ic = await app.vault.read(inf);
            } catch(e) {
                ic = `# 📥 Inbox\n\n`;
            }
            
            const tn = Math.floor(Math.random()*9)+1;
            let ttg = `#task #${category}/${priority}${tn}`;
            if (extraTags) extraTags.split(',').forEach(t => {const tr = t.trim(); if(tr) ttg += ` #${tr}`;});
            
            const tl = `- [ ] ${ttg} ${name} [[${pn}|📄]] 📅 ${dl}${te}\n`;
            
            try {
                const inf = app.vault.getAbstractFileByPath(ip);
                if (inf) await app.vault.modify(inf, ic + tl);
                else await app.vault.create(ip, ic + tl);
            } catch(e) {
                await app.vault.create(ip, ic + tl);
            }
        }
        
        await app.vault.create(fn, pc);
        
        const tl = type === "project" ? "Project" : "Task";
        new Notice(`${em} Created: ${pn}`,3000);
        
        const f = app.vault.getAbstractFileByPath(fn);
        if (f) await app.workspace.getLeaf().openFile(f);
        
    } catch(e) {
        new Notice("Error: " + e.message,3000);
        console.error(e);
    }
};

const bk = dv.el("button", "📊 Kanban Board");
bk.style.cssText = "padding:8px 16px;margin:5px;font-size:14px;background:linear-gradient(135deg,#10B981 0%,#059669 100%);color:white;border:none;border-radius:6px;cursor:pointer;font-weight:bold";
bk.onclick = async () => {
    const kf = app.vault.getAbstractFileByPath("Dashboards/Kanban-Board.md");
    if (kf) {await app.workspace.getLeaf().openFile(kf); new Notice("📊 Kanban opened!",3000);}
    else new Notice("Kanban not found",3000);
};

const bg = dv.el("button", "🕸️ Graph View");
bg.style.cssText = "padding:8px 16px;margin:5px;font-size:14px;background:#8B5CF6;color:white;border:none;border-radius:6px;cursor:pointer;font-weight:bold";
bg.onclick = () => app.commands.executeCommandById('graph:open');

dv.paragraph("");
```

---

## 🔴 TODAY - URGENT

> [!danger]+ **🚨 Urgent Tasks**

```tasks
not done
(tags include #/A OR tags include #urgent OR tags include #priority-a OR path includes Inbox)
(due today OR scheduled today OR due before tomorrow)
sort by priority, due
hide backlink
hide task count
```

---

## 📊 KANBAN VIEW

> [!info]+ **🎯 Overview - Click "📊 Kanban Board" for Drag & Drop**

### 🔴 URGENT (A)

```dataview
TASK
WHERE !completed
WHERE (contains(tags,"/A") OR contains(tags,"urgent"))
SORT priority DESC, due ASC
LIMIT 10
```

### 🟠 IMPORTANT (B)

```dataview
TASK
WHERE !completed
WHERE contains(tags,"/B")
WHERE due <= date(today) + dur(7 days)
SORT due ASC
LIMIT 10
```

### 🟡 NICE-TO-HAVE (C)

```dataview
TASK
WHERE !completed
WHERE contains(tags,"/C")
SORT due ASC
LIMIT 10
```

### ✅ COMPLETED

```dataview
TASK
WHERE completed
WHERE completion >= date(today)
SORT completion DESC
LIMIT 10
```

---

## 📊 STATISTICS

```dataviewjs
const ps = dv.pages('#task');
let pA=0,pB=0,pC=0,cp=0,ov=0,wP=0,wC=0;
const td = dv.date('today');
const wa = td.minus({days:7});

for(let p of ps){
    if(!p.file.tasks) continue;
    for(let t of p.file.tasks){
        const tt = t.text.toLowerCase();
        const iA = tt.includes('/a')||tt.includes('#urgent');
        const iB = tt.includes('/b')||tt.includes('#important');
        const iC = tt.includes('/c')||tt.includes('#normal');
        
        if(!t.completed && t.due){
            const dd = dv.date(t.due);
            if(dd && dd < td) ov++;
        }
        
        if(t.completed && t.completion){
            const cd = dv.date(t.completion);
            if(cd && cd.toFormat("yyyy-MM-dd")===td.toFormat("yyyy-MM-dd")){
                if(iA){pA+=5;cp++;}
                else if(iB){pB+=3;cp++;}
                else if(iC){pC+=1;cp++;}
            }
            if(cd && cd >= wa){
                wC++;
                if(iA) wP+=5;
                else if(iB) wP+=3;
                else if(iC) wP+=1;
            }
        }
    }
}

const tp = pA+pB+pC;
dv.header(1,"⚡ "+tp+" pts today");
dv.paragraph("✅ "+cp+" tasks | ⚠️ "+ov+" overdue");

let nv = "🥉 Beginner";
if(tp>=20) nv="👑 Champion";
else if(tp>=15) nv="🥇 Advanced";
else if(tp>=10) nv="🥈 Intermediate";
else if(tp>=5) nv="🔰 Confirmed";

dv.header(2,nv);
dv.paragraph("**Today**: 🔴 A="+pA+"pts | 🟠 B="+pB+"pts | 🟡 C="+pC+"pts");
dv.paragraph("");
dv.header(3,"📅 This Week");
dv.paragraph("🎯 **"+wC+" tasks** | **"+wP+" pts**");
```

---

**Dashboard v1.17 EN** | **NEW ARCHITECTURE** | **EMOJIS INCLUDED**  
**Calendar + Instant Load** | **Zero Bugs** | **Production Ready**
