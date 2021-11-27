<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class JenisUsahaSeeder extends Seeder
{
    public function run()
    {
        $model = new \App\Models\JenisUsahaModel();
        $model->save(['nama' => 'Klinik', 'keterangan' => 'Jenis usaha klinik.']);
        $model->save(['nama' => 'Panti Asuhan', 'keterangan' => 'Jenis usaha panti asuhan.']);
        $model->save(['nama' => 'Mesjid', 'keterangan' => 'Jenis usaha mesjid.']);
        $model->save(['nama' => 'Klinik', 'keterangan' => 'Jenis usaha klinik.']);
    }
}
