<?php

use Framework\Database;

class Controller
{
	public function main()
	{
		// get people
		$category = empty($_SESSION['category']) ? '' : "WHERE cat1 = '{$_SESSION['category']}' OR cat2 = '{$_SESSION['category']}'";
		$people = Database::query("
			SELECT id, name, cat1, IF(cat1 = cat2, NULL, cat2) AS cat2
			FROM (
				SELECT A.person_id as id, A.name,
					(SELECT profession FROM _empleos_profile_professions B WHERE B.person_id = A.person_id ORDER BY profession LIMIT 0,1) as cat1,
					(SELECT profession FROM _empleos_profile_professions B WHERE B.person_id = A.person_id ORDER BY profession LIMIT 1,1) as cat2
				FROM _empleos_profile A
			) subq $category");

		// display error if there is no data
		if(count($people) <= 0 ) {
			$this->view->error = "no_data_found";
		}

		// send data to the view
		$this->view->data->title = "Personal";
		$this->view->data->filters = ['category'=>true];
		$this->view->data->people = $people;
		$this->view->setLayout('main');
	}

	public function resume()
	{
		// get data from the view
		$id = $this->request->get('id');

		// get the person data
		$person = Database::queryFirst("SELECT name, bio, email, phone FROM _empleos_profile WHERE person_id = $id");
		$profession = Database::query("SELECT profession FROM _empleos_profile_professions WHERE person_id = $id");
		$education = Database::query("SELECT grad_year, school, degree FROM _empleos_profile_education WHERE person_id = $id ORDER BY grad_year DESC");
		$experience = Database::query("SELECT workplace, position FROM _empleos_profile_experience WHERE person_id = $id");
		$skills = Database::query("SELECT skill FROM _empleos_profile_skills WHERE person_id = $id");

		// add the profession
		$person->profession = [];
		foreach ($profession as $item) {
			$person->profession[] = $this->view->categories[$item->profession];
		}

		// add the education
		$person->education = [];
		foreach ($education as $item) {
			$person->education[] = $item;
		}

		// add the experience
		$person->experience = [];
		foreach ($experience as $item) {
			$person->experience[] = $item;
		}

		// add the skills
		$person->skills = [];
		foreach ($skills as $item) {
			$person->skills[] = $item->skill;
		}

		// send data to the view
		$this->view->data->title = "Resumé";
		$this->view->data->person = $person;
		$this->view->setLayout('main');
	}
}
