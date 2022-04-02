<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\MediaResource;
use App\Models\Media;
use Illuminate\Http\Request;

class MediaController extends Controller
{
    public function index()
    {
        return MediaResource::collection(Media::query()->orderBy('title')->get());
    }

    public function store(Request $request)
    {
        if ($request->hasFile("files")) {
            foreach ($request->file('files') as $file) {
                $upload_path = public_path('uploads/');
                $file_name = $file->getClientOriginalName();
                $file->move($upload_path, $file_name);
                Media::create([
                    "title" =>  $file_name,
                    "path" => "/uploads/" . $file_name
                ]);
            }
            return response()->json([
                "message" => "messages was uploaded"
            ]);
        }
    }

    public function show($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function count()
    {
        $count = Media::query()->get()->count();
        return response()->json(["count" => $count]);
    }

    public function destroy($id)
    {
        $media = Media::findOrFail($id);
        $file_name = $media->title;
        if ($file_name) {
            unlink("uploads/" . $file_name);
            $media->delete();
        }
        return response()->json([
            "message" => $id
        ]);
    }
}
