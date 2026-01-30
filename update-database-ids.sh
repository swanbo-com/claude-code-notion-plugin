#!/bin/bash

# Script to update database ID placeholders with actual Notion database IDs
# Usage: ./update-database-ids.sh

echo "=== Notion Plugin Database ID Updater ==="
echo ""
echo "This script will replace placeholder database IDs in your commands."
echo "You'll be prompted to enter the actual database IDs for each project."
echo ""

# Function to prompt for database ID
prompt_for_id() {
    local project_name="$1"
    local db_type="$2"
    local placeholder="$3"

    echo "Enter ${project_name} ${db_type} Database ID:"
    echo "(Press Enter to skip if you don't have this database)"
    read -r database_id

    if [ -n "$database_id" ]; then
        # Replace placeholder in all command files
        find commands -name "*.md" -type f -exec sed -i '' "s/${placeholder}/${database_id}/g" {} +
        echo "✓ Updated ${project_name} ${db_type} database ID"
    else
        echo "⊘ Skipped ${project_name} ${db_type}"
    fi
    echo ""
}

# Reccs
echo "--- RECCS PROJECT ---"
prompt_for_id "Reccs" "Ideas" "YOUR_RECCS_IDEAS_DATABASE_ID_HERE"
prompt_for_id "Reccs" "Tasks" "YOUR_RECCS_TASKS_DATABASE_ID_HERE"

# Reachh
echo "--- REACHH PROJECT ---"
prompt_for_id "Reachh" "Ideas" "YOUR_REACHH_IDEAS_DATABASE_ID_HERE"
prompt_for_id "Reachh" "Tasks" "YOUR_REACHH_TASKS_DATABASE_ID_HERE"

# WordPress
echo "--- WORDPRESS PROJECT ---"
prompt_for_id "WordPress" "Ideas" "YOUR_WORDPRESS_IDEAS_DATABASE_ID_HERE"
prompt_for_id "WordPress" "Tasks" "YOUR_WORDPRESS_TASKS_DATABASE_ID_HERE"

# Brand Engine
echo "--- BRAND ENGINE PROJECT ---"
prompt_for_id "Brand Engine" "Ideas" "YOUR_BRAND_ENGINE_IDEAS_DATABASE_ID_HERE"
prompt_for_id "Brand Engine" "Tasks" "YOUR_BRAND_ENGINE_TASKS_DATABASE_ID_HERE"

echo "=== Done! ==="
echo ""
echo "Your commands are now configured with your Notion database IDs."
echo "You can verify by checking: commands/idea.md"
echo ""
