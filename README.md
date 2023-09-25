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

### Exploratory

Compositional data will always sum to a constant. Therefore, a ternary plot will effectively present the three-variable data two-dimensionally. Since the plot is barycentric, clear dependencies and trends between sand, silt, and clay can be identified easily.

<p align="center">
<img src="/images/ternary_plot.png" width="600" align="center"/>
</p>

To verify some of the discoveries from the ternary plot, a summary of the data has been produced.

<p align="center">
<img src="/images/CoDA_SS.png" width="600" align="center"/>
</p>

Then again, the same process is followed, but sand, silt and clay are plotted independently against depth in scatter plots. Then, to verify the apparent trends, correlation coefficients are calculated between each variable to gain a more precise idea of the strength of the correlations. 

<p align="center">
<img src="/images/scatter_plots.png" width="750" align="center"/>
</p>

<p align="center">
<img src="/images/co_eff.png" width="350" align="center"/>
</p>


### Linear Models

