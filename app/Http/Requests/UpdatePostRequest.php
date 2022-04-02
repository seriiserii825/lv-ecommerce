<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePostRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'title' => 'required|unique:posts,title,' . $this->title . ',title',
            'slug' => 'required|unique:posts,slug,' . $this->slug . ',slug',
            'category_id' => 'required|integer',
            'text' => 'required|string',
        ];
    }
}
