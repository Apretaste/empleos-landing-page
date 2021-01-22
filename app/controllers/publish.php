<?php

use Apretaste\Utils;
use Framework\Config;
use Framework\Database;

class Controller
{
	public function main()
	{
		// get the captcha public key
		$captchaKey = Config::pick('recaptcha')['public'];

		// send data to the view
		$this->view->data->title = "Publicar";
		$this->view->data->captchaKey = $captchaKey;
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
		$recaptcha = $this->request->get('g-recaptcha-response');

		// ensure captcha was submitted
		if(empty($recaptcha)){
			header("Location: /publish?error=invalid_captcha");
			exit;
		}

		// post request to server and get response
		$ip = Utils::getUserIp();
		$secretKey = Config::pick('recaptcha')['secret'];
		$url = 'https://www.google.com/recaptcha/api/siteverify?secret=' . urlencode($secretKey) .  '&response=' . urlencode($recaptcha);
		$responseJSON = file_get_contents($url);
		$response = json_decode($responseJSON, true);

		// should return JSON with success as true
		if( ! $response["success"]) {
			header("Location: /publish?error=invalid_captcha");
			exit;
		}

		// insert into the database
		Database::query("
			INSERT INTO _empleos_offers (id, title, description, email, category, kind) 
			VALUES (uuid(), '$title', '$description', '$email', '$category', '$type')");

		// redirect to the posts
		header("Location: /posts?error=post_published");
	}
}
