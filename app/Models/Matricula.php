<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class matricula extends Model
{
    use HasFactory;
    
    protected $fillable = ['id','alumno_id','curso_id','periodo_id','seccion_id','feins_matri'];

      //Relación uno a muchos (Inversa)
      public function periodos(){
    
        return $this->belongsTo(periodo::class,'periodo_id','id');
    }

    //Relación uno a muchos (Inversa)
    public function seccions(){
    
        return $this->belongsTo(seccion::class,'seccion_id','id');
    }

    //Relación uno a muchos (Inversa)
    public function alumnos(){
    
        return $this->belongsTo(alumno::class,'alumno_id','id');
    }

    //Relación uno a muchos (Inversa)
    public function cursos(){
    
        return $this->belongsTo(curso::class,'curso_id','id');
    }

    public function scopeFilterpid($query, $id) {
      
        if(!empty($id)) {
            
            return $query->where('periodo_id', "$id");
            
        } 
    
    }
  
      public function scopeFiltercid($query, $id) {
        
            if(!empty($id)) {
                  
                return $query->where('curso_id', "$id");
                  
            }  
      
      }
      
      public function scopeFilterNpd($query,$name){
  
          if(!empty($name)) $query->whereHas("alumnos",function($query) use($name){
              $query->Where("nom_al","like","%$name%");
              $query->orWhere("ape_al","like","%$name%");
              $query->orWhere("dni_al","like","%n$name%");
          });
      }

}
