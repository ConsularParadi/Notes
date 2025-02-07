---
tags:
  - ai
  - machine-learning
  - math
---
##### Multi-Collinearity
Multi-collinearity occurs when two or more predictor variables in a regression model are highly correlated, meaning they contain similar information about the variance in the dependent variable.

<u>Consequences</u>
- It leads to ==inflated variances== of the coefficient estimates, making them sensitive to changes in the model (change in model specification or input).
- ==Unreliable== and less precise coefficient estimates.
- It becomes difficult to determine the ==individual effect== of each predictor on the dependent variable since the predictors are not independent of each other.

<u>Solution</u>
- **Correlation Matrix**: Checking the correlation coefficients between pairs of predictors.
- **Variance Inflation Factor (VIF)**: Measures how much the variance of a regression coefficient is inflated due to multi-collinearity.

#### Matrices

###### Ill-Conditioned
An ill-conditioned matrix has a high condition number. The condition number of a matrix $A$ is defined as the ratio of the largest singular value to the smallest singular value of $A$.

- A ==high condition number== indicates that the matrix is close to being singular and even small data or computation errors can lead to significant errors in coefficients as matrix inversion amplifies these errors. This is also known as matrix inversion sensitivity.

###### Singularity
$$|A|=0$$
A singular matrix is non-invertible.


#### Graphs

###### Modulus
![[math_graph_modulus.png]]