
create_tabulado = function(base, v_interes, v_cruce,  v_subpob = NULL, v_fexp1, v_conglom, v_estratos, tipoCALCULO, ci, ajuste_ene,etiquetas=FALSE,denominator,scheme,server = T){

  # print("inside")
  # print(na.rm != F)
  #
  # if(na.rm != F){
  #   base = base %>% dplyr::filter(!is.na(!!rlang::sym(v_interes)))
  #
  #   print(any(is.na(base[v_interes])))
  # }

  if(v_subpob != ""){
    base = base %>% dplyr::filter(!!rlang::sym(v_subpob) == 1)
  }


  if(length(v_cruce)>1){
    v_cruce_string = paste0(v_cruce, collapse  = "+")
  }else{
    v_cruce_string = v_cruce
  }

  base[[v_interes]] = as.numeric(base[[v_interes]])
  base$unit =  as.numeric(base[[v_conglom]])
  base$varstrat =  as.numeric(base[[v_estratos]])

 # print(base[[v_fexp1]])

  base$fe =  as.numeric(base[[v_fexp1]])

  ### Diseño complejo
  dc <- survey::svydesign(ids = ~unit, strata = ~varstrat,
                          data =  base, weights = ~fe)

  options(survey.lonely.psu = "certainty")


  ### listas de funciones CALIDAD
  funciones_cal = list(calidad::create_mean, calidad::create_prop,
                       calidad::create_total, calidad::create_size)

  if(tipoCALCULO %in% "uno") {
    numero = 1
  }else if(tipoCALCULO %in% "dos"){
    numero = 2
  }else if(tipoCALCULO %in% "tres"){
    numero = 3
  }else if(tipoCALCULO %in% "cuatro"){
    numero = 4
  }

  if(scheme == "eclac"){
    eclac_input = TRUE
    log_cv= TRUE

  }else{
    eclac_input = FALSE
    log_cv= FALSE
  }

## condicional si es un cálculo por proporciones ####



  if(tipoCALCULO == "dos"){
    if(!is.null(denominator)){

      evaluados = calidad::assess(funciones_cal[[numero]](var = v_interes,
                                                         design = dc,
                                                         domains = v_cruce_string,
                                                         ci = ci,
                                                         denominator = denominator,
                                                         eclac_input = eclac_input,
                                                         log_cv= log_cv)
                                    ,scheme = scheme,publish = T)
    }else{
      evaluados = calidad::assess(funciones_cal[[numero]](var = v_interes,
                                                         design = dc,
                                                         domains = v_cruce_string,
                                                         ci = ci,
                                                         eclac_input = eclac_input,
                                                         log_cv= log_cv),
                                    scheme = scheme,publish = T)
    }

 # }else if(tipoCALCULO == "Conteo casos" & ){


  }else{

    evaluados = calidad::assess(funciones_cal[[numero]](var = v_interes,
                                                       design = dc,
                                                       domains = v_cruce_string,
                                                       ci = ci,
                                                       eclac_input = eclac_input),
                                  scheme = scheme,publish = T)
  }

  # corregimos la variable calidad dependiendo si es CEPAL o INE

  if(scheme == "eclac"){
    evaluados <- evaluados %>%
      mutate(label = dplyr::case_when(label == "publish" ~ "Publicar",
                                      label == "review" ~ "Revisar",
                                      label == "supress" ~ "Suprimir")) %>%
      rename(calidad = label)
  }else{
    evaluados <- evaluados %>%
      mutate(label = dplyr::case_when(label == "reliable" ~ "fiable",
                                      label == "weakly reliable" ~ "poco fiable",
                                      label == "non-reliable" ~ "no fiable")) %>%
      rename(calidad = label) %>% select(-c(publication,	pass))
  }

  #### opción de etiquetas #####
  # if(etiquetas == F && !is.null(v_cruce) && labelled::is.labelled(base[[v_cruce[1]]])){ #
  #
  #   paste_labels = function(tabla, base, var_cruce){
  #
  #     dt = data.frame(valor = labelled::val_labels(base[[var_cruce]]))
  #     dt = tibble::rownames_to_column(dt)
  #
  #     tabla[[var_cruce]] =  unlist(lapply(tabla[[var_cruce]] ,function(x) as.character(dt$rowname[dt$valor == x])))
  #     tabla
  #   }
  #
  #   ####  al hacer filtros se eliminan categorias, necesitamos sacar etiquetas de base filtrada
  #
  #   if(v_subpob!=""){
  #     datos2 = base[base[[v_subpob]] == 1,]
  #   }else{
  #     datos2 = base
  #   }
  #
  #   #asignamos etiquetas
  #   for(i in v_cruce){
  #     evaluados = paste_labels(tabla = evaluados, base = datos2, var_cruce = i)
  #   }
  #
  # }
  evaluados
}

