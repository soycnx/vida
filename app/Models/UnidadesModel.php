<?php 
namespace App\Models;

use CodeIgniter\Model;

class UnidadesModel extends Model{
    protected $table      = 'unidades';
    protected $primaryKey = 'idunidad';
    protected $returnType = 'array';
    protected $useSoftDeletes = false;
    protected $allowedFields = ['desc_corta', 'desc_larga', 'estado'];
    protected $useTimestamps = false;
    protected $validationRules = [];
    protected $validationMessages = [];
    protected $skipValidation = false;
}