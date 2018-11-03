<h1 class="page-header">Lotes</h1>

<div class="well well-sm text-right">
    <a class="btn btn-primary" href="?c=Lote&a=Crud">Nuevo Lote</a>
</div>

<table class="table table-striped">
    <thead>
        <tr>
            <th style="width:100px;">Nombre</th>
            <th>Área</th>
            <th style="width:100px;">Estado</th>
            <th style="width:100px;">Producción</th>
            <th style="width:60px;"></th>
            <th style="width:60px;"></th>
        </tr>
    </thead>
    <tbody>
    <?php foreach($this->model->Listar() as $r): ?>
        <tr>
            <td><?php echo $r->Nombre; ?></td>
            <td><?php echo $r->AreaL; ?></td>
            <td><?php echo $r->Estado == 1 ? 'Desocupado' : 'Ocupado'; ?></td>
            <td><?php echo $r->Produccion; ?></td>
            <td>
                <a href="?c=Lote&a=Crud&IdLote=<?php echo $r->IdLote; ?>">Editar</a>
            </td>
            <td>
                <a onclick="javascript:return confirm('¿Seguro de eliminar este registro?');" href="?c=Lote&a=Eliminar&IdLote=<?php echo $r->IdLote; ?>">Eliminar</a>
            </td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table> 
