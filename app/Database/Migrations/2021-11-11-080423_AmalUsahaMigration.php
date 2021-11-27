<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AmalUsahaMigration extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id' => [
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => true,
                'auto_increment' => true
            ],
            'node_id' => [
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => true,
            ],
            'jenis_usaha_id' => [
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => true,
            ],
            'nama' => [
                'type' => 'VARCHAR',
                'constraint' => 255
            ],
            'fasilitas' => [
                'type' => 'VARCHAR',
                'constraint' => 255
            ],
            'kegiatan' => [
                'type' => 'VARCHAR',
                'constraint' => 255
            ],
            'jam_operasional' => [
                'type' => 'VARCHAR',
                'constraint' => 255
            ],
            'alamat' => [
                'type' => 'TEXT',
            ],
            'keterangan' => [
                'type' => 'TEXT',
                'constraint' => 255
            ],
            'coordinate' => [
                'type' => 'VARCHAR',
                'constraint' => 255
            ],
            'gambar' => [
                'type' => 'VARCHAR',
                'constraint' => 255
            ],
            'created_at timestamp default current_timestamp',
            'updated_at timestamp on update current_timestamp',
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addForeignKey('jenis_usaha_id', 'jenis_usaha', 'id', 'cascade', 'cascade');
        $this->forge->addForeignKey('node_id', 'node', 'id', 'cascade', 'cascade');
        $this->forge->createTable('amal_usaha');
    }

    public function down()
    {
        $this->forge->dropTable('amal_usaha');
    }
}
