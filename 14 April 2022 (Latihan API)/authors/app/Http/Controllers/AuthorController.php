<?php

namespace App\Http\Controllers;

use App\Models\Author;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class AuthorController extends Controller
{

    public function showAllAuthors(): JsonResponse
    {

        return response()->json(Author::all());
    }

    public function showOneAuthor($id): JsonResponse
    {

        return response()->json(Author::find($id));
    }

    public function create(Request $request): JsonResponse
    {
        // dd($request);
        // $this->validate($request, [
        //     'name' => 'required',
        //     'email' => 'required|email|unique:authors',
        //     'location' => 'required|alpha'
        // ]);

        $author = Author::create($request->all());

        return response()->json($author, Response::HTTP_CREATED);
    }

    public function update(Request $request)
    {

        $author = Author::find($request->id);
        $author->update($request->except('id'));
        return $author;

        // $author = Author::findOrFail($id);
        // $author->update($request->all());
        // return response()->json($author, Response::HTTP_OK);
    }

    public function delete(Request $request)
    {

        $author = Author::find($request->id);
        $author->delete;
        return [
            'success' => true,
        ];

        // Author::findOrFail($id)->delete();
        // return response('Deleted Successfully', Response::HTTP_OK);
    }
}
