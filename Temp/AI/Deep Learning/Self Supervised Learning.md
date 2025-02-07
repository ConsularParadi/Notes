---
tags:
  - deep-learning
  - self-supervised-learning
  - vision
status: pending
---
### Pretext Task

- Often not the real task we care about.
- Used for learning representations

##### Examples

1. Relative position of patches
![[ssl_ptTask_relpatch.png]]

2. Jigsaw Puzzles
![[ssl_ptTask_jigsaw.png]]

3. Predicting Rotations
![[ssl_ptTask_rotn.png]]

> [!failure] 
> Alignment of pretrained task with the transfer task

#### Generalization

![[ssl_ptTask_gen01.png]]

- As we go deeper into the network, the information being stored becomes semantic and we get better results.
- The last layer is specifically trained to solve jigsaw(pretraining) task and hence the mAP drops.


>[!note] Pretrained Features should ... 
>- represent how images relate to one another (what features do imgs of different trees have in similar)
>- be robust (invariant) to nuisance factors : exact location in image, lighting, rotation & scaling, exact color (**augmentations**)

##### Some Trivial Solutions

### SSL Methods

**Initialization**
- ImageNet without labels (1.3M images)
- ResNet-50 initialized randomly

**Evaluation using Transfer Learning**
Transfer to a downstream task
- Train a linear classifier on frozen features
- Full finetuning of network
#### Similarity Maximization Objective

##### Contrastive Learning

- Groups of 


> [!references]
> [Ishan Misra NYU](https://youtu.be/8L10w1KoOU8?list=PLLHTzKZzVU9e6xUfG10TkTWApKSZCzuBI)
