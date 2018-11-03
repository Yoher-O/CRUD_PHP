<?php
class Lote
{

    private $pdo;
        
    public $IdLote;
    public $Nombre;
    public $AreaL;
    public $Estado;
    public $Produccion;

	public function __CONSTRUCT()
	{
		try
		{
			$this->pdo = Database::StartUp();     
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Listar()
	{
		try
		{
			$result = array();

			$stm = $this->pdo->prepare("SELECT * FROM selo09");
			$stm->execute();

			return $stm->fetchAll(PDO::FETCH_OBJ);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Obtener($IdLote)
	{
		try 
		{
			$stm = $this->pdo
			          ->prepare("SELECT * FROM selo09 WHERE IdLote = ?");
			          

			$stm->execute(array($IdLote));
			return $stm->fetch(PDO::FETCH_OBJ);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

	public function Eliminar($IdLote)
	{
		try 
		{
			$stm = $this->pdo
			            ->prepare("DELETE FROM selo09 WHERE IdLote = ?");			          

			$stm->execute(array($IdLote));
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

	public function Actualizar($data)
	{
		try 
		{
			$sql = "UPDATE selo09 SET 
						Nombre       = ?, 
						AreaL        = ?,
						Estado       = ?, 
						Produccion   = ?
				    WHERE IdLote     = ?";

			$this->pdo->prepare($sql)
			     ->execute(
				    array(
                        $data->Nombre, 
                        $data->AreaL,
                        $data->Estado,
                        $data->Produccion,
                        $data->IdLote
					)
				);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

	public function Registrar(Lote $data)
	{
		try 
		{
		$sql = "INSERT INTO selo09 (Nombre,AreaL,Estado,Produccion) 
		        VALUES (?, ?, ?, ?)";

		$this->pdo->prepare($sql)
		     ->execute(
				array(
                    $data->Nombre, 
                    $data->AreaL, 
                    $data->Estado,
                    $data->Produccion
                )
			);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}
}

?>