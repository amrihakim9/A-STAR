<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class NodeSeeder extends Seeder
{
    public function run()
    {
        $faker = \Faker\Factory::create('id_ID');

        $user = model('NodeModel');

        for ($i = 1; $i <= 50; $i++) :
            $data = [
                'name' => $faker->address,
                'coordinate' => '-33.8688,151.2195',
            ];

            $user->insert($data);
        endfor;
    }
}
