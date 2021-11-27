<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class NodeMigration extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id' => [
                'type' => 'INT',
                'constraint' => 5,
                'unsigned' => true,
                'auto_increment' => true
            ],
            'name' => [
                'type' => 'TEXT',
            ],
            'coordinate' => [
                'type' => 'VARCHAR',
                'constraint' => 50,
            ],
            'created_at timestamp default current_timestamp',
            'updated_at timestamp on update current_timestamp',

        ]);
        $this->forge->addKey('id');
        $this->forge->createTable('node');
    }

    public function down()
    {
        $this->forge->dropTable('node');
    }
}
