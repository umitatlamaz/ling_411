library(tidyverse)

cab_intercept <- 30.0
cab_slope_distance <- 20
cab_slope_nbridges <- 33
cab_bridge <- 10
rint_unif <- function(n, min, max) { 
  runif(n=n, min=min-0.499, max=max+0.499) %>% round() 
}

set.seed(42)

n = 1000
hidden_cost <- rnorm(1000, mean=20, sd=15)
cab_fares <- data.frame( distance_km = rint_unif(n, min=10, max=50),
                         n_bridges = rint_unif(n, min=0, max=10)
)

cab_fares <- within(cab_fares,
                    { taxi_fare <- cab_intercept + 
                      cab_slope_distance*distance_km + 
                      cab_slope_nbridges*n_bridges
                    })


cab_fares <- mutate(cab_fares, taxi_fare = round(taxi_fare+hidden_cost,2))


cab_fares


write.csv(cab_fares, file = 'data/taxi_fares_2024.csv', row.names = FALSE)
