# Quick Reference - Project-Aware Notion Commands

## Auto-Detect Commands (use from project directory)

```bash
/idea                    # Capture idea (auto-detects project)
/task                    # Create task (auto-detects project)
```

## Project-Specific Commands (use from anywhere)

```bash
/idea-reccs             # Idea for Reccs
/idea-reachh            # Idea for Reachh
/idea-wordpress         # Idea for WordPress
/idea-brand-engine      # Idea for Brand Engine
```

## Examples

```bash
# Working in reccs directory
cd ~/Documents/reccs
/idea "Add user preferences panel"
# → Creates in Ideas Inbox, links to Reccs project

# Working elsewhere but want to capture for Reachh
cd ~/somewhere/else
/idea-reachh "Email notification settings"
# → Creates in Ideas Inbox, links to Reachh project

# Create task with details
/task "Fix authentication timeout" due="tomorrow" priority="High"
# → Creates in Tasks database, auto-detects project

# Extract idea from conversation
# Just chat about an idea, then:
/idea
# → Claude extracts from context and saves
```

## Directory Mappings

| Directory | Project |
|-----------|---------|
| `/Users/johnasbury/Documents/reccs` | Reccs |
| `/Users/johnasbury/Documents/Reachh` | Reachh |
| `/Users/johnasbury/Documents/Wordpress` | WordPress Care Platform |
| `/Users/johnasbury/Documents/brand-engine` | Brand Engine |
| `/Users/johnasbury/ai_img` | Brand Engine |

## Database IDs

**Ideas Inbox**: `533088a2-9c61-4903-bf33-56f2922807ed`
**Tasks**: `7f56a5c5-40b2-4712-baa1-8b03184a6ec8`

## Original Notion Commands

```bash
/Notion:search [query]           # Search workspace
/Notion:create-page              # Create new page
/Notion:create-database-row      # Add database row
/Notion:database-query           # Query database
/Notion:find                     # Find pages/databases
```
