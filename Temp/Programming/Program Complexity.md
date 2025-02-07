---
tags:
  - cs
  - dsa/basics
---
### Time Complexity

>[!info]
>Rate at which the time taken increases with respect to the input size.

1) Take worst case
2) Avoid constants
3) Avoid lower values

##### Big - Oh Notation

>[!example]
>```cpp
>for (i=1; i<=N; i++)
>{
>		for (j=1; j<=i; j++);
>		{
>			code
>		}
>}
>```
>$O(\frac{N(N+1)}{2}) = O(\frac{N^2}{2}+\frac{N}{2}) = O(N^2)$

### Space Complexity

>[!info]
>**Auxilary space** (space taken to solve the problem) + **Input Space** (space taken to share the input) 

>[!warning]
>Never do anything to input (do not tamper data)
>




