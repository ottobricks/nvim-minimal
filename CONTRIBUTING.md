# Contributing to NeoChange

Thank you for your interest in contributing to NeoChange! This guide will help you get started.

## 🚀 Quick Start

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Make your changes
4. Run tests: `make test`
5. Submit a pull request

## 📋 Prerequisites

Before contributing, ensure you have:

- **Neovim 0.7+** with Lua support
- **Git** for version control
- **luacheck** for linting: `luarocks install luacheck`
- **stylua** for formatting: `cargo install stylua`
- **plenary.nvim** for testing (automatically installed)

## 🏗️ Development Setup

1. **Clone your fork**:
   ```bash
   git clone https://github.com/yourusername/neochange.nvim
   cd neochange.nvim
   ```

2. **Set up development environment**:
   ```bash
   make install-dev
   ```

3. **Run initial tests**:
   ```bash
   make test
   ```

## 🧪 Testing

### Running Tests

```bash
# Run all tests
make test

# Run tests in watch mode (requires entr)
make test-watch

# Run specific test file
nvim --headless --noplugin -u tests/minimal_init.lua -c "PlenaryBustedFile tests/neochange_spec.lua"
```

### Writing Tests

Tests use [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)'s testing framework:

```lua
describe("feature description", function()
    before_each(function()
        -- Setup before each test
    end)

    it("should do something", function()
        local result = your_function()
        assert.equals(expected, result)
    end)

    it("should handle edge cases", function()
        assert.has_error(function()
            error_function()
        end)
    end)
end)
```

### Test Coverage

We aim for comprehensive test coverage:
- ✅ **Core functionality** - All git operations
- ✅ **Error handling** - Invalid inputs and edge cases  
- ✅ **UI components** - Floating window behavior
- ✅ **Command registration** - Neovim command setup

## 🎨 Code Style

### Formatting

We use [stylua](https://github.com/JohnnyMorganz/StyLua) for consistent formatting:

```bash
# Format all files
make format

# Check formatting without changes
make format-check
```

### Linting

We use [luacheck](https://github.com/mpeterv/luacheck) for linting:

```bash
# Run linter
make lint
```

### Style Guidelines

- **Indentation**: 4 spaces (configured in `.stylua.toml`)
- **Line length**: 100 characters maximum
- **Naming**: `snake_case` for functions and variables
- **Comments**: Use `--` for single line, `--[[ ]]--` for blocks
- **Error handling**: Always return `success, message` pattern

#### Example Code Style

```lua
local function switch_branch(branch_name)
    if not branch_name or branch_name == '' then
        return false, "Branch name cannot be empty"
    end
    
    local result, err = execute_git_command('git checkout ' .. branch_name)
    if err then
        return false, "Failed to switch branch: " .. err
    end
    
    return true, "Successfully switched to branch '" .. branch_name .. "'"
end
```

## 📁 Project Structure

```
neochange.nvim/
├── lua/neochange/
│   ├── init.lua          # Core functionality
│   ├── ui.lua            # Floating window UI
│   ├── commands.lua      # Neovim commands
│   └── README.md         # Plugin documentation
├── doc/
│   └── neochange.txt     # Help documentation
├── tests/
│   ├── neochange_spec.lua # Test suite
│   └── minimal_init.lua   # Test configuration
├── .github/workflows/    # CI/CD pipelines
├── CONTRIBUTING.md       # This file
├── LICENSE              # MIT license
├── Makefile            # Development commands
└── README.md           # Project overview
```

## 🐛 Bug Reports

When reporting bugs, please include:

1. **Neovim version**: `:version`
2. **Plugin version**: Git commit hash
3. **Steps to reproduce**: Clear, minimal example
4. **Expected behavior**: What should happen
5. **Actual behavior**: What actually happens
6. **Environment**: OS, terminal, git version
7. **Error messages**: Full stack traces if any

### Bug Report Template

```markdown
**Bug Description**
Brief description of the issue

**Steps to Reproduce**
1. Step one
2. Step two
3. See error

**Expected Behavior**
What should happen

**Actual Behavior**
What actually happens

**Environment**
- Neovim version: 
- OS: 
- Git version: 
- Terminal: 

**Additional Context**
Any other relevant information
```

## ✨ Feature Requests

For new features, please:

1. **Check existing issues** - Avoid duplicates
2. **Describe the use case** - Why is this needed?
3. **Propose implementation** - How should it work?
4. **Consider alternatives** - Other ways to solve this?

### Feature Request Template

```markdown
**Feature Description**
Clear description of the new feature

**Use Case**
Why is this feature needed? What problem does it solve?

**Proposed Solution**
How should this feature work?

**Alternatives Considered**
What other approaches did you consider?

**Additional Context**
Any other relevant information
```

## 🔄 Pull Request Process

### Before Submitting

1. **Fork and branch**: Create a descriptive branch name
2. **Write tests**: Add tests for new functionality  
3. **Update docs**: Update help files if needed
4. **Run CI locally**: `make ci` should pass
5. **Write good commits**: Clear, descriptive messages

### PR Guidelines

- **One feature per PR**: Keep changes focused
- **Descriptive title**: Summarize the change
- **Detailed description**: Explain what and why
- **Link issues**: Reference related issues
- **Add screenshots**: For UI changes

### PR Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature  
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Tests pass locally
- [ ] Added tests for new functionality
- [ ] Manual testing completed

## Checklist
- [ ] Code follows project style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No breaking changes (or clearly documented)
```

### Review Process

1. **Automated checks**: CI must pass
2. **Code review**: Maintainers will review
3. **Feedback**: Address any requested changes
4. **Approval**: Two approvals required for merge
5. **Merge**: Squash and merge preferred

## 🏷️ Commit Convention

We follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

- `feat`: New features
- `fix`: Bug fixes  
- `docs`: Documentation only
- `style`: Formatting, no code change
- `refactor`: Code restructuring
- `test`: Adding tests
- `chore`: Maintenance tasks

### Examples

```bash
feat: add branch switching with tab completion
fix: resolve floating window border configuration error
docs: update README with new installation instructions
test: add comprehensive error handling tests
refactor: improve git command execution performance
```

## 🎯 Areas for Contribution

### High Priority

- **Performance improvements** - Faster branch switching
- **Error handling** - Better error messages and recovery
- **Testing** - More comprehensive test coverage
- **Documentation** - Examples and tutorials

### Medium Priority

- **UI enhancements** - Improved floating window design
- **Configuration options** - Customizable behavior
- **Integration** - Work with other plugins
- **Platform support** - Windows compatibility

### Low Priority

- **Themes** - Custom color schemes
- **Advanced features** - Branch creation, deletion
- **Automation** - Git hooks integration

## 📞 Getting Help

- **Issues**: GitHub issues for bugs and features
- **Discussions**: GitHub discussions for questions
- **Documentation**: `:h neochange` in Neovim

## 🙏 Recognition

Contributors will be:
- Listed in the README
- Tagged in release notes
- Credited in git history

## 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to NeoChange! 🎉
