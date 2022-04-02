<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StorePortfolioRequest;
use App\Http\Requests\UpdatePortfolioRequest;
use App\Http\Resources\PortfolioResource;
use App\Models\Portfolio;
use Illuminate\Http\Request;

class PortfolioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     */
    public function index()
    {
        return PortfolioResource::collection(Portfolio::query()->orderByDesc('created_at')->get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     */
    public function store(StorePortfolioRequest $request)
    {
        $portfolio = Portfolio::create($request->validated());
        return new PortfolioResource($portfolio);
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     */
    public function show(Portfolio $portfolio)
    {
        return new PortfolioResource($portfolio);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     */
    public function update(UpdatePortfolioRequest $request, Portfolio $portfolio)
    {
        $portfolio->update($request->validated());
        return new PortfolioResource($portfolio);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Portfolio $portfolio)
    {
        $portfolio->delete();
        return response()->noContent();
    }
}
