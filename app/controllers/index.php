<?php

use Framework\Database;

class Controller
{
	public function main()
	{
		header('Location: /posts');
		exit;
	}

	public function filter()
	{
		// get params from the URL
		$controller = $this->request->get('controller');
		$action = $this->request->get('action');
		$date_from = $this->request->get('date_from');
		$date_to = $this->request->get('date_to');
		$category = $this->request->get('category');
		$type = $this->request->get('type');

		// validate dates
		$date_from_time = strtotime($date_from);
		$date_to_time = strtotime($date_to);
		if($date_from_time > $date_to_time) {
			header("Location: /$controller/$action?error=wrong_date_filter");
			exit;
		}

		// alter the dates
		if(!empty($date_from) && !empty($date_to)) {
			$_SESSION['date_from'] = $date_from;
			$_SESSION['date_to'] = $date_to;
		}

		// alter the category
		if(!empty($category)) {
			if($category == "ALL") $category = "";
			$_SESSION['category'] = $category;
		}

		// alter the type
		if(!empty($type)) {
			if($type == "ALL") $type = "";
			$_SESSION['type'] = $type;
		}

		// redirect to action
		header("Location: /$controller/$action");
		exit;
	}
}
