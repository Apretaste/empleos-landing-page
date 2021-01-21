<!-- PEOPLE -->
<div class="card-columns">
	<?php foreach ($people as $item) { ?>
		<div class="card">
			<div class="card-body">
				<h5 class="card-title"><?= $item->name ?></h5>
				<div class="mb-3">
					<?php if (!empty($item->cat1)) { ?>
						<span class="badge badge-light"><i class="fas fa-tag"></i> <?= $this->categories[$item->cat1] ?></span>
					<?php } ?>

					<?php if (!empty($item->cat2)) { ?>
						<span class="badge badge-light"><i class="fas fa-tag"></i> <?= $this->categories[$item->cat2] ?></span>
					<?php } ?>
				</div>
				<a href="/people/resume?id=<?= $item->id ?>" class="card-link">Resumé</a>
			</div>
		</div>
	<?php } ?>
</div>
