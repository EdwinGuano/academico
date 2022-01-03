<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\SeccionStoreRequest;
use App\Http\Resources\SeccionResource;
use App\Models\seccion;
use Illuminate\Http\Request;

class SeccionController extends Controller
{
    public function index(Request $request)
    {
        $per_page=$request->per_page;
        return Seccion::paginate($per_page);
    }

    public function store(SeccionStoreRequest $request)
    {
        
        $seccion = Seccion::create($request->validated());

        return new SeccionResource($seccion);
    }

    public function show(Seccion $seccion)
    {
        return new SeccionResource($seccion);
    }

    public function update(Seccion $seccion, SeccionStoreRequest $request)
    {
        $seccion->update($request->validated());
        return new SeccionResource(($seccion));
    }

    public function destroy(Seccion $seccion)
    {
        $seccion->delete();
        return response()->noContent();
    }
}

