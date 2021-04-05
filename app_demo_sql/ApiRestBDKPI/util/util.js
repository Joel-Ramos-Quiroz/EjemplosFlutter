function validarNumeros(evento){
    var tecla = (evento.which) ? evento.which : evento.keyCode;
    if (tecla >= 48 && tecla <= 57){
      return true;
    }
    
    return false;
}

 function soloLetras(e){
      var  key = e.keyCode || e.which;
        var tecla = String.fromCharCode(key).toLowerCase();
      var letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
      var especiales = "8-37-39-46";

      var tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }
    
    function validarEmail(valor) {
if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(valor)){
alert("La dirección de email " + valor + " es correcta.");
} else {
alert("La dirección de email es incorrecta.");
}
}