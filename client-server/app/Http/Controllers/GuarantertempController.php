<?php

namespace App\Http\Controllers;

use App\Guarantertemp;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;
use App\Savings;
use App\Guarantors;

class GuarantertempController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $guaranters = Guarantertemp::with("user")->where("user_id", "=", Auth::user()->id)->get();
        $all_guaranters = [];
        foreach ($guaranters as $guaranter) {
            $row = [
                "g_amount" => $guaranter->g_amount,
                "guarantor" => $guaranter->guarantor,
                "id" => $guaranter->id,
                "user" => $guaranter->user,
                "user_id" => $guaranter->user_id,
                "due_amount" => app('App\Http\Controllers\SavingsController')->calculatedueamount($guaranter->guarantor)
            ];
            array_push($all_guaranters, $row);
        }
        return $all_guaranters;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //checking for the due amount
        $due_amount = app('App\Http\Controllers\SavingsController')->calculatedueamount($request->guaranter_id);
        if ($request->g_amount > (0.75 * $due_amount)) {
            return response()->json([
                "msg" => "error",
                "amount" => (0.75 * $due_amount)
            ]);
        }

        //fetching existing guaranter
        $existing_guaranter = Guarantertemp::where(["user_id" => Auth::user()->id, "guarantor" => $request->guaranter_id])->get();
        if (count($existing_guaranter) > 0) {
            return response()->json([
                "status" => "error",
                "msg" => "existing guaranter"
            ]);
        }

        //creating the temp guaranter
        Guarantertemp::create([
            "user_id" => Auth::user()->id,
            "guarantor" => $request->guaranter_id,
            "g_amount" => $request->g_amount
        ]);
        return response()->json([
            "msg" => "Guaranter Saved Successfully"
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Guarantertemp  $guarantertemp
     * @return \Illuminate\Http\Response
     */
    public function show(Guarantertemp $guarantertemp)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Guarantertemp  $guarantertemp
     * @return \Illuminate\Http\Response
     */
    public function edit(Guarantertemp $guarantertemp)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Guarantertemp  $guarantertemp
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $due_amount = app('App\Http\Controllers\SavingsController')->calculatedueamount($request->guaranter_id);
        if ($request->g_amount > (0.75 * $due_amount)) {
            return response()->json([
                "msg" => "error",
                "amount" => (0.75 * $due_amount)
            ]);
        }
        Guarantertemp::where("id", $request->id)->update(
            [
                "g_amount" => $request->g_amount,
                "guarantor" => $request->guaranter_id,
            ]
        );
        return response()->json([
            "msg" => "Guarantor uiyu Saved Successfully"
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Guarantertemp  $guarantertemp
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        Guarantertemp::where("id", $request->id)->delete();
        return response()->json([
            "msg" => "Guarantor Deleted Successfully"
        ]);
    }
}