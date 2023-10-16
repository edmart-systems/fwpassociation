<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBiodatasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('biodatas', function (Blueprint $table) {
            $table->id();
            $table->Integer('user_id')->index();
            $table->string('address')->nullable();
            $table->string('occupation')->nullable();
            $table->string('phone1')->nullable();
            $table->string('phone2')->nullable();
            $table->string('nationality')->nullable();
            $table->date('dob')->nullable();
            $table->string('NIN')->nullable();
            $table->string('passport')->nullable();
            $table->string('marital')->nullable();
            $table->string('spouse')->nullable();
            $table->string('children')->nullable();
            $table->string('father')->nullable();
            $table->string('mother')->nullable();
            $table->string('nextofkin')->nullable();
            $table->string('nextofkinaddress')->nullable();
            $table->string('nxtnin')->nullable();
            $table->string('nxtcont')->nullable();
            $table->string('nxtemail')->nullable();
            $table->string('relationship')->nullable();
            $table->tinyInteger('status')->default(0)->comment("0=pending, 1=approved, 2=edit requested");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('biodatas');
    }
}
