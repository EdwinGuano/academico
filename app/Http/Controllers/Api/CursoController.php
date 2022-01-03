<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CursoStoreRequest;
use App\Http\Resources\CursoResource;
use App\Models\Curso;
use Illuminate\Http\Request;

class CursoController extends Controller
{
    public function index(Request $request)
    {
        $per_page=$request->per_page;
        //return CursoResource::collection(curso::all());
        return CursoResource::collection(curso::filterMaterias(true)->paginate($per_page));
        
    }
    
    public function materia()
    {
        return CursoResource::collection(curso::all());
        
    }
    
    public function store(CursoStoreRequest $request)
    {
        
        $curso = Curso::create($request->validated());
        $curso->materias()->sync($request->materia_id);

        return new CursoResource($curso);
    }

    public function show(Curso $curso)
    {
        return new CursoResource($curso);
    }

    public function update(Curso $curso, CursoStoreRequest $request)
    {
        $curso->update($request->validated());       
        $curso->materias()->sync($request->materia_id);

        return new CursoResource(($curso));
    }

    public function destroy(Curso $curso)
    {
        $curso->delete();
        return response()->noContent();
    }

}
