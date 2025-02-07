---
tags:
  - ai
  - machine-learning/metrics
---
#### Loss/Error Functions

###### Mean Absolute Error (MAE)
$$mae=\frac{\sum_{i=1}^n|y_i-\hat{y_i}|}{n}$$
<u>Advantages</u>
1. Same unit
2. Robust to outliers

<u>Disadvantages</u>
1. Modulus [[Mathematical Concepts#Graphs#Modulus|function graph]] is not differentiable at 0.

###### Mean Squared Error (MSE)
$$mse=\frac{\sum_{i=1}^n(y_i-\hat{y_i})^2}{n}$$

<u>Advantages</u>
1. Can be used as a loss function because it is differentiable.

<u>Disadvantages</u>
1. Not easily interpretable, output unit is unit$^2$.
2. Penalizes outliers heavily, not robust to outliers.

###### Root Mean Squared Error (RMSE)
$$mse=\sqrt{\frac{\sum_{i=1}^n(y_i-\hat{y_i})^2}{n}}$$
<u>Advantages</u>
1. Output unit same as input unit.

<u>Disadvantages</u>
1. Penalizes outliers heavily, not robust to outliers.

>[!tip]
>MSE and MAE are context dependent


#### Model Performance

> [!tip]
> R2 score is context independent

###### R2 Score
$$R2=1-\frac{SS_R}{SS_M}$$
$SS$ -> sum of squared errors (regression and mean)

> [!info]
> R2 score compares model's performance with error when output is mean.
> - R2 -> 1 implies better model performance
> - 0.8 R2 says that 80% of variance can be explained using given features

> [!tip]
> Also known as Coefficient of determination / Goodness of fit

> [!failure]
> If an irrelevant feature is added to inputs, R2 score should decrease but it remains constant or increases.
> 

###### Adjusted R2 Score
$$R_{2_{adj}}=1-[\frac{(1-R_2)(1-n)}{n-1-k}]$$
$n$ -> no. of rows
k -> no. of independent variables

## Questions

1. Why use adjusted R2 over R2?
	1. Adjusted R2 also takes into account increase in no. of inputs while R2 may increase or stay same even if adding an irrelevant column.