<?php 
namespace App\Models;

use CodeIgniter\Model;

class AppsModel extends Model{
    protected $table      = 'apps';
    protected $primaryKey = 'idapp';
    protected $returnType = 'array';
    protected $useSoftDeletes = false;
    protected $allowedFields = ['nombre', 'estado'];
    protected $useTimestamps = false;
    protected $validationRules = [];
    protected $validationMessages = [];
    protected $skipValidation = false;
}