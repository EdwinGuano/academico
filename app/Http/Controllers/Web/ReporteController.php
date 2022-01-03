<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;

use App\Models\Alumno;
use App\Models\Asignadoc;
use App\Models\Curso;
use App\Models\Materia;
use App\Models\Matricula;
use App\Models\Planeva;
use App\Models\Periodo;

use Illuminate\Http\Request;

use DB;
use PDF;
use Session;

class ReporteController extends Controller
{
    public function filtros()
    {
        $lista_cursos   = Curso::all();
        $lista_materias = Materia::with('cursos')->get();
        $lista_periodos = Periodo::all();

        return ['lista_cursos' => $lista_cursos, 'lista_materias' => $lista_materias, 'lista_periodos' => $lista_periodos];
    }

    public function matriculas()
    {
        return view('web.reportematriculas'); 
    }

    public function matriculasDescargar($curso_id, $periodo_id)
    {
        $lista_matriculas = Matricula::where('curso_id', $curso_id)
                                    ->where('periodo_id', $periodo_id)
                                    ->orderby('feins_matri', 'asc')
                                    ->get();

        if(count($lista_matriculas) > 0 )
        {
            $curso   = Curso::find($curso_id);
            $periodo = Periodo::find($periodo_id);

            $pdf = PDF::loadView('web.reporte.matricula', ['curso' => $curso, 'periodo' => $periodo ,'lista_matriculas' => $lista_matriculas]);
                    
            $pdf->setPaper('A4');

            return $pdf->stream();
        }                       
            
        return "No existe información para los datos filtrados.";
    }

    public function registroNotas()
    {
        return view('web.reporteregistronotas'); 
    }

    public function registroNotaDescargar($curso_id, $materia_id, $periodo_id)
    {
        $asignadoc = null;

        if(count(Session::get('usuario')->docente) > 0)
        {
            $asignadoc = Asignadoc::where('docente_id', Session::get('usuario')->docente[0]->id)
                                ->where('curso_id', $curso_id)
                                ->where('materia_id', $materia_id)
                                ->where('periodo_id', $periodo_id)
                                ->first();
        }
        
        if($asignadoc)
        {
            $lista_matriculas = Matricula::where('periodo_id', $periodo_id)
                                    ->where('curso_id', $curso_id)
                                    ->where('seccion_id', $asignadoc->seccion_id)
                                    ->get();

            $lista_planes = Planeva::with('detalplanevas.evaluacions')
                                    ->where('docente_id', Session::get('usuario')->docente[0]->id)
                                    ->where('periodo_id', $periodo_id)
                                    ->where('materia_id', $materia_id)
                                    ->get();

            $lista_reporte = [];

            if(count($lista_matriculas) > 0)
            {
                foreach($lista_matriculas as $matricula)
                {
                    $promedio_actitudinal = 0;
                    $promedio_individual  = 0;
                    $promedio_grupal      = 0;

                    $cantidad_actitudinal = 0;
                    $cantidad_individual  = 0;
                    $cantidad_grupal      = 0;

                    foreach($lista_planes as $planeva)
                    {
                        foreach($planeva->detalplanevas[0]->evaluacions as $evaluacion)
                        {
                            if($evaluacion->detalplanevas->tipoact_acti == 'Aporte actitudinal' && $matricula->alumno_id == $evaluacion->alumno_id)
                            {
                                $promedio_actitudinal = $promedio_actitudinal + $evaluacion->nota_deteva;

                                $cantidad_actitudinal++;
                            }
                            elseif($evaluacion->detalplanevas->tipoact_acti == 'Aporte individual' && $matricula->alumno_id == $evaluacion->alumno_id)
                            {
                                $promedio_individual = $promedio_individual + $evaluacion->nota_deteva;

                                $cantidad_individual++;
                            }
                            elseif($evaluacion->detalplanevas->tipoact_acti == 'Aporte grupal' && $matricula->alumno_id == $evaluacion->alumno_id)
                            {
                                $promedio_grupal = $promedio_grupal + $evaluacion->nota_deteva;

                                $cantidad_grupal++;
                            }
                        }
                    }

                    $promedio_actitudinal = ($promedio_actitudinal / $cantidad_actitudinal) * $asignadoc->porcentaje_actitudinal / 100;
                    $promedio_individual  = ($promedio_individual / $cantidad_individual) * $asignadoc->porcentaje_individual / 100;
                    $promedio_grupal      = ($promedio_grupal / $cantidad_grupal) * $asignadoc->porcentaje_grupal / 100;

                    $promedio_general = round($promedio_actitudinal + $promedio_individual + $promedio_grupal);

                    if($promedio_general >= 19)
                    {
                        $promedio_letra = 'Sobresaliente';
                    }
                    else if($promedio_general >= 17 && $promedio_general <= 18)
                    {
                        $promedio_letra = 'Muy Buena';
                    }
                    else if($promedio_general >= 13 && $promedio_general <= 16)
                    {
                        $promedio_letra = 'Regular';
                    }
                    else if($promedio_general >= 0 && $promedio_general <= 15)
                    {
                        $promedio_letra = 'Malo';
                    }

                    $reporte = [

                        'grado' => $matricula->alumnos->tipogrado->nom_grado,
                        'alumno' => $matricula->alumnos->ape_al .' '. $matricula->alumnos->nom_al,
                        'promedio_numero' => $promedio_general,
                        'promedio_letra' => $promedio_letra
                    ];

                    array_push($lista_reporte, $reporte);
                }

                $curso   = Curso::find($curso_id);
                $materia = Materia::find($materia_id);
                $periodo = Periodo::find($periodo_id);

                $pdf = PDF::loadView('web.reporte.reporte_registro_notas', ['curso' => $curso, 'materia' => $materia, 'periodo' => $periodo ,'lista_reporte' => $lista_reporte]);
                        
                $pdf->setPaper('A4');

                return $pdf->stream();
            }
            
            return "No existe información para los datos filtrados.";
        }

        return "No existe información para los datos filtrados.";
    }

    public function notas()
    {
        return view('web.reportenotas'); 
    }

    public function notasDescargar($curso_id, $periodo_id)
    {
        $matricula = Matricula::with('cursos.materias')
                            ->where('alumno_id', Session::get('usuario')->alumno[0]->id)
                            ->where('curso_id', $curso_id)
                            ->where('periodo_id', $periodo_id)
                            ->first();

        $lista_reporte = [];

        if($matricula)
        {
            foreach($matricula->cursos->materias as $materia)
            {
                $asignadoc = Asignadoc::where('seccion_id', $matricula->seccion_id)
                                ->where('curso_id', $curso_id)
                                ->where('materia_id', $materia->id)
                                ->where('periodo_id', $periodo_id)
                                ->first();

                $promedio_general = 0;

                if($asignadoc)
                {
                    $lista_planes = Planeva::with('detalplanevas.evaluacions')
                                    ->where('docente_id', $asignadoc->docente_id)
                                    ->where('periodo_id', $periodo_id)
                                    ->where('materia_id', $materia->id)
                                    ->get();

                                    
                    $promedio_actitudinal = 0;
                    $promedio_individual  = 0;
                    $promedio_grupal      = 0;

                    $cantidad_actitudinal = 0;
                    $cantidad_individual  = 0;
                    $cantidad_grupal      = 0;

                    foreach($lista_planes as $planeva)
                    {
                        foreach($planeva->detalplanevas[0]->evaluacions as $evaluacion)
                        {
                            if($evaluacion->detalplanevas->tipoact_acti == 'Aporte actitudinal' && $matricula->alumno_id == $evaluacion->alumno_id && $evaluacion->materia_id)
                            {
                                $promedio_actitudinal = $promedio_actitudinal + $evaluacion->nota_deteva;

                                $cantidad_actitudinal++;
                            }
                            elseif($evaluacion->detalplanevas->tipoact_acti == 'Aporte individual' && $matricula->alumno_id == $evaluacion->alumno_id)
                            {
                                $promedio_individual = $promedio_individual + $evaluacion->nota_deteva;

                                $cantidad_individual++;
                            }
                            elseif($evaluacion->detalplanevas->tipoact_acti == 'Aporte grupal' && $matricula->alumno_id == $evaluacion->alumno_id)
                            {
                                $promedio_grupal = $promedio_grupal + $evaluacion->nota_deteva;

                                $cantidad_grupal++;
                            }
                        }
                    }

                    if($cantidad_actitudinal > 0 && $cantidad_individual > 0 && $cantidad_grupal > 0)
                    {
                        $promedio_actitudinal = ($promedio_actitudinal / $cantidad_actitudinal) * $asignadoc->porcentaje_actitudinal / 100;
                        $promedio_individual  = ($promedio_individual / $cantidad_individual) * $asignadoc->porcentaje_individual / 100;
                        $promedio_grupal      = ($promedio_grupal / $cantidad_grupal) * $asignadoc->porcentaje_grupal / 100;

                        $promedio_general = round($promedio_actitudinal + $promedio_individual + $promedio_grupal);
                    }
                }

                if($promedio_general >= 19)
                {
                    $promedio_letra = 'Sobresaliente';
                }
                else if($promedio_general >= 17 && $promedio_general <= 18)
                {
                    $promedio_letra = 'Muy Buena';
                }
                else if($promedio_general >= 13 && $promedio_general <= 16)
                {
                    $promedio_letra = 'Regular';
                }
                else if($promedio_general >= 0 && $promedio_general <= 15)
                {
                    $promedio_letra = 'Malo';
                }

                $reporte = [

                    'materia' => $materia->nom_mat,
                    'promedio_numero' => $promedio_general,
                    'promedio_letra' => $promedio_letra
                ];

                array_push($lista_reporte, $reporte);
            }

            $alumno = $matricula->alumnos;
            $curso   = Curso::find($curso_id);
            $periodo = Periodo::find($periodo_id);

            $pdf = PDF::loadView('web.reporte.notas', ['curso' => $curso, 'alumno' => $alumno, 'periodo' => $periodo ,'lista_reporte' => $lista_reporte]);
                    
            $pdf->setPaper('A4');

            return $pdf->stream();
        }

        return "No existe información para los datos filtrados.";
    }

    public function cursos()
    {
        return view('web.reportecursos'); 
    }

    public function cursosDescargar($curso_id, $periodo_id)
    {
        $matriculas = Matricula::with('cursos.materias')
                            ->where('curso_id', $curso_id)
                            ->where('periodo_id', $periodo_id)
                            ->get();

        $lista_reporte = [];

        if(count($matriculas))
        {
            foreach($matriculas as $matricula)
            {
                $notas_materia = [];

                foreach($matricula->cursos->materias as $materia)
                {
                    $asignadoc = Asignadoc::where('seccion_id', $matricula->seccion_id)
                                ->where('curso_id', $curso_id)
                                ->where('materia_id', $materia->id)
                                ->where('periodo_id', $periodo_id)
                                ->first();

                    $promedio_general = 0;

                    if($asignadoc)
                    {
                        $lista_planes = Planeva::with('detalplanevas.evaluacions')
                                        ->where('docente_id', $asignadoc->docente_id)
                                        ->where('periodo_id', $periodo_id)
                                        ->where('materia_id', $materia->id)
                                        ->get();


                        $promedio_actitudinal = 0;
                        $promedio_individual  = 0;
                        $promedio_grupal      = 0;

                        $cantidad_actitudinal = 0;
                        $cantidad_individual  = 0;
                        $cantidad_grupal      = 0;

                        foreach($lista_planes as $planeva)
                        {
                            foreach($planeva->detalplanevas[0]->evaluacions as $evaluacion)
                            {
                                if($evaluacion->detalplanevas->tipoact_acti == 'Aporte actitudinal' && $matricula->alumno_id == $evaluacion->alumno_id && $evaluacion->materia_id)
                                {
                                    $promedio_actitudinal = $promedio_actitudinal + $evaluacion->nota_deteva;

                                    $cantidad_actitudinal++;
                                }
                                elseif($evaluacion->detalplanevas->tipoact_acti == 'Aporte individual' && $matricula->alumno_id == $evaluacion->alumno_id)
                                {
                                    $promedio_individual = $promedio_individual + $evaluacion->nota_deteva;

                                    $cantidad_individual++;
                                }
                                elseif($evaluacion->detalplanevas->tipoact_acti == 'Aporte grupal' && $matricula->alumno_id == $evaluacion->alumno_id)
                                {
                                    $promedio_grupal = $promedio_grupal + $evaluacion->nota_deteva;

                                    $cantidad_grupal++;
                                }
                            }
                        }

                        if($cantidad_actitudinal > 0 && $cantidad_individual > 0 && $cantidad_grupal > 0)
                        {
                            $promedio_actitudinal = ($promedio_actitudinal / $cantidad_actitudinal) * $asignadoc->porcentaje_actitudinal / 100;
                            $promedio_individual  = ($promedio_individual / $cantidad_individual) * $asignadoc->porcentaje_individual / 100;
                            $promedio_grupal      = ($promedio_grupal / $cantidad_grupal) * $asignadoc->porcentaje_grupal / 100;

                            $promedio_general = round($promedio_actitudinal + $promedio_individual + $promedio_grupal);
                        }
                    }

                    if($promedio_general >= 19)
                    {
                        $promedio_letra = 'Sobresaliente';
                    }
                    else if($promedio_general >= 17 && $promedio_general <= 18)
                    {
                        $promedio_letra = 'Muy Buena';
                    }
                    else if($promedio_general >= 13 && $promedio_general <= 16)
                    {
                        $promedio_letra = 'Regular';
                    }
                    else if($promedio_general >= 0 && $promedio_general <= 15)
                    {
                        $promedio_letra = 'Malo';
                    }

                    
                    array_push($notas_materia, $promedio_general);
                }

                $reporte = [

                    'grado' => $matricula->alumnos->tipogrado->nom_grado,
                    'alumno' => $matricula->alumnos->ape_al .' '. $matricula->alumnos->nom_al,
                    'notas_materia' => $notas_materia,
                ];

                array_push($lista_reporte, $reporte);
            }

            $alumno   = $matricula->alumnos;
            $curso    = Curso::find($curso_id);
            $periodo  = Periodo::find($periodo_id);
            $materias = $matricula->cursos->materias;

            //return view('web.reporte.cursos', ['curso' => $curso, 'alumno' => $alumno, 'periodo' => $periodo , 'materias' => $materias, 'lista_reporte' => $lista_reporte]);
            $pdf = PDF::loadView('web.reporte.cursos', ['curso' => $curso, 'alumno' => $alumno, 'periodo' => $periodo , 'materias' => $materias, 'lista_reporte' => $lista_reporte]);
                    
            $pdf->setPaper('A2');

            return $pdf->stream();
        }

        return "No existe información para los datos filtrados.";
    }
}