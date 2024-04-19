
### Heuristic Function

Estimates distance of the node from the goal. This h(n) can be used to pick a node from 
OPEN list.

### Best First Search

> [!info] 
>-  OPEN -> Priority queue sorted on h(n)
>- Node pair becomes a node triple with heuristic value

![[best_first_Search.png]]

##### Examples

1) **8-puzzle**
	- h_hamming : no. of tiles out of place
	- h_manhattan: sum of manhattan distance of a tile from its correct position


> [!warning] 
> Heuristic function may not always be accurate - **Local Minima** 

> [!tip] 
> Similarity is inverse of distance 

2) **Geographical route finding**
	- h : euclidean or manhattan


## Local Search Algorithms
### Hill Climbing

> [!info] 
> - Thinks of the problem as optimization. Move to best neighbour if better, else terminate
> - Space Requirement -> constant, better than BFS and Best First 
> - May not be able to find global maxima
> - Time Complexity is linear

> [!tip] 
> Works with monotonic heuristic function 

![[hill climbing.png]]

![[local_maxima_hill_climbing.png]]

## Problem

### Blocks World Problem
![[blocks_world_problem.png]]

![[heuristic_function_variation.png]]