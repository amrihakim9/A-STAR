<?php

namespace Config;

use CodeIgniter\Validation\CreditCardRules;
use CodeIgniter\Validation\FileRules;
use CodeIgniter\Validation\FormatRules;
use CodeIgniter\Validation\Rules;

class Validation
{
    //--------------------------------------------------------------------
    // Setup
    //--------------------------------------------------------------------

    /**
     * Stores the classes that contain the
     * rules that are available.
     *
     * @var string[]
     */
    public $ruleSets = [
        Rules::class,
        FormatRules::class,
        FileRules::class,
        CreditCardRules::class,
    ];

    /**
     * Specifies the views that are used to display the
     * errors.
     *
     * @var array<string, string>
     */
    public $templates = [
        'list'   => 'CodeIgniter\Validation\Views\list',
        'single' => 'CodeIgniter\Validation\Views\single',
    ];

    //--------------------------------------------------------------------
    // Rules
    //--------------------------------------------------------------------
    // Login validation
    public $login = [
        'username' => [
            'rules' => 'required|min_length[5]',
            'errors' => [
                'required' => 'Username tidak boleh kosong',
                'min_length' => 'Username harus lebih dari atau sama dengan 5 karakter'
            ]
        ],
        'password' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Username tidak boleh kosong'
            ]
        ]
    ];

    public $createUser = [
        'username' => [
            'rules' => 'required|is_unique[user.username]',
            'errors' => [
                'required' => 'Username harus diisi',
                'is_unique' => 'Username sudah ada'
            ]
        ],
        'password' => [
            'rules' => 'required|is_unique[user.username]',
            'errors' => [
                'required' => 'Password harus diisi',
                'is_unique' => 'Pengguna sudah terdaftar'
            ]
        ],
        '_password' => [
            'rules' => 'required|matches[password]',
            'errors' => [
                'required' => 'Password harus diisi',
                'matches' => 'Password tidak cocok'
            ]
        ],
        'role' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Role harus diisi',
            ]
        ],
        'gambar' => [
            'rules' => 'uploaded[gambar]|is_image[gambar]',
            'errors' => [
                'uploaded' => 'Gambar tidak boleh kosong',
                'is_image' => 'File harus berupa gambar',
            ]
        ]
    ];
    public $updateUser = [
        'id' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'User tidak valid',
            ]
        ],
        'username' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Username harus diisi',
            ]
        ],
        'password' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Password harus diisi',
            ]
        ],
        '_password' => [
            'rules' => 'required|matches[password]',
            'errors' => [
                'required' => 'Password harus diisi',
                'matches' => 'Password tidak cocok'
            ]
        ],
        'role' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Role harus diisi',
            ]
        ],

    ];

    public $createNode = [
        'name' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'name tidak boleh kosong'
            ]
        ],
        'coordinate' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Kordiat tidak boleh kosong'
            ]
        ]
    ];

    public $updateNode = [
        'id' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Node tidak valid'
            ]
        ],
        'name' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'name tidak boleh kosong'
            ]
        ],
        'coordinate' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Kordiat tidak boleh kosong'
            ]
        ]
    ];

    public $createGraph = [
        'start' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Lokasi awal tidak boleh kosong'
            ]
        ],
        'end' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Lokasi tujuan tidak boleh kosong'
            ]
        ],
        'distance' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Jarak tidak boleh kosong'
            ]
        ]
    ];

    public $updateGraph = [
        'id' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Data tidak valid'
            ]
        ],
        'start' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Lokasi awal tidak boleh kosong'
            ]
        ],
        'end' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Lokasi tujuan tidak boleh kosong'
            ]
        ],
        'distance' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Jarak tidak boleh kosong'
            ]
        ]
    ];

    public $createJenisUsaha = [
        'nama' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Nama Jenis Usaha tidak boleh kosong'
            ]
        ],
        'color' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Warna Marker tidak boleh kosong'
            ]
        ]
    ];

    public $updateJenisUsaha = [
        'id' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Nama Jenis Usaha tidak boleh kosong'
            ]
        ],
        'nama' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Nama Jenis Usaha tidak boleh kosong'
            ]
        ]
    ];

    public $createAmalUsaha = [
        'jenis_usaha_id' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Jenis usaha tidak boleh kosong'
            ]
        ],
        'nama' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Amal usaha tidak boleh kosong'
            ]
        ],
        'coordinate' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Amal usaha tidak boleh kosong'
            ]
        ],
        'gambar' => [
            'rules' => 'uploaded[gambar]|is_image[gambar]',
            'errors' => [
                'uploaded' => 'Gambar tidak boleh kosong',
                'is_image' => 'Gambar tidak valid'
            ]
        ],
    ];

    public $updateAmalUsaha = [
        'id' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Amal usaha tidak valid'
            ]
        ],
        'jenis_usaha_id' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Jenis usaha tidak boleh kosong'
            ]
        ],
        'nama' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Amal usaha tidak boleh kosong'
            ]
        ],
        'coordinate' => [
            'rules' => 'required',
            'errors' => [
                'required' => 'Amal usaha tidak boleh kosong'
            ]
        ],
        'gambar' => [
            'rules' => 'is_image[gambar]',
            'errors' => [
                'is_image' => 'Gambar tidak valid'
            ]
        ],
    ];
}
