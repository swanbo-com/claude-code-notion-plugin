# Custom Notion Plugin Setup

This is your forked and customized version of the Notion plugin with **project-aware** commands.

## What's Customized

### 🎯 New Project-Aware Commands

#### `/idea` - Auto-detect project and capture idea
Automatically detects your current project from the directory and captures the idea to the right project.

**Usage:**
```bash
/idea "Add dark mode toggle to settings"
# OR just:
/idea
# (Claude will extract from conversation)
```

**How it works:**
- Detects project from `pwd`
- Creates row in Ideas Inbox (533088a2-9c61-4903-bf33-56f2922807ed)
- Links to correct project via Project relation field
- Auto-fills Status, Created Date, Source

#### `/task` - Auto-detect project and create task
Same as `/idea` but creates in Tasks database.

**Usage:**
```bash
/task "Fix authentication bug" due="tomorrow" priority="High"
```

#### Project-Specific Shortcuts

When you're working in a different directory but want to capture for a specific project:

```bash
/idea-reccs "New recommendation algorithm"
/idea-reachh "Add email templates"
/idea-wordpress "Custom post type for testimonials"
/idea-brand-engine "Batch image processing"
```

## Database Configuration

All commands are pre-configured with your database IDs:

```bash
# Ideas Inbox (shared)
IDEAS_INBOX_DB="533088a2-9c61-4903-bf33-56f2922807ed"

# Tasks (shared)
TASKS_DB="7f56a5c5-40b2-4712-baa1-8b03184a6ec8"

# Project IDs (for relation field)
RECCS_PROJECT_ID="2f63bd66-37bc-81f2-914c-eeed8e404082"
REACHH_PROJECT_ID="2f63bd66-37bc-81b0-837f-f23b76e2b0bb"
WORDPRESS_PROJECT_ID="2f63bd66-37bc-8110-b6e8-efe57b258814"
BRAND_ENGINE_PROJECT_ID="2f63bd66-37bc-81fc-917c-d024f3e112a3"
```

## Directory Mappings

The plugin detects projects based on these directory paths:

- `/Users/johnasbury/Documents/reccs` → Reccs
- `/Users/johnasbury/Documents/Reachh` → Reachh
- `/Users/johnasbury/Documents/Wordpress` → WordPress Care Platform
- `/Users/johnasbury/Documents/brand-engine` OR `/Users/johnasbury/ai_img` → Brand Engine

## Installation Status

✅ Plugin is already installed and configured!

Your Claude Code is now using this forked version located at:
`/Users/johnasbury/Documents/my-notion-plugin`

## Next Steps

### 1. Restart Claude Code
```bash
# Exit Claude Code and restart to load the new commands
```

### 2. Test the Commands

Once restarted, test the new commands:

```bash
# Test auto-detection (run from inside a project directory)
cd ~/Documents/reccs
/idea "Test idea from reccs directory"

# Test specific project commands
/idea-reachh "Test idea for Reachh"

# Test task creation
/task "Test task creation" priority="High"
```

### 3. Connect to Notion (if not already connected)

The MCP server should auto-connect via OAuth. If prompted:
1. Authenticate with Notion
2. Grant workspace access
3. Confirm connection

## Available Commands

### Original Notion Commands (still available)
- `/Notion:search` - Search workspace
- `/Notion:create-page` - Create new page
- `/Notion:create-database-row` - Add row to database
- `/Notion:create-task` - Create task (generic)
- `/Notion:database-query` - Query databases
- `/Notion:find` - Find specific pages/databases

### New Project-Aware Commands
- `/idea` - Auto-detect project, capture idea
- `/task` - Auto-detect project, create task
- `/idea-reccs` - Capture idea for Reccs
- `/idea-reachh` - Capture idea for Reachh
- `/idea-wordpress` - Capture idea for WordPress
- `/idea-brand-engine` - Capture idea for Brand Engine

### Skills (use with natural language)
- **notion-knowledge-capture** - Turn conversations into docs
- **notion-meeting-intelligence** - Meeting notes & actions
- **notion-research-documentation** - Research synthesis
- **notion-spec-to-implementation** - Specs to tasks

## Customizing Further

Want to add more commands or modify existing ones?

1. Commands are in: `commands/`
2. Each command is a markdown file with instructions for Claude
3. Edit the `.md` files to change behavior
4. Restart Claude Code to reload

## Syncing with Upstream

To get updates from the official Notion plugin:

```bash
cd ~/Documents/my-notion-plugin
git remote add upstream https://github.com/makenotion/claude-code-notion-plugin.git
git fetch upstream
git merge upstream/main
# Resolve conflicts if any, keeping your customizations
```

## Troubleshooting

**Commands not showing up?**
- Restart Claude Code
- Check that the plugin is in `~/Documents/my-notion-plugin`
- Verify `~/.claude/plugins/installed_plugins.json` points to `my-notion-plugin` marketplace

**Project not detected?**
- Make sure you're in the correct directory
- Check that the path matches one of the directory mappings above
- Use project-specific commands (`/idea-reccs`, etc.) as fallback

**Database errors?**
- Verify database IDs in command files haven't changed
- Check Notion connection is active
- Re-authenticate if needed

## Support

For issues with:
- **Project-aware features**: Edit this fork
- **Base Notion integration**: Check [official repo](https://github.com/makenotion/claude-code-notion-plugin)
- **Claude Code**: See [Claude Code docs](https://docs.anthropic.com/claude-code)
