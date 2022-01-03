<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\MateriaStoreRequest;
use App\Http\Resources\MateriaResource;
use App\Models\Materia;
use Illuminate\Http\Request;

class MateriaController extends Controller
{
        public function index(Request $request)
    {
        $per_page=$request->per_page;
        return Materia::paginate($per_page);


      //  $per_page=$request->per_page;
      //  return Articulo::paginate($per_page)
    }
  


    public function store(MateriaStoreRequest $request)
    {
       
        $materia = Materia::create($request->validated());

        return new MateriaResource($materia);
    }

    public function show(Materia $materia)
    {
        return new MateriaResource($materia);
    }

    public function update(Materia $materia, MateriaStoreRequest $request)
    {
        $materia->update($request->validated());
        return new MateriaResource(($materia));
    }

    public function destroy(Materia $materia)
    {
        $materia->delete();
        return response()->noContent();
    }
}
