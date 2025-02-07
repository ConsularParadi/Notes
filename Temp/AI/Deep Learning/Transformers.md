---
tags:
  - deep-learning/transformers
---
> [!important] 
> Allows for parallel-processing
### Architecture

#### Encoder
##### Input
- Natural language: [[Natural Language#Word Embedding|word embedding]] + [[Natural Language#Positional Encoding|positional encoding]]

###### [[Attension#Self-Attention|Self-Attention]]
- Query, Key, Value
![[Pasted image 20240426221746.png]]

> [!tip] 
> - We reuse the weights for query, key and value.
> -  We further use weights for position encoded values so that multiple attention heads can be used to extract different contexts/meanings from words

###### Residual Layer
Residual connection between self-attention layer and word position encoded values.

![[Pasted image 20240426222642.png]]

#### Decoder

> [!tip] 
> - Starting with **EOS** (end of sequence) or **SOS** (start of sequence) makes more sense.
> - Sets of weight is different for encoder and decoder

![[Pasted image 20240426224343.png]]


> [!references]
> 1. [Statquest](https://youtu.be/zxQyTK8quyY)



























