<html>
	<title>Reporte de Matrículas</title>
    <head>
        <style>
            /** 
                Establezca los márgenes de la página en 0, por lo que el pie de página y el encabezado
                puede ser de altura y anchura completas.
             **/
            @page {
                margin: 0cm 0cm;
            }

            /** Defina ahora los márgenes reales de cada página en el PDF **/
            body {
                margin-top: 2cm;
                margin-left: 2cm;
                margin-right: 2cm;
                margin-bottom: 2cm;
            }

            /** Definir las reglas del encabezado **/
            header {
                position: fixed;
                top: 0cm;
                left: 0cm;
                right: 0cm;
                height: 2cm;

                /** Estilos extra personales **/
                background-color: white;
                color: black;
                text-align: center;
                line-height: 0.5cm;
            }

            /** Definir las reglas del pie de página **/
            footer {
                position: fixed; 
                bottom: 0cm; 
                left: 0cm; 
                right: 0cm;
                height: 5cm;

                /** Estilos extra personales **/
                background-color: white;
                color: black;
                text-align: center;
                line-height: 0.5cm;
            }

            .verticalText{
 
			 	text-orientation: upright; /*SI necesitas el textos sea orientado de este modo tambien*/
			  	font-size: 10px;
				margin-right: -15px;
				margin-left: 0px;
				float:left;
				transform: rotate(-90deg);
				padding-left: 0px;
			}

        </style>
    </head>
    <body>
        <!-- Defina bloques de encabezado y pie de página antes de su contenido -->
        <header>
            <h4>
				<center>
					FUERZA AÉREA ECUATORIANA <br>
					CENTRO DE OPERACIONES SECTORIALES NRO 1
				</center>
			</h4>
        </header>

        <footer>
        	<table style="width: 100%;">
				<tr>
					<td width="50">
						<center>
							Juan Andrés Sanches Carrasco <br>
							Cbop. Tec. Avc <br>
							<b>TÉCNICO DEPARTAMENTO CAPACITACIÓN</b>
						</center>
					</td>
					<td width="50">
						<center>
							Edwin Andrés Suarez Aman <br>
							Subs. Tec. Avc <br>
							<b>SUPERVISOR DEPARTAMENTO CAPACITACIÓN</b>
						</center>
					</td>
				</tr>
			</table>
        </footer>

        <!-- Envuelva el contenido de su PDF dentro de una etiqueta principal -->
        <main>
			<h3><center>REPORTE DE CALIFICACIONES CURSO</center></h3>
			<table border=1 cellspacing=0 cellpadding=2 bordercolor="666633" style="font-size: 13px; width: 100%;"> 
				<tr>
					<td><b>Curso:</b></td>
					<td>{{$curso->nom_cur}}</td>
					<td><b>Periodo:</b></td>
					<td>{{$periodo->ano_per .' '. $periodo->peri_per}}</td>
				</tr>
			</table>
			<br>
			<table border=1 cellspacing=0 cellpadding=2 bordercolor="666633"style="font-size: 13px; width: 100%;">
				<thead>
					<tr>
						<th>Ord.</th>
						<th>Grado</th>
						<th>Apellidos y nombres</th>
						@foreach($materias as $materia)
							<th style="height: 80px; padding-top: 60px;"><div class="HorizontalText">{{$materia->nom_mat}}</div></th>
						@endforeach
						<th style="height: 80px; text-align: center; padding-top: 60px;"><div class="HorizontalText">Promedio</div></th>
						<th style="height: 80px; text-align: center; padding-top: 60px; padding-bottom: 0px;"><div class="HorizontalText">Observaciones</div></th>
					</tr>
				</thead>
				<tbody>
					<?php $contador = 1; ?>
					@foreach($lista_reporte as $reporte)

						<?php
							$promedio = 0;
						?>

						<tr>
							<td style="width: 2%; text-align: center;">{{$contador++}}</td>
							<td style="width: 2%; ">{{$reporte['grado']}}</td>
							<td style="width: auto; ">{{$reporte['alumno']}}</td>
							@foreach($reporte['notas_materia'] as $nota)

								<?php
									$promedio = $promedio + $nota;
								?>

								<td style="text-align: center;">{{$nota}}</td>
							@endforeach
							<td style="width: 5%; text-align: center;">

								<?php
									$promedio = round($promedio / count($materias));
								?>

								{{$promedio}}
							</td>
							<td style="width: 5%; text-align: center;">
								@if($promedio > 15)
									APRUEBA
								@else
									<span style="color: red">REPRUEBA</span>
								@endif
							</td>
						</tr>
					@endforeach
				</tbody>
			</table>    
        </main>
    </body>
</html>