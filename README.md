# Bayesian Hierarchical Logistic Regression

##Introduction
This is my final project for the STAT 431 Bayesian Statistics course I took in my master's program at the University of Illinois at Urbana-Champaign.
The project focuses on building a Bayesian hierarchical logistic regression model to predict marketing response behavior, using the Customer Personality Analysis dataset.
The model incorporates both individual-level predictors and group-level effects, with full Bayesian inference performed using the brms package.
Note: This was a group project. I was responsible for implementing the Markov Chain Monte Carlo (MCMC) sampling, Convergence Diagnostics, Posterior Summaries , and Posterior Predictive Checks. To be more specific, my contributions are section 3 and section 4 in the report.

## Data Source
The dataset used in this project is the  [Customer Personality Analysis](https://www.kaggle.com/datasets/imakash3011/customer-personality-analysis) from Kaggle.
It contains customer demographic information, purchase history, and response to marketing campaigns.

## Tools and Technical Skills
* R
Technical skills demonstrated in this project:
1. Bayesian Hierarchical Modeling:
Built a hierarchical logistic regression model with individual-level predictors and a random intercept for education level.
2. MCMC Diagnostics:
Performed MCMC convergence diagnostics, including trace plots, R-hat statistics, Effective Sample Size (ESS), and Monte Carlo Standard Error (MCSE).
3. Posterior Inference:
Interpreted posterior means and credible intervals of regression coefficients and group-level variance.
4. Posterior Predictive Checks:
Conducted visual checks (pp_check) to assess model fit.
5. Out-of-sample Prediction:
Performed train-test split and evaluated predictive performance using test set accuracy.
6. Sensitivity Analysis:
Tested different prior settings to evaluate the robustness of posterior inferences.

## Repository Structure
```plaintext
Bayesian/
│
├── README.md
├── data/  
│    ├── marketing_campaign.csv  – Source data (not uploaded to GitHub; download manually)
│
├── code/  
│    ├── bayesian_model.R  – Main analysis notebook
│
├── report/  
│    ├── stat431_final_may13.pdf  – Final report submitted for the course
│

```


## Contact Information

For any questions or collaboration opportunities, please feel free to reach out:
* Email: yguo8395@gmail.com
* LinkedIn: Iris Kuo
* GitHub: Iris Kuo
