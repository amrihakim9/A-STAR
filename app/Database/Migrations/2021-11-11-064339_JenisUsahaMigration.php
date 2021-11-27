<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class JenisUsahaMigration extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id' => [
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => true,
                'auto_increment' => true,
            ],
            'nama' => [
                'type' => 'VARCHAR',
                'constraint' => '255',
            ],
            'slug' => [
                'type' => 'VARCHAR',
                'constraint' => '255',
            ],
            'color' => [
                'type' => 'VARCHAR',
                'constraint' => '255',
            ],
            'keterangan' => [
                'type' => 'VARCHAR',
                'constraint' => '255',
            ],
            'created_at timestamp default current_timestamp',
            'updated_at timestamp on update current_timestamp'
        ]);
        $this->forge->addPrimaryKey('id');
        $this->forge->addKey('slug');
        $this->forge->createTable('jenis_usaha');
    }

    public function down()
    {
        $this->forge->dropTable('jenis_usaha');
    }
}
