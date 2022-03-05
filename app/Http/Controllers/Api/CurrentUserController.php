<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CurrentUserController extends Controller
{
    public function index()
    {
        if ($user = Auth::user()) {
            return response()->json([
                "user" => $user
            ]);
        }
        return response()->json([
            "user" => false
        ]);
    }
}
