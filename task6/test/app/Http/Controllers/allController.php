<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class allController extends Controller
{
    public function index()
    {
        $users = User::all();
        return view('all',compact('users'));
    }
}
