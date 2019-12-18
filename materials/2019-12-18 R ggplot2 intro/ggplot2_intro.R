# load ggplot2
library(ggplot2)

# 1) data ---------------------------------------------------------------------
# most important component of a plot: DATA
diamonds # weight, size and attributes of diamonds

# first plotting experiment
ggplot(data = diamonds) 
# nothing happens


# 2) mapping ------------------------------------------------------------------
# to plot data, it has to be specified which features are mapped to which
# aesthetic attributes of their representations in the plot

# second try
ggplot(data = diamonds, mapping = aes(x = carat, y = price))
# still nothing happens


# 3) geoms --------------------------------------------------------------------
# we still need to specify which kind of geometric attribute we want to show

# for scatterplot: geom_point()
ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_point() # new layers are added on the plot

# overplotting: too many data, not enough space
# can be accomodated e.g. by adding transparency by specifying another 
# attribute of the geom
ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_point(alpha = 0.3) 

# maybe better when if separating by cut to see if the prices vary
ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_point(mapping = aes(color = cut), alpha = 0.3) 

# aesthetics can also be specified in the geoms (different aesthetics for 
# different geoms)
# if set without mapping (like alpha): constant for all observations


# 3) scales ------------------------------------------------------------------
# control the way data are mapped to the different aesthetic attributes of  geoms 
# - e.g. color scales, x/y scales

# plot on log-log scale with new color scale
ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_point(mapping = aes(color = cut), alpha = 0.3) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_viridis_d(option = "C", direction = -1, end = 0.9)

# 4) facets ------------------------------------------------------------------
# another way to avoid overplotting is by separating your plot into small
# multiples for different groups, which can be done with facets

# separate plot by cut
ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_point(mapping = aes(color = cut), alpha = 0.3) +
  scale_x_continuous() +
  scale_y_continuous() +
  scale_color_viridis_d(option = "C", direction = -1) +
  facet_wrap(~cut, scales = "free")

# 5) themes -------------------------------------------------------------------
# non-data components are governed by themes, e.g. background color, font size,
# margin size, guides & legends, axis properties etc.
# themes are based on theme elements

# # remove legend title and put in empty box
ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_point(mapping = aes(color = cut), alpha = 0.3) +
  scale_x_continuous() +
  scale_y_continuous() +
  scale_color_viridis_d(option = "C", direction = -1) +
  facet_wrap(~cut, scales = "free") + 
  theme(legend.title   = element_blank(),
        legend.position = c(0.8, 0.25))


# complete changes of all graphical attributes can be achieved with the
# built-in themes 

# add theme_minimal()
ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_point(mapping = aes(color = cut), alpha = 0.3) +
  scale_x_continuous() +
  scale_y_continuous() +
  scale_color_viridis_d(option = "C", direction = -1) +
  facet_wrap(~cut, scales = "free") +
  theme_minimal() +  # must come before the manual call to theme() 
  theme(legend.position = c(0.8, 0.25), # to avoid overriding it
        legend.title   = element_blank())


# 6) additional options -------------------------------------------------------
# other components of plots: coordinate systems, annotations, 
# summary statistics...

# add summary via geom_smooth() and proper x/y labels
ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_point(mapping = aes(color = cut), alpha = 0.3) +
  scale_x_continuous() +
  scale_y_continuous() +
  scale_color_viridis_d(option = "C", direction = -1) +
  facet_wrap(~cut, scales = "free") +
  theme_minimal() +  # must come before the manual call to theme() 
  theme(legend.position = c(0.8, 0.25), # to avoid overriding it
        legend.title   = element_blank()) +
  geom_smooth(method = "lm", col = "black") +
  labs(x = "Weight (carat)", y = "Price ($)")

# now it can e.g. be exported via ggsave()
