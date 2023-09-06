library(shinytest2)

## para correr los test con: testthat::test_file(path = "tests/testthat/test-shinytest2.R")

test_that("{shinytest2} recording: calidad_chile_media", {

  app <- AppDriver$new(variant = platform_variant(), name = "calidad_chile_media",
      height = 955, width = 1619)
  Sys.sleep(2)
  app$click("base_ine")
  app$set_inputs(varINTERES = "rph_edad")
  app$click("actionTAB")
  app$click("actionTAB")
  app$expect_screenshot()
})



test_that("{shinytest2} recording: calidad_cepal_media", {
  app <- AppDriver$new(variant = platform_variant(), name = "calidad_cepal_media",
      height = 955, width = 1619)
  Sys.sleep(2)
  app$click("base_ine")
  app$set_inputs(varINTERES = "rph_edad")
  app$set_inputs(SCHEME = "eclac")
  app$click("actionTAB")
  app$expect_screenshot()
})


test_that("{shinytest2} recording: calidad_media_prop_conte_con y sin desagreg", {
  app <- AppDriver$new(name = "calidad_media_prop_conte_con y sin desagreg", height = 955,
      width = 1619)
  Sys.sleep(2)
  app$click("base_ine")
  app$set_inputs(varINTERES = "rph_edad")
  app$click("actionTAB")
  app$set_inputs(varCRUCE = "rph_edad")
  app$set_inputs(varCRUCE = character(0))
  app$set_inputs(varCRUCE = "enc_region")
  app$set_inputs(tipoCALCULO = "dos")
  app$set_inputs(varINTERES = "")
  app$set_inputs(varINTERES = "vp_dc")
  app$set_inputs(varCRUCE = character(0))
  app$click("actionTAB")
  app$set_inputs(varCRUCE = "enc_region")
  app$set_inputs(varINTERES = "")
  app$set_inputs(varINTERES = "muj_insg_taxi")
  app$set_inputs(varDENOM = "hom_insg_taxi")
  app$click("actionTAB")
  app$set_inputs(varDENOM = character(0))
  app$set_inputs(varINTERES = "")
  app$set_inputs(varINTERES = "vp_dc")
  app$set_inputs(tipoCALCULO = "tres")
  app$set_inputs(tipoCALCULO = "cuatro")
  app$click("actionTAB")
  app$expect_download("tabla")
  app$click("show")
  app$click("cerrar_modal")
  app$click("reset")
})


test_that("{shinytest2} recording: calidad_esi_probando suma variable continua", {
  app <- AppDriver$new(name = "calidad_esi_probando suma variable continua", height = 955,
      width = 1619)
  Sys.sleep(2)
  app$set_inputs(base_web_ine = "ESI 2016")
  app$click("base_ine")
  app$set_inputs(varINTERES = "ing_ot")
  app$set_inputs(tipoCALCULO = "cuatro")
  app$set_inputs(tipoCALCULO = "tres")
  app$click("actionTAB")
  app$set_inputs(varCRUCE = "region")
  app$set_inputs(tipoCALCULO = "uno")
  app$set_inputs(varINTERES = "ing_a_t")
  app$click("actionTAB")
  app$click("actionTAB")
  app$set_inputs(IC = TRUE)
  app$expect_values()
})
