
library(calidad)
library(dplyr)


source("create_tabulado.R")

enusc_sinet <- read.csv2("data/enusc_2016.csv")


### Tipo de cálculo ####
### Scheme CHILE ####
## mean ####

create_tabulado(base = enusc_sinet,
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

create_tabulado(base = enusc_sinet,
                tipoCALCULO = "uno",
                scheme = "chile",
                v_interes = "rph_edad",
                v_cruce = "enc_region",
                v_subpob = NULL,
                v_fexp1 = "fact_pers",
                v_conglom = "conglomerado",
                v_estratos = "varstrat",
                ci = F)
