<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\GraphModel;
use App\Models\NodeModel;
use App\Models\UserModel;

class DashboardController extends BaseController
{
    public function __construct()
    {
        $this->graphModel = new GraphModel();
        $this->nodeModel  = new NodeModel();
        $this->userModel = new UserModel();
    }
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        return view('admin/dashboard/index', [
            'title' => 'Dashboard',
            'count_graph' => $this->graphModel->find(),
            'count_node' => $this->nodeModel->find(),
            'count_user' => $this->userModel->find(),
        ]);
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($id = null)
    {
        //
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
