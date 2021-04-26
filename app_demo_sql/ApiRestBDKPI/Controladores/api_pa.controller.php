<?php
/*
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST ,OPTIONS, PUT');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');
*/

//session_start();
require_once '../Objetos/api_consumo_energia.class.php';
require_once '../Objetos/api_pa.class.php';
require_once '../util/funciones/Funciones.class.php';
require_once "../Controladores/Variables_Globales.php";
try {
    $obj = new pa_procedure();
    $obj_ce = new pa_consumo_energia();

    switch ($_GET["p"]) {
        case "listar_fundos":
            $obj->setBusqueda($_POST['ubicacion']);
            $resultado = $obj->get_listar_fundos_con_turnos();
            //echo json_encode($resultado);
            Funciones::imprimeJSON_api(200, $resultado);
            break;
        case "listar_suministros":
            $obj->setCodfundo($_POST['codfundo']);
            $resultado = $obj->get_listar_suministros_x_fundo();
            //echo json_encode($resultado);
            Funciones::imprimeJSON_api(200, $resultado);
            break;
        case "login":
            $obj->setDni($_POST["usuario"]);
            $obj->setClave($_POST["clave"]);
            $resultado = $obj->pa_login();
            Funciones::imprimeJSON_api(200, $resultado);
            break;
        case "GuardarConsumoEnergia":
            $obj_ce->setOperacion((int)$_POST["operacion"]);
            $obj_ce->setCodigo((int)$_POST["codigo"]);
            $obj_ce->setCodSum((int)$_POST["codsum"]);
            $obj_ce->setCodubi((int)$_POST["codubi"]);
            $obj_ce->setDni($_POST["dni"]);
            $obj_ce->setNumero_recibo($_POST["num_recibo"]);
            $obj_ce->setImporte($_POST["importe"]);
            $obj_ce->setKq($_POST["kq"]);
            $obj_ce->setFecha_consumo($_POST["fecha"]);
            $obj_ce->setEstado($_POST["estado"]);
            $resultado = $obj_ce->pa_guardar();
            
            Funciones::imprimeJSON_api(200, $resultado);
            break;
    }
} catch (Exception $exc) {
    Funciones::imprimeJSON(500, $exc->getMessage(), " ");
}
