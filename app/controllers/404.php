<?php

class Controller
{
	public function main()
	{
		header("HTTP/1.0 404 Not Found");
		$this->view->data->title = "Error 404";
		$this->view->setLayout('main');
	}
}
