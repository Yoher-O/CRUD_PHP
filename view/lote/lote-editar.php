<h1 class="page-header">
    <?php echo $lot->IdLote != null ? $lot->Nombre : 'Nuevo Registro'; ?>
</h1>

<ol class="breadcrumb">
  <li><a href="?c=Lote">Lotes</a></li>
  <li class="active"><?php echo $lot->IdLote != null ? $lot->Nombre : 'Nuevo Registro'; ?></li>
</ol>

<form id="frm-lote" action="?c=Lote&a=Guardar" method="post" enctype="multipart/form-data">
    <input type="hidden" name="IdLote" value="<?php echo $lot->IdLote; ?>" />
    
    <div class="form-group">
        <label>Nombre</label>
        <input type="text" name="Nombre" value="<?php echo $lot->Nombre; ?>" class="form-control" placeholder="Ingrese su nombre" data-validacion-tipo="requerido|min:3" />
    </div>
    
    <div class="form-group">
        <label>Área</label>
        <input type="text" name="AreaL" value="<?php echo $lot->AreaL; ?>" class="form-control" placeholder="Ingrese el área del lote" data-validacion-tipo="requerido|min:2" />
    </div>
    
    <div class="form-group">
        <label>Estado</label>
        <select name="Estado" class="form-control">
            <option <?php echo $lot->Estado == 1 ? 'selected' : ''; ?> value="1">Desocupado</option>
            <option <?php echo $lot->Estado == 2 ? 'selected' : ''; ?> value="2">Ocupado</option>
        </select>
    </div>
    
   <div class="form-group">
        <label>Producción</label>
        <input type="text" name="Produccion" value="<?php echo $lot->Produccion; ?>" class="form-control" placeholder="Ingrese la producción del lote" data-validacion-tipo="requerido|min:3" />
    </div>
    
    <hr />
    
    <div class="text-right">
        <button class="btn btn-success">Guardar</button>
    </div>
</form>

<script>
    $(document).ready(function(){
        $("#frm-lote").submit(function(){
            return $(this).validate();
        });
    })
</script>