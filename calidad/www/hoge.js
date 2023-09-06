

//  cargamos elementos del DOM
let tipoCalculo = document.querySelector("#tipoCALCULO")
let denominador = document.querySelector("#fe_denom")
let proporcion = document.getElementsByName("tipoCALCULO")
let btnCepal = document.getElementsByClassName("btn radiobtn btn-primary")[3];
let radio2 = tipoCalculo.querySelectorAll("input[type='radio']")

// denominador comienza bloqueado
denominador.style.display = "none";

// cuando se cambia a tipo de calculo 2 se despliega denominador
for (match in radio2) {
   radio2[match].onclick = function() {
     //console.log(this.value)
valor = this.value
if(valor == "dos"){
denominador.style.display = "block";
}else{
denominador.style.display = "none";
}
console.log(valor)
   }
}

/////////////////////

scheme = document.querySelector("#SCHEME")

// console.log(btnCepal)
val_eclac = scheme.querySelectorAll("input[type='radio']")

//  //  cuando se cambia al esquema cepal desaparece el denominador
  for (match in val_eclac) {
     val_eclac[match].onchange = function() {
       //console.log(this.value)
  valor = this.value

    if(valor == "eclac"){
    denominador.style.display = "none";
    }else{
    denominador.style.display = "block";
    }
  console.log(valor)
     }
  }



// para bloquear el botón de cepal al seleccionar alguna variable en denominador
Shiny.addCustomMessageHandler(
      type = 'send-notice', function(message) {
         console.log(message)

        if(message == "denom_not_null"){

          btnCepal.disabled = true

        }else{

          btnCepal.disabled = false

        }

    });




// console.log(nombresArchivos)


/// desplegamos origne de los datos desde JS

let origenDatos = document.querySelector("#Id004")

let originDatosValue = origenDatos.querySelectorAll("input[type='radio']")

divOrigenDatos = document.querySelector("#origen-datos")

// divOrigenDatos.innerHTML = 'fe' //`<div><h3 class="ti-top-ine">Evaluación de Calidad de Estimaciones en Encuestas de Hogares</h3><div/>`

console.log(divOrigenDatos)


// let valor = "Bases INE"

//console.log(valor)

//      /// cargamos nombre de los archivos
//      Shiny.addCustomMessageHandler(
//            type = 'files-names', function(message) {
//           //    console.log(message)
//
//        for (match in originDatosValue) {
//
//        originDatosValue[match].onchange = function() {
//             //console.log(this.value)
//        valor = this.value
//
//          if(valor == "Bases INE"){
//
//      divOrigenDatos.innerHTML =  `<div id="DescargaINE" class="shiny-html-output shiny-bound-output" aria-live="polite"><div class="form-group shiny-input-container">
//      <label class="control-label" id="base_web_ine-label" for="base_web_ine-selectized">
//        <h4>Utilizar una base de datos del INE</h4>
//      </label>
//      <div>
//        <select id="base_web_ine" tabindex="-1" class="selectized shiny-bound-input shinyjs-resettable" data-shinyjs-resettable-id="base_web_ine" data-shinyjs-resettable //   -type="Select" data-shinyjs-resettable-value="&quot;ENUSC 2016&quot;" style="display: none;"><option value=`$message` selected="selected">ENUSC 2016</option></select//    ><div class="selectize-control single plugin-selectize-plugin-a11y"><div class="selectize-input items full has-options has-items"><div class="item" data-value="ENUSC //    2016">ENUSC 2016</div><input type="text" autocomplete="off" tabindex="" id="base_web_ine-selectized" role="combobox" aria-expanded="false" haspopup="listbox" aria//    -owns="cithdiwi20" style="width: 4px;"></div><div class="selectize-dropdown single plugin-selectize-plugin-a11y" style="display: none;"><div class="selectize //   -dropdown-content" role="listbox" id="cithdiwi20"></div></div></div>
//        <script type="application/json" data-for="base_web_ine" data-nonempty="">{"plugins":["selectize-plugin-a11y"]}</script>
//      </div>
//    </div>
//    <button id="base_ine" type="button" class="btn btn-default action-button shiny-bound-input">Cargar base desde el INE</button></div>`
//
//               }else{
//
//      divOrigenDatos.innerHTML =  `<div id="datos_locales" class="shiny-html-output shiny-bound-output" aria-live="polite"><div class="form-group shiny-input-container">
//      <label class="control-label" id="file-label" for="file"><h4>Carga una base de datos desde tu computador</h4> <h6>- El peso máximo aceptado es <strong>400 mb//    </strong> <br>
//                                                   - Los archivos <strong>.csv</strong> deben estar separados por comas</h6></label>
//      <div class="input-group">
//        <label class="input-group-btn input-group-prepend">
//          <span class="btn btn-default btn-file">
//            Buscar
//            <input id="file" name="file" type="file" style="position: absolute !important; top: -99999px !important; left: -99999px !important;" class="shiny-bound-input //    shinyjs-resettable" data-shinyjs-resettable-id="file" data-shinyjs-resettable-type="File" data-shinyjs-resettable-value="">
//          </span>
//        </label>
//        <input type="text" class="form-control" placeholder=".sav .rds .dta .sas .xlsx .csv .feather" readonly="readonly">
//      </div>
//      <div id="file_progress" class="progress active shiny-file-input-progress">
//        <div class="progress-bar"></div>
//      </div>
//    </div></div>`
//
//              }
//
//           }
//
//        }
//
//    console.log(valor)
//
//          }
//
//          );
//






// // console.log(proporcion[1].onclick)
// console.log("denominador")
// console.log(denominador)
//
// let input = document.getElementsByClassName("varDENOM")
// console.log("input")
// console.log(input)
//
//
// input.onchange = (e) =>{
//
//   console.log(e.target)
//
// }



// console.log("select")
// var all_select = document.getElementsByClassName("select");
// for (i = 0; i < all_select.length; i++) {
//     all_select[i].onclick = function () {
//         console.log(this.value);
//     }
// }

// input.addEventListener("input", (event) => {
//
// let input2 = document.getElementsByClassName("varDENOM")
//
// console.log(input2)
//
//  }
// )
//


//console.log(tipoCalculo.getElementsByClassName("shiny-options-group").onclick)
//
//console.log("denominador")
//console.log(denominador)
//
//console.log(denominador.getElementsByClassName("selectize-input items not-full has-options has-items focus input-active dropdown-active"))
//
//let input = denominador.getElementsByClassName("selectize-input items not-full has-options has-items focus input-active dropdown-active")
//  console.log("input")
//  console.log(input)
//
//
//input.addEventListener("change",(event) => {
//console.log("valor ingresado")
//
//let item = item.getElementsByClassName("item")
//
//console.log(item)
//
//console.log(event.target.value)
//});



