<?php

namespace App\Controllers\Front;

use App\Controllers\BaseController;
use App\Models\AmalUsahaModel;
use App\Models\GraphModel;
use App\Models\NodeModel;

class AmalUsahaController extends BaseController
{
    public function __construct()
    {
        $this->amalUsahaModel = new AmalUsahaModel();
        $this->nodeModel = new NodeModel();
        $this->graphModel = new GraphModel();
    }
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        return view('front/amal-usaha/index', [
            'title' => 'Amal Usaha',
            'amalUsahas' => $this->amalUsahaModel->get($this->request->getGet('search'))->paginate(10),
            'pager' => $this->amalUsahaModel->pager
        ]);
    }

    public function indexByJenisUsaha($jenisUsaha)
    {
        return view('front/amal-usaha/index', [
            'title' => 'Amal Usaha',
            'slug' => ucwords(str_replace('-', ' ', $jenisUsaha)),
            'amalUsahas' => $this->amalUsahaModel->getByJenisUsaha($jenisUsaha)->paginate(10),
            'pager' => $this->amalUsahaModel->pager
        ]);
    }
    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($id = null)
    {
        $graphs = $this->graphModel->get($this->request->getGet('search'));
        $nodes = $this->nodeModel->get($this->request->getGet('search'));
        if (!$this->request->isAJAX()) {
            return view('front/amal-usaha/show', [
                'title' => 'Amal Usaha',
                'amalUsaha' => $this->amalUsahaModel->getByID($id)->first()
            ]);
        } else {
            echo json_encode(array('nodes' => $nodes->findAll(), 'graphs' => $graphs->findAll()));
        }
    }

    /**
     * Return a new resource object, with default properties
     *
     * @return mixed
     */
    public function new()
    {
        //
    }

    /**
     * Create a new resource object, from "posted" parameters
     *
     * @return mixed
     */
    public function create()
    {
        //
    }

    /**
     * Return the editable properties of a resource object
     *
     * @return mixed
     */
    public function edit($id = null)
    {
        //
    }

    /**
     * Add or update a model resource, from "posted" properties
     *
     * @return mixed
     */
    public function update($id = null)
    {
        //
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        //
    }
}
