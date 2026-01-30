# 📝 Claude Code Session Logger

A professional skill for tracking your Claude Code learning journey with structured daily logs, automatic summaries, and git integration.

## ✨ Why Use This?

| Benefit | Description |
|---------|-------------|
| **Learning Reinforcement** | Writing summaries solidifies what you learned |
| **Portfolio Evidence** | Documented journey shows commitment to growth |
| **Progress Tracking** | See improvement over time |
| **Knowledge Base** | Searchable history of commands and solutions |
| **Accountability** | Structured logging keeps you focused |

---

## 🚀 Quick Start

### Installation

```bash
# 1. Create the skills directory
mkdir -p ~/.claude/skills/session-logger

# 2. Copy the SKILL.md
cp SKILL.md ~/.claude/skills/session-logger/

# 3. Initialize logs in your project
cd ~/your-project
mkdir -p .logs
cp templates/INDEX.md .logs/

# 4. Add .logs to git
git add .logs/
git commit -m "Initialize learning log"
```

### Basic Usage

```
You: session start
Claude: [Asks about your focus and goals, creates session state]

You: [Work on your tasks, ask questions, build things...]

You: session log just figured out how hooks work!
Claude: 📝 Noted: "figured out how hooks work"

You: session end
Claude: [Generates summary, creates log file, commits to git]
```

---

## 📖 Commands

| Command | Purpose |
|---------|---------|
| `session start` | Begin tracking a new session |
| `session end` | Summarize & commit log |
| `session end quick` | Fast mode, skip questions |
| `session log [note]` | Capture a moment mid-session |
| `session status` | Check if session is active |

---

## 📁 File Structure

After using the logger, your project will have:

```
your-project/
├── .session-state.json      # Active session (deleted on end)
├── .logs/
│   ├── INDEX.md             # Navigation & stats
│   ├── 2026/
│   │   ├── 01/
│   │   │   ├── 2026-01-30.md
│   │   │   └── 2026-01-31.md
│   │   └── 02/
│   │       └── ...
│   └── weekly/              # Optional weekly rollups
└── ...
```

---

## 📋 Log Format

Each daily log includes:

- **Session metadata** (time, duration, focus)
- **Goals & completion status**
- **Completed tasks** with descriptions
- **Files changed** (created/modified)
- **Key learnings** with explanations
- **Challenges & solutions** table
- **Commands discovered** with examples
- **Notes & insights**
- **Next steps** as actionable TODOs
- **Daily summary** with reflection

See `templates/example-2026-01-30.md` for a complete example.

---

## 🔧 Customization

### Change Log Location

Edit the SKILL.md and change `.logs/` to your preferred path.

### Modify Log Template

The log template is embedded in SKILL.md under "LOG FILE TEMPLATE". Customize sections as needed.

### Add Topics/Tags

Add a tags section at the end of your logs for categorization:

```markdown
## 🏷️ Tags
`claude-code` `aws` `bedrock` `skills`
```

---

## 💡 Tips for Effective Logging

1. **Be Specific** — "Learned /compact" is better than "learned stuff"
2. **Capture Commands** — Document exact syntax and what it does
3. **Note the Why** — Context matters as much as what
4. **Use Quick Notes** — Don't wait until end to capture breakthroughs
5. **Review Weekly** — Read past logs to reinforce learning
6. **Link to Resources** — Include URLs to docs you referenced

---

## 🎯 Integration Ideas

### With Your AWS Study Plan

Add a section to logs for certification progress:

```markdown
### AWS AIF-C01 Progress
- Topics studied: [list]
- Practice questions: [count]
- Confidence level: [1-10]
```

### With Anki

After each session, note flashcards to create:

```markdown
### Flashcards to Create
- Q: What does /compact do? A: Summarizes conversation to save tokens
- Q: Where are skills stored? A: ~/.claude/skills/ or .claude/skills/
```

### Weekly Reviews

Create a `/weekly-review` command that:
1. Aggregates the week's logs
2. Calculates total time spent
3. Lists all commands learned
4. Identifies patterns
5. Suggests focus for next week

---

## 🚧 Troubleshooting

### "No active session" error

The `.session-state.json` file is missing. Either:
- Start a new session with `session start`
- Create a retroactive log with `session end` (it will offer this option)

### Git commit fails

Check:
1. You're in a git repository: `git status`
2. You have commits to push: `git log --oneline -3`
3. Remote is configured: `git remote -v`

### Log file not created

Ensure the directory exists:
```bash
mkdir -p .logs/$(date +%Y/%m)
```

---

## 📈 Future Enhancements

Ideas for extending this skill:

- [ ] Weekly/monthly summary generation
- [ ] Metrics dashboard (tokens, costs, time)
- [ ] Integration with Obsidian/Notion
- [ ] Learning streak tracking
- [ ] Export to portfolio format
- [ ] AI-powered insights on learning patterns

---

## 🤝 Contributing

This is a personal learning tool, but feel free to fork and adapt for your own journey!

---

## 📄 License

MIT — Use freely for your learning journey.

---

*Built as part of my AI/ML Engineer transition journey*

Happy Learning! 🚀
