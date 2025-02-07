---
tags:
  - cs/distributed
---
A collection of independent semi-autonomous entities that cooperate to solve a problem that cannot be individually solved. Do not share common memory or common physical clock.

Applications:
1. Peer2Peer - BitTorrent, Gnutella
2. Distributed Data Mining
3. Grid Computing
4. Cloud Computing

Security
- Kerberos
- SSL

Properties:
1. Heterogeneity
2. Concurrency
3. Shared Data
4. No global clock
5. Interdependecy

Constraints:
1. Asynchrony
2. Local knowledge
3. Failures


#### Message Passing Model
- Each communication channel provides a bidirectional connection b/w two specfic processors.
- Collection of channels is called a network.
- P - refers to a processor

![[Distributed Systems - message passing model.png]]

![[Distributed Systems - Inbuf Outbuf.png]]

##### Configuration
Vector of processor states (including outbufs (channels))
- Captures current snapshot of entire system: accesible processor states (local vars, incoming msg queues) as well as comm channels. 

##### Events

- **Deliver Event**: moves a message from sender's outbuf to receiver's inbuf; message will be available next time receiver takes a step.
- **Computation Event**: when a processor starting with old inaccesible state (local vars + incoming msgs) applies the transition function of processor's state machine to handle all the incoming msgs resulting in a new accesible state with empty inbugs and new outgoing msgs.
![[Distributed Systems - Message Passing - Computation Event.png]]
##### Execution
config, event, config, event ...

- First config: Processor in initial state and all inbufs are empty
- Config changes during execution if:
	- if delivery event
	- if computation event

##### Admissibility
- Safety conditions on execution
Executions satisfying all external contraints are called admissible
##### Types
1. **Asynchronous**
	- No fixed upper bound on how long it takes for a message to be delivered or how much time elapses between consecutive steps of a processor.
	- It is admissible if:
		- every msg in outbuf is eventually delivered
		- every processor takes an infinite no. of steps
	- Models reliable system (no msg is lost and no processor stops working)
2. **Synchronous**
	- Execution in lockstep: execution is partitioned into rounds, each round every processor can send a message which is delivered and every processor computes based on the msgs just received.
	- lockstep unison
	- Time is measures as number of rounds until termination

##### Broadcast and Convergecast

``` title:"Rooted Spanning Tree Broadcast"
Root parent:
	upon receiving no message:
		terminate

Parent (i:n-1):
	upon receiving <M> from parent:
		send <M> to all children
		terminate (set local bool var to true)

For both sync and async
time -> d (depth of spanning tree), at most n-1 when chain
messages -> n-1
```

<u>Convergecast</u>: aggregates info from children and sends to parent (opposite to broadcast)

###### Complexity
1. Synchronous & Asynchronous:
	- Time is depth *d* of spanning tree (at most n-1 when chain)
	- No. of messages is n-1 (1 over each edge) 

``` title:"Finding a spanning tree given a root"
root M sends to all its neighbours
when non-root gets M
- set sender as parent
- send "parent" msg to sender
- send M to all neighbours, if no neighbours terminate

when get M otherwise
- send "reject" msg to sender

use "parent" and "reject" msgs to set children variables and know when to terminate (after hearing from all neighbours)
```

``` title:"Finding a spanning tree without a root"
Each node runs its own dfs with a initiator id
When collide, resolve
```


### Leader Election in Rings
Ex: when a deadlock is created, because of processors waiting in a cycle for each other, the deadlock can be broken by electing one of the processor as a leader and removing it from the cycle.

In every admissible execution: every possible processor enters in a leader or non-leader states

Uses:
- Find a spanning tree with leader as root
- Reconstruct lost token in a token-ring network

![[Distributed Systems - Leader Election - Ring.png]]

1 = left = clockwise
2 = right = anti-clockwise

##### Anonymous Rings
- Processors do not have unique identifiers and each processor has the same state machine.

###### Uniform (Anonymous) Algorithms
- Uniform does not use size of ring.

*Leader Election in Anonymous Rings*
There is no leader election algo for anon rings, even inf algo knows the ring size (non-uni) and synchronous model.

Either safety (more than one leader) or liveness (at least one leader) is violated. Same holds for weaker (less well-behaved) models like unifrom and asynchronous. 

##### Rings with Identifiers
<u>Uniform</u>: one state machine for every id
<u>Non-Uniform</u>: one state machine for every id and for every ring size

###### LeLann-Chang-Roberts (LCR) algorithm ($O(n^2)$)
- send value of own id to the left
- when receive an id j (from the right)
	- j > id -> forward j to left (lost)
	- j = id -> elect self (won)
	- j < id -> lost
###### The Hirschberg and Sinclair (HS) algorithm ($O(n\log{n})$)
k-neighbourhood 
$2^k-neighbourhood$ 

Asynchronous rings cannot do better than $O(n\log{n}$)
Synchronous rings can get upto $O(n$) under certain conditions but otherwise $O(n\log{n})$

### Models of distributed systems, causality and logical time

![[Distributed Systems - Space Diagram.png]]

Partial Order Relation:
- R on set A is
	- reflexive
	- antisymmetric
	- transitive
- Ordered pair <A, R> is called a poset (partially ordered set) when R is partial order

Example: $<=$ relation

Total Order:
- partial order
- every element is related with every element one way or the other
- also called linear order

**Causal Precedence Relation**
![[Distributed Systems - Causal Precedence Relation.png]]

**Concurrent Events**
When ei does not happen before ej and vice versa.
$e_i || e_j$

**Logical vs Physical Concurrency**
- Logical: two events do not causally affect each other
- Physucal: events occur at the same instant in physical time.

**Models of Comm Networks**
1. Causally ordered
2. FIFO
3. Non-FIFO (random, from set)

$CO \subset FIFO \subset Non-FIFO$

##### Causality
- Tracked using physical time.

**Scalar**

![[Distributed Systems - Scalar Space Diagram.png]]

- When going to next process $C(P_i) = C(P_i) + 1$
- A recv msg takes $C(P_i) = max(C(P_i), C(P_j))$ where j is the msg sender.
- Total ordering => $x \prec y \iff (h < k ~or~ (h=k ~and~ i < j))$
	- h and k are clocks, x and y are processes and i and j are processor ids.
- Not consistent => $e_1^3$ did not happen before $e_2^4$

**Vector**
![[Distributed Systems - Vector Clock - Space Diagram.png]]

### Clocks

Matrix Clock
![[Distributed Systems - Clock - Matrix.png]]

 Physical Clock Synchronization
 ![[Distributed Systems - Physical Clock Synchronization.png]]

$delay (\theta) = \frac{a-b}{2}$
$round-trip (\delta) = a-b$

### Global State




> [!references]
> 1. [NPTEL](https://onlinecourses.nptel.ac.in/noc24_cs77/course)