

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

// console.log("val_eclac")
// console.log(val_eclac)
//
// val_eclac.onchange = () =>{
//
//   console.log(val_eclac.value)
//
// }

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




//console.log(document.getElementsByName("SCHEME").querySelector("input[type='radio']"))



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



