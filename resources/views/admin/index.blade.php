<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
 
  <title>Academico SGA</title>
  

  <link href="{{asset('login/assets/css/custom.min.css')}}" rel="stylesheet">
 
</head>
<body>
  <section id="login">
    <div class="container" id="c1">
      <div class="row">
        <div class="col-md-7 p-0">
          <div id="registro" class="login-wrapper">
            <div class="login-logo">
              <img class="logo" src="{{asset('login/assets/images/user.png')}}">
            
            </div>
            <div class="white-bg-login">
            <h3 align="center" style="color: #003882; font-size: 25px; font-family: Arial; font-weight: bold">Sistema Académico FAE SGA</h3>

            <br />
		<h1 align="center" style="color: white; font-size: 25px; font-family: Arial; font-weight: bold">....</h1>
            
            </div>
            <form method="POST" action="{{url('user/login')}}">
                @csrf
              

              <div class="cs-field field">
              <label class="bold">Usuario:</label>
                        <input type="email" name="email" class="form-control _ge_de_ol" type="text" placeholder="Correo electrónico" required="" aria-required="true">
                    </div>
                    <div class="cs-field field">
                    <label class="bold">Contraseña:</label>
                        <input type="password" name="password" class="form-control _ge_de_ol" type="text" placeholder="Contraseña" required="" aria-required="true">
                    </div>

             
              <button class="login-enviar cs-btn btn-blue">Iniciar sesión</button>
              <h1 align="center" style="color: white; font-size: 12px; font-family: Arial; font-weight: bold">"Más alla del alcanse de los cazas"</h1>
             
              <h1 align="center" style="color: blue; font-size: 20px; font-family: Arial; font-weight: bold">"Más alla del alcanse de los cazas"</h1>
             
               </form>
          </div>
        </div>
        <div id="login-img" class="col-md-5 p-0 h-100">
          <div class="img-fit">
         
            <img src="{{asset('login/assets/images/fondo.jpg')}}"> -->
          </div>
        </div>
      </div>
    </div>
      
    <div class="footer-wrapper">
      <ul class="footer-links">
        <li><a href="">Más alla del alcance de los cazas</a></li>
       
      </ul>
      <div class="copyright 2021"><span class="black">Capacitación Defensa Aérea</span> | Todos los derechos reservados ®</div>
    </div>
  </section>

  
  
  <script src="assets/js/custom.js"></script>
</body>
</html>