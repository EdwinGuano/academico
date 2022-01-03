<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\TipocursoStoreRequest;
use App\Http\Resources\TipocursoResource;
use App\Models\Tipocurso;
use Illuminate\Http\Request;

class TipocursoController extends Controller
{
    public function index()
    {
        return TipocursoResource::collection(tipocurso::all());
    }

    public function store(TipocursoStoreRequest $request)
    {
        // sleep(3);
        if($request->hasFile('thumbnail')){
            $filename = $request->thumbnail->getClientOriginalName();
            info($filename); //log
        }
        $tipocurso = Tipocurso::create($request->validated());

        return new TipocursoResource($tipocurso);
    }

    public function show(Tipocurso $tipocurso)
    {
        return new TipocursoResource($tipocurso);
    }

    public function update(Tipocurso $tipocurso, TipocursoStoreRequest $request)
    {
        $tipocurso->update($request->validated());
        return new TipocursoResource(($tipocurso));
    }

    public function destroy(Tipocurso $tipocurso)
    {
        $tipocurso->delete();
        return response()->noContent();
    }

}
