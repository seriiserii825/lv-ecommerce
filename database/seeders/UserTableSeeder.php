<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = [
            [
                'name' => 'Serii',
                'email' => 'seriiburduja@gmail.com',
                'password' =>  Hash::make('some1234')
            ],
        ];

        DB::table('users')->insert($users);
    }
}
