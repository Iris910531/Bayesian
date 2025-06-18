library(brms)
library(dplyr)

df <- read.csv("/Users/hsuan/UIUC_courses/431/final project/data/marketing_campaign.csv")

# Preprocessing
df <- df %>%
  mutate(
    Age = 2015 - Year_Birth,
    Spending = MntWines + MntFruits + MntMeatProducts +
      MntFishProducts + MntSweetProducts + MntGoldProds,
    Children = Kidhome + Teenhome,
    Education = factor(Education),
    Response = as.integer(Response)
  ) %>%
  select(Response, Income, Age, Spending, Children, Education) %>%
  na.omit() # 24 NA in income will be dropped

set.seed(123)
n <- nrow(df)
train_index <- sample(1:n, size = 0.8 * n)
df_train <- df[train_index, ]
df_test <- df[-train_index, ]



model <- brm(
  formula = Response ~ Income + Age + Spending + Children + (1 | Education),
  family = bernoulli(link = "logit"), # logistic regression
  data = df_train,
  chains = 4,
  iter = 8000, # original:2000
  warmup = 4000, # original:1000
  seed = 123,
  prior = c(
    set_prior("normal(0, 5)", class = "b"), # for Income, Age, Spending, Children
    set_prior("normal(0, 5)", class = "Intercept"), # for intercept
    set_prior("normal(0, 5)", class = "sd") # foe education
  ),
  control = list(adapt_delta = 0.95) # to control divergent transitions
)

summary(model)
plot(model)
pp_check(model) # Posterior Predictive Check


# calculate Accuracy
predicted <- posterior_predict(model, newdata = df_test)
posterior_means <- colMeans(predicted)
predicted_class <- ifelse(posterior_means > 0.5, 1, 0) #threshold = 0.5
accuracy <- mean(predicted_class == df_test$Response)
print(accuracy)


