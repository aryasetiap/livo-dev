# AI Development Agent Guidelines

## Project Overview
**Project:** livo-dev
**** ## Comprehensive Repository Summary: livo-dev

This comprehensive summary is based on the analysis of the provided repository, `aryasetiap/livo-dev`, which currently contains only a `README.md` file. Due to the extremely limited content, the analysis focuses on the initial state of a project and provides recommendations for its development.

**1. What this codebase does (Purpose and Functionality)**

Based solely on the `README.md` file, the primary purpose of this repository is to host a project titled "livo-dev". At this stage, the specific functionality, domain, or goals of this project are **undefined**. The `README.md` acts as a placeholder, indicating an intent to start a project, but no actual code or detailed description of its purpose is present.

**2. Key Architecture and Technology Choices**

Given the absence of any code files or detailed documentation beyond the title in the `README.md`, it is **impossible to determine** any architecture or technology choices. There are no indications of programming languages, frameworks, databases, or cloud platforms being used.

**3. Main Components and How They Interact**

The only identifiable "component" in this repository is the `README.md` file itself. It serves as the project's initial introductory document. As there are no other files or code, there are **no interactions** to analyze.

**4. Notable Patterns, Configurations, or Design Decisions**

There are **no notable patterns, configurations, or design decisions** evident from the current repository content. The presence of a `README.md` is a standard practice for any repository, indicating an intention for documentation, but its current content is minimal.

**5. Overall Code Structure and Organization**

The code structure is **extremely minimal and flat**, consisting of a single `README.md` file at the root of the repository. This is typical for the very initial stages of project creation before any actual development begins. The organization is rudimentary, as there is nothing yet to organize.

**6. Code Quality Observations and Recommendations**

*   **Documentation (Critical):** The `README.md` file is the absolute first point of contact for anyone encountering this repository. It currently only states "livo-dev".
    *   **Recommendation:** Immediately expand the `README.md` to clearly articulate the project's purpose, its intended functionality, target users, and a high-level overview of what it aims to achieve. This is crucial for onboarding, collaboration, and even for the project owner to solidify their vision.
*   **Structure:** While appropriate for an empty repository, as the project evolves, a logical directory structure will be essential.
    *   **Recommendation:** Plan for a well-organized structure from the outset. Consider common patterns like `src/`, `docs/`, `tests/`, `config/`, etc., based on the chosen technology stack.
*   **Version Control:** Assuming standard Git practices, the repository is under version control.
    *   **Recommendation:** Ensure consistent commit messages and a clear branching strategy once development starts.

**7. Potential Areas for Improvement or Refactoring**

Given the current state, "refactoring" is not applicable as there is no code. The primary areas for improvement are foundational:

*   **Populate `README.md` (Highest Priority):** This is the most critical and immediate next step. A comprehensive `README.md` should include:
    *   Project Title and Tagline
    *   Detailed Description of Purpose and Functionality
    *   Technology Stack (planned or chosen)
    *   Setup Instructions (dependencies, installation)
    *   How to Run/Develop
    *   Testing Guidelines
    *   Contribution Guidelines
    *   License Information
*   **Project Initialization:**
    *   **Recommendation:** Based on the intended technology stack (e.g., Node.js, Python, Java), initialize the project with its respective package manager (`package.json`, `requirements.txt`, `pom.xml`, etc.). This sets up dependencies and basic project scripts.
*   **Establish a Development Environment:**
    *   **Recommendation:** Define and document the necessary development environment tools, IDEs, linters, formatters, and any specific configurations (e.g., `.editorconfig`, `prettierrc`).
*   **Create a `.gitignore`:**
    *   **Recommendation:** Add a `.gitignore` file to prevent unnecessary files (e.g., `node_modules`, `build` artifacts, `.env` files, IDE-specific files) from being committed to the repository.

In summary, `livo-dev` is currently an empty project shell. The most important next steps involve defining its purpose, choosing a technology stack, and populating the `README.md` to guide future development and collaboration.

## CodeGuide CLI Usage Instructions

This project is managed using CodeGuide CLI. The AI agent should follow these guidelines when working on this project.

### Essential Commands

#### Project Setup & Initialization
```bash
# Login to CodeGuide (first time setup)
codeguide login

# Start a new project (generates title, outline, docs, tasks)
codeguide start "project description prompt"

# Initialize current directory with CLI documentation
codeguide init
```

#### Task Management
```bash
# List all tasks
codeguide task list

# List tasks by status
codeguide task list --status pending
codeguide task list --status in_progress
codeguide task list --status completed

# Start working on a task
codeguide task start <task_id>

# Update task with AI results
codeguide task update <task_id> "completion summary or AI results"

# Update task status
codeguide task update <task_id> --status completed
```

#### Documentation Generation
```bash
# Generate documentation for current project
codeguide generate

# Generate documentation with custom prompt
codeguide generate --prompt "specific documentation request"

# Generate documentation for current codebase
codeguide generate --current-codebase
```

#### Project Analysis
```bash
# Analyze current project structure
codeguide analyze

# Check API health
codeguide health
```

### Workflow Guidelines

1. **Before Starting Work:**
   - Run `codeguide task list` to understand current tasks
   - Identify appropriate task to work on
   - Use `codeguide task update <task_id> --status in_progress` to begin work

2. **During Development:**
   - Follow the task requirements and scope
   - Update progress using `codeguide task update <task_id>` when significant milestones are reached
   - Generate documentation for new features using `codeguide generate`

3. **Completing Work:**
   - Update task with completion summary: `codeguide task update <task_id> "completed work summary"`
   - Mark task as completed: `codeguide task update <task_id> --status completed`
   - Generate any necessary documentation

### AI Agent Best Practices

- **Task Focus**: Work on one task at a time as indicated by the task management system
- **Documentation**: Always generate documentation for new features and significant changes
- **Communication**: Provide clear, concise updates when marking task progress
- **Quality**: Follow existing code patterns and conventions in the project
- **Testing**: Ensure all changes are properly tested before marking tasks complete

### Project Configuration
This project includes:
- `codeguide.json`: Project configuration with ID and metadata
- `documentation/`: Generated project documentation
- `AGENTS.md`: AI agent guidelines

### Getting Help
Use `codeguide --help` or `codeguide <command> --help` for detailed command information.

---
*Generated by CodeGuide CLI on 2025-10-31T16:59:38.084Z*
