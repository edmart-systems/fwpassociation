// When the document is ready
$(document).ready(() => {
    //setting up month inputs
    const setMonth = () => {
        var d = new Date();
        var currentMonth;
        d.getMonth() + 1 >= 10 ?
            (currentMonth = d.getMonth() + 1) :
            (currentMonth = "0" + (d.getMonth() + 1));
        $("#month").val(d.getFullYear() + "-" + currentMonth);
        $("#year").val(d.getFullYear());
        // console.log("month set");
    };
    setMonth();

    //Empty inputs
    const emptyInputs = () => {
        $("#cate").val("");
        $("#monthly_contribution").val("");
        $("#late").val("");
        $("#late_payment").val("");
        $("#late_meeting").val("");
        $("#absenteeism").val("");
        $("#marriage").val("");
        $("#birth").val("");
        $("#graduation").val("");
        $("#consecration").val("");
        $("#sickness").val("");
        $("#death").val("");
    };

    //Get function request
    const getRequest = (url) => {
        return $.ajax({
            url: url,
            type: "get",
            dataType: "json",
        });
    };

    //setting up commas in budget
    const numberWithCommas = (number) => {
        var parts = number.toString().split(".");
        parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return parts.join(".");
    };

    //post function request
    const postActions = (actionUrl, sendData) => {
        return $.ajax({
            url: actionUrl,
            type: "post",
            data: JSON.stringify(sendData),
            dataType: "json",
            headers: {
                "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
            },
            contentType: "application/json",
            cache: false,
            processData: false,
        });
    };

    //closing modal
    $(document).on("click", ".modal-close", (e) => {
        emptyInputs();
        $("#save-btn")
            .attr("btn-action", "save")
            .html('<i class="mdi mdi-check"></i> Request');
    });

    //selecting meeting fines select
    $(document).on("change", "#meeeting-fines", function() {
        if ($(this).val() == "late_meeting") {
            const late_fine = 50000
            $("#late_meeting").val(late_fine);
            $("#absenteeism").val(0);
            $(".meeting-amount-message").text(late_fine + "UGX");
        } else if ($(this).val() == "absenteeism") {
            const abse_fine = 100000
            $("#absenteeism").val(abse_fine);
            $("#late_meeting").val(0);
            $(".meeting-amount-message").text(abse_fine + "UGX");
        } else {
            $("#absenteeism").val(0);
            $("#late_meeting").val(0);
            $(".meeting-amount-message").text("0 UGX");
        }
    });

    // submitting savings
    $("#savings-form").submit(function(e) {
        e.preventDefault();
        var actionUrl = "savings/create";

        if ($("#save-btn").attr("btn-action") !== "save") {
            actionUrl = `savings/edite/${$("#save-btn").attr("btn-id")}`;
        }
        $("#save-btn").html("Submiting...");
        $("#save-btn").prop("disabled", true);
        $.ajax({
                url: actionUrl,
                type: "post",
                data: new FormData(this),
                dataType: "json",
                headers: {
                    "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
                },
                contentType: false,
                cache: false,
                processData: false,
            })
            .done((response) => {
                $(savings).modal("hide");
                emptyInputs();
                $('#save-btn').html('<i class="mdi mdi-check"></i> Request').attr("btn-action", "save");
                $("#save-btn").prop("disabled", false);
                window.location.reload();
            })
            .fail((error) => {
                console.log(error);
            });
    });

    const fetchSavings = () => {
        var monthData = { date: $("#month").val() };
        $.when(
            postActions("fetch", monthData)
            .done((response) => {
                console.log(response.Expenditure);
                renderSavings(response.savings);
                $(".year-total").html(`${numberWithCommas(response.totalYear)}`);
                $(".expenditure").html(`${numberWithCommas(response.Expenditure)}`);
                $(".amountdue").html(`${numberWithCommas(response.Amountdue)}`);
                $(".loan").html(`${numberWithCommas(response.loan)} UGX`);
                $(".loanreturn").html(`${numberWithCommas(response.loanreturn)} UGX`);
                $(".loanguarantor").html(`${numberWithCommas(response.guarantor)} UGX`);
                $(".Expected-savings").html(`${numberWithCommas(response.Expected)}`);
                $(".percent").html(`${numberWithCommas(response.percent)}`);
                $(".Arrears").html(`${numberWithCommas(response.Arrears)}`);
                $(".payout").html(`${numberWithCommas(response.payout)}`);
            })
            .fail((error) => {
                console.log(error);
            })
        );
    };
    fetchSavings();

    const renderSavings = (data) => {
        $(".saving-tbody").html("");
        var totalYear = 0;
        const savingsData = data.savings;

        savingsData
            ?
            savingsData.forEach((saving) => {
                totalYear = Number(totalYear) + Number(saving.monthly_contribution);

                var months = new Array(12);
                months[0] = "January";
                months[1] = "February";
                months[2] = "March";
                months[3] = "April";
                months[4] = "May";
                months[5] = "June";
                months[6] = "July";
                months[7] = "August";
                months[8] = "September";
                months[9] = "October";
                months[10] = "November";
                months[11] = "December";

                var d = new Date(saving.date);
                month_value = d.getMonth();
                year_value = d.getFullYear();
                if (data.userType == "treasurer") {
                    return $(".saving-tbody").append(`
            <tr>
                <th scope="row">
                    <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-outline-info">Action</button>
                        <button type="button"
                            class="btn btn-outline-info btn-sm dropdown-toggle dropdown-toggle-split"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="sr-only">Toggle Dropdown</span>
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item bg-light text-primary edit-savings-entries"
                                title="Edit Savings" href="/savings/edit/${saving.id}/${saving.name_id}/${saving.date}/${saving.monthly_contribution}/${saving.late_payment}/${saving.late_meeting}/${saving.absenteeism}/${saving.marriage}/${saving.birth}/${saving.graduation}/${saving.consecration}/${saving.sickness}/${saving.death}">
                                Edit <i class="fa fa-edit"></i>
                            </a>
                            <a class="dropdown-item bg-light text-danger" title="Delete Saving"
                                href="/savings/delete/${saving.id}">Delete
                                <i class="fa fa-trash" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                </th>
                <td class="border-top-0" rowspan="1" scope="col"><span class="font-14">${
                  months[month_value]
                }</span></td>
                <td class="border-top-0" rowspan="1" scope="col"><span class="font-14">${year_value}</span></td>
                <td class="border-top-0" rowspan="1" scope="col"><span class="font-14">${numberWithCommas(
                  saving.monthly_contribution
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.late_payment
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.late_meeting
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.absenteeism
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.marriage
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.birth
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.graduation
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.consecration
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.sickness
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.death
                )}</span></td>
            </tr>
        `);
                } else {
                    return $(".saving-tbody").append(`
            <tr>
                <th scope="row">
                    <div class="btn-group">
                        <span class="text-muted">No actions</span>
                    </div>
                </th>
                <td class="border-top-0" rowspan="1" scope="col"><span class="font-14">${
                  months[month_value]
                }</span></td>
                <td class="border-top-0" rowspan="1" scope="col"><span class="font-14">${year_value}</span></td>
                <td class="border-top-0" rowspan="1" scope="col"><span class="font-14">${numberWithCommas(
                  saving.monthly_contribution
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.late_payment
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.late_meeting
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.absenteeism
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.marriage
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.birth
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.graduation
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.consecration
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.sickness
                )}</span></td>
                <td class="border-top-0" scope="col"><span class="font-14">${numberWithCommas(
                  saving.death
                )}</span></td>
            </tr>
        `);
                }
            }) :
            null;
    };

    //editing saving
    $("#edit-savings-entries").on("click", function(e) {
        console.log("sadfjsdlfjasdl");
        e.preventDefault();
        const savingDetails = $(this).attr("data-content").split("|");
        const date = savingDetails[0];
        const monthly_contribution = savingDetails[1];
        const late_payment = savingDetails[2];
        const late_meeting = savingDetails[3];
        const absenteeism = savingDetails[4];
        const marriage = savingDetails[5];
        const birth = savingDetails[6];
        const graduation = savingDetails[7];
        const consecration = savingDetails[8];
        const sickness = savingDetails[9];
        const deat = savingDetails[10];
        const userId = savingDetails[11];
        const userName = savingDetails[12];

        //assigning inputs values;
        $("#savingscate").val(userId).change();
        $("#edit-savings").modal("show");
    });

  $("#savingscate").on("change", function (e) {
    $(".yesmembername").removeClass("nomembername");
    console.log(true);
    const cat_id = $(this).val();
    const sendData = {
      savingscate: cat_id,
    };
    $.when(
      getRequest("/members", sendData)
        .done((response) => {})
        .fail((error) => {
          console.log(error);
        })
    );
    $.when(
      postActions("savings/fetchmembername", sendData)
        .done((response) => {
          console.log(response.username);
          $(".fwpmembername").val(response.username);
        })
        .fail((error) => {
          console.log(error);
        })
    );
    $.when(
      postActions("/savings/fetcharears", sendData)
        .done((response) => {
          $(".arreas_holder").val(response.Arrears);
        })
        .fail((error) => {
          console.log(error);
        })
    );
  });
    $("#cate").change(function () {
      $(".yespdfname").removeClass("nopdfname");
      console.log(true);
      const sendData = {
        cate: $(this).val(),
      };
      $.when(
        postActions("fetchnamemodal", sendData)
          .done((response) => {
            console.log(response.username);
            $(".fwpnamemodal").text(response.username);
          })
          .fail((error) => {
            console.log(error);
          })
      );
    });


    $(".subcategory").on("change", function(e) {
        $(".yespayout").removeClass("nopayout");
        const cat_id = $("#category").val();
        const selectedYear = $(this).val();
        if (cat_id) {
            const sendData = {
                selectedYear: selectedYear,
                cat_id: cat_id,
            };
            $.when(
                postActions("/savings/fetch/year", sendData)
                .done((response) => {
                    renderSavings(response);
                    var totalContribution = 0;
                    response.savings.forEach((saving) => {
                        totalContribution =
                            parseInt(totalContribution) +
                            parseInt(saving.monthly_contribution);
                    });

                    $(".year-total").html(`${numberWithCommas(totalContribution)} UGX`);
                    $(".expenditure").html(`${numberWithCommas(response.Expenditure)} UGX`);
                    $(".loan").html(`${numberWithCommas(response.loan)} UGX`);
                    $(".loanreturn").html(`${numberWithCommas(response.loanreturn)} UGX`);
                    $(".loanguarantor").html(`${numberWithCommas(response.guarantor)} UGX`);
                    $(".amountdue").html(`${numberWithCommas(response.Amountdue)} UGX`);
                    $(".Expected-savings").html(`${numberWithCommas(response.Expected)} UGX`);
                    $(".percent").html(`${numberWithCommas(response.percent)} UGX`);
                    $(".Arrears").html(`${numberWithCommas(response.Arrears)} UGX`);
                    $(".payout").html(`${numberWithCommas(response.Payout)} UGX`);
                })
                .fail((error) => {
                    console.log(error);
                })
            );
        }
    });
  // $(".monthpayment").change(function () {
    
  //   const currentYear = new Date().getFullYear();
  //   const currentMonth = new Date().getMonth() + 1;
  //   var selectedDate = new Date($(this).val());
  //   var requiredDate = new Date(currentYear + "-0" + currentMonth + "-10");
  //   console.log(selectedDate, "-->", requiredDate);
  //   const arrears = parseInt($(".arreas_holder").val());
  //   console.log(arrears);
  //   if (Date.parse(selectedDate) <= Date.parse(requiredDate)) {
  //     //start is less than End
  //     $("#late_payment").val(0);
  //   } else if (parseInt(arrears) <= 0) {
  //     //end is less than start
  //     $("#late_payment").val(0);
  //   } else {
  //     $("#late_payment").val((15 / 100) * parseInt(arrears));
  //   }
  // });

    $(".monthpayment").change(function () {
      const currentYear = new Date().getFullYear();
    const currentMonth = new Date().getMonth() + 1;
    var selectedDate = new Date($(this).val());
    var requiredDate = new Date(currentYear + "-0" + currentMonth + "-10");
    var selectedDatex = $(this).val();
    var memberx = $("#savingscate").val();
    console.log(memberx);
    const arrears = parseInt($(".arreas_holder").val());
    if ((Date.parse(selectedDate) > Date.parse(requiredDate))&& (parseInt(arrears) > 0)) {
      $.when(
      postActions("check/payment", {
        "date": selectedDatex,
        "member": $("#savingscate").val()
      })
        .done((response) => {   
        !response.status ? $("#late_payment").val(((15 / 100) * parseInt(arrears))) :  $("#late_payment").val(0);;  
        })
        .fail((error) => {
          console.log(error);
        })
    );
    }
    else{
        $("#late_payment").val(0);
    }
  });

});