<!DOCTYPE html>
<html lang="en">
<head>
	<!-- google analytics -->
	<?php include BASE_PATH . 'configs/analytics.php'; ?>

	<!-- meta -->
	<title>Empleos | <?= $title ?></title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- favicon -->
	<link rel="icon" type="image/x-icon" href="/favicon.ico">
	<link rel="icon" type="image/png" sizes="16x16" href="/branding/apretaste_icon_16x16.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/branding/apretaste_icon_32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/branding/apretaste_icon_64x64.png">

	<!-- fonts -->
	<link href="/assets/libs/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

	<!-- styles-->
	<link href="/assets/css/sb-admin-2.min.css" rel="stylesheet">

	<!-- scripts-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/sb-admin-2.min.js"></script>
</head>
<body>
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<ul id="navbar" class="navbar-nav bg-gray-800 sidebar sidebar-dark d-none d-sm-block">
			<!-- User -->
			<li class="nav-item mt-3 mb-1">
				<a class="nav-link" href="/posts">
					<img src="/branding/apretaste_icon_64x64.png" class="w-100 d-sm-none" alt="Apretaste Empleos">
					<img src="/branding/apretaste_logo_250x90.png" class="w-75 d-none d-sm-block" alt="Apretaste Empleos">
				</a>
			</li>

			<!-- posts -->
			<li class="nav-item <?php if($this->router->controller == 'posts') echo 'active'; ?>">
				<a class="nav-link" href="/posts">
					<i class="fas fa-fw fa-address-card"></i>
					<span>Anuncios</span>
				</a>
			</li>

			<!-- publish -->
			<li class="nav-item <?php if($this->router->controller == 'publish') echo 'active'; ?>">
				<a class="nav-link" href="/publish">
					<i class="fas fa-fw fa-plus-circle"></i>
					<span>Publicar</span>
				</a>
			</li>

			<!-- people -->
			<li class="nav-item <?php if($this->router->controller == 'people') echo 'active'; ?>">
				<a class="nav-link" href="/people">
					<i class="fas fa-fw fa-users"></i>
					<span>Personal</span>
				</a>
			</li>
		</ul>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Page Content -->
				<div class="container-fluid">
					<div class="row mt-4">
						<div class="d-12 col-12 text-center text-md-left mb-4">
							<h1 class="h3 mb-0 text-gray-800">
								<!-- Menu Button -->
								<button type="button" class="btn btn-dark d-sm-none btn-sm float-left" onclick="$('#navbar, #filters').toggleClass('d-none')">
									<i class="fas fa-bars"></i>
								</button>

								<!-- Title -->
								<?= $title ?>
							</h1>
						</div>
					</div>

					<!-- Filters -->
					<?php if(!empty($filters)) { ?>
						<form id="filters" action="/index/filter" method="post" class="row d-none d-sm-flex mb-4">
							<!-- origin -->
							<input type="hidden" name="controller" value="<?= $this->router->controller ?>">
							<input type="hidden" name="action" value="<?= $this->router->action ?>">

							<!-- date -->
							<?php if(!empty($filters['date'])) { ?>
								<div class="col-12 col-sm-auto mb-2">
									<input type="date" id="date_from" class="form-control" name="date_from" value="<?= date('Y-m-d', strtotime($_SESSION['date_from'])) ?>" required>
								</div>
								<div class="col-12 col-sm-auto mb-2">
									<input type="date" id="date_to" class="form-control" name="date_to" value="<?= date('Y-m-d', strtotime($_SESSION['date_to'])) ?>" required>
								</div>
							<?php } ?>

							<!-- category -->
							<?php if(!empty($filters['category'])) { ?>
								<div class="col-12 col-sm-auto mb-2">
									<select class="custom-select" name="category">
										<option value="ALL">Todos</option>
										<?php foreach ($this->categories as $key=>$value) { ?>
											<?php $selected = $_SESSION['category'] == $key ? 'selected' : ''; ?>
											<option <?= $selected ?> value="<?= $key ?>"><?= $value ?></option>
										<?php } ?>
									</select>
								</div>
							<?php } ?>

							<!-- type -->
							<?php if(!empty($filters['type'])) { ?>
								<div class="col-12 col-sm-auto mb-2">
									<select class="custom-select" name="type">
										<option value="ALL">Todos</option>
										<option <?php if($_SESSION['type'] == 'OFERTA') echo 'selected'; ?> value="OFERTA">Ofertas</option>
										<option <?php if($_SESSION['type'] == 'SOLICITUD') echo 'selected'; ?> value="SOLICITUD">Solicitudes</option>
									</select>
								</div>
							<?php } ?>

							<!-- submit -->
							<div class="col-12 col-sm-auto">
								<button type="submit" class="btn btn-dark btn-block">Filtrar</button>
							</div>
						</form>
					<?php } ?>

					<!-- display errors, if any -->
					<?php if($this->error) include APP_PATH . 'layouts/error.tpl'; ?>

					<!-- Template content -->
					{TEMPLATE}
				</div>
			</div>

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<div class="mb-2">Copyright &copy; Apretaste <?= date('Y') ?></div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<!-- zendesk widget -->
	<?php if(IS_PRODUCTION) { ?>
		<script id="ze-snippet" src="https://static.zdassets.com/ekr/snippet.js?key=e21187ac-4d56-4c8a-85f3-89d824515b57"></script>
	<?php } ?>
</body>
</html>
