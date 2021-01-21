<div class="row">
	<div class="col-12">
		<h1 class="h3 mb-3"><?= $post->title ?></h1>

		<div class="mb-3">
			<span class="badge badge-light"><i class="fas fa-calendar"></i> <?= date('M d, Y', strtotime($post->inserted)) ?></span>
			<span class="badge badge-light"><i class="fas fa-tag"></i> <?= $this->categories[$post->category] ?></span>
			<span class="badge badge-light"><i class="fas fa-tag"></i> <?= ucfirst(strtolower($post->kind)) ?></span>
		</div>

		<p><?= $post->description ?></p>

		<div class="input-group mb-4">
			<input id="contact" type="text" class="form-control" value="<?= $post->email ?>" readonly>
			<div class="input-group-append" id="button-addon">
				<button class="btn btn-outline-secondary" type="button" onclick="copyToClipboard()">
					<i class="fas fa-copy"></i>
				</button>
			</div>
		</div>

		<a href="/posts" class="btn btn-light">← Atrás</a>
	</div>
</div>

<script type="text/javascript">
	function copyToClipboard() {
		var copyText = document.getElementById("contact");
		copyText.select();
		copyText.setSelectionRange(0, 99999);
		document.execCommand("copy");
		alert("Se ha copiado el texto: " + copyText.value);
	}
</script>
