<?php

class Controller
{
	public function main()
	{
		// clear the data 
		unset($_SESSION['date_from']);
		unset($_SESSION['date_to']);
		unset($_SESSION['category']);
		unset($_SESSION['type']);
		unset($_SESSION['flags']);

		// redirect home
		header("Location: /");
	}
}
