
## Solution Space Search

- candidate solutions in solution space or plan space

### Pertubation

![[pertubation.png]]

### Problems

![[tsp_vs_sat.png]]

#### SAT

![[sat example.png]]

#### TSP
- Complexity is n!

![[tsp 1.png]]

##### Greedy constructive methods

1. Nearest neigbour
![[tsp_neigbour.png]]
1. Add shortest available edge after sorting

##### Heuristics

1. Savings Heuristic
![[savings_heuristic.png]]

1. Two edge exchange
![[2_edge_exchange.png]]
### Algorithms

#### Beam Search

![[beam_search_sat.png]]

#### Variable Neighbourhood Descent

- If you get stuck while using a sparse h-function, use a denser h-function

![[vnd.png]]
#### Best Neighbour - a variation of Hill Climbing

![[best_neighbour.png]]

#### Taboo Search - not allowed back immediately

![[taboo_search.png]]

- Aspiration Criterion - If a node is better than bestseen, make an exception
- Memory - an array that keeps track of which bit was changed and hence not allowed for **tabu tenure (tt)**
- Frequency array - to drive search into newer areas, by storing frequency of bit being changed and penalize optimization value based on it
