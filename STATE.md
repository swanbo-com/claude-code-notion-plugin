# Project State - Custom Notion Plugin

**Last Updated**: 2026-01-30
**Status**: ✅ Complete and Ready to Use
**Version**: 1.0.0 (forked from makenotion/claude-code-notion-plugin)

## Overview

Custom fork of the official Notion plugin for Claude Code with project-aware commands that auto-detect which project you're working in and capture ideas/tasks to the correct Notion databases.

## Current State

### ✅ Completed

1. **Repository Setup**
   - Forked from `makenotion/claude-code-notion-plugin` to `swanbo-com/claude-code-notion-plugin`
   - Cloned to local: `/Users/johnasbury/Documents/my-notion-plugin`
   - Added as marketplace in Claude Code config
   - Plugin installed and active

2. **Project-Aware Commands Created**
   - `/idea` - Auto-detect project, capture to Ideas Inbox
   - `/task` - Auto-detect project, create in Tasks database
   - `/idea-reccs` - Direct capture to Reccs
   - `/idea-reachh` - Direct capture to Reachh
   - `/idea-wordpress` - Direct capture to WordPress
   - `/idea-brand-engine` - Direct capture to Brand Engine

3. **Database Configuration**
   - All commands pre-configured with actual database IDs
   - Ideas Inbox: `533088a2-9c61-4903-bf33-56f2922807ed`
   - Tasks: `7f56a5c5-40b2-4712-baa1-8b03184a6ec8`
   - Project relation field configured for all 4 projects

4. **Directory Mappings**
   - `/Users/johnasbury/Documents/reccs` → Reccs (`2f63bd66-37bc-81f2-914c-eeed8e404082`)
   - `/Users/johnasbury/Documents/Reachh` → Reachh (`2f63bd66-37bc-81b0-837f-f23b76e2b0bb`)
   - `/Users/johnasbury/Documents/Wordpress` → WordPress (`2f63bd66-37bc-8110-b6e8-efe57b258814`)
   - `/Users/johnasbury/Documents/brand-engine` OR `/ai_img` → Brand Engine (`2f63bd66-37bc-81fc-917c-d024f3e112a3`)

5. **Documentation**
   - ✅ SETUP.md - Complete setup and usage guide
   - ✅ QUICK_REFERENCE.md - Command quick reference
   - ✅ PROJECT_CONFIG.md - Database ID documentation
   - ✅ GET_DATABASE_IDS.md - Guide for finding IDs
   - ✅ update-database-ids.sh - Helper script for updating IDs
   - ✅ STATE.md - This file

6. **Version Control**
   - All customizations committed to `main` branch
   - Pushed to GitHub: https://github.com/swanbo-com/claude-code-notion-plugin
   - Commit: `ecb27dd` - "Add project-aware commands for automatic idea and task capture"

### 🔄 Pending

1. **Testing Required**
   - [ ] Restart Claude Code to load new commands
   - [ ] Test `/idea` from each project directory
   - [ ] Test `/task` with various arguments
   - [ ] Test project-specific commands (`/idea-reccs`, etc.)
   - [ ] Verify Notion MCP server connection
   - [ ] Confirm database rows created with correct Project relations

2. **Potential Enhancements**
   - [ ] Add `/task-reccs`, `/task-reachh`, etc. for task-specific shortcuts
   - [ ] Add priority and due date parsing to `/idea` command
   - [ ] Create `/quick-capture` that asks which type (idea vs task)
   - [ ] Add `/weekly-review` command to pull ideas/tasks by project
   - [ ] Integration with existing `/idea` skill (claude-code built-in)

### 📊 Project Structure

```
my-notion-plugin/
├── .claude-plugin/
│   ├── marketplace.json      # Marketplace metadata
│   └── plugin.json           # Plugin metadata
├── commands/
│   ├── create-database-row.md
│   ├── create-page.md
│   ├── create-task.md
│   ├── database-query.md
│   ├── find.md
│   ├── search.md
│   ├── idea.md              # ⭐ NEW: Auto-detect idea capture
│   ├── task.md              # ⭐ NEW: Auto-detect task creation
│   ├── idea-reccs.md        # ⭐ NEW: Reccs-specific idea
│   ├── idea-reachh.md       # ⭐ NEW: Reachh-specific idea
│   ├── idea-wordpress.md    # ⭐ NEW: WordPress-specific idea
│   ├── idea-brand-engine.md # ⭐ NEW: Brand Engine-specific idea
│   └── tasks/
│       ├── build.md
│       ├── explain-diff.md
│       ├── plan.md
│       └── setup.md
├── skills/
│   └── notion/
│       ├── knowledge-capture/
│       ├── meeting-intelligence/
│       ├── research-documentation/
│       └── spec-to-implementation/
├── .mcp.json                # MCP server config
├── GET_DATABASE_IDS.md      # ⭐ NEW: ID lookup guide
├── PROJECT_CONFIG.md        # ⭐ NEW: Config documentation
├── QUICK_REFERENCE.md       # ⭐ NEW: Quick command reference
├── SETUP.md                 # ⭐ NEW: Setup guide
├── STATE.md                 # ⭐ NEW: This file
├── update-database-ids.sh   # ⭐ NEW: Helper script
└── README.md                # Original README

⭐ = Custom additions to fork
```

## Configuration Files Updated

1. **~/.claude/plugins/known_marketplaces.json**
   - Added `my-notion-plugin` marketplace pointing to `/Users/johnasbury/Documents/my-notion-plugin`

2. **~/.claude/plugins/installed_plugins.json**
   - Changed marketplace from `notion-plugin-marketplace` to `my-notion-plugin`

## How Commands Work

### Auto-Detection Flow
1. User runs `/idea` or `/task` from project directory
2. Command executes `pwd` to get current working directory
3. Matches directory path against mappings
4. Determines project ID from match
5. Creates database row in unified database (Ideas Inbox or Tasks)
6. Sets Project relation field to: `["https://www.notion.so/{PROJECT_ID}"]`
7. Auto-fills Status, Created Date, Source properties
8. Returns confirmation with Notion link

### Project-Specific Flow
1. User runs `/idea-reccs` (or other project variant)
2. Command uses hard-coded database ID and project ID
3. Skips directory detection
4. Creates row directly
5. Returns confirmation

## Integration Points

- **MCP Server**: https://mcp.notion.com/mcp (Notion's hosted server)
- **OAuth**: Automatic authentication via Notion
- **Database Access**: Read/write to Ideas Inbox and Tasks databases
- **Project Linking**: Via Notion relation field to Projects database

## Known Limitations

1. Directory detection is string-based (checks if path contains project name)
2. No fuzzy matching - must be in exact project directory
3. No support for sub-projects or nested projects yet
4. Requires exact property names in Notion databases ("Project", "Status", etc.)

## Maintenance

### Syncing with Upstream
To pull updates from official Notion plugin:
```bash
cd ~/Documents/my-notion-plugin
git fetch upstream
git merge upstream/main
# Resolve conflicts, keep custom commands
```

### Updating Database IDs
If database IDs change:
1. Edit command files directly in `commands/`
2. Or run `./update-database-ids.sh` and enter new IDs
3. Commit changes
4. Restart Claude Code

## Next Session Tasks

1. **MUST DO**: Restart Claude Code to load commands
2. **TEST**: Run `/idea` from reccs directory
3. **TEST**: Run `/idea-reachh "test"` from any directory
4. **VERIFY**: Check Notion to confirm rows created correctly
5. **OPTIMIZE**: Based on usage, refine command prompts

## Success Metrics

- [ ] All 6 new commands appear in Claude Code after restart
- [ ] Ideas captured with correct project relation
- [ ] Tasks created with correct project relation
- [ ] Directory detection works 100% of time
- [ ] No manual database ID entry required
- [ ] <30 seconds from idea to Notion capture

## Resources

- **Fork**: https://github.com/swanbo-com/claude-code-notion-plugin
- **Upstream**: https://github.com/makenotion/claude-code-notion-plugin
- **Local Path**: /Users/johnasbury/Documents/my-notion-plugin
- **Notion Workspace**: (authenticated via MCP server)
