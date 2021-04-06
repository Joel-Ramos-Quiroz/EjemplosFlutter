<?php
/*
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST ,OPTIONS, PUT');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');
*/

//session_start();
require_once '../Objetos/api_pa.class.php';
require_once '../util/funciones/Funciones.class.php';
require_once "../Controladores/Variables_Globales.php";
try {
    $obj = new pa_procedure();
    switch ($_GET["p"]) {
        case "listar_fundos":
                $obj->setBusqueda($_POST["ubicacion"]);
                $resultado = $obj->get_listar_fundos_con_turnos();
                //echo json_encode($resultado);
                Funciones::imprimeJSON_api(200, $resultado);
                break;
        case "login":
            $obj->setDni($_POST["usuario"]);
            $obj->setClave($_POST["clave"]);
            $resultado = $obj->pa_login();
            Funciones::imprimeJSON_api(200, $resultado);
            /*
            if($resultado[1]==0){
                echo json_encode("REGISTRADO CORRECTAMENTE");
            }else{
                echo json_encode($resultado[0]);
            }
            */
            //echo ($resultado[0]);
                break;
    }
} catch (Exception $exc) {
    Funciones::imprimeJSON(500, $exc->getMessage(), " ");
}
