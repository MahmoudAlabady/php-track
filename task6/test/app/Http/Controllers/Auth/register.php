<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class register extends Controller
{
    public function register()
    {
        return view('register');
    }
}
