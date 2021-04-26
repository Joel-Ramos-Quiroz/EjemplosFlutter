<?php

require_once '../Configuracion/Conexion.class.php';

class pa_procedure extends Conexion
{
private $dni;
private $clave;
private $msj;
private $coderror;
private $usuario;

function setDni($dni) { $this->dni = $dni; }
function getDni() { return $this->dni; }
function setClave($clave) { $this->clave = $clave; }
function getClave() { return $this->clave; }
function setMsj($msj) { $this->msj = $msj; }
function getMsj() { return $this->msj; }
function setCoderror($coderror) { $this->coderror = $coderror; }
function getCoderror() { return $this->coderror; }
function setUsuario($usuario) { $this->usuario = $usuario; }
function getUsuario() { return $this->usuario; }

private $busqueda;

function setBusqueda($busqueda) { $this->busqueda = $busqueda; }
function getBusqueda() { return $this->busqueda; }

private $codfundo;

function setCodfundo($codfundo) { $this->codfundo = $codfundo; }
function getCodfundo() { return $this->codfundo; }


    public function get_listar_fundos_con_turnos()
    {
        $this->dbLink->beginTransaction();
        try {
            $sql = "{CALL pa_cons_fundos_con_suministro(?)}";
            $sentencia = $this->dbLink->prepare($sql);
            $sentencia->bindParam(1, $this->getBusqueda());
            $sentencia->execute();
            $resultado = $sentencia->fetchAll(PDO::FETCH_ASSOC);
            $this->dbLink->commit();
            return $resultado;
        } catch (Exception $ex) {
            $this->dbLink->rollBack();
            throw $ex;
        }
    }

    public function get_listar_suministros_x_fundo()
    {
        $this->dbLink->beginTransaction();
        try {
            $sql = "{CALL pa_cons_sumnistro(?)}";
            $sentencia = $this->dbLink->prepare($sql);
            $sentencia->bindParam(1, $this->getCodfundo());
            $sentencia->execute();
            $resultado = $sentencia->fetchAll(PDO::FETCH_ASSOC);
            $this->dbLink->commit();
            return $resultado;
        } catch (Exception $ex) {
            $this->dbLink->rollBack();
            throw $ex;
        }
    }

    public function pa_login()
    {
        $this->dbLink->beginTransaction();
        try {
            $msj = "";
            $usuario="";
            $coderror = 0;

            $sql = "{CALL pa_login(?,?,?,?,?)}";
            $sentencia = $this->dbLink->prepare($sql);
            $sentencia->bindParam(1, $this->getDni());
            $sentencia->bindParam(2, $this->getClave());
            $sentencia->bindParam(3, $msj, PDO::PARAM_STR|PDO::PARAM_INPUT_OUTPUT,100); 
            $sentencia->bindParam(4, $usuario, PDO::PARAM_STR|PDO::PARAM_INPUT_OUTPUT,250);
            $sentencia->bindParam(5, $coderror, PDO::PARAM_STR|PDO::PARAM_INPUT_OUTPUT,1);
            
            $sentencia->execute();
            //$resultado = $sentencia->fetchAll(PDO::FETCH_ASSOC);
            $this->dbLink->commit();
            return array($msj, $usuario,$coderror);
        } catch (Exception $ex) {
            $this->dbLink->rollBack();
            throw $ex;
        }
    }

}
