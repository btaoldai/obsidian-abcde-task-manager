# 📋 Obsidian ABCDE Task Manager

> **Version 1.17** | Un système complet de gestion de tâches par priorité pour Obsidian  
> Créé par Btaoldai | [Licence MIT](LICENSE)

**[🇬🇧 English version](README.md)**

---

## 🎯 Présentation

**ABCDE Task Manager** est un système avancé de gestion de tâches pour Obsidian qui implémente la méthode de priorisation ABCDE. Il fournit un tableau de bord unifié, des tableaux Kanban intelligents, une création de projets dynamique et un suivi automatisé des statuts.

### ✨ Fonctionnalités Principales

- **🎯 Système de Priorité ABCDE** : A (Urgent - 7 jours), B (Important - 14 jours), C (Souhaitable - 30 jours)
- **📊 Tableau de Bord Unifié** : Accès en un clic à toutes les tâches, projets et statistiques
- **🔄 Catégories Dynamiques** : Ajout de catégories personnalisées à la volée lors de la création de projet
- **📈 Kanban Intelligent** : Filtrage par statut avec support drag & drop
- **🎨 Gestion Visuelle des Statuts** : Badges colorés et boutons de changement rapide
- **📱 Stats Temps Réel** : Système de points, suivi de progression et gamification
- **🔗 Liaison Automatique** : Tâches automatiquement liées aux pages de projet
- **🕸️ Vue Graphe** : Relations visuelles et dépendances entre projets

---

## 📦 Contenu du Repo

```
obsidian-abcde-task-manager/
├── .obsidian/
│   └── snippets/
│       └── abcde-colors.css
├── Dashboards/
│   ├── Dashboard.md
│   └── Kanban-Board.md
├── Projects/
│   ├── Administrative/
│   ├── Health/
│   ├── Professional/
│   ├── Wiki/
│   ├── Training/
│   └── Inbox.md
├── src/
│   ├── Status-in-progress.md
│   ├── Status-completed.md
│   ├── Status-archived.md
│   ├── Status-paused.md
│   └── Status-cancelled.md
├── scripts/
│   ├── setup.ps1
│   └── setup.sh
├── README.md
├── README.fr.md
├── LICENSE
└── .gitignore
```

---

## 🚀 Démarrage Rapide

### Option A : Installation Automatisée (Recommandé)

#### Windows (PowerShell)

```powershell
cd "C:\Chemin\Vers\Votre\Vault\Obsidian"
git clone https://github.com/yourusername/obsidian-abcde-task-manager .
.\scripts\setup.ps1
```

#### Linux/Mac (Bash)

```bash
cd ~/chemin/vers/votre/vault/obsidian
git clone https://github.com/yourusername/obsidian-abcde-task-manager .
chmod +x scripts/setup.sh
./scripts/setup.sh
```

### Option B : Installation Manuelle

1. **Cloner le dépôt** dans le répertoire de votre vault Obsidian
2. **Installer les plugins requis** :
   - Dataview (requis)
   - Tasks (requis)
   - Kanban (optionnel)
3. **Activer le snippet CSS** :
   - Paramètres → Apparence → Snippets CSS → Activer `abcde-colors`
4. **Activer Dataview JavaScript** :
   - Paramètres → Dataview → Enable JavaScript Queries
5. **Redémarrer Obsidian**
6. **Ouvrir le Dashboard** : `Dashboards/Dashboard.md`

---

## 📚 Guide d'Utilisation

### Créer un Projet

1. Ouvrir `Dashboards/Dashboard.md`
2. Cliquer **"🎯 ➕ Create Task or Project"**
3. Sélectionner **"🎯 Full Project"**
4. Remplir les détails
5. Cliquer **"✅ Create"**

### Créer une Tâche Rapide

1. Ouvrir Dashboard
2. Cliquer **"🎯 ➕ Create Task or Project"**
3. Sélectionner **"⚡ Quick Task"**
4. Remplir et créer

### Changer le Statut d'un Projet

**Méthode 1 : Boutons Rapides** (Plus rapide)
1. Ouvrir le fichier projet
2. Section "💡 Quick Status Change"
3. Cliquer sur le bouton de statut souhaité

**Méthode 2 : Dropdown Properties**
1. Ouvrir le fichier projet
2. Cliquer sur `status` dans Properties
3. Sélectionner nouveau statut

---

## 🔌 Plugins Requis

### Dataview
**Requis** | Permet les requêtes du dashboard

Configuration: Settings → Dataview → Enable JavaScript Queries → **ON**

### Tasks
**Requis** | Fournit gestion des tâches et filtering

### Kanban
**Optionnel** | Active la fonctionnalité drag & drop

---

## 📝 Licence

Licence MIT - Voir le fichier [LICENSE](LICENSE) pour les détails.

**Créé par Btaoldai**

---

## 🙏 Remerciements

- Méthode de Priorité ABCDE
- Communauté Obsidian
- Plugin Dataview par blacksmithgu
- Plugin Tasks par Obsidian Tasks Group

---

**⭐ Si ce projet vous aide, merci de mettre une étoile au dépôt !**
