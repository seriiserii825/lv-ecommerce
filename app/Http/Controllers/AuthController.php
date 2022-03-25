<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(RegisterRequest $request)
    {
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->save();

        return response()->json(["status" => 200, "message" => "User was created"]);
    }

    public function login(LoginRequest $request)
    {
        $user = User::query()->where('email', $request['email'])->first();

        if ($user && Hash::check($request["password"], $user->password)) {
            $token = $user->createToken('auth_token')->plainTextToken;

            return response([
                "user" => $user,
                "token" => $token
            ]);
        }
        return response([
            "message" => "unauthorized",
        ], 401);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json(['message' => 'Logged out success'], 200);
    }
}
