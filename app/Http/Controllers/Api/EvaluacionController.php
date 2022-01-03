<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\AsignadocResource;
use App\Http\Requests\EvaluacionStoreRequest;
use App\Http\Resources\EvaluacionResource;
use App\Models\Asignadoc;
use App\Models\Evaluacion;
use App\Models\Matricula;
use App\Models\Planeva;

use Illuminate\Http\Request; 

use Session;

class EvaluacionController extends Controller
{
    public function index(Request $request)
    {
        $docente_id = $request->get('docente_id');
        $estado     = 'Planificado';

        $lista_asignadoc = AsignadocResource::collection(asignadoc::FilterDocente($docente_id)->FilterEstado($estado)->orderby('updated_at', 'desc')->get()->all());

        return response()->json(['lista_asignadoc' => $lista_asignadoc]);
    }

    public function listarRegistro($docente_id, $periodo_id, $curso_id, $materia_id, $seccion_id, $aula_id)
    {
        $asignadoc = Asignadoc::where('docente_id', $docente_id)
                                ->where('periodo_id', $periodo_id)
                                ->where('seccion_id', $seccion_id)
                                ->where('materia_id', $materia_id)
                                ->where('aula_id', $aula_id)
                                ->first();

        $lista_planes = Planeva::with('detalplanevas')->where('docente_id', $docente_id)
                                                    ->where('periodo_id', $periodo_id)
                                                    ->where('materia_id', $materia_id)
                                                    ->orderby('fecent_plaeva', 'asc')
                                                    ->get();

        $lista_matriculas = Matricula::with(['alumnos.tipogrado', 'periodos.evaluaciones'])
                                            ->where('periodo_id', $periodo_id)
                                            ->where('curso_id', $curso_id)
                                            ->where('seccion_id', $seccion_id)
                                            ->get();

        return response()->json(['asignadoc' => $asignadoc, 'lista_planes' => $lista_planes, 'lista_matriculas' => $lista_matriculas, 'materia_id' => $materia_id]);

        //return view('web.registro', ['asignadoc' => $asignadoc, 'lista_planes' => $lista_planes, 'lista_matriculas' => $lista_matriculas, 'materia_id' => $materia_id]);
    }

    public function guardarNota(Request $request)
    {
        if($request->ajax())
        {
            $evaluacion = Evaluacion::where('alumno_id', $request->get('alumno_id'))
                                            ->where('periodo_id', $request->get('periodo_id'))
                                            ->where('materia_id', $request->get('materia_id'))
                                            ->where('detalplaneva_id', $request->get('detalplaneva_id'))
                                            ->first();

            if($evaluacion)
            {
                $evaluacion->nota_deteva = $request->get('nota_deteva') == null ? 0 : $request->get('nota_deteva');

                $evaluacion->save();
            }
            /*else
            {
                $evaluacion = new Evaluacion();

                $evaluacion->fecreg_eval      = date('Y-m-d');
                $evaluacion->nota_deteva      = $request->get('nota_deteva') == null ? 0 : $request->get('nota_deteva');
                $evaluacion->alumno_id        = $request->get('alumno_id');
                $evaluacion->periodo_id       = $request->get('periodo_id');
                $evaluacion->materia_id       = $request->get('materia_id');
                $evaluacion->detalplaneva_id  = $request->get('detalplaneva_id');

                $evaluacion->save();
            }*/

            return response()->json(true);
        }
    }

    public function store(EvaluacionStoreRequest $request)
    {
        // sleep(3);
        if($request->hasFile('thumbnail')){
            $filename = $request->thumbnail->getClientOriginalName();
            info($filename); //log
        }
        $evaluacion = Evaluacion::create($request->validated());

        return new EvaluacionResource($evaluacion);
    }

    public function show(Evaluacion $evaluacion)
    {
        return new EvaluacionResource($evaluacion);
    }

    public function update(Evaluacion $evaluacion, EvaluacionStoreRequest $request)
    {
        $evaluacion->update($request->validated());
        return new EvaluacionResource(($evaluacion));
    }

    public function destroy(Evaluacion $evaluacion)
    {
        $evaluacion->delete();
        return response()->noContent();
    }
}