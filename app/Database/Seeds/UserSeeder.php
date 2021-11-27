<?php

namespace App\Database\Seeds;

use App\Models\UserModel;
use CodeIgniter\Database\Seeder;

class UserSeeder extends Seeder
{
    public function run()
    {
        $userModel = new UserModel();
        $userModel->save([
            'username' => 'admin',
            'password' => password_hash('admin', PASSWORD_BCRYPT),
            'role' => 'ADMIN',
            'gambar' => 'default.png',
        ]);
        $userModel->save([
            'username' => 'adminpcm',
            'password' => password_hash('adminpcm', PASSWORD_BCRYPT),
            'role' => 'PCM',
            'gambar' => 'default.png',
        ]);
        $userModel->save([
            'username' => 'adminpdm',
            'password' => password_hash('adminpdm', PASSWORD_BCRYPT),
            'role' => 'PDM',
            'gambar' => 'default.png',
        ]);
    }
}
