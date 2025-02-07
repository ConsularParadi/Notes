---
tags:
  - cs/devops
---
> [!note] **What**
 Improving application delivery through
> - automation
> - ensuring quality
> - continuous testing
> - continuous monitoring.

```mermaid
---
title: Software Development LifeCycle
---
flowchart TD;
id1(("Plan"))-->|Requirements|id2(("Define"))-->|Software Req. Document|id3(("Design"))
subgraph DevOps
id4(("Build"))-->id5(("Test"))-->id6(("Deploy"))
end
id3-->|HLD & LLD|id4
id6-->id1
```

#### Infrastructure as Code (IaC)
[[Terraform]]
### Observability
