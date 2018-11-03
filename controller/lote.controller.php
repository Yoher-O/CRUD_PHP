<?php
require_once 'model/lote.php';

class LoteController
{
    
    private $model;
    
    public function __CONSTRUCT(){
        $this->model = new Lote();
    }
    
    public function Index(){
        require_once 'view/header.php';
        require_once 'view/lote/lote.php';
        require_once 'view/footer.php';
    }
    
    public function Crud(){
        $lot = new Lote();
        
        if(isset($_REQUEST['IdLote'])){
            $lot = $this->model->Obtener($_REQUEST['IdLote']);
        }
        
        require_once 'view/header.php';
        require_once 'view/lote/lote-editar.php';
        require_once 'view/footer.php';
    }
    
    public function Guardar(){
        $lot = new Lote();
        
        $lot->IdLote = $_REQUEST['IdLote'];
        $lot->Nombre = $_REQUEST['Nombre'];
        $lot->AreaL = $_REQUEST['AreaL'];
        $lot->Estado = $_REQUEST['Estado'];
        $lot->Produccion = $_REQUEST['Produccion'];

        $lot->IdLote > 0 
            ? $this->model->Actualizar($lot)
            : $this->model->Registrar($lot);
        
        header('Location: index.php');
    }
    
    public function Eliminar(){
        $this->model->Eliminar($_REQUEST['IdLote']);
        header('Location: index.php');
    }
}

?>