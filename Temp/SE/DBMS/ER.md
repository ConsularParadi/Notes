---
tags:
  - cs/engineering
---
![[cs-db-arch.pdf]]
- Security is handled at the external level of db

##### Logical Schema
1. Attributes of table
2. Consistency constraints (Primary Key)
3. Relationships


### Data Models

##### Entity Relationship (ER)

```mermaid
---
title: "Entity and Attributes"
---
flowchart TD
subgraph Example
A[Student]---B([ID])
A---C([Name])
A---D([Batch])
end
subgraph Structure
X[Entity]---Y([Attribute])
end
```

![[dbms_er.pdf]]

```mermaid
---
title: Relations
---
graph TD
subgraph Example
A[Customer]---B{borrows}===C[Loan]
end
subgraph Structure
X[Entity]---Z{Relation}---Y[Entity]
end
```

- Customer has partial participation with Loan because not all customers buy loans.
- Loan has complete participation with Customer because no loans are without customers.

```mermaid
---
title: "Types of Attributes"
---
flowchart LR
A[Customer]---B([Address])
A---C([Name])
subgraph multi-valued
D
end
A---D(((Phone no)))
A---E([DOB])
subgraph derived
F
end
A-.-F([Age])
subgraph composite 1
B---G([Street])
B---H([City])
B---I([State])
B---J([Zip Code])
G---N([Street Name])
G---O([Street No])
end
subgraph composite 2
C---K([First])
C---L([Middle])
C---M([Last])
end
A---P[Customer ID]
```

```mermaid
---
title: "Weak entity and relation"
---
graph LR
subgraph example
A["Loan"]---B{{"Loan Payment"}}---C[("Payment")]
end
subgraph structure
C-.-D(("Weak Entity\n(concentric rectangle)"))
B-.-E(("Weak Relation\n(concentric diamond)"))
end
```
Here payment depends on loan for existence (or to be uniquely identified), if there is no loan entity, payment entity can be uniquely identified only through load id. Also the payment relation is weak.

- Payment (==Weak Entity==) has total participation while Loan(==Strong==) may/may not have total participation.

```mermaid
---
title: "Ternary Relation"
---
graph LR
A[Emloyee]---B{"works in"}
B---C[Branch]
B---D["Job Role"]
subgraph emp
A-.-A1["Emp id"]
A-.-A2["Name"]
end
subgraph job
D-.-B1["Title"]
D-.-B2["Job id"]
D-.-B3["Role"]
end
subgraph branch
C-.-C1["Branch id"]
C-.-C2["Name"]
end
```
## Extended ER

![[dbms_extended-er.pdf]]

```mermaid
---
title: Specialization
---
graph LR
subgraph person
A[person]-.-A1([name])
A-.-A2([address])
end
subgraph employee
B[employee]-.-B1([salary])
B-.-B2([role])
end
subgraph customer
C[customer]-.-C1([membership])
C-.-C2(["cust id"])
end
C---D
D-->A
B---D{{"is a"}}
```


```mermaid
---
title: Aggregation
---
graph LR
subgraph F["Entity Combination"]
A[Employee]---B{"works in"}---C[Job]
end
D[Manager]---E{manages}
E-->F
```

##### How to make ER models

1. Identify identity sets
2. Attributes of identities and their types
3. Relationships and constraints
	- Mapping
	- Participation

##### Banking System
- Banking System - branches (name)
- Bank - customers
- Customers - accounts, & loan
- Customers - banker
- Bank - employees
- Accounts - savings, current
- Loan - branch, >=1 customer, payment schedule

1. Entity sets - branch, customer, employee, account, loan, payment schedule
2. Attributes
	- branch: <u>name</u>, city, assets, liabilities
	- customer: <u>customer-id</u>, name, address (composite), contact (multi-valued), DOB, age (derived)
	- employee: <u>emp-id</u>, name, contact, dependent name, start-date (single-valued), years of service
	- savings account: interest rate, daily withdrawal limit
	- current account: per transaction charge, overdraft amount
	- ==Generalized Entity== Account: <u>acc-no</u>, balance
	- loan: <u>loan-no</u>, amount
	- ==Weak Entity== Payment: payment no., date, amount
3. Relationships & Constraints
	- customer borrow loan (m:n, loan in total participation)
	- loan originated by branch (n:1, loan in total participation)
	- loan paid as payment (1:n, total participation)
	- customer deposit account (m:n)
	- customer banker employee (n:1)
	- employee managed by employee (n:1)

![[DBA_banking-er-diagram.png]]

##### Facebook

1. Features and use case
	1. profile -> user_profiles -> friends
	2. user can post
	3. post -> contains text, images, videos
	4. post -> like, comment by other users
2. Entities
	1. user_profile
	2. user_post
	3. post_comment
	4. post_like
3. Attributes + types
	1. user_profile: name (composite), <u>username</u>, email, pwd, contact (muti), DOB, age(derived)
	2. user_post: <u>post_id</u>, (text, images, videos) - multi, created_timestamp, modified_timestamp
	3. post_comment: <u>comment_id</u>, text, timestamp
	4. post_like: <u>like_id</u>, timestamp
4. Relation & Constraints
	1. user_profile friend user_profile (m:n)
	2. user_profile post user_post (1:n, user_post total participation)
	3. user_profile can post_like (1:n, post_like total)
	4. user_profile can post_comment (1:n, post_comment total)
	5. user_profile can post_like (1:n, post_like total)
	6. user_profile can post_like (1:n, post_like total)


![[DBA_facebook-er.png]]