---
tags:
  - rust/basics
---
### Basics

```rust title:Initiation
let sentence: String = String::from("My name is Khan")
```

```rust title:"Iteration on chars"
fn main() {
	let mut ans: String = String::new()
	for char: char in sentence.chars() {
		ans.push_str(string: char.to_string().as_str());
	}
}
```

