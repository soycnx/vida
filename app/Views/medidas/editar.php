<div class="col-md-8 mx-auto">
    <div class="card radius-10 border-start border-0 border-3 border-info">
        <form action="<?php echo base_url('/medidas/actualizar') ?>" method="POST" autocomplete="off">
            <div class="card-body">
                <h6 class="card-title text-center">Modificar medida</h6>
                <hr>
                <div class="alert border-0 border-start border-5 border-info alert-dismissible fade show py-2">
                    <div class="d-flex align-items-center">
                        <div class="font-35 text-info"><i class='bx bx-info-square'></i>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0 text-info">Advertencia</h6>
                            <div>Todo los campos con <b class="text-danger">*</b> son obligatorios</div>
                        </div>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <?php csrf_field(); ?>
                <div class="row p-3">
                    <div class="col-md-8">
                        <div class="form-floating mb-3">
                            <input type="hidden" value="<?php echo $medida['idmedida'] ?>" name="id">
                            <input type="text" class="form-control" placeholder="Nombre de la medida" name="medida" value="<?= set_value('medida', $medida['medida']) ?>">
                            <?php if (isset($validation)) { ?>
                                <span class="text-danger font-weight-bold"><?php echo $validation->getError('medida'); ?></span>
                            <?php } ?>
                            <label for="medida">Nombre</label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" placeholder="Nombre corto" name="nombre_corto" value="<?= set_value('nombre_corto', $medida['nombre_corto']) ?>">
                            <?php if (isset($validation)) { ?>
                                <span class="text-danger font-weight-bold"><?php echo $validation->getError('nombre_corto'); ?></span>
                            <?php } ?>
                            <label for="medida">Nombre</label>
                        </div>
                    </div>
                </div>
                <div class="card-footer text-end">
                    <button class="btn btn-outline-primary" type="submit"><i class="fas fa-registered"></i> Modificar</button>
                    <a href="<?php echo base_url('/medidas') ?>" class="btn btn-outline-danger"><i class="fas fa-ban"></i> Atras</a>
                </div>
            </div>
        </form>
    </div>
</div>