

f_variables_interes = function(datos){

  datos <- datos %>%
    mutate(pet = if_else(edad >= 15 ,1,0),
           fdt = if_else(cae_especifico >= 1 & cae_especifico <= 9, 1, 0), # fuerza de trabajo
           ocupados = if_else(cae_especifico >= 1 & cae_especifico <= 7, 1, 0), # persona ocupada
           desocupados = if_else(cae_especifico >= 8 & cae_especifico <= 9, 1, 0),
           hombres = if_else(sexo == 1,1,0),
           mujeres = if_else(sexo == 2,1,0)) # personas desocupadas

  print(table(datos$pet))
  print(table(datos$fdt))
  print(table(datos$ocupados))
  print(table(datos$desocupados))
  print(table(datos$hombres))
  print(table(datos$mujeres))

  datos
}


load("calidad/data/shiny/ESI 2016.rda")
load("calidad/data/shiny/ESI 2017.rda")
load("calidad/data/shiny/ESI 2018.rda")
load("calidad/data/shiny/ESI 2019.rda")
load("calidad/data/shiny/ESI 2020.rda")
load("calidad/data/shiny/ESI 2021.rda")
load("calidad/data/shiny/ESI 2022.rda")


esi_2016 <- esi_2016  %>% f_variables_interes()
esi_2017 <- esi_2017  %>% f_variables_interes()
esi_2018 <- esi_2018  %>% f_variables_interes()
esi_2019 <- esi_2019  %>% f_variables_interes()
esi_2020 <- esi_2020  %>% f_variables_interes()
esi_2021 <- esi_2021  %>% f_variables_interes()
esi_2022 <- esi_2022  %>% f_variables_interes()

save(esi_2016,file = "calidad/data/shiny/ESI 2016.rda")

save(esi_2017,file = "calidad/data/shiny/ESI 2017.rda")
save(esi_2018,file = "calidad/data/shiny/ESI 2018.rda")
save(esi_2019,file = "calidad/data/shiny/ESI 2019.rda")
save(esi_2020,file = "calidad/data/shiny/ESI 2020.rda")
save(esi_2021,file = "calidad/data/shiny/ESI 2021.rda")
save(esi_2022,file = "calidad/data/shiny/ESI 2022.rda")

library(purrr)

rutas <- list.files(path = "calidad/data/shiny/",pattern = "ENUSC",full.names = T)

load(rutas[1])
load(rutas[2])
load(rutas[3])
load(rutas[4])
load(rutas[5])
load(rutas[6])


base = enusc_2016

f_var_enusc = function(base){

  names(base) = tolower(names(base))

 c("p9_4_1","p9_3_1","p9_64_1","p9_11_1","p9_12_1","p9_13_1","rph_sexo") %in% names(base)

base$hombres = ifelse(base$rph_sexo == 1,1,0)
base$mujeres = ifelse(base$rph_sexo == 2,1,0)

print(base$hombres)
print(base$mujeres)

base$muj_insg_taxi = ifelse(base$p9_4_1 %in% c(1,2) & base$rph_sexo == 2,1 ,0)
base$hom_insg_taxi = ifelse(base$p9_4_1 %in% c(1,2) & base$rph_sexo == 1,1 ,0)

print(table(base$muj_insg_taxi))
print(table(base$hom_insg_taxi))

base$muj_insg_micro = ifelse(base$p9_3_1 %in% c(1,2) & base$rph_sexo == 2,1 ,0)
base$hom_insg_micro = ifelse(base$p9_3_1 %in% c(1,2) & base$rph_sexo == 1,1 ,0)

print(table(base$muj_insg_micro))
print(table(base$hom_insg_micro))

base$muj_insg_centr.com = ifelse(base$p9_6_1 %in% c(1,2) & base$rph_sexo == 2,1 ,0)
base$hom_insg_centr.com = ifelse(base$p9_6_1 %in% c(1,2) & base$rph_sexo == 1,1 ,0)

print(table(base$muj_insg_centr.com))
print(table(base$hom_insg_centr.com))

base$muj_insg_loc.col = ifelse(base$p9_11_1 %in% c(1,2) & base$rph_sexo == 2,1 ,0)
base$hom_insg_loc.col = ifelse(base$p9_11_1 %in% c(1,2) & base$rph_sexo == 1,1 ,0)

print(table(base$muj_insg_loc.col))
print(table(base$hom_insg_loc.col))

base$muj_insg_calles.barrio = ifelse(base$p9_12_1 %in% c(1,2) & base$rph_sexo == 2,1 ,0)
base$hom_insg_calles.barrio = ifelse(base$p9_12_1 %in% c(1,2) & base$rph_sexo == 1,1 ,0)

print(table(base$muj_insg_calles.barrio))
print(table(base$hom_insg_calles.barrio))

base$muj_insg_terminal = ifelse(base$p9_13_1 %in% c(1,2) & base$rph_sexo == 2,1 ,0)
base$hom_insg_terminal = ifelse(base$p9_13_1 %in% c(1,2) & base$rph_sexo == 1,1 ,0)

print(table(base$muj_insg_terminal))
print(table(base$hom_insg_terminal))


base

}


enusc_2016 <- enusc_2016 %>% f_var_enusc()
enusc_2017 <- enusc_2017 %>% f_var_enusc()
enusc_2018 <- enusc_2018 %>% f_var_enusc()
enusc_2019 <- enusc_2019 %>% f_var_enusc()

names(enusc_2020_etiq) = names(enusc_2020_etiq) %>% tolower()
names(enusc_2021) = names(enusc_2021) %>% tolower()


enusc_2020_etiq$hombres = ifelse(enusc_2020_etiq$rph_sexo == 1,1,0)
enusc_2020_etiq$mujeres = ifelse(enusc_2020_etiq$rph_sexo == 2,1,0)

print(enusc_2020_etiq$hombres)
print(enusc_2020_etiq$mujeres)

enusc_2021$hombres = ifelse(enusc_2021$rph_sexo == 1,1,0)
enusc_2021$mujeres = ifelse(enusc_2021$rph_sexo == 2,1,0)

print(enusc_2021$hombres)
print(enusc_2021$mujeres)




save(enusc_2016,file = "calidad/data/shiny/ENUSC 2016.rda")
save(enusc_2017,file = "calidad/data/shiny/ENUSC 2017.rda")
save(enusc_2018,file = "calidad/data/shiny/ENUSC 2018.rda")
save(enusc_2019,file = "calidad/data/shiny/ENUSC 2019.rda")
save(enusc_2020_etiq,file = "calidad/data/shiny/ENUSC 2020.rda")
save(enusc_2021,file = "calidad/data/shiny/ENUSC 2021.rda")





