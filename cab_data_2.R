cab_intercept <- 7.0
cab_slope_distance <- 6
cab_slope_nbridges <- 13
cab_bridge <- 10
rint_unif <- function(n, min, max) { 
  runif(n=n, min=min-0.499, max=max+0.499) %>% round() 
}

set.seed(42)

n = 1000
hidden_cost <- rnorm(1000, mean=7.5, sd=4.5)
cab_fares_2 <- data.frame( distance_km = rint_unif(n, min=10, max=50),
                         n_bridges = rint_unif(n, min=0, max=10)
)

cab_fares_2 <- within(cab_fares_2,
                    { taxi_fare_2 <- cab_intercept + 
                      cab_slope_distance*distance_km + 
                      cab_slope_nbridges*n_bridges
                    })


cab_fares_2 <- mutate(cab_fares_2, taxi_fare_2 = round(taxi_fare_2+hidden_cost,2))
