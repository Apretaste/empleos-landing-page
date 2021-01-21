<?php

use Framework\Database;

class Controller
{
	public function main()
	{
		// get anuncios
		$kind = empty($_SESSION['type']) ? '' : "AND kind = '{$_SESSION['type']}'";
		$category = empty($_SESSION['category']) ? '' : "AND category = '{$_SESSION['category']}'";
		$posts = Database::query("
			SELECT id, title, category, kind, inserted 
			FROM _empleos_offers
			WHERE inserted BETWEEN '{$_SESSION['date_from']} 00:00:00' AND '{$_SESSION['date_to']} 23:59:59'
			$category $kind
			ORDER BY inserted DESC
			LIMIT 100");

		// calculate offers and requests
		$offers = $requests = 0;
		foreach ($posts as $item) {
			if($item->kind == 'OFERTA') {
				$item->borderColor = 'border-left-primary';
				$offers++;
			}

			if($item->kind == 'SOLICITUD') {
				$item->borderColor = 'border-left-success';
				$requests++;
			}
		}

		// display error if there is no data
		if(count($posts) <= 0 ) {
			$this->view->error = "no_data_found";
		}

		// send data to the view
		$this->view->data->title = "Anuncios";
		$this->view->data->filters = ['date'=>true, 'category'=>true, 'type'=>true];
		$this->view->data->offers = $offers;
		$this->view->data->requests = $requests;
		$this->view->data->posts = $posts;
		$this->view->setLayout('main');
	}

	public function open()
	{
		// get data from the view
		$id = $this->request->get('id');

		// open the post
		$post = Database::queryFirst("
			SELECT id, title, description, category, kind, email, inserted 
			FROM _empleos_offers
			WHERE id = '$id'");

		// send data to the view
		$this->view->data->title = "Anuncio";
		$this->view->data->post = $post;
		$this->view->setLayout('main');
	}
}
