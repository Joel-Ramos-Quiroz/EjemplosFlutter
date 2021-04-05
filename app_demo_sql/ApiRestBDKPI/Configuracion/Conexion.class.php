<?php
require_once 'configuracion.php';

class Conexion {

    protected $dbLink;

    public function __construct() {
        $this->abrirConexion();
    }

    public function __destruct() {
        $this->dbLink = NULL;
    }

    protected function abrirConexion() {
        $usuario = BD_USUARIO;
        $clave = BD_CLAVE;
        $dbname=BD_NOMBRE_BD;        
        try {
            $this->dbLink = new PDO("sqlsrv:server=172.16.30.37;Database=$dbname", $usuario, $clave);
            $this->dbLink->setAttribute( PDO::SQLSRV_ATTR_QUERY_TIMEOUT, 100);
            //$this->dbLink->exec("SET NAMES 'utf8';");
            $this->dbLink->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);   
        } catch (Exception $exc) {
            echo $exc->getMessage();
        }
        return $this->dbLink;
    }

}
