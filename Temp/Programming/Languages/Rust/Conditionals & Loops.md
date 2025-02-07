---
tags:
  - rust/basics
---
##### If-else

```rust title:Conditional
fn main() {
	let is_even: bool = true;
	if is_even {
		println!("The number is even");
	}
	else if !is_even {
		println!("The number is odd");
	}
}
```

##### For

```rust title:For
for i: i32 in 0..10{
	println!("{}", i);
}
```

##### While



