# 📋 ABCDE Task Manager Dashboard

> **Version 1.17** | **[🇬🇧 EN](#) / [🇫🇷 FR](#)** ← Click to switch language

```dataviewjs
// ============================================================
// ABCDE Task Manager Dashboard v1.17
// Bilingual Support: English / French
// ============================================================

// Language switcher
let currentLang = localStorage.getItem('abcde_lang') || 'en';

const langs = {
    en: {
        title: "ABCDE Task Manager",
        switchLang: "🇫🇷 Switch to French",
        calendar: "📅 View tasks for:",
        today: "🔵 Today",
        tomorrow: "⏭️ Tomorrow",
        tasksOf: "Tasks for",
        createBtn: "🎯 ➕ Create Task or Project",
        kanbanBtn: "📊 Kanban Board",
        graphBtn: "🕸️ Graph View",
        todaySection: "🔴 TODAY - Urgent Tasks",
        kanbanSection: "📊 KANBAN VIEW",
        inProgressA: "🔵 IN PROGRESS - URGENT (A)",
        inProgressB: "🔵 IN PROGRESS - IMPORTANT (B)",
        inProgressC: "🔵 IN PROGRESS - NICE-TO-HAVE (C)",
        paused: "⏸️ PAUSED",
        completedToday: "✅ COMPLETED TODAY",
        archived: "📦 ARCHIVED (Last 7 days)",
        statsSection: "📊 STATISTICS",
        ptsToday: "pts today",
        tasks: "tasks",
        overdue: "OVERDUE",
        thisWeek: "📅 This week",
        levels: {
            beginner: "🥉 Beginner",
            confirmed: "🔰 Confirmed",
            intermediate: "🥈 Intermediate",
            advanced: "🥇 Advanced",
            champion: "👑 Champion"
        },
        modalTitle: "🎯 Create Task or Project",
        modalType: "📌 Type",
        modalTask: "⚡ Quick Task",
        modalProject: "🎯 Full Project",
        modalName: "📝 Name",
        modalNamePlaceholder: "Ex: Analyze logs...",
        modalCategory: "📂 Category",
        modalSubcategory: "📁 Subcategory",
        modalTags: "🏷️ Additional tags",
        modalTagsPlaceholder: "urgent, incident...",
        modalPriority: "🚨 Priority",
        modalPrioA: "🔴 A - Urgent",
        modalPrioB: "🟠 B - Important",
        modalPrioC: "🟡 C - Nice-to-have",
        modalDeadline: "📅 Deadline (optional)",
        modalPreview: "🔍 Preview tags:",
        modalCreate: "✅ Create",
        modalCancel: "❌ Cancel",
        nameRequired: "❌ Name required!",
        created: "✅ Created:",
        error: "❌ Error:",
        categories: {
            administrative: "🔵 Administrative",
            health: "🟢 Health",
            professional: "🟣 Professional",
            wiki: "🔷 Wiki",
            training: "🟠 Training"
        }
    },
    fr: {
        title: "Gestionnaire de Tâches ABCDE",
        switchLang: "🇬🇧 Passer en Anglais",
        calendar: "📅 Voir tâches du :",
        today: "🔵 Aujourd'hui",
        tomorrow: "⏭️ Demain",
        tasksOf: "Tâches du",
        createBtn: "🎯 ➕ Créer Tâche ou Projet",
        kanbanBtn: "📊 Tableau Kanban",
        graphBtn: "🕸️ Vue Graphe",
        todaySection: "🔴 AUJOURD'HUI - Tâches Urgentes",
        kanbanSection: "📊 VUE KANBAN",
        inProgressA: "🔵 EN COURS - URGENT (A)",
        inProgressB: "🔵 EN COURS - IMPORTANT (B)",
        inProgressC: "🔵 EN COURS - SOUHAITABLE (C)",
        paused: "⏸️ EN PAUSE",
        completedToday: "✅ TERMINÉ AUJOURD'HUI",
        archived: "📦 ARCHIVÉ (7 derniers jours)",
        statsSection: "📊 STATISTIQUES",
        ptsToday: "pts aujourd'hui",
        tasks: "tâches",
        overdue: "EN RETARD",
        thisWeek: "📅 Cette semaine",
        levels: {
            beginner: "🥉 Débutant",
            confirmed: "🔰 Confirmé",
            intermediate: "🥈 Intermédiaire",
            advanced: "🥇 Avancé",
            champion: "👑 Champion"
        },
        modalTitle: "🎯 Créer Tâche ou Projet",
        modalType: "📌 Type",
        modalTask: "⚡ Tâche Rapide",
        modalProject: "🎯 Projet Complet",
        modalName: "📝 Nom",
        modalNamePlaceholder: "Ex: Analyser logs...",
        modalCategory: "📂 Catégorie",
        modalSubcategory: "📁 Sous-catégorie",
        modalTags: "🏷️ Tags additionnels",
        modalTagsPlaceholder: "urgent, incident...",
        modalPriority: "🚨 Priorité",
        modalPrioA: "🔴 A - Urgent",
        modalPrioB: "🟠 B - Important",
        modalPrioC: "🟡 C - Souhaitable",
        modalDeadline: "📅 Deadline (optionnel)",
        modalPreview: "🔍 Aperçu tags :",
        modalCreate: "✅ Créer",
        modalCancel: "❌ Annuler",
        nameRequired: "❌ Nom requis !",
        created: "✅ Créé :",
        error: "❌ Erreur :",
        categories: {
            administrative: "🔵 Administratif",
            health: "🟢 Santé",
            professional: "🟣 Professionnel",
            wiki: "🔷 Wiki",
            training: "🟠 Formation"
        }
    }
};

const t = langs[currentLang];

// Language switcher button
const langBtn = dv.el("button", t.switchLang);
langBtn.style.cssText = "position:absolute;top:10px;right:10px;padding:8px 16px;background:#8B5CF6;color:white;border:none;border-radius:5px;cursor:pointer;font-weight:bold;z-index:1000";
langBtn.onclick = () => {
    currentLang = currentLang === 'en' ? 'fr' : 'en';
    localStorage.setItem('abcde_lang', currentLang);
    window.location.reload();
};

dv.paragraph("");
```

---

## 📅 CALENDAR

```dataviewjs
const t = langs[localStorage.getItem('abcde_lang') || 'en'];
const c=dv.container;
const dc=c.createDiv();
dc.style.cssText="display:flex;align-items:center;gap:15px;margin-bottom:20px;padding:15px;background:linear-gradient(135deg,#667eea 0%,#764ba2 100%);border-radius:10px";

const l=dc.createEl("span",{text:t.calendar});
l.style.cssText="color:white;font-weight:bold;font-size:16px";

const di=dc.createEl("input",{type:"date"});
di.value=moment().format("YYYY-MM-DD");
di.style.cssText="padding:10px;border:2px solid white;border-radius:5px;font-size:14px;font-weight:bold";

const bt=dc.createEl("button",{text:t.today});
bt.style.cssText="padding:10px 20px;background:white;color:#667eea;border:none;border-radius:5px;cursor:pointer;font-weight:bold";
bt.onclick=()=>{di.value=moment().format("YYYY-MM-DD");window.location.reload();};

const bto=dc.createEl("button",{text:t.tomorrow});
bto.style.cssText="padding:10px 20px;background:white;color:#667eea;border:none;border-radius:5px;cursor:pointer;font-weight:bold";
bto.onclick=()=>{di.value=moment().add(1,'days').format("YYYY-MM-DD");window.location.reload();};

const si=c.createDiv();
si.style.cssText="margin-bottom:20px;padding:10px;background:#F3F4F6;border-radius:5px;text-align:center;font-size:16px;font-weight:bold";
si.innerHTML=`📆 ${t.tasksOf} <span style="color:#667eea">${moment().format("dddd DD MMMM YYYY")}</span>`;

di.addEventListener('change',()=>window.location.reload());
dv.paragraph("");
```

---

## 🚀 QUICK ACTIONS

```dataviewjs
const t = langs[localStorage.getItem('abcde_lang') || 'en'];

const cats=[
    {v:"administrative",t:t.categories.administrative},
    {v:"health",t:t.categories.health},
    {v:"professional",t:t.categories.professional},
    {v:"wiki",t:t.categories.wiki},
    {v:"training",t:t.categories.training}
];

const prios=[
    {v:"A",t:t.modalPrioA},
    {v:"B",t:t.modalPrioB},
    {v:"C",t:t.modalPrioC}
];

const emojis={administrative:"🔵",health:"🟢",professional:"🟣",wiki:"🔷",training:"🟠"};

async function askCreate(){
    return new Promise((resolve)=>{
        const m=new obsidian.Modal(app);
        m.titleEl.setText(t.modalTitle);
        m.titleEl.style.cssText="font-size:20px;font-weight:bold";
        
        m.contentEl.createEl("label",{text:t.modalType});
        const st=m.contentEl.createEl("select");
        st.style.cssText="width:100%;padding:10px;margin-bottom:15px;border:2px solid #E5E7EB;border-radius:5px;font-size:14px";
        [{v:"task",t:t.modalTask},{v:"project",t:t.modalProject}].forEach(type=>st.createEl("option",{value:type.v,text:type.t}));
        
        m.contentEl.createEl("label",{text:t.modalName});
        const inp=m.contentEl.createEl("input",{type:"text",placeholder:t.modalNamePlaceholder});
        inp.style.cssText="width:100%;padding:10px;margin-bottom:15px;border:2px solid #E5E7EB;border-radius:5px";
        
        m.contentEl.createEl("label",{text:t.modalCategory});
        const sc=m.contentEl.createEl("select");
        sc.style.cssText="width:100%;padding:10px;margin-bottom:15px;border:2px solid #E5E7EB;border-radius:5px";
        cats.forEach(c=>sc.createEl("option",{value:c.v,text:c.t}));
        
        m.contentEl.createEl("label",{text:t.modalTags});
        const it=m.contentEl.createEl("input",{type:"text",placeholder:t.modalTagsPlaceholder});
        it.style.cssText="width:100%;padding:10px;margin-bottom:15px;border:2px solid #E5E7EB;border-radius:5px";
        
        m.contentEl.createEl("label",{text:t.modalPriority});
        const sp=m.contentEl.createEl("select");
        sp.style.cssText="width:100%;padding:10px;margin-bottom:15px;border:2px solid #E5E7EB;border-radius:5px";
        prios.forEach(p=>sp.createEl("option",{value:p.v,text:p.t}));
        
        m.contentEl.createEl("label",{text:t.modalDeadline});
        const id=m.contentEl.createEl("input",{type:"date"});
        id.style.cssText="width:100%;padding:10px;margin-bottom:20px;border:2px solid #E5E7EB;border-radius:5px";
        
        const pc=m.contentEl.createDiv();
        pc.style.cssText="padding:10px;background:#F3F4F6;border-radius:5px;margin-bottom:15px";
        pc.createEl("div",{text:t.modalPreview}).style.cssText="font-weight:bold;margin-bottom:5px";
        const pt=pc.createEl("div");
        pt.style.cssText="display:flex;gap:5px;flex-wrap:wrap";
        
        function up(){
            const ty=st.value;
            const ca=sc.value;
            const pr=sp.value;
            const ex=it.value;
            
            let tg=ty==="task"?[`#task`,`#${ca}/${pr}1`]:[`#project`,`#${ca}`,`#priority-${pr.toLowerCase()}`,`#in-progress`];
            if(ex)ex.split(',').forEach(t=>{const tr=t.trim();if(tr)tg.push(`#${tr}`);});
            
            const bg=ty==="task"?"#F59E0B":"#8B5CF6";
            pt.innerHTML=tg.map(tag=>`<span style="background:${bg};color:white;padding:3px 8px;border-radius:12px;font-size:12px">${tag}</span>`).join('');
        }
        
        [st,sc,sp,it].forEach(e=>e.addEventListener('change',up));
        it.addEventListener('input',up);
        up();
        
        const bc=m.contentEl.createDiv();
        bc.style.cssText="display:flex;gap:10px";
        
        const bo=bc.createEl("button",{text:t.modalCreate});
        bo.style.cssText="flex:1;padding:12px;background:#10B981;color:white;border:none;border-radius:5px;cursor:pointer;font-weight:bold";
        
        const bca=bc.createEl("button",{text:t.modalCancel});
        bca.style.cssText="flex:1;padding:12px;background:#EF4444;color:white;border:none;border-radius:5px;cursor:pointer;font-weight:bold";
        
        bo.onclick=()=>{
            if(!inp.value){new Notice(t.nameRequired,2000);return;}
            resolve({type:st.value,name:inp.value,category:sc.value,priority:sp.value,customDate:id.value,extraTags:it.value});
            m.close();
        };
        
        bca.onclick=()=>{resolve(null);m.close();};
        inp.addEventListener("keypress",(e)=>{if(e.key==="Enter")bo.click();});
        m.open();
        inp.focus();
    });
}

const bu=dv.el("button",t.createBtn);
bu.style.cssText="padding:15px 30px;margin:5px;font-size:16px;background:linear-gradient(135deg,#8B5CF6 0%,#F59E0B 50%,#3B82F6 100%);color:white;border:none;border-radius:8px;cursor:pointer;font-weight:bold;box-shadow:0 4px 15px rgba(139,92,246,0.4)";

bu.onclick=async()=>{
    try{
        const d=await askCreate();
        if(!d)return;
        
        const {type,name,category,priority,customDate,extraTags}=d;
        
        let dl;
        if(customDate){
            dl=customDate;
        }else{
            const days=type==="task"?(priority==="A"?0:priority==="B"?3:7):(priority==="A"?7:priority==="B"?14:30);
            dl=moment().add(days,'days').format("YYYY-MM-DD");
        }
        
        let tg=type==="project"?["project",category,`priority-${priority.toLowerCase()}`,"in-progress"]:["task",category];
        if(extraTags)extraTags.split(',').forEach(t=>{const tr=t.trim();if(tr)tg.push(tr);});
        
        const catFolder={administrative:"Administrative",health:"Health",professional:"Professional",wiki:"Wiki",training:"Training"};
        let fp=`Projects/${catFolder[category]}`;
        const fx=catFolder[category].toUpperCase();
        
        try{await app.vault.createFolder(fp);}catch(e){}
        
        const pn=`${fx}-${name.replace(/\s+/g,'-')}-${moment().format("YYYY-MM-DD")}`;
        const fn=`${fp}/${pn}.md`;
        const em=emojis[category]||"📋";
        
        let pc;
        const tagList=tg.map(t=>`  - ${t}`).join('\n');
        const statusChangeSection=`## 💡 Quick Status Change

\`\`\`dataviewjs
const file = dv.current().file;

async function changeStatus(newStatus) {
    try {
        const f = app.vault.getAbstractFileByPath(file.path);
        if (!f) {new Notice("❌ File not found", 2000); return;}
        
        let content = await app.vault.read(f);
        const statusRegex = /status:\\s*[^\\n]+/;
        
        if (statusRegex.test(content)) {
            content = content.replace(statusRegex, \`status: \${newStatus}\`);
            await app.vault.modify(f, content);
            
            const statusEmoji = {"in-progress":"🔵","completed":"✅","archived":"📦","paused":"⏸️","cancelled":"❌"};
            new Notice(\`\${statusEmoji[newStatus]} Status changed: \${newStatus}\`, 3000);
            setTimeout(() => window.location.reload(), 500);
        }
    } catch (error) {
        new Notice("❌ Error: " + error.message, 2000);
    }
}

const bc = dv.el("div");
bc.style.cssText = "display:flex;gap:10px;flex-wrap:wrap;margin:10px 0";

[
    {s:"in-progress",l:"🔵 In Progress",c:"#3B82F6"},
    {s:"completed",l:"✅ Completed",c:"#10B981"},
    {s:"archived",l:"📦 Archived",c:"#6B7280"},
    {s:"paused",l:"⏸️ Paused",c:"#F59E0B"},
    {s:"cancelled",l:"❌ Cancelled",c:"#EF4444"}
].forEach(btn => {
    const b = bc.createEl("button", {text:btn.l});
    b.style.cssText = \`padding:10px 20px;background:\${btn.c};color:white;border:none;border-radius:6px;cursor:pointer;font-weight:bold;font-size:14px\`;
    b.onclick = () => changeStatus(btn.s);
});
\`\`\``;
        
        if(type==="project"){
            pc=`---
tags:
${tagList}
status: in-progress
created: ${moment().format("YYYY-MM-DD")}
deadline: ${dl}
priority: ${priority}
---

# ${em} ${fx} - ${name}

> **Category** : ${catFolder[category]}  
> **Priority** : ${priority} | **Status** : 🔵 In Progress | **Deadline** : ${dl}

---

${statusChangeSection}

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

**Created** : ${moment().format("YYYY-MM-DD HH:mm")}`;
        }else{
            const te=priority==="A"?" ⏫":priority==="B"?" 🔼":"";
            
            pc=`---
tags:
${tagList}
status: in-progress
created: ${moment().format("YYYY-MM-DD")}
deadline: ${dl}
priority: ${priority}
---

# ${em} ${name}

> **Category** : ${catFolder[category]}  
> **Priority** : ${priority} | **Status** : 🔵 In Progress | **Deadline** : ${dl}

---

${statusChangeSection}

---

## 📋 Task

- [ ] #task #${category}/${priority}${Math.floor(Math.random()*9)+1} ${name} 📅 ${dl}${te}

---

## 📝 Notes

...`;
            
            const ip="Projects/Inbox.md";
            let ic="";
            
            try{
                const inf=app.vault.getAbstractFileByPath(ip);
                if(inf)ic=await app.vault.read(inf);
            }catch(e){
                ic=`# 📥 Inbox\n\n`;
            }
            
            const tn=Math.floor(Math.random()*9)+1;
            let ttg=`#task #${category}/${priority}${tn}`;
            if(extraTags)extraTags.split(',').forEach(t=>{const tr=t.trim();if(tr)ttg+=` #${tr}`;});
            
            const tl=`- [ ] ${ttg} ${name} [[${pn}|📄]] 📅 ${dl}${te}\n`;
            
            try{
                const inf=app.vault.getAbstractFileByPath(ip);
                if(inf)await app.vault.modify(inf,ic+tl);
                else await app.vault.create(ip,ic+tl);
            }catch(e){
                await app.vault.create(ip,ic+tl);
            }
        }
        
        await app.vault.create(fn,pc);
        
        const tl=type==="project"?"Project":"Task";
        new Notice(`${t.created} ${pn}`,3000);
        
        const f=app.vault.getAbstractFileByPath(fn);
        if(f)await app.workspace.getLeaf().openFile(f);
        
    }catch(e){
        new Notice(`${t.error} ${e.message}`,3000);
        console.error(e);
    }
};

const bk=dv.el("button",t.kanbanBtn);
bk.style.cssText="padding:10px 20px;margin:5px;font-size:14px;background:linear-gradient(135deg,#10B981 0%,#059669 100%);color:white;border:none;border-radius:6px;cursor:pointer;font-weight:bold";
bk.onclick=async()=>{
    const kf=app.vault.getAbstractFileByPath("Dashboards/Kanban-Board.md");
    if(kf){await app.workspace.getLeaf().openFile(kf);new Notice("📊 Kanban opened!",3000);}
    else new Notice("❌ Kanban not found",3000);
};

const bg=dv.el("button",t.graphBtn);
bg.style.cssText="padding:10px 20px;margin:5px;font-size:14px;background:#8B5CF6;color:white;border:none;border-radius:6px;cursor:pointer;font-weight:bold";
bg.onclick=()=>app.commands.executeCommandById('graph:open');

dv.paragraph("");
```

---

## 🔴 TODAY

> [!danger]+ **🚨 TODAY'S URGENT TASKS**

```tasks
not done
(tags include #/A OR tags include #urgent OR tags include #priority-a OR path includes Inbox)
(due today OR scheduled today OR due before tomorrow)
sort by priority, due
hide backlink
hide task count
```

---

## 📊 KANBAN

> [!info]+ **🎯 Overview - Click "📊 Kanban Board" for drag & drop**

### 🔵 IN PROGRESS - URGENT (A)

```dataview
TASK
WHERE !completed
WHERE (contains(tags,"/A") OR contains(tags,"urgent"))
WHERE contains(string(status),"in-progress") OR !status
SORT priority DESC, due ASC
LIMIT 10
```

---

### 🔵 IN PROGRESS - IMPORTANT (B)

```dataview
TASK
WHERE !completed
WHERE contains(tags,"/B")
WHERE contains(string(status),"in-progress") OR !status
WHERE due <= date(today) + dur(7 days)
SORT due ASC
LIMIT 10
```

---

### 🔵 IN PROGRESS - NICE-TO-HAVE (C)

```dataview
TASK
WHERE !completed
WHERE contains(tags,"/C")
WHERE contains(string(status),"in-progress") OR !status
SORT due ASC
LIMIT 10
```

---

### ⏸️ PAUSED

```dataview
TASK
WHERE !completed
WHERE contains(string(status),"paused")
SORT due ASC
LIMIT 10
```

---

### ✅ COMPLETED TODAY

```dataview
TASK
WHERE completed
WHERE completion >= date(today)
SORT completion DESC
LIMIT 10
```

---

### 📦 ARCHIVED

```dataview
LIST
WHERE contains(string(status),"archived")
WHERE file.mtime >= date(today) - dur(7 days)
SORT file.mtime DESC
LIMIT 10
```

---

## 📊 STATS

```dataviewjs
const t = langs[localStorage.getItem('abcde_lang') || 'en'];
const ps=dv.pages('#task');
let pA=0,pB=0,pC=0,cp=0,ov=0,wP=0,wC=0;
const td=dv.date('today');
const wa=td.minus({days:7});

for(let p of ps){
    if(!p.file.tasks)continue;
    for(let task of p.file.tasks){
        const tt=task.text.toLowerCase();
        const iA=tt.includes('/a')||tt.includes('#urgent');
        const iB=tt.includes('/b')||tt.includes('#important');
        const iC=tt.includes('/c')||tt.includes('#normal');
        
        if(!task.completed&&task.due){
            const dd=dv.date(task.due);
            if(dd&&dd<td)ov++;
        }
        
        if(task.completed&&task.completion){
            const cd=dv.date(task.completion);
            if(cd&&cd.toFormat("yyyy-MM-dd")===td.toFormat("yyyy-MM-dd")){
                if(iA){pA+=5;cp++;}
                else if(iB){pB+=3;cp++;}
                else if(iC){pC+=1;cp++;}
            }
            if(cd&&cd>=wa){
                wC++;
                if(iA)wP+=5;
                else if(iB)wP+=3;
                else if(iC)wP+=1;
            }
        }
    }
}

const tp=pA+pB+pC;
dv.header(1,"⚡ "+tp+" "+t.ptsToday);
dv.paragraph("✅ "+cp+" "+t.tasks+" | ⚠️ "+ov+" "+t.overdue);

let nv=t.levels.beginner;
if(tp>=20)nv=t.levels.champion;
else if(tp>=15)nv=t.levels.advanced;
else if(tp>=10)nv=t.levels.intermediate;
else if(tp>=5)nv=t.levels.confirmed;

dv.header(2,nv);
dv.paragraph("**Today** : 🔴 A="+pA+"pts | 🟠 B="+pB+"pts | 🟡 C="+pC+"pts");
dv.paragraph("");
dv.header(3,t.thisWeek);
dv.paragraph("🎯 **"+wC+" "+t.tasks+"** | **"+wP+" pts**");
```

---

**Dashboard V1.17** | **Bilingual: EN/FR** | **Dynamic Categories**  
**Created**: 2025-10-28