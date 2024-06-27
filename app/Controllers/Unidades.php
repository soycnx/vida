<?php 
namespace App\Controllers;

use App\Models\DetallePermisosModel;
use App\Models\UnidadesModel;
class Unidades extends BaseController{
    protected $reglas, $unidades, $session, $detalle_permisos;
    public function __construct()
    {
        helper(['form']);
        $this->unidades = new UnidadesModel();


        $this->detalle_permisos = new DetallePermisosModel();
        $this->session = session();
        $perm = $this->detalle_permisos->verificarPermisos($this->session->id_usuario, "unidades");
        if (!$perm && $this->session->id_usuario != 1) {
            echo view('permisos');
            exit;
        }
        $this->reglas = [
            'desc_corta' => [
                'rules' => 'required|is_unique[unidades.desc_corta,unidad,{id}]',
                'errors' => [
                    'required' => 'El campo {field} es requerido',
                    'is_unique' => 'El {field} debe ser único'

                ]
                ],
             'desc_larga' => [
                    'rules' => 'required.desc_larga,unidad,{id}]',
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
        echo view("unidades/index");
        echo view("templates/footer");
    }
    public function listar()
    {
        $data = $this->unidades->where('estado', 1)->findAll();
        for ($i = 0; $i < count($data); $i++) {
            if ($data[$i]['estado'] == 1) {
                $data[$i]['estado'] = '<span class="badge bg-success">Activo</span>';
                $data[$i]['acciones'] = '<div class"text-center">
                <a href="' . base_url("unidades/editar/" . $data[$i]['idunidad']) . '" class="btn btn-dark"><i class="fas fa-edit"></i></a>
                <button class="btn btn-danger" onclick="btnEliminarMarca(' . $data[$i]['idunidad'] . ')"><i class="fas fa-trash-alt"></i></button>
                </div>';
            }
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function registrar()
    {
        if ($this->request->getMethod() == 'post' && $this->validate($this->reglas)) {
            $desc_corta = $this->request->getPost('desc_corta');
            $desc_larga = $this->request->getPost('desc_larga');
            $data = $this->unidades->save([
                'desc_corta' => $desc_corta,
                'desc_larga' => $desc_larga
            ]);
            return redirect()->to(base_url() . '/unidades')->with('message', 'Unidad academica registrado con exíto.');
        } else {
            $data['validation'] = $this->validator;
            echo view("templates/header");
            echo view("unidades/nuevo", $data);
            echo view("templates/footer");
        }
    }
    public function nuevo()
    {
        echo view("templates/header");
        echo view("unidades/nuevo");
        echo view("templates/footer");
    }
    public function editar($id)
    {
        $data['marca'] = $this->unidades->where('idunidad', $id)->first();
        echo view("templates/header");
        echo view("unidades/editar", $data);
        echo view("templates/footer");
    }
    public function actualizar()
    {
        if ($this->request->getMethod() == 'post' && $this->validate($this->reglas)) {
            $data = $this->unidades->update(
                $this->request->getPost('id'),
                [
                    'desc_corta' => $this->request->getPost('desc_corta'),
                    'desc_larga' => $this->request->getPost('desc_larga')
                ]
            );
            return redirect()->to(base_url() . '/unidades')->with('message', 'Unidad academica modificado con exíto.');
        } else {
            $data['marca'] = $this->unidades->where('idunidad', $this->request->getPost('id'))->first();
            $data['validation'] = $this->validator;
            echo view("templates/header");
            echo view("unidades/editar", $data);
            echo view("templates/footer");
        }
    }
    public function eliminar($id)
    {
        $data = $this->unidades->update($id, ['estado' => 0]);
        if ($data) {
            $mensaje = array('icono' => 'success', "mensaje" => 'Unidad academica eliminado con éxito');
        } else {
            $mensaje = array('icono' => 'error', "mensaje" => 'Error al eliminar la Unidad academica');
        }
        echo json_encode($mensaje, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function reciclaje()
    {
        echo view("templates/header");
        echo view("unidades/reciclaje");
        echo view("templates/footer");
    }
    public function vaciar()
    {
        $data = $this->unidades->where('estado', 0)->findAll();
        for ($i = 0; $i < count($data); $i++) {
            if ($data[$i]['estado'] == 0) {
                $data[$i]['estado'] = '<span class="badge bg-danger">Inactivo</span>';
                $data[$i]['acciones'] = '<div class"text-center">
                    <button class="btn btn-success" onclick="btnreingresar_marca(' . $data[$i]['idunidad'] . ')"><i class="fas fa-reply"></i></button>
                    </div>';
            }
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function restaurar($id)
    {
        $data = $this->unidades->update($id, ['estado' => 1]);
        if ($data) {
            $mensaje = array('icono' => 'success', "mensaje" => 'Unidad academica reingresado con éxito');
        } else {
            $mensaje = array('icono' => 'error', "mensaje" => 'Error al reingresar la UA');
        }
        echo json_encode($mensaje, JSON_UNESCAPED_UNICODE);
        die();
    }
}