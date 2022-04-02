<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PortfolioResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            "id" => $this->id,
            "title" => $this->title,
            "domain" => $this->domain,
            "image" => $this->image,
            "type_id" => $this->type_id,
            "type" => $this->type,
            "date" => $this->date,
            "created_at" => $this->created_at
        ];
    }
}
