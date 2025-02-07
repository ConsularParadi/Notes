![[Relational Model.pdf]]
Table -> Relation

| Cust-Id | Name   | Address | Contact |
| ------- | ------ | ------- | ------- |
| 1       | Rishi  | ...     | ...     |
| 2       | Sharma | ...     | ...     |

Degree of relation -> no. of attributes (4)
Cardinality -> datapoints (2)

##### ER to Relational

```mermaid
---
title: "ER Model"
---
graph TD
A[Customer]---B{places}---C[Order]
subgraph customer
A---A1[(address)]
A---A2[(contact)]
A---A3[(cust-id)]
A---A4[(name)]
end
subgraph order
C---C1[(timestamp)]
C---C2[(delivery-date)]
C---C3[(order-id)]
end
```

==RDMBS== : software to implement relational model (ex: MySQL, MSAccess, Oracle)

##### Transformation from ER model to Relational model

![[Relational Model transformation from ER.pdf]]

![[DBA_banking-er-diagram.png]]
##### Interview Questions

1. Can we delete from parent table if value is lying in the child table w/o violating delete constraint?
	- **ON Delete Cascade**: Delete value from parent table -> delete corresponding entry from child table too
2. Can F.K have Null value?
	- **ON Delete Null**: deleted value from parent table -> put corresponding FK in child table null