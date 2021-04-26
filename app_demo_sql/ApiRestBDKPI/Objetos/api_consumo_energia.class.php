<?php

require_once '../Configuracion/Conexion.class.php';

class pa_consumo_energia extends Conexion
{

private $operacion;
private $codigo;
private $CodSum;
private $codubi;
private $Dni;
private $numero_recibo;
private $importe;
private $kq;
private $fecha_consumo;
private $estado;
private $msj;
private $coderror;
private $codreturn;

function setOperacion($operacion) { $this->operacion = $operacion; }
function getOperacion() { return $this->operacion; }
function setCodigo($codigo) { $this->codigo = $codigo; }
function getCodigo() { return $this->codigo; }
function setCodSum($CodSum) { $this->CodSum = $CodSum; }
function getCodSum() { return $this->CodSum; }
function setCodubi($codubi) { $this->codubi = $codubi; }
function getCodubi() { return $this->codubi; }
function setDni($Dni) { $this->Dni = $Dni; }
function getDni() { return $this->Dni; }
function setNumero_recibo($numero_recibo) { $this->numero_recibo = $numero_recibo; }
function getNumero_recibo() { return $this->numero_recibo; }
function setImporte($importe) { $this->importe = $importe; }
function getImporte() { return $this->importe; }
function setKq($kq) { $this->kq = $kq; }
function getKq() { return $this->kq; }
function setFecha_consumo($fecha_consumo) { $this->fecha_consumo = $fecha_consumo; }
function getFecha_consumo() { return $this->fecha_consumo; }
function setEstado($estado) { $this->estado = $estado; }
function getEstado() { return $this->estado; }
function setMsj($msj) { $this->msj = $msj; }
function getMsj() { return $this->msj; }
function setCoderror($coderror) { $this->coderror = $coderror; }
function getCoderror() { return $this->coderror; }
function setCodreturn($codreturn) { $this->codreturn = $codreturn; }
function getCodreturn() { return $this->codreturn; }

    public function pa_guardar()
    {
        $this->dbLink->beginTransaction();
        try {
            $msj = "";
            $codreturn=0;
            $coderror = 0;

            $sql = "{CALL pa_mant_consumo_energia(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            $sentencia = $this->dbLink->prepare($sql);
            $sentencia->bindParam(1, $this->getOperacion());
            $sentencia->bindParam(2, $this->getCodigo());
            $sentencia->bindParam(3, $this->getCodSum());
            $sentencia->bindParam(4, $this->getCodubi());
            $sentencia->bindParam(5, $this->getDni());
            $sentencia->bindParam(6, $this->getNumero_recibo());
            $sentencia->bindParam(7, $this->getImporte());
            $sentencia->bindParam(8, $this->getKq());
            $sentencia->bindParam(9, $this->getFecha_consumo());
            $sentencia->bindParam(10, $this->getEstado());
            $sentencia->bindParam(11, $msj, PDO::PARAM_STR|PDO::PARAM_INPUT_OUTPUT,100); 
            $sentencia->bindParam(12, $coderror, PDO::PARAM_INT|PDO::PARAM_INPUT_OUTPUT,1); 
            $sentencia->bindParam(13, $codreturn, PDO::PARAM_INT|PDO::PARAM_INPUT_OUTPUT,1);
            
            $sentencia->execute();
            
            //$resultado = $sentencia->fetchAll(PDO::FETCH_ASSOC);
            $this->dbLink->commit();
            return array($msj, $coderror,$codreturn);
        } catch (Exception $ex) {
            $this->dbLink->rollBack();
            throw $ex;
        }
    }

}
