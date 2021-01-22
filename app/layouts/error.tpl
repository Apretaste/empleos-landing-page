<?php

// select the right error message
switch ($this->error)
{
	case 'post_published': 
		$message = 'Su anuncio ha sido publicado correctamente.';
		break;
	case 'post_flagged': 
		$message = 'El anuncio ha sido reportado. Gracias por ayudarnos a moderar.';
		break;
	case 'wrong_date_filter': 
		$message = 'El rango de fechas que escogió es incorrecto.';
		break;
	case 'no_data_found': 
		$message = 'No hay información que mostrar para sus parámetros de búsqueda.';
		break;
	case 'invalid_captcha': 
		$message = 'El captcha es inválido o ha expirado. Por favor intente nuevamente.';
		break;
	default:
		$message = 'Hubo un error inesperado. Estamos revisando que pasó.';
		break;
}

?>

<!-- display the error message -->
<div class="row">
	<div class="col-12">
		<div class="alert alert-danger py-1 px-3" role="alert">
			<i class="fa fa-exclamation-triangle mt-1 float-left" aria-hidden="true"></i>
			<span class="pl-3 d-flex"><?= $message ?></span>
		</div>
	</div>
</div>
