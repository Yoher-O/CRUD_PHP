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
			            ->prepare("CALL EliminarLote(?)");// ? -> equivale a un parametro osea el EliminarLote(?) recibe un parametro osea el id ejemplo

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
			$sql = "CALL EditarLote(?,?,?,?,?)";// en este caso recibe 5 parametros

			$this->pdo->prepare($sql)
			     ->execute(
				    array(
                        $data->Nombre, // El orden en este array es importante xq si el procedimiento almacenado recibe primero el nombre y pones el apellido
                        $data->AreaL,  // va a tomar ese apellido como nombre
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
