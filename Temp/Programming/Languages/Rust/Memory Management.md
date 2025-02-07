---
tags:
  - rust
  - memory-management
---

### Mutability

Immutability represent variables whose value cannot be changed once assigned.
By default, all variables in rust are immutable.

```rust title:"Mutable Vars" error:2
let x: i32 = 1;
x = 23;
let mut y: i32 = 10;
y = 215;
```

- Thread safe, no synchronization needed when concurrent data access.


### Stack vs Heap

Rust has clear rules for stack and heap management.

**Stack**:
- Fast allocation and deallocation
- Space owned by user
- For data where the size is known at compile time

**Heap**:
- Program has to ask OS for more space
- For data that can grow at runtime, like strings or vectors

### Ownership

