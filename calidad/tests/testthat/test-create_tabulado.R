
library(calidad)
library(dplyr)


source("create_tabulado.R")

load("data/shiny/ENUSC 2016.rda")


### Tipo de cálculo ####
### Scheme CHILE ####
## mean ####

create_tabulado(base = enusc_2016,
                tipoCALCULO = "uno",
                scheme = "chile",
                v_interes = "rph_edad",
                v_cruce = NULL,
                v_subpob = NULL,
                v_fexp1 = "fact_pers",
                v_conglom = "conglomerado",
                v_estratos = "varstrat",
                ci = F)

## mean, cruce ####

create_tabulado(base = enusc_2016,
                tipoCALCULO = "uno",
                scheme = "chile",
                v_interes = "rph_edad",
                v_cruce = "enc_region",
                v_subpob = NULL,
                v_fexp1 = "fact_pers",
                v_conglom = "conglomerado",
                v_estratos = "varstrat",
                ci = F)


create_tabulado(base = enusc_2016,
                tipoCALCULO = "uno",
                scheme = "chile",
                v_interes = "rph_edad",
                v_cruce = "enc_region",
                v_subpob = "hombres",
                v_fexp1 = "fact_pers",
                v_conglom = "conglomerado",
                v_estratos = "varstrat",
                ci = F)


create_tabulado(base = enusc_2016,
                tipoCALCULO = "uno",
                scheme = "chile",
                v_interes = "rph_edad",
                v_cruce = "enc_region",
                v_subpob = "mujeres",
                v_fexp1 = "fact_pers",
                v_conglom = "conglomerado",
                v_estratos = "varstrat",
                ci = F)


tab = create_tabulado(base = enusc_2016,
                tipoCALCULO = "uno",
                scheme = "chile",
                v_interes = "rph_edad",
                v_cruce = "enc_region",
                v_subpob = NULL,
                v_fexp1 = "fact_pers",
                v_conglom = "conglomerado",
                v_estratos = "varstrat",
                ci = F)



load("data/shiny/CASEN 2017.rda")


tab = create_tabulado(base = casen_2017,
                      tipoCALCULO = "dos",
                      denominator = NULL,
                      scheme = "chile",
                      v_interes = "pobreza_multi_4d",
                      v_cruce = "region",
                      v_subpob = "",
                      v_fexp1 = "expr",
                      v_conglom = "varunit",
                      v_estratos = "varstrat",
                      na.rm = T,
                      ci = F)



base = casen_2017 %>% dplyr::filter(!is.na(!!rlang::sym(v_interes))) %>% mutate(numerador = 1)

base = casen_2017 %>% mutate(numerador = 1)

base$numerador
|
### Diseño complejo
dc <- survey::svydesign(ids = ~varunit, strata = ~varstrat,
                        data =  base, weights = ~expr)

options(survey.lonely.psu = "certainty")

calidad::create_prop(var = "numerador", denominator = "pobreza_multi_4d",design = dc)







