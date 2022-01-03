<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Hash;

use App\Models\User;

use Auth;
use DB;
use Session;

class UsuarioController extends Controller
{
    public function usuario()
    {
        return view('web.usuario');
    }

    public function login(Request $request)
    {
        $user = User::with('user_roles.rol')->where('email', $request->get('email'))->first();

        if($user)
        {
            if(Hash::check($request->get('password'), $user->password))
            {
                Session::put('usuario', $user);

                return redirect('home');
            }

            Session::flash('errores', 'La contraseña es incorrecta');

            return redirect('/');
        }

        Session::flash('errores', 'El e-mail y el rol ingresado no existen');

        return redirect('/');
    }

    public function logout(Request $request)
    {
        Session::flush();

        return redirect('/');
    }
}