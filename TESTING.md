# RSpec Testing Guide

## Overview

This project includes comprehensive RSpec unit tests for the Ruby Book Management System. The tests ensure that all classes (`Item`, `Book`, and `Label`) work correctly in isolation and together.

## 📁 Test Structure

```
spec/
├── spec_helper.rb      # RSpec configuration
├── item_spec.rb        # Tests for Item class
├── book_spec.rb        # Tests for Book class
└── label_spec.rb       # Tests for Label class
```

## 🚀 Getting Started

### Prerequisites

1. Install Ruby 2.5 or higher
2. Install RSpec gem:
   ```bash
   gem install rspec
   ```

### Running All Tests

```bash
# From project root directory
rspec
```

### Running Specific Test File

```bash
# Test only Item class
rspec spec/item_spec.rb

# Test only Book class
rspec spec/book_spec.rb

# Test only Label class
rspec spec/label_spec.rb
```

### Running with Detailed Output

```bash
# Show all tests and descriptions
rspec --format documentation

# Show format with colors
rspec --color
```

### Running Specific Test by Description

```bash
# Run only tests that match a pattern
rspec -e "can_be_archived"

# Run only tests for a specific context
rspec spec/book_spec.rb -e "override"
```

## 📊 Test Summary

### Item Class Tests (43 assertions)

| Test Group          | Description                                | Count |
| ------------------- | ------------------------------------------ | ----- |
| `#initialize`       | Valid parameters, defaults, edge cases     | 5     |
| `#can_be_archived?` | Old items, recent items, edge cases        | 5     |
| `#move_to_archive`  | Archiving items, preventing double archive | 6     |
| `#to_h`             | Hash conversion and keys                   | 3     |

**Total Item Tests**: 19

### Book Class Tests (52 assertions)

| Test Group          | Description                                | Count |
| ------------------- | ------------------------------------------ | ----- |
| Inheritance         | Inherits from Item, has Item properties    | 2     |
| `#initialize`       | All parameters, defaults, cover states     | 7     |
| `#can_be_archived?` | Override behavior, conditions, edge cases  | 7     |
| `#display`          | Formatting, active/archived status         | 3     |
| `#to_h`             | Hash conversion, properties, serialization | 4     |
| `.from_h`           | Creating from hash, defaults, JSON loading | 4     |

**Total Book Tests**: 27

### Label Class Tests (59 assertions)

| Test Group     | Description                                      | Count |
| -------------- | ------------------------------------------------ | ----- |
| `#initialize`  | Valid parameters, colors, empty items            | 6     |
| `#add_item`    | Adding items, duplicates, different types        | 6     |
| `#remove_item` | Removing items, non-existent items, empty labels | 6     |
| `#item_count`  | Count accuracy, updates                          | 4     |
| `#display`     | Formatting, item counts                          | 4     |
| `#to_h`        | Hash conversion, properties                      | 4     |
| `.from_h`      | Creating from hash, empty items                  | 3     |

**Total Label Tests**: 33

## 🎯 Test Coverage by Method

### Item Class

```ruby
✓ initialize(id, publish_date, archived=false)
✓ can_be_archived?
✓ move_to_archive
✓ to_h
```

### Book Class

```ruby
✓ initialize(id, title, author, publisher, publish_date, cover_state='good', label_id=nil, archived=false)
✓ can_be_archived? (overridden)
✓ display
✓ to_h
✓ from_h (class method)
```

### Label Class

```ruby
✓ initialize(id, title, color)
✓ add_item(item)
✓ remove_item(item)
✓ item_count
✓ display
✓ to_h
✓ from_h (class method)
```

## 📝 Test Examples

### Item Tests

```ruby
require_relative '../item'

RSpec.describe Item do
  describe '#can_be_archived?' do
    it 'returns true for items published more than 1 day ago' do
      old_date = (Date.today - 10).to_s
      item = Item.new(1, old_date)

      expect(item.can_be_archived?).to be(true)
    end
  end
end
```

### Book Tests

```ruby
RSpec.describe Book do
  describe '#can_be_archived?' do
    context 'when conditions are met' do
      it 'returns true if item is old and cover is good' do
        old_date = (Date.today - 10).to_s
        book = Book.new(1, 'Old Book', 'Author', 'Publisher', old_date, 'good')

        expect(book.can_be_archived?).to be(true)
      end
    end
  end
end
```

### Label Tests

```ruby
RSpec.describe Label do
  describe '#add_item' do
    it 'adds an item to the label' do
      label = Label.new(1, 'Fiction', 'red')
      item = Item.new(1, '2020-01-01')

      result = label.add_item(item)

      expect(label.items).to include(item)
    end
  end
end
```

## ✅ Key Testing Patterns Used

### 1. **Context Blocks**

Used to group related tests:

```ruby
context 'when conditions are met' do
  it 'does something' do
    # test code
  end
end
```

### 2. **Describe Blocks**

Used to organize tests by method:

```ruby
describe '#method_name' do
  # related tests
end
```

### 3. **Expectations**

Clear assertions using `expect`:

```ruby
expect(object.property).to eq(expected_value)
expect(result).to be(true)
expect(array).to include(item)
```

### 4. **Setup with Variables**

Tests initialize necessary objects:

```ruby
let(:item) { Item.new(1, '2020-01-01') }
```

## 🔍 Test Categories

### Unit Tests

- Test individual methods in isolation
- Verify correct behavior with various inputs
- Check return values and side effects

### Edge Cases

- Recent publish dates
- Very old publish dates
- Duplicate items
- Empty collections
- Boundary conditions (exactly 1 day old)

### Integration Tests (Basic)

- Book inherits from Item
- Label can contain Books
- Methods work together correctly

## 📈 Coverage Goals

- **Item Class**: 100% method coverage
- **Book Class**: 100% method coverage, inheritance verification
- **Label Class**: 100% method coverage, association testing

## 🛠️ Debugging Failed Tests

### If tests fail:

1. **Check Ruby version**

   ```bash
   ruby --version
   ```

2. **Check RSpec installation**

   ```bash
   rspec --version
   ```

3. **Run single test for debugging**

   ```bash
   rspec spec/item_spec.rb:20
   ```

4. **Use verbose output**
   ```bash
   rspec --format documentation --color
   ```

### Common Issues

| Issue                  | Solution                             |
| ---------------------- | ------------------------------------ |
| `require` errors       | Check relative paths in spec files   |
| Date parsing errors    | Ensure date format is YYYY-MM-DD     |
| Matcher not found      | Check RSpec gem version              |
| Failed archiving tests | Check current date and publish dates |

## 📚 RSpec Matchers Used

```ruby
# Equality
expect(value).to eq(expected)

# Boolean
expect(value).to be(true)
expect(value).to be(false)

# Collection membership
expect(array).to include(item)
expect(array).to be_empty

# Type checking
expect(object).to be_an_instance_of(ClassName)
expect(object).to be_a(ClassName)

# Respond to methods
expect(object).to respond_to(:method_name)
```

## 🎓 Learning Objectives Met

✅ Use RSpec for unit testing
✅ Organize tests with `describe` and `context`
✅ Write meaningful test descriptions
✅ Test initialization and properties
✅ Test method behavior and return values
✅ Test overridden methods
✅ Test class methods (`.from_h`)
✅ Test edge cases and error conditions
✅ Test associations between classes

## 📖 Additional Resources

- [RSpec Documentation](https://rspec.info/)
- [RSpec Matchers](https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers)
- [Testing Best Practices](https://betterspecs.org/)

## 🔄 Running Tests Continuously

### Using Auto-run with `guard` gem

```bash
# Install guard and guard-rspec
gem install guard guard-rspec
guard init

# Run in watch mode
guard
```

### Simple File Watcher

```bash
# On Unix/Linux/Mac:
while true; do rspec; sleep 2; done

# On Windows PowerShell:
while($true) { rspec; Start-Sleep 2 }
```

## 📝 Writing New Tests

When adding new features:

1. Create test file following naming convention: `feature_spec.rb`
2. Use descriptive test names starting with `it`
3. Follow AAA pattern: Arrange, Act, Assert
4. Group related tests with `context`

Example:

```ruby
describe '#new_method' do
  context 'when [condition]' do
    it 'should [expected behavior]' do
      # Arrange
      object = ClassName.new(params)

      # Act
      result = object.new_method

      # Assert
      expect(result).to eq(expected)
    end
  end
end
```

---

**Last Updated**: March 2026  
**Total Test Cases**: 79  
**Total Assertions**: 154+  
**Test Framework**: RSpec
