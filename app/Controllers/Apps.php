<?php 
namespace App\Controllers;

use App\Models\DetallePermisosModel;
use App\Models\AppsModel;
class Apps extends BaseController{
    protected $reglas, $apps, $session, $detalle_permisos;
    public function __construct()
    {
        helper(['form']);
        $this->apps = new AppsModel();
        $this->detalle_permisos = new DetallePermisosModel();
        $this->session = session();
        $perm = $this->detalle_permisos->verificarPermisos($this->session->id_usuario, "apps");
        if (!$perm && $this->session->id_usuario != 1) {
            echo view('permisos');
            exit;
        }
        $this->reglas = [
            'nombre' => [
                'rules' => 'required|is_unique[apps.nombre,{id}]',
                'errors' => [
                    'required' => 'El campo {field} es requerido',
                    'is_unique' => 'El {field} debe ser único'

                ]
            ]
        ];
    }
    public function index()
    {
        echo view("templates/header");
        echo view("apps/index");
        echo view("templates/footer");
    }
    public function listar()
    {
        $data = $this->apps->where('estado', 1)->findAll();
        for ($i = 0; $i < count($data); $i++) {
            if ($data[$i]['estado'] == 1) {
                $data[$i]['estado'] = '<span class="badge bg-success">Activo</span>';
                $data[$i]['acciones'] = '<div class"text-center">
                <a href="' . base_url("apps/editar/" . $data[$i]['idmarca']) . '" class="btn btn-dark"><i class="fas fa-edit"></i></a>
                <button class="btn btn-danger" onclick="btnEliminarApp(' . $data[$i]['idmarca'] . ')"><i class="fas fa-trash-alt"></i></button>
                </div>';
            }
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function registrar()
    {
        if ($this->request->getMethod() == 'post' && $this->validate($this->reglas)) {
            $nombre = $this->request->getPost('nombre');
            $data = $this->apps->save([
                'marca' => $marca
            ]);
            return redirect()->to(base_url() . '/apps')->with('message', 'App registrada con exíto.');
        } else {
            $data['validation'] = $this->validator;
            echo view("templates/header");
            echo view("apps/nuevo", $data);
            echo view("templates/footer");
        }
    }
    public function nuevo()
    {
        echo view("templates/header");
        echo view("apps/nuevo");
        echo view("templates/footer");
    }
    public function editar($id)
    {
        $data['app'] = $this->apps->where('idapp', $id)->first();
        echo view("templates/header");
        echo view("apps/editar", $data);
        echo view("templates/footer");
    }
    public function actualizar()
    {
        if ($this->request->getMethod() == 'post' && $this->validate($this->reglas)) {
            $data = $this->apps->update(
                $this->request->getPost('id'),
                [
                    'nombre' => $this->request->getPost('nombre')
                ]
            );
            return redirect()->to(base_url() . '/apps')->with('message', 'App modificado con exíto.');
        } else {
            $data['app'] = $this->apps->where('idapp', $this->request->getPost('id'))->first();
            $data['validation'] = $this->validator;
            echo view("templates/header");
            echo view("apps/editar", $data);
            echo view("templates/footer");
        }
    }
    public function eliminar($id)
    {
        $data = $this->apps->update($id, ['estado' => 0]);
        if ($data) {
            $mensaje = array('icono' => 'success', "mensaje" => 'App eliminada con éxito');
        } else {
            $mensaje = array('icono' => 'error', "mensaje" => 'Error al eliminar la App');
        }
        echo json_encode($mensaje, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function reciclaje()
    {
        echo view("templates/header");
        echo view("apps/reciclaje");
        echo view("templates/footer");
    }
    public function vaciar()
    {
        $data = $this->apps->where('estado', 0)->findAll();
        for ($i = 0; $i < count($data); $i++) {
            if ($data[$i]['estado'] == 0) {
                $data[$i]['estado'] = '<span class="badge bg-danger">Inactivo</span>';
                $data[$i]['acciones'] = '<div class"text-center">
                    <button class="btn btn-success" onclick="btnreingresar_marca(' . $data[$i]['idapp'] . ')"><i class="fas fa-reply"></i></button>
                    </div>';
            }
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function restaurar($id)
    {
        $data = $this->apps->update($id, ['estado' => 1]);
        if ($data) {
            $mensaje = array('icono' => 'success', "mensaje" => 'App reingresado con éxito');
        } else {
            $mensaje = array('icono' => 'error', "mensaje" => 'Error al reingresar la App');
        }
        echo json_encode($mensaje, JSON_UNESCAPED_UNICODE);
        die();
    }
}