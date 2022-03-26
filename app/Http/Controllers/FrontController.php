<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FrontController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        return $user ? response()->json(['user' => true], 200) : response()->json(['user' => false], 404);
    }
}
