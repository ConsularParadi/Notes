---
tags:
  - cs/programming
status: ongoing
---
![[Svelte - differences from react.png]]

##### Reactive Components
The state of component changes as soon as any of the variables are changed.

```ts title:" Reactive Example"
$: name = firstName + ' ' + lastName`
```


##### Conditionals
Renders HTML based on condition.

```ts title:"Conditional Example"
{if conditional}
//HTML
{:else}
{/if}
```

##### Iteration
For iterating through arrays.

```ts title:"Array Iteration"
{#each users as user}
<p>{user.id} : {user.name}</p>
{/each}
```

##### Stores

##### Dispatch Events

##### Transitions

##### Props

> [!tldr] 
> Used to export variables from a component file or add parameters to a component. 

```ts title:"Prop"
let {name} = $props();
```

##### State

> [!tldr] 
> Used to mark a code snippet as reactive. Reruns automatically whenever any of its dependecies change.

```ts title:"State"
<script>
let name = $state("Default Value");
</script>
```
```html Binding
<input type="text" bind:value={name} />
```

- Bind updates the reactive value to the input received.




