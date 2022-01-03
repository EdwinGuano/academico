<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class evaluacion extends Model
{
       
    protected $fillable = ['id','alumno_id', 'periodo_id', 'materia_id', 'fecreg_eval', 'detalplaneva_id', 'nota_deteva'];
 
    //Relación uno a muchos (Inversa)
    public function alumnos() {
    
      return $this->belongsTo(alumno::class,'alumno_id','id');

    }

    //Relación uno a muchos (Inversa)
    public function periodos(){
    
      return $this->belongsTo(periodo::class,'periodo_id','id');
    
    }

   //Relación uno a muchos (Inversa)
    public function materias(){
    
        return $this->belongsTo(materia::class,'materia_id','id');
    }
    
    //Relacion Uno a Uno
    public function detalplanevas() {

        return $this->belongsTo(Detalplaneva::class,'detalplaneva_id');
    }
   
    }