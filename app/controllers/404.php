<?php

class Controller
{
	public $requires_login = false;

	public function main()
	{
		header("HTTP/1.0 404 Not Found");
		$this->view->data->title = "Página no encontrada";
		$this->view->setLayout('main');
	}
}
