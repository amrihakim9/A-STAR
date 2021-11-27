<?php

namespace App\Database\Seeds;

use App\Models\GraphModel;
use CodeIgniter\Database\Seeder;

class GraphSeeder extends Seeder
{
    public function run()
    {
        $faker = \Faker\Factory::create('id_ID');
        $graphModel = new GraphModel();
        for ($i = 0; $i <= 50; $i++) {
            $graphModel->save([
                'start' => $faker->randomNumber(1),
                'end' => $faker->randomNumber(1),
                'distance' => $faker->randomNumber(3),
            ]);
        }
    }
}
