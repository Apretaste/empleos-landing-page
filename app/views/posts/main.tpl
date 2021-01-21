<div class="row">
	<!-- OFFERS -->
	<div class="col-6 col-md-6 col-lg-4 mb-4">
		<div class="card border-left-primary shadow h-100 py-2">
			<div class="card-body">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Ofertas</div>
						<div class="h5 mb-0 font-weight-bold text-gray-800"><?= number_format($offers) ?></div>
					</div>
					<div class="col-auto d-none d-sm-block">
						<i class="fas fa-sign-out-alt fa-2x text-gray-300"></i>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- REQUESTS -->
	<div class="col-6 col-md-6 col-lg-4 mb-4">
		<div class="card border-left-success shadow h-100 py-2">
			<div class="card-body">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div class="text-xs font-weight-bold text-success text-uppercase mb-1">Solicitudes</div>
						<div class="h5 mb-0 font-weight-bold text-gray-800"><?= number_format($requests) ?></div>
					</div>
					<div class="col-auto d-none d-sm-block">
						<i class="fas fa-sign-in-alt fa-2x text-gray-300"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- POSTS -->
<?php if($posts) { ?>
	<div class="card-columns">
		<?php foreach ($posts as $item) { ?>
			<div class="card <?= $item->borderColor ?>">
				<div class="card-body">
					<div class="mb-3">
						<span class="badge badge-light"><i class="fas fa-calendar"></i> <?= date('M d, Y', strtotime($item->inserted)) ?></span>
						<span class="badge badge-light"><i class="fas fa-tag"></i> <?= $this->categories[$item->category] ?></span>
					</div>
					<p class="card-text"><?= $item->title ?></p>
					<a href="/posts/open?id=<?= $item->id ?>" class="card-link">Revisar</a>
				</div>
			</div>
		<?php } ?>
	</div>
<?php } ?>
