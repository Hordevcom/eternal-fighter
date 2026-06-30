---
name: Godot 4 Development
alwaysApply: false
---

# Project

This is a Godot 4 game project.

## Mandatory Rules

- Always use GDScript only.
- Never generate Python, C#, C++, JavaScript, Rust or any other language.
- Never use Unity or Unreal APIs.
- Use only the official Godot 4 API.
- If you are unsure about an API, inspect the project first and verify against the official Godot documentation before writing code.
- Never invent Godot classes, methods, signals or properties.

## Workflow

Before writing any code:

1. Read the relevant project files.
2. Search the project for similar systems.
3. Understand the existing architecture.
4. Reuse existing code whenever possible.
5. Modify existing files instead of creating new ones unless absolutely necessary.

Never generate standalone examples.
Always integrate your changes into the existing project.

## Code Style

- Use typed GDScript whenever possible.
- Use @export where appropriate.
- Use class_name where appropriate.
- Use snake_case for variables and functions.
- Use PascalCase for classes.
- Keep the existing project coding style.

## Response Rules

Return only production-ready Godot 4 GDScript.

Do not explain using Python.

Do not translate examples into Python.

Always assume this is a real production project, not a tutorial.