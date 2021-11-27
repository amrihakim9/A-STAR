<?php

namespace App\Database\Seeds;

use App\Models\AmalUsahaModel;
use CodeIgniter\Database\Seeder;

class AmalUsahaSeeder extends Seeder
{
    public function run()
    {
        $model = new AmalUsahaModel();
        $model->save([
            'nama' => 'SD Muhamadiyah',
            'jenis_usaha_id' => '1',
            'keterangan' => 'Quo sunt rem deleniti aperiam odit vel.'
        ]);
        $model->save([
            'nama' => 'Klinik Sehat',
            'jenis_usaha_id' => '1',
            'keterangan' => 'In porro labore facilis est harum quis quia. Esse corporis doloremque vel numquam. Eos excepturi tempore. Eum quos et sed sunt ratione..'
        ]);
        $model->save([
            'nama' => 'Panti Muhamadiyah',
            'jenis_usaha_id' => '1',
            'keterangan' => 'Dolor ratione neque itaque cumque et aspernatur. Eaque voluptatem eum consectetur tempore quibusdam. Amet esse rerum enim quia dolor quia alias blanditiis et. Repudiandae omnis facilis.'
        ]);
    }
}
