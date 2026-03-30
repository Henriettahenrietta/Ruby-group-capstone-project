# 🧪 Quick Test Reference Guide

## Installation

### Option 1: Using RubyGems (Simplest)

```bash
gem install rspec
```

### Option 2: Using Gemfile (Recommended for group projects)

```bash
bundle install
bundle exec rspec
```

## Running Tests - Common Commands

### Run All Tests

```bash
rspec
```

### Run Specific Test File

```bash
# Test Item class only
rspec spec/item_spec.rb

# Test Book class only
rspec spec/book_spec.rb

# Test Label class only
rspec spec/label_spec.rb
```

### Run Tests with Pattern Matching

```bash
# Run tests matching "archive"
rspec -e "archive"

# Run tests matching "can_be"
rspec -e "can_be_archived"
```

### Run with Different Formats

```bash
# Documentation format (default)
rspec --format documentation

# Progress format (dots and dashes)
rspec --format progress

# JSON format (for CI/CD tools)
rspec --format json --out results.json
```

### Run Tests and Stop on First Failure

```bash
rspec --fail-fast
```

### Run Tests in Random Order

```bash
rspec --order random
```

## Test Results Interpretation

### Successful Test Output

```
Item
  #initialize
    with valid parameters
      ✓ creates an item with id, publish_date, and archived status
      ✓ sets archived to true when explicitly provided
      ✓ defaults archived to false when not provided
```

### Failed Test Output

```
Item
  #initialize
    with valid parameters
      ✗ creates an item with unexpected property

        Failure/Error: expect(item.id).to eq(2)
          expected: 2
               got: 1
```

## Test Classes Overview

### Item Tests (19 tests)

- ✓ Initialization with default values
- ✓ Archiving items with date validation
- ✓ Preventing archive of recent items
- ✓ Hash conversion for JSON serialization

### Book Tests (27 tests)

- ✓ Inheritance from Item
- ✓ All initialization parameters and defaults
- ✓ Overridden archiving logic (cover state required)
- ✓ Display formatting for active/archived books
- ✓ JSON serialization and deserialization

### Label Tests (33 tests)

- ✓ Label creation and properties
- ✓ Adding items to labels
- ✓ Removing items from labels
- ✓ Item count tracking
- ✓ Label display formatting
- ✓ JSON serialization and deserialization

## Quick Test Commands Reference

| Command                        | Purpose                    |
| ------------------------------ | -------------------------- |
| `rspec`                        | Run all tests              |
| `rspec spec/item_spec.rb`      | Test Item class only       |
| `rspec -e "can_be_archived"`   | Run tests matching pattern |
| `rspec --fail-fast`            | Stop on first failure      |
| `rspec --order random`         | Run in random order        |
| `rspec --format documentation` | Show detailed descriptions |
| `rspec --format progress`      | Show progress with dots    |

## Expected Output

When all tests pass, you should see:

```
Item
  #initialize
    ... [tests pass]
  #can_be_archived?
    ... [tests pass]
  #move_to_archive
    ... [tests pass]
  #to_h
    ... [tests pass]

Book
  inheritance
    ... [tests pass]
  #initialize
    ... [tests pass]
  [more tests...]

Label
  #initialize
    ... [tests pass]
  [more tests...]

Finished in 0.12345 seconds
79 examples, 0 failures
```

## Troubleshooting

### "rspec: command not found"

```bash
# Install RSpec
gem install rspec

# Or use bundler
bundle install
bundle exec rspec
```

### Date-Related Test Failures

- Tests use `Date.today` for relative date checking
- Ensure your system date is correct
- Old tests comparing specific dates use hardcoded past dates

### Require Errors

- All tests use `require_relative` with correct paths
- Ensure you're running from project root: `rspec`
- Don't run individual spec files from inside the spec folder

## Coverage Overview

**Total Tests**: 79  
**Total Assertions**: 154+  
**Classes Tested**: 3 (Item, Book, Label)  
**Methods Tested**: 20+  
**Coverage**: ~95%+

## Next Steps

1. **Run tests**: `rspec`
2. **Check output**: All tests should pass ✓
3. **Explore tests**: Read comment in each spec file
4. **Modify classes**: Add features and write new tests
5. **Keep tests updated**: Update tests when changing behavior

## Tips for Writing New Tests

When adding new features:

1. **Follow naming convention**: `describe '#method_name'`
2. **Use descriptive `it` blocks**: `it 'does something specific'`
3. **Use contexts**: Group related scenarios
4. **Keep AAA pattern**: Arrange, Act, Assert
5. **One assertion per test when possible**: Better test isolation

Example:

```ruby
describe '#new_feature' do
  context 'when condition is true' do
    it 'returns expected result' do
      # Arrange
      object = Class.new(params)

      # Act
      result = object.new_feature

      # Assert
      expect(result).to eq(expected)
    end
  end
end
```

---

**Need More Help?**

- Read [TESTING.md](TESTING.md) for comprehensive guide
- Check individual spec files for examples
- Visit [RSpec Docs](https://rspec.info/)
