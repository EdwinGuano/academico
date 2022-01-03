<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\AulaStoreRequest;
use App\Http\Resources\AulaResource;
use App\Models\Aula;
use Illuminate\Http\Request;

class AulaController extends Controller
{
    public function index(Request $request)
    {
        $per_page=$request->per_page;
        return AulaResource::collection(aula::paginate($per_page));
    }

    public function store(AulaStoreRequest $request)
    {
       
        $aula = Aula::create($request->validated());

        return new AulaResource($aula);
    }

    public function show(Aula $aula)
    {
        return new AulaResource($aula);
    }

    public function update(Aula $aula, AulaStoreRequest $request)
    {
       
        $aula->update($request->validated());
        //dd($aula); 
        return new AulaResource(($aula));
    }

    public function destroy(Aula $aula)
    {
        $aula->delete();
        return response()->noContent();
    }
}
