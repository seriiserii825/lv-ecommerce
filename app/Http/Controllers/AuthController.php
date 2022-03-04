<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $data = $request->validate([
            'email' => 'required|string',
            'password' => 'required|string'
        ]);

        $user = User::query()->where('email', $data['email'])->first();

        if ($user && Hash::check($data["password"], $user->password)) {
            $token = $user->createToken('myapptoken')->plainTextToken;

            return response([
                "user" => $user,
                "token" => $token
            ]);
        }
        return response([
            "message" => "unauthorized",
        ], 401);
    }
}
