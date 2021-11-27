<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class GraphMigration extends Migration
{
    public function up()
    {
        $forge = $this->forge;
        $forge->addField([
            'id' => [
                'type' => 'INT',
                'constraint' => 5,
                'unsigned' => true,
                'auto_increment' => true
            ],
            'start' => [
                'type' => 'INT',
                'unsigned' => true
            ],
            'end' => [
                'type' => 'INT',
                'unsigned' => true
            ],
            'distance' => [
                'type' => 'DECIMAL(10,2)',
            ],
            'created_at timestamp default current_timestamp',
            'updated_at timestamp on update current_timestamp',
        ]);
        $forge->addForeignKey('start', 'node', 'id', 'CASCADE', 'CASCADE');
        $forge->addForeignKey('end', 'node', 'id', 'CASCADE', 'CASCADE');
        $forge->addKey('id');
        $forge->createTable('graph');
    }

    public function down()
    {
        $this->forge->dropTable('graph');
    }
}
