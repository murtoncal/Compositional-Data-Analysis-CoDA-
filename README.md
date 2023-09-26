# Compositional-Data-Analysis-CoDA-
This GitHub Respo is a condensed version of a practical and applied statistics project 'What Effect Does the Depth of an Artic Lake Have On Its Sediment Composition?' I conducted during my BSc in Mathematics and Statistics. For reference, this project was awarded first-class marks.

**Abstract -** *The sediment composition throughout a lake is critical in the reconstruction of its surrounding environment. In this report, we investigate whether sediment composition is dependent on depth to enable accurate projections of the sediment composition for a given depth. Our findings could have many positive ramifications in this area of research. Data of 39 sediment compositions with the corresponding depth from an Arctic lake is analysed using linear regression. However, due to the constraints of compositional data and the assumptions of linear regression, we had to be flexible with its application. From our exploratory analysis, we found that sand and clay had the most considerable dependence on depth. Hence two linear models, one with sand as the independent variable and one with clay as the independent variable, depending solely on depth, were fitted. Since compositional data has a fixed sum, we could also obtain the predicted values of silt. We judged the effect of depth on the predicted values using the 𝑅-squared statistic, and the quality of fit was assessed by calculating the mean squared error. We found that depth had a strong effect on fitting sand and depth and a moderate effect on fitting clay, while the average prediction of sand and clay approximately 10% away from their actual value. This shows that sediment does significantly depend on depth, but the accuracy may not be precise enough for research purposes. Therefore, using the depth of a lake should be more of a rough guide to forecast its sediment compositions throughout the lake.*

If this project is of particular interest to you, please email @murtoncal@gmail.com to see the full paper. 

## Reference

Coakley, J.P. & Rust, B.R. (1968) Sedimentation in an Arctic lake *J. Sed. Petrology*, **38**, 1290-1300.
- https://pubs.geoscienceworld.org/sepm/jsedres/article-abstract/38/4/1290/96159/Sedimentation-in-an-Arctic-lake

## File Structure

There are two .R files detailing the code written for this project. One containing the exploratory data analysis. One containing the linear models.

## Data Analysis

The data for this project can be seen below, where the percentiles Sand + Silt + Clay == 100.

<p align="center">
  <img src="/images/CoDA_data.png" width="750" align="center"/>
</p>
<p align="center">
  <em>Project Data</em>
</p>

### Exploratory

Compositional data will always sum to a constant. Therefore, a ternary plot will effectively present the three-variable data two-dimensionally. Since the plot is barycentric, clear dependencies and trends between sand, silt, and clay can be identified easily.

<p align="center">
  <img src="/images/ternary_plot.png" width="600" align="center"/>
</p>
<p align="center">
  <em>Ternary Plot</em>
</p>

To verify some of the discoveries from the ternary plot, a summary of the data has been produced.

<p align="center">
  <img src="/images/CoDA_SS.png" width="600" align="center"/>
</p>
<p align="center">
  <em>Summary of the Data</em>
</p>

Then again, the same process is followed, but sand, silt and clay are plotted independently against depth in scatter plots.
<p align="center">
  <img src="/images/scatter_plots.png" width="750" align="center"/>
</p>
<p align="center">
  <em>Scatter Plots of Each Sediment Against Depth</em>
</p>

To verify the apparent trends, correlation coefficients are calculated between each variable to gain a more precise idea of the strength of the correlations. 

<p align="center">
  <img src="/images/co_eff.png" width="300" align="center"/>
</p>
<p align="center">
  <em>Correlation Coefficients Between Each Variable</em>
</p>

Overall, from the explanatory data analysis, it is clear that sediment composition does have some dependence on depth. Therefore, the strength of this dependence will be further analysed using more rigorous mathematical techniques.

### Linear Models

The next step in the analysis is to perform linear regression due to the strong correlation between sediment composition and depth identified in the explanatory analysis. So, using linear regression, the depth is predicted based on the value of one sediment. Then, numerical summaries such as the mean squared error and the 𝑅-squared coefficient are used to help evaluate the quality of fit and the influence depth has had on this fit.

However, because the sediment data is compositional, it comes with the following two constraints,

$$
\sum_{n=1}^{3} p_{n} = 1 \qquad \qquad \qquad p_{n} \geq 0,
$$

where $p_{i}$ where $p_{i}$ is the proportion of sand, silt or clay. For the predictive value of $p_{i}$, these constraints would not be satisfied using linear regression.

Also, the usual four assumptions must be satisfied when applying linear regression. One of which is that the residuals of the model must follow a normal distribution. Compositional data, however, follows the logit-normal distribution, meaning this assumption would not be met.

The explanatory analysis found that silt has little correlation with depth. So, if a linear model were to be constructed with silt as the response variable and depth as the explanatory variable, it is anticipated to perform poorly. Hence, if the values of sand and clay were predicted, a more accurate estimation of the silt proportion would be obtained, as Silt = 1 - Clay - Sand. Additionally, this would overcome the constraint $$\sum_{n=1}^{3} p_{n} = 1.$$

To overcome the second constraint, $p_{n} \geq 0$, and the invalid assumption, the sand and clay proportions are transformed to log-odds,

$$
\text{odds} = \text{log} \left( \frac{p}{1-p} \right).
$$

Calculating the log odds means that the sediment is no longer bounded between 0 and 1 and that it can be any real number, (0, 1) → 𝑅. Once the regression is performed, the inverse log-odds transformation can be applied to translate the fitted values back into proportions, enabling the value of silt to be calculated. Also, once the log-odds transformation is applied, the data follows a normal distribution. So, the assumptions of linear regression are all now met.

Therefore, the analysis will consist of two linear models with the log odds of sand or clay as the response variable and depth as the single explanatory variable. $s_{i}$ and $c_{i}$ denote the log odds of sand and clay, and $d_{i}$ represent depth, for $i = (1,2,…,39)$. So, the two models are constructed as follows,

$$
c_{i} = \beta_{d}d_{i} + \epsilon_{i},
$$

$$
s_{i} = \beta_{d}d_{i} + \epsilon_{i},
$$

where $\epsilon_{i}$ is the error term defined by the Gaussian distribution, $\epsilon_{i} \sim N(0,\sigma^{2})$.

As always, with linear regression, four assumptions must be satisfied. The first assumption is that a linear relationship must exist between the response variable (the log odds of sand and clay) and the explanatory variable (depth). Secondly, the residuals must be independent, meaning there is no correlation between consecutive data points. Thirdly, the residuals must have a constant variance. Fourthly and finally, the residuals must be normally distributed. An easy way to check these assumptions is by constructing diagnostic plots for each linear model.

<p align="center">
  <img src="/images/Dianog_clay.png" width="600" align="center"/>
</p>
<p align="center">
  <em>Diagnostic Plots of the linear model with clay as the response variable and depth as the explanatory variable.</em>
</p>

<p align="center">
  <img src="/images/Dianog_sand.png" width="600" align="center"/>
</p>
<p align="center">
  <em>Diagnostic Plots of the linear model with sand as the response variable and depth as the explanatory variable.</em>
</p>

From assessing the diagnostic plots, all assumptions for linear modelling are met. However, three outlier observations, 12, 18 and 25, do not satisfy the assumptions. These can be seen below. 

<p align="center">
  <img src="/images/outliers.png" width="300" align="center"/>
</p>
<p align="center">
  <em>Outlier Observations.</em>
</p>

Including these outliers increases the data variability, which could have detrimental effects when fitting the linear models. So, observations 12, 18 and 25 are removed from the data set. The fitted values from the two models can be seen below.

<p align="center">
  <img src="/images/fitted_values.png" width="600" align="center"/>
</p>
<p align="center">
  <em>Fitted Values.</em>
</p>

Above, it can be seen that both models fit the data very well. To reinforce this, the mean square error is calculated for each model. They are 0.644 and 0.520 for clay and sand as the response variables, respectively. 

Since both models performed similarly well, the value of silt will now be calculated. To transform the fitted values of sand and clay from log-odds to compositional data, the following inverse log-odds transformation will be used,

$$
t_{1,2} = \frac{e^{o_{1,2}}}{1+e^{o_{1,2}}},
$$

where $o$ is the log-odds, $n = (1,2)$ are sand and clay, and $t_{1,2}$ is the transformed fitted values.

The ‘fitted values’ of silt can now be calculated using the condition that sand, silt and clay must sum to 1. So, there is now the following equation for silt, 

$$
\text{Silt} = 1 - \text{Sand} - \text{Clay}.
$$

In the figure below, the transformed fitted values and the observed values against depth for clay (left), sand (middle) and silt (right) have been plotted. They give us a good visual representation of the accuracy of the fitted values by comparing them to the observed values. It can be seen that the fitted values are no longer linear. This is because the inverse log-odds transformation is not linear a linear transformation.

<p align="center">
  <img src="/images/CoDA_fitted.png" width="600" align="center"/>
</p>
<p align="center">
  <em>Fitted Values.</em>
</p>
