<?php

use Framework\Database;

class Controller
{
	public function main()
	{
		// send data to the view
		$this->view->data->title = "Publicar";
		$this->view->setLayout('main');
	}

	public function submit()
	{
		// get data from the view
		$title = Database::escape($this->request->get('title'));
		$description = Database::escape($this->request->get('description'));
		$email = Database::escape($this->request->get('email'));
		$category = Database::escape($this->request->get('category'));
		$type = Database::escape($this->request->get('type'));

		// insert into the database
		Database::query("
			INSERT INTO _empleos_offers (id, title, description, email, category, kind) 
			VALUES (uuid(), '$title', '$description', '$email', '$category', '$type')");

		// redirect to the posts
		header("Location: /posts?error=post_published");
	}
}
