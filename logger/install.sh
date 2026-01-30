#!/bin/bash

#══════════════════════════════════════════════════════════════════════════════
# Session Logger Skill - Installation Script
#══════════════════════════════════════════════════════════════════════════════

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║     📝 Claude Code Session Logger - Installer                ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Step 1: Install skill globally
echo -e "${YELLOW}[1/3] Installing skill to ~/.claude/skills/...${NC}"
mkdir -p ~/.claude/skills/session-logger
cp "$SCRIPT_DIR/SKILL.md" ~/.claude/skills/session-logger/
echo -e "${GREEN}  ✓ Skill installed${NC}"

# Step 2: Initialize logs in current project (optional)
echo ""
echo -e "${YELLOW}[2/3] Initialize .logs/ in current directory?${NC}"
read -p "  This will create .logs/ with INDEX.md [Y/n]: " init_logs

if [[ ! $init_logs =~ ^[Nn]$ ]]; then
    mkdir -p .logs/$(date +%Y/%m)
    
    if [ -f "$SCRIPT_DIR/templates/INDEX.md" ]; then
        cp "$SCRIPT_DIR/templates/INDEX.md" .logs/
        # Update the start date
        sed -i.bak "s/\[Date\]/$(date +%Y-%m-%d)/" .logs/INDEX.md 2>/dev/null || \
        sed -i '' "s/\[Date\]/$(date +%Y-%m-%d)/" .logs/INDEX.md
        rm -f .logs/INDEX.md.bak
    fi
    
    echo -e "${GREEN}  ✓ Logs directory created at .logs/${NC}"
else
    echo -e "${BLUE}  ⏭ Skipped${NC}"
fi

# Step 3: Git setup
echo ""
echo -e "${YELLOW}[3/3] Git integration${NC}"

if [ -d ".git" ]; then
    read -p "  Add .logs/ to git and commit? [Y/n]: " git_add
    
    if [[ ! $git_add =~ ^[Nn]$ ]]; then
        git add .logs/ 2>/dev/null || true
        git commit -m "📝 Initialize session logging

Added:
- .logs/ directory for tracking learning sessions
- INDEX.md for log navigation

Using Claude Code Session Logger skill" 2>/dev/null || echo -e "${BLUE}  ⏭ Nothing to commit${NC}"
        echo -e "${GREEN}  ✓ Committed to git${NC}"
    else
        echo -e "${BLUE}  ⏭ Skipped${NC}"
    fi
else
    echo -e "${BLUE}  ⏭ Not a git repository${NC}"
fi

# Done!
echo ""
echo -e "${GREEN}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║              ✅ Installation Complete!                       ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}Usage:${NC}"
echo "  1. Start Claude Code in your project"
echo "  2. Say: ${YELLOW}session start${NC}"
echo "  3. Work on your tasks..."
echo "  4. Say: ${YELLOW}session log${NC} to capture moments"
echo "  5. Say: ${YELLOW}session end${NC} when done"
echo ""
echo -e "${GREEN}Happy learning! 🚀${NC}"
