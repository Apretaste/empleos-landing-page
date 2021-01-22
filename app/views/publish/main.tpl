<div class="row">
	<div class="col-12">
		<form action="/publish/submit" method="post">
			<!-- title -->
			<div class="form-group">
				<label>Título</label>
				<input class="form-control" type="text" name="title" required>
			</div>

			<!-- description -->
			<div class="form-group">
				<label>Descripción</label>
				<textarea class="form-control" rows="8" name="description" required></textarea>
			</div>

			<!-- email -->
			<div class="form-group">
				<label>Correo electrónico</label>
				<input class="form-control" type="email" name="email" required>
			</div>

			<!-- category -->
			<div class="form-group">
				<label>Categoría</label>
				<select class="custom-select" name="category" required>
					<option value=""></option>
					<?php foreach ($this->categories as $key=>$value) { ?>
						<option value="<?= $key ?>"><?= $value ?></option>
					<?php } ?>
				</select>
			</div>

			<!-- type -->
			<div class="form-group">
				<label>Tipo de anuncio</label>
				<select class="custom-select" name="type" required>
					<option value=""></option>
					<option value="OFERTA">Oferta</option>
					<option value="SOLICITUD">Solicitud</option>
				</select>
			</div>

			<!-- recaptcha -->
			<div class="form-group">
				<div class="g-recaptcha" data-sitekey="<?= $captchaKey ?>"></div>
			</div>

			<!-- BUTTONS -->
			<a href="/posts" class="btn btn-light">← Atrás</a>
			<button class="btn btn-dark btn-loading" type="submit">Publicar</button>
		</form>
	</div>
</div>

<script src="https://www.google.com/recaptcha/api.js?hl=es" async defer></script>
