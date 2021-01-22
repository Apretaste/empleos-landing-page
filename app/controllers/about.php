<?php

class Controller
{
	public function main()
	{
		// send data to the view
		$this->view->data->title = "Acerca de";
		$this->view->setLayout('main');
	}
}
