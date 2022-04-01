<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreTypeRequest;
use App\Http\Requests\UpdateTypeRequest;
use App\Http\Resources\TypeResource;
use App\Models\Type;
use Illuminate\Http\Request;

class TypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     */
    public function index(Request $request)
    {
        return TypeResource::collection(Type::query()->orderBy('created_at')->get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     */
    public function store(StoreTypeRequest $request)
    {
        $type = Type::create($request->validated());
        return new TypeResource($type);
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     */
    public function show(Type $type)
    {
        return new TypeResource($type);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     */
    public function update(UpdateTypeRequest $request, Type $type)
    {
        $type->update($request->validated());
        return new TypeResource($type);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Type $type)
    {
        $type->delete();
        return response()->noContent();
    }
}
