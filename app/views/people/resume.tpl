<div class="row">
	<!-- CARD -->
	<div class="col-12">
		<ul class="list-group mb-4">
			<!-- name -->
			<?php if($person->name) { ?>
				<li class="list-group-item">
					<span class="fa-stack fa-1x mr-2 float-left">
						<i class="fas fa-circle fa-stack-2x"></i>
						<i class="fas fa-male fa-stack-1x fa-inverse"></i>
					</span>
					<p class="my-0 pl-5"><?= $person->name ?></p>
					<p class="font-weight-lighter text-black-50 my-0 pl-5">Nombre</p>
				</li>
			<?php } ?>

			<!-- email -->
			<?php if($person->email) { ?>
				<li class="list-group-item">
					<span class="fa-stack fa-1x mr-2 float-left">
						<i class="fas fa-circle fa-stack-2x"></i>
						<i class="fas fa-envelope-open-text fa-stack-1x fa-inverse"></i>
					</span>
					<p class="my-0 pl-5"><?= $person->email ?></p>
					<p class="font-weight-lighter text-black-50 my-0 pl-5">Correo electrónico</p>
				</li>
			<?php } ?>

			<!-- phone -->
			<?php if($person->phone) { ?>
				<li class="list-group-item">
					<span class="fa-stack fa-1x mr-2 float-left">
						<i class="fas fa-circle fa-stack-2x"></i>
						<i class="fas fa-phone fa-stack-1x fa-inverse"></i>
					</span>
					<p class="my-0 pl-5"><?= $person->phone ?></p>
					<p class="font-weight-lighter text-black-50 my-0 pl-5">Teléfono</p>
				</li>
			<?php } ?>

			<!-- profession -->
			<?php if($person->profession) { ?>
				<li class="list-group-item">
					<span class="fa-stack fa-1x mr-2 float-left">
						<i class="fas fa-circle fa-stack-2x"></i>
						<i class="fas fa-tags fa-stack-1x fa-inverse"></i>
					</span>
					<p class="my-0 pl-5"><?= implode(', ', $person->profession) ?></p>
					<p class="font-weight-lighter text-black-50 my-0 pl-5">Profesión</p>
				</li>
			<?php } ?>

			<!-- bio -->
			<?php if($person->bio) { ?>
				<li class="list-group-item">
					<span class="fa-stack fa-1x mr-2 float-left">
						<i class="fas fa-circle fa-stack-2x"></i>
						<i class="fas fa-address-card fa-stack-1x fa-inverse"></i>
					</span>
					<p class="my-0 pl-5"><?= $person->bio ?></p>
					<p class="font-weight-lighter text-black-50 my-0 pl-5">Biografía</p>
				</li>
			<?php } ?>

			<!-- education -->
			<?php foreach ($person->education as $item) { ?>
				<li class="list-group-item">
					<span class="fa-stack fa-1x mr-2 float-left">
						<i class="fas fa-circle fa-stack-2x"></i>
						<i class="fas fa-graduation-cap fa-stack-1x fa-inverse"></i>
					</span>
					<p class="my-0 pl-5"><?= $item->grad_year ?>: <?= $item->school ?></p>
					<p class="font-weight-lighter text-black-50 my-0 pl-5"><?= $item->degree ?></p>
				</li>
			<?php } ?>

			<!-- experience -->
			<?php foreach ($person->experience as $item) { ?>
				<li class="list-group-item">
					<span class="fa-stack fa-1x mr-2 float-left">
						<i class="fas fa-circle fa-stack-2x"></i>
						<i class="fas fa-briefcase fa-stack-1x fa-inverse"></i>
					</span>
					<p class="my-0 pl-5"><?= $item->workplace ?></p>
					<p class="font-weight-lighter text-black-50 my-0 pl-5"><?= $item->position ?></p>
				</li>
			<?php } ?>

			<!-- skills -->
			<?php if($person->skills) { ?>
				<li class="list-group-item">
					<span class="fa-stack fa-1x mr-2 float-left">
						<i class="fas fa-circle fa-stack-2x"></i>
						<i class="fas fa-brain fa-stack-1x fa-inverse"></i>
					</span>
					<p class="my-0 pl-5"><?= implode(', ', $person->skills) ?></p>
					<p class="font-weight-lighter text-black-50 my-0 pl-5">Habilidades</p>
				</li>
			<?php } ?>
		</ul>

		<a href="/people" class="btn btn-light">← Atrás</a>
	</div>
</div>
