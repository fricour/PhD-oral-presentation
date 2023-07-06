calanoids_east <- vroom('perspectives/taxo//1902593_class_number_4_FromNetCDF.csv') |> 
  filter(PhaseName == 'NPAR') |> mutate(date = as.Date(date), group = 'Calanoida - East') 

calanoids_west <- vroom('perspectives/taxo//4903657_class_number_4_FromNetCDF.csv') |> 
  filter(PhaseName == 'NPAR') |> mutate(date = as.Date(date), group = 'Calanoida - West') 

chaeto_east <- vroom('perspectives/taxo//1902593_class_number_5_FromNetCDF.csv') |> 
  filter(PhaseName == 'NPAR') |> mutate(date = as.Date(date), group = 'Chaetognatha - East')

chaeto_west <- vroom('perspectives/taxo//4903657_class_number_5_FromNetCDF.csv') |> 
  filter(PhaseName == 'NPAR') |> mutate(date = as.Date(date), group = 'Chaetognatha - West')

detritus_east <- vroom('perspectives/taxo//1902593_class_number_13_FromNetCDF.csv') |> 
  filter(PhaseName == 'NPAR') |> mutate(date = as.Date(date), group = 'detritus - East') 

detritus_west <- vroom('perspectives/taxo//4903657_class_number_13_FromNetCDF.csv') |> 
  filter(PhaseName == 'NPAR') |> mutate(date = as.Date(date), group = 'detritus - West') 

taxo_kerguelen <- rbind(calanoids_east, calanoids_west, chaeto_east, chaeto_west,
                        detritus_east, detritus_west) |> filter(date <= as.Date("2023-03-21"))


ggplot(taxo_kerguelen) + geom_point(aes(x = conc_object, y = depth, colour = date)) + scale_colour_viridis_c(trans = "date",labels = c("2023-02-11","2023-02-18","2023-02-25","2023-03-04","2023-03-11", "2023-03-18"), breaks = c(as.Date("2023-02-11"), as.Date("2023-02-18"), as.Date("2023-02-25"), as.Date("2023-03-04"), as.Date("2023-03-11"), as.Date("2023-03-18"))) + scale_y_reverse() + theme_bw() +
  labs(x = 'Concentration (#/L)', colour = "Date", y = 'Depth (m)') +
  facet_wrap(~group, scale = "free_x", nrow = 5)