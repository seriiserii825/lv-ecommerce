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
    public function index(Request $request)
    {
        $sort_field = $request->get('sort_field') ?: "created_at";
        $sort_direction = $request->get('sort_direction') ?: "asc";
        return PortfolioResource::collection(Portfolio::query()->orderBy($sort_field, $sort_direction)->get());
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

    public function importCsv()
    {
        $filepath = public_path("/portfolio.csv");        // Reading file
        $file = fopen($filepath, "r");

        $importData_arr = [];
        $i = 0;

        while (($filedata = fgetcsv($file, 1000, ",")) !== FALSE) {
            $num = count($filedata);

            // Skip first row (Remove below comment if you want to skip the first row)
            if ($i == 0) {
                $i++;
                continue;
            }
            for ($c = 0; $c < $num; $c++) {
                $importData_arr[$i][] = $filedata [$c];
            }
            $i++;
        }
        fclose($file);

        //1 - title, 2-type, 3-domain
        // Insert to MySQL database
        foreach ($importData_arr as $importData) {
            $insertData = array(
                "title" => $importData[1],
                "domain" => $importData[3],
                "type_id" => 1,
                "image" => "some",
                "date" => "2022-04-02 08:01:32",
                "created_at" => "2022-04-02 08:01:32",
            );
//            Portfolio::firstOrCreate($insertData);
//            Page::insertData($insertData);
        }
        return response()->json([
            'data' => $importData_arr,
            'insert_data' => $insertData
        ]);
    }
}
