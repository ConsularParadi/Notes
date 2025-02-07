---
tags:
  - cs/engineering
---
![[System Design - Production Pipeline.png]]

> [!attention] 
> Do not debug issues directly on the production server, instead use a staging area to debug and test patch fixes.


Good Design:
- Scalabillity
- Maintainability
- Efficiency
- Reliability

### CAP/Brewer's Theorem

Consistency
Availability
Partition Tolerance

Only two of 3 above can be achieved at a time.

##### Availability
SLO - Service Level Objectives (ex: latency)
SLA - Service Level Agreement (agreement with users on t&c of service provided)

1. Reliability: system works consistently
2. Fault Tolerance: what happens when system fails
3. Redundancy: always have backups

##### Speed
1. Throughput - how much data our system can handle over a certain period of time (ex: servers(r/s), db(q/s) and data over network or processed(bytes/s))
2. Latency - how long it takes to handle a single request


### API Design

##### CRUD Operations

Create -> POST
Read -> GET
Update -> PUT
Delete -> DELETE

##### API Paradigms

###### REST
Representational State Transfer
- Stateless (sends all data)
- Standard HTTP Methods
- Overfetching and Underfetching
- JSON for data exchange
###### GraphQL
- Avoids overfetching and underfetching
- Strongly typed schema based queries
- Queries can impact server performance
- Only POST requests
- Responds with HTTP 200
###### gRPC
Google Remote Procedure Call
- Built on HTTP/2
- Multiplexing / Server Push
- Uses protocol buffers
- Efficient (suitable for microservices)
- Less Human Readable
- Requires HTTP/2

##### Backward Compatibility and Versioning
Ensure that changing the features or pipeline of the software does not disconnect the older clients.

``` title:"REST"
// Create new api versions for newer version
/api/v2/products
/api/v1/products
```

``` title:"GraphQL"
// Add new columns for newer version
products_v2
products
```

###### Rate Limiter
Prevents multiple requests from a single user

###### Reducing GeoLatency
1. Caching
	- Storing a copy of data in a temporary storage
		- Website caching
			- $CacheRatio = \frac{CacheHit}{CacheHit+CacheMiss}$
		- Server caching
			- Uses redis
			- Write back (->cache->db)
				- Improves write performace
				- Risk of losing data when server crash
			- Write around (->db)
				- Bypass cache to store directly to storage
				- When write performance is not critical
			- Write through (->cache=db)
				- Data consistency but slower than write around
			- Eviction Policy
				- What to remove from cache when full
				- Generally uses LRU or FIFO
		- Database Caching
			- Caching db query results - LRU, LFU, FIFO
			- Better read results
2. CDN (Content Delivery Networks)
	- Pull Based
		- For static content
		- Passive Management
	- Push Based
		- For content that is updated on the origin server less frequently.
		- Origin server pushes the updated files to the CDN network
		- Active Management
	- Benefits:
		- Reduced Latency
		- High Availability
		- Improved Security

##### [[Proxy Server]]

1. Forward
	- Hide client IP addresses
	- Ex: Instagram proxies, internet use control, caching, anonymizing web access
2. Reverse
	- Hides server addresses
	- Compress data, cache files, manage ssl encryptions
	- Ex: load balancers, CDNs, Firewalls (WebAppFs), SSL Offloading
1. Open
2. Transparent
3. Anonymous
4. Distorting
5. High Anonymity

###### Common Strategies in Load Balancer
1. Round robin
2. Least connection (fewest connections)
3. Least response time (fastest reponse)
4. IP Hash (hash of client's IP addresses) - session persistence
5. Weighted algorithms
6. Geographic
7. Consistent Hashing (distributes data based on hashing to multiple servers)

- Load balancers are essential in health checks of servers
- hardware, software and cloud based load balancer

**What happens when a load balancer fails**
- Redundant Load balancer
- Health checks and monitoring
- Auto-scaling and self-healing systems
- DNS failover

### Database Essentials

##### Types
Relational
- MySQL, PostGreSQL, SQLite
- ACID compliant - atomicity, consistency, isolation, durablity
NoSQL
- MongoDB, Cassandra, Redis
- key-value, document-based, graph
In-Memory
- Redis, MemCache

##### Scaling
Vertical
- Increase individual server capability
Horizontal
- Increase machines in a cluster
\
##### Databse Sharding
- range-based
- directory-based
- geography

##### Replication
- master-slave
- master-master

##### Database Performance
- Caching
- Indexing
- Query Optimization