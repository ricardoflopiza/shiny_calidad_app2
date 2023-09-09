
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


