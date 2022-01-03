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
                line-height: 1.5cm;
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
			<h3><center>REPORTE DE MATRICULACIÓN</center></h3>
			<table border=1 cellspacing=0 cellpadding=2 bordercolor="666633" style="width: 100%;">
				<tr>
					<td><b>Curso:</b></td>
					<td>{{$curso->nom_cur}}</td>
					<td><b>Periodo:</b></td>
					<td>{{$periodo->ano_per}} {{$periodo->peri_per}}</td>
				</tr>
			</table>
			<br>
			<table border=1 cellspacing=0 cellpadding=2 bordercolor="666633"style="font-size: 12px;">
				<thead>
					<tr>
						<th>Ord.</th>
						<th>Grado</th>
						<th>Cédula</th>
						<th>Apellidos y nombres</th>
						<th>Curso</th>
						<th>Sección</th>
						<th>Periodo</th>
					</tr>
				</thead>
				<tbody>
					<?php $contador = 1; ?>
					@foreach($lista_matriculas as $matricula)
						<tr>
							<td style="width: 10px; text-align: center;">{{$contador}}</td>
							<td style="width: 50px; text-align: center;">{{$matricula->alumnos->tipogrado->nom_grado}}</td>
							<td style="width: 60px; text-align: center;">{{$matricula->alumnos->dni_al}}</td>
							<td style="width: 120px; text-align: center;">
								{{$matricula->alumnos->ape_al}} {{$matricula->alumnos->nom_al}}
							</td>
							<td style="width: 100px; text-align: center;">{{$curso->nom_cur}}</td>
							<td style="width: 80px; text-align: center;">
								{{$matricula->seccions->nom_sec}}
							</td>
							<td style="width: 150px; text-align: center;">{{$periodo->ano_per}} {{$periodo->peri_per}}</td>
						</tr>
					@endforeach
				</tbody>
			</table>    
        </main>
    </body>
</html>