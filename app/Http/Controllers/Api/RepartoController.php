<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\RepartoStoreRequest;
use App\Http\Resources\RepartoResource;
use App\Models\Reparto;
use Illuminate\Http\Request;

class RepartoController extends Controller
{
    public function index()
    {
        return RepartoResource::collection(Reparto::all());
    }

    public function store(RepartoStoreRequest $request)
    {
        // sleep(3);
        if($request->hasFile('thumbnail')){
            $filename = $request->thumbnail->getClientOriginalName();
            info($filename); //log
        }
        $reparto = Reparto::create($request->validated());

        return new RepartoResource($reparto);
    }

    public function show(Reparto $reparto)
    {
        return new RepartoResource($reparto);
    }

    public function update(Reparto $reparto, RepartoStoreRequest $request)
    {
        $reparto->update($request->validated());
        return new RepartoResource(($reparto));
    }

    public function destroy(Reparto $reparto)
    {
        $reparto->delete();
        return response()->noContent();
    }

}
