<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    //public function login(){
    //    return view('auth.perfil');
    //}
    public function index()
    {
        return view('admin.index');
    }

    public function home()
    {
        return view('home');
    }
}