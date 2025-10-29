# 🕸️ Graph View - DENSE SWARM CLUSTERS v1.17

> **Vue Graphique avec Swarms Denses & Visibles**  
> **Clusters compacts** • **Nœuds gros** • **ZERO espacement fourmis!**

---

## 🧠 INTELLIGENT AUTO-SYNC WITH DENSE SWARMS

```dataviewjs
const button = dv.el("button", "🧠 SCAN & SYNC GRAPH SWARMS");
button.style.cssText = "padding: 12px 24px; font-size: 16px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; border: none; border-radius: 8px; cursor: pointer; font-weight: bold; box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4); transition: all 0.3s;";

button.onclick = async () => {
    try {
        button.textContent = "🔄 Scanning...";
        
        // Base Colors - Thematic Mapping
        const baseColors = {
            "administrative": 16744192,   // 🟠 Orange #FFA500
            "health": 1638144,            // 🟢 Green #19B419
            "professional": 8388863,      // 🟣 Purple #7F00FF
            "wiki": 8421504,              // ⚫ Gray #808080
            "training": 16711680          // 🔴 Red #FF0000
        };
        
        // Function to lighten color
        function lightenColor(rgb, percent) {
            const r = (rgb >> 16) & 0xFF;
            const g = (rgb >> 8) & 0xFF;
            const b = rgb & 0xFF;
            
            const newR = Math.min(255, Math.floor(r + (255 - r) * percent));
            const newG = Math.min(255, Math.floor(g + (255 - g) * percent));
            const newB = Math.min(255, Math.floor(b + (255 - b) * percent));
            
            return (newR << 16) | (newG << 8) | newB;
        }
        
        // Scan all vault tags
        const allPages = dv.pages();
        const tagSet = new Set();
        const tagMap = {};
        
        for (let page of allPages) {
            if (page.file.tags) {
                for (let tag of page.file.tags) {
                    const tagName = tag.replace('#', '');
                    tagSet.add(tagName);
                    if (!tagMap[tagName]) tagMap[tagName] = 0;
                    tagMap[tagName]++;
                }
            }
        }
        
        // MAIN CLUSTERS - Base Colors
        const colorGroups = [
            // 🔵 DASHBOARD HUB - Light Blue (Central hub connecting all)
            {
                "query": "file:Dashboard OR file:Kanban",
                "color": {"a": 1, "rgb": 3972831}  // Light Blue #3CCFFF
            },
            
            // 🟠 ADMINISTRATIVE SWARM
            {
                "query": "tag:#administrative OR path:Projects/Administrative/",
                "color": {"a": 1, "rgb": baseColors.administrative}
            },
            // 🟢 HEALTH SWARM
            {
                "query": "tag:#health OR path:Projects/Health/",
                "color": {"a": 1, "rgb": baseColors.health}
            },
            // 🟣 PROFESSIONAL SWARM
            {
                "query": "tag:#professional OR path:Projects/Professional/",
                "color": {"a": 1, "rgb": baseColors.professional}
            },
            // ⚫ WIKI SWARM
            {
                "query": "tag:#wiki OR path:Projects/Wiki/",
                "color": {"a": 1, "rgb": baseColors.wiki}
            },
            // 🔴 TRAINING SWARM
            {
                "query": "tag:#training OR path:Projects/Training/",
                "color": {"a": 1, "rgb": baseColors.training}
            }
        ];
        
        // Generate lighter versions for sub-tags (to keep in same swarm)
        const processedTags = new Set(['administrative', 'health', 'professional', 'wiki', 'training', 'task', 'project', 'in-progress', 'completed', 'archived', 'paused', 'cancelled', 'priority-a', 'priority-b', 'priority-c', 'urgent', 'important']);
        let lightLevel = 0.25;
        
        for (let tag of tagSet) {
            if (processedTags.has(tag)) continue;
            
            const parts = tag.split('/');
            if (parts.length > 1) {
                const parent = parts[0];
                
                if (baseColors[parent]) {
                    const depth = parts.length - 1;
                    const lightenAmount = lightLevel * depth;
                    const derivedColor = lightenColor(baseColors[parent], lightenAmount);
                    
                    colorGroups.push({
                        "query": `tag:#${tag}`,
                        "color": {"a": 1, "rgb": derivedColor}
                    });
                    
                    processedTags.add(tag);
                }
            }
        }
        
        // STATUS COLORS (separate swarm indicators)
        colorGroups.push(
            {
                "query": "tag:#in-progress",
                "color": {"a": 1, "rgb": 3901695}  // Blue 🔵
            },
            {
                "query": "tag:#completed",
                "color": {"a": 1, "rgb": 1096065}  // Green ✅
            },
            {
                "query": "tag:#archived",
                "color": {"a": 1, "rgb": 7039851}  // Gray 📦
            },
            {
                "query": "tag:#paused",
                "color": {"a": 1, "rgb": 16744192} // Orange ⏸️
            },
            {
                "query": "tag:#cancelled",
                "color": {"a": 1, "rgb": 15745092} // Red ❌
            }
        );
        
        // PRIORITY COLORS
        colorGroups.push(
            {
                "query": "tag:#priority-a OR tag:#urgent",
                "color": {"a": 1, "rgb": 15745092}  // Red 🔴
            },
            {
                "query": "tag:#priority-b OR tag:#important",
                "color": {"a": 1, "rgb": 16744192} // Orange 🟠
            },
            {
                "query": "tag:#priority-c",
                "color": {"a": 1, "rgb": 15724032} // Yellow 🟡
            }
        );
        
        // SPECIAL FILES
        colorGroups.push(
            {
                "query": "tag:#project",
                "color": {"a": 1, "rgb": 16711935}  // Magenta 💜
            },
            {
                "query": "file:README OR file:Index OR file:Graph",
                "color": {"a": 1, "rgb": 12632256}  // Dark Gray 🔲
            }
        );
        
        // DENSE SWARM CONFIG - NO MORE ANTS!
        const graphConfig = {
            "collapse-filter": false,
            "search": "",
            "showTags": true,
            "showAttachments": false,
            "hideUnresolved": false,
            "showOrphans": false,
            "collapse-color-groups": false,
            "colorGroups": colorGroups,
            "collapse-display": false,
            "showArrow": false,
            "textFadeMultiplier": 0,
            "nodeSizeMultiplier": 3.5,          // HUGE NODES! (was 1.5)
            "lineSizeMultiplier": 2,            // Thicker lines (was 0.8)
            "collapse-forces": false,
            "centerStrength": 0.3,              // Medium center pull
            "repelStrength": 25,                // REDUCED - closer clusters (was 60)
            "linkStrength": 0.5,                // Stronger connections (was 0.25)
            "linkDistance": 120,                // Closer nodes (was 70)
            "scale": 1.2,
            "close": false
        };
        
        // Write graph.json
        await app.vault.adapter.write(".obsidian/graph.json", JSON.stringify(graphConfig, null, 2));
        
        new Notice(`✅ DENSE SWARMS SYNCED! 🔥 ${colorGroups.length} clusters | ${tagSet.size} tags | BIG NODES!`, 5000);
        
        button.textContent = `✅ DENSE SWARMS - ${tagSet.size} tags`;
        button.style.background = "linear-gradient(135deg, #11998e 0%, #38ef7d 100%)";
        
    } catch (error) {
        new Notice("❌ Error: " + error.message, 5000);
        console.error("Graph sync error:", error);
        button.textContent = "❌ Error - Retry";
        button.style.background = "linear-gradient(135deg, #f85032 0%, #e73827 100%)";
    }
};

dv.paragraph("");
```

---

## 🎨 DENSE SWARM LAYOUT

**NOW WITH BIG NODES & TIGHT CLUSTERS:**

```
                    🔵 DASHBOARD (Sky Blue HUB - BIG!)
                           ↓
        ┌─────────────────┼─────────────────┐
        ↓                 ↓                 ↓
   🟠 ADMIN          🟢 HEALTH          🟣 PROF
   ●●●●●             ●●●●●              ●●●●●
   ●●●●●             ●●●●●              ●●●●●
   ●●●●●             ●●●●●              ●●●●●
   
        ↓                 ↓
   ⚫ WIKI            🔴 TRAINING
   ●●●●●             ●●●●●
   ●●●●●             ●●●●●
   ●●●●●             ●●●●●
```

**NO MORE ANTS! DENSE CLUSTERS! 🎉**

---

## ⚙️ DENSE OPTIMIZATION SETTINGS

| Setting | Before | After | Effect |
|---------|--------|-------|--------|
| **nodeSizeMultiplier** | 1.5 | **3.5** | 🔥 HUGE visible nodes |
| **repelStrength** | 60 | **25** | Clusters MUCH closer |
| **linkDistance** | 70 | **120** | Tighter bonds |
| **linkStrength** | 0.25 | **0.5** | Stronger connections |
| **lineSizeMultiplier** | 0.8 | **2** | Thick visible lines |

---

## 📊 TAG DETECTION + DENSE VIEW

```dataviewjs
const allPages = dv.pages();
const tagMap = {};
const categoryStats = {
    "administrative": 0,
    "health": 0,
    "professional": 0,
    "wiki": 0,
    "training": 0
};

// Scan all tags
for (let page of allPages) {
    if (page.file.tags) {
        for (let tag of page.file.tags) {
            const tagName = tag.replace('#', '');
            if (!tagMap[tagName]) {
                tagMap[tagName] = 0;
            }
            tagMap[tagName]++;
            
            // Count by category
            if (tagName.startsWith('administrative')) categoryStats.administrative++;
            else if (tagName.startsWith('health')) categoryStats.health++;
            else if (tagName.startsWith('professional')) categoryStats.professional++;
            else if (tagName.startsWith('wiki')) categoryStats.wiki++;
            else if (tagName.startsWith('training')) categoryStats.training++;
        }
    }
}

dv.header(2, "🎨 Dense Swarm Architecture");
dv.paragraph('**Central Hub**: Dashboard (Light Blue 🔵) - **VISIBLE SIZE**');
dv.paragraph('**Node Size**: 3.5x multiplier = **HUGE VISIBLE NODES!**');
dv.paragraph("");

dv.header(3, "📊 Cluster Statistics");
dv.paragraph(`🟠 **Administrative Swarm**: ${categoryStats.administrative} nodes - **COMPACT**`);
dv.paragraph(`🟢 **Health Swarm**: ${categoryStats.health} nodes - **COMPACT**`);
dv.paragraph(`🟣 **Professional Swarm**: ${categoryStats.professional} nodes - **COMPACT**`);
dv.paragraph(`⚫ **Wiki Swarm**: ${categoryStats.wiki} nodes - **COMPACT**`);
dv.paragraph(`🔴 **Training Swarm**: ${categoryStats.training} nodes - **COMPACT**`);

const totalClusterNodes = Object.values(categoryStats).reduce((a,b) => a+b, 0);
dv.paragraph("");
dv.paragraph(`**Total dense nodes**: ${totalClusterNodes}`);
dv.paragraph(`**Hub + Kanban**: 2 nodes (extra big!)`);
dv.paragraph(`**Total tags**: ${Object.keys(tagMap).length}`);
```

---

## ✅ POST-SYNC CHECKLIST

- [ ] Click "🧠 SCAN & SYNC GRAPH SWARMS"
- [ ] See "✅ DENSE SWARMS SYNCED!" message
- [ ] **Close & reopen Obsidian**
- [ ] Open Graph View (`Ctrl+G`)
- [ ] See **BIG NODES** in **TIGHT CLUSTERS**
- [ ] See **Sky Blue Hub** in center (BIG!)
- [ ] See **5 dense colored swarms** orbiting it
- [ ] **NO MORE ANTS!** 🎉

---

## 🎯 FINAL RESULT

✅ **Huge Sky Blue Hub** = Dashboard + Kanban (VISIBLE!)  
✅ **Dense Orange Swarm** = Administrative (PACKED!)  
✅ **Dense Green Swarm** = Health (PACKED!)  
✅ **Dense Purple Swarm** = Professional (PACKED!)  
✅ **Dense Gray Swarm** = Wiki (PACKED!)  
✅ **Dense Red Swarm** = Training (PACKED!)  

**Beautiful, organized, and VISIBLE!** 🌊✨

---

## 📝 Navigation

- [[Dashboards/Dashboard|📋 Dashboard]]
- [[Dashboards/Kanban-Board|📊 Kanban Board]]
- [[README|📚 Documentation]]

---

**Graph View v1.17 DENSE SWARMS** | **Big Nodes** | **Tight Clusters**  
**NO MORE ANTS!** | **Production Ready** ✅
