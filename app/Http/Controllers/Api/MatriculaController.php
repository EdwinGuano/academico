<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\MatriculaStoreRequest;
use App\Http\Resources\MatriculaResource;
use App\Http\Resources\ModalidadcursoResource;
use App\Models\Matricula;
use Illuminate\Http\Request;

class MatriculaController extends Controller
{
    public function index(Request $request)
    {

        $buscarp = $request->input('periodo_id');
        $buscarc = $request->input('curso_id');
        $buscar = $request->input('name');
            
        return MatriculaResource::collection(matricula::Filterpid($buscarp)->Filtercid($buscarc)->FilterNpd($buscar)->orderBy('id', 'desc')->get()->all());
        
    }

    public function store(MatriculaStoreRequest $request)
    {
        $validacionMatricula = Matricula::where('periodo_id', $request->get('periodo_id'))
                                        ->where('alumno_id', $request->get('alumno_id'))
                                        ->where('curso_id', $request->get('curso_id'))
                                        ->where('seccion_id', $request->get('seccion_id'))
                                        ->first();

        if($validacionMatricula)
        {
            return ['estado_accion' => false];
        }

        $matricula = Matricula::create($request->validated());

        return ['estado_accion' => true];
    }

    public function show(Matricula $matricula)
    {
        return new MatriculaResource($matricula);
    }

    public function update(Matricula $matricula, MatriculaStoreRequest $request)
    {
        $validacionMatricula = Matricula::where('periodo_id', $request->get('periodo_id'))
                                        ->where('alumno_id', $request->get('alumno_id'))
                                        ->where('curso_id', $request->get('curso_id'))
                                        ->where('seccion_id', $request->get('seccion_id'))
                                        ->first();

        if($validacionMatricula)
        {
            if($validacionMatricula->id != $request->get('id'))
            {
                return ['estado_accion' => false];
            }
        }

        $matricula->update($request->validated());
        
        return ['estado_accion' => true];
    }

    public function destroy(Matricula $matricula)
    {
        $matricula->delete();
        return response()->noContent();
    }

}
