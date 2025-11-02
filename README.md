# Statistical Analysis of Nutritional Supplement Effects (in R)

> This project applies formal statistical analysis techniques in R to a simulated dataset to determine the effect of a nutritional supplement on the weight of mice and rats.

The analysis involves generating synthetic data, applying the correct hypothesis tests to check for significant changes, and performing distribution fitting to understand the underlying probabilistic structure of the results.

## 1. Key Features

* **Data Simulation:** Generates synthetic 'before' and 'after' datasets in R using `rnorm` (for mice) and `rweibull`, `rgamma`, and `rlnorm` (for rats).
* **Hypothesis Testing:** Implements paired **t-tests** and **Wilcoxon signed-rank tests** to determine if the observed weight change is statistically significant.
* **Distribution Fitting:** Analyses the post-treatment data to find the best-fit statistical distribution.
* **Advanced Visualisation:** Uses R's plotting capabilities to create histograms, density plots, CDF plots, Q-Q plots, and P-P plots to visually validate the distribution fit.

## 2. Technologies & Libraries Used

* **Core:** R
* **Libraries:** `fitdistrplus` (or similar for fitting), `ggplot2` (for visualisation)

## 3. How to Run

1.  Clone the repository:
    `git clone https://github.com/w4el/statistical-analysis-R-nutritional-supplement.git`
2.  Open the `.R` or `.Rmd` file in RStudio.
3.  Run the script from top to bottom to replicate the data generation, statistical tests, and plot creation.

## 4. Results

* **Hypothesis Testing:** The paired t-test and Wilcoxon test both returned p-values significantly less than 0.05, leading to the rejection of the null hypothesis. This indicates a statistically significant effect of the supplement on weight.
* **Distribution Fitting:** Visual analysis from Q-Q and P-P plots confirmed that the **Weibull** and **Gamma** distributions provided the most accurate fit for the skewed post-treatment data.
