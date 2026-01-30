# How to Get Your Notion Database IDs

You need the database IDs for:
1. **Reccs** - Ideas/Tasks database
2. **Reachh** - Ideas/Tasks database
3. **WordPress** - Ideas/Tasks database
4. **Brand Engine** (ai_img) - Ideas/Tasks database

## Method 1: From Notion URL

1. Open the database in Notion (web or desktop)
2. Look at the URL in your browser:
   ```
   https://www.notion.so/YOUR_WORKSPACE/DATABASE_ID?v=...
                                        ^^^^^^^^^^
   ```
3. Copy the 32-character ID (before the `?v=`)

## Method 2: Use the Search Command

Once you connect the MCP server, you can run:
```bash
/Notion:search "Ideas"
```

This will list all databases with "Ideas" in the name, including their IDs.

## What I Need

Please provide the database IDs in this format:

```
RECCS_IDEAS_DB_ID=abc123...
RECCS_TASKS_DB_ID=def456... (optional, if separate)

REACHH_IDEAS_DB_ID=ghi789...
REACHH_TASKS_DB_ID=jkl012... (optional)

WORDPRESS_IDEAS_DB_ID=mno345...
WORDPRESS_TASKS_DB_ID=pqr678... (optional)

BRAND_ENGINE_IDEAS_DB_ID=stu901...
BRAND_ENGINE_TASKS_DB_ID=vwx234... (optional)
```

Or just give me one "Ideas Inbox" database ID if you use a single database with a "Project" property to filter.
