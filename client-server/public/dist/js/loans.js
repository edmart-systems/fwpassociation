//when the document is ready
$(document).ready(() => {
    //setting up month inputs
    const setMonth = () => {
        var d = new Date();
        var currentMonth;
        d.getMonth() + 1 >= 10 ?
            (currentMonth = d.getMonth() + 1) :
            (currentMonth = "0" + (d.getMonth() + 1));
        $("#monthloan").val(d.getFullYear() + "-" + currentMonth);
        $("#year").val(d.getFullYear());
        $("#hiddendate").val(d.getFullYear() + "-" + currentMonth + "-" + d.getDate())
            // console.log("month set");
    };
    setMonth();

    //Empty inputs
    const emptyInputs = () => {
        $("#mem").val("");
        $("#total-amount").val("");
        $("#expected_loan").val("");
        $("#loan_amount").val("");
        $("#submem").val("");
        $("#fee").val("");
        $("#months_taken").val("");
        $("#desc").val("");
        $('#return').val("");
        $("#fee_return").text("");
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
        $("#loanrequest-btn")
            .attr("btn-action", "save")
            .html('<i class="mdi mdi-check"></i> Request');
    });

    $(".loanmember").click(function() {
        const sendData = {
            id: $(this).val(),
        };
        $.when(
            postActions("/fetch/totalamountdue", sendData)
            .done((response) => {
                $("#total-amount-span").text(numberWithCommas(response.total_amount) + " UGX");
                $("#total-amount").val(response.total_amount);
                const amount = $("#total-amount").val();
                $("#expected_loan_span").text(numberWithCommas((75 / 100) * parseInt(amount)) + " UGX");
                $("#expected_loan").val((75 / 100) * parseInt(amount));
                $(".loan_limit_span").text(numberWithCommas(2 * parseInt(amount)) + " UGX");
                $("#loan_limit").val(2 * parseInt(amount));
                var exp = $('#expected_loan').val();
                var expect = 2 * exp;
            })
            .fail((error) => {
                console.log(error);
            })
        );
    });

    //fetching details for loans
    const fetchrequireddetails = () => {
        const sendData = {
            id: $(".loanmember").val(),
        };
        $.when(
            postActions("/fetch/totalamountdue", sendData)
            .done((response) => {
                $("#total-amount-span").text(numberWithCommas(response.total_amount) + "UGX");
                $("#total-amount").val(response.total_amount);
                const amount = $("#total-amount").val();
                $("#expected_loan_span").text(numberWithCommas((75 / 100) * parseInt(amount)) + "UGX");
                $("#expected_loan").val((75 / 100) * parseInt(amount));
                $(".loan_limit_span").text(numberWithCommas(2 * parseInt(amount)) + "UGX");
                $("#loan_limit").val(2 * parseInt(amount));
                var exp = $('#expected_loan').val();
                var expect = 2 * exp;
            })
            .fail((error) => {
                console.log(error);
            })
        );
    }

    fetchrequireddetails();

    $("#loan_amount").change(function() {
        const loan = parseInt($("#loan_amount").val().replace(/,/g, ""));
        const exp = $("#expected_loan").val();
        $("#loan_amount").removeAttr("max");

        if (loan <= parseInt(exp)) {
            $("#fee").val(20000);
            $("#fee_span").text(numberWithCommas(20000));
            $("#total-amount2").val(0)
            $("#expected").val(0)
            $(".resty").addClass("lily");
        } else {
            $(".resty").removeClass("lily")
            $("#fee").val(100000)
            $("#fee_span").text(numberWithCommas(100000));
            //fetch guarannters
            fetchTempGuarantors();
        }
    });

    //guaranter functionality

    const validateGuarantor = () => {
        $("#guarantor_id").val() ? $(".g_select").addClass("d-none") : $(".g_select").removeClass("d-none");
        $("#g_amount").val() ? $(".g_amount").addClass("d-none") : $(".g_amount").removeClass("d-none")
        if ($("#guarantor_id").val() && $("#g_amount").val()) {
            return true;
        } else {
            return false;
        }
    }

    //empting guarantor inputs
    const emptyGuarantorInputs = () => {
            $("#guarantor_id").val("");
            $("#g_amount").val("");
        }
        //adding guantor
        // submitting loan request
    $(document).on("click", "#add-guarantor", function(e) {
        var guaranter_id = $("#guarantor_id").val()
        var g_amount = $("#g_amount").val().replace(/,/g, "");
        if (validateGuarantor()) {
            var guaranter_id = $("#guarantor_id").val();
            var g_amount = $("#g_amount").val().replace(/,/g, "");
            var submitData = {
                guaranter_id: parseInt(guaranter_id),
                g_amount: parseInt(g_amount)
            }
            e.preventDefault();
            var actionUrl = "create/guarantor";
            if ($("#add-guarantor").attr("btn-action") !== "save") {
                actionUrl = `edit/guarantor`;
                submitData.id = parseInt($("#add-guarantor").attr("btn-id"));
            }
            $("#add-guarantor").html("Submiting...").prop("disabled", true);
            $.when(postActions(actionUrl, submitData).done(response => {
                if (response.msg == "error") {
                    $(".g_vlidation").text("Amount is above guarator Limit");
                    if ($("#add-guarantor").attr("btn-action") !== "save") {
                        $("#add-guarantor").html(`<i class="fa fa-save"></i> Save Guarantor`).prop("disabled", false);
                    } else {
                        $("#add-guarantor").html(`<i class="fa fa-plus" aria-hidden="true"></i> Guarantor`).prop("disabled", false);
                    }
                } else {
                    $(".g_vlidation").text("");
                    fetchTempGuarantors(response);
                    emptyGuarantorInputs();
                    $("#add-guarantor").html(`<i class="fa fa-plus" aria-hidden="true"></i> Guarantor`).prop("disabled", false);
                    $("#add-guarantor").attr("btn-action", "save");
                    $("#add-guarantor").attr("btn-id", "0");
                }
            }).fail(error => {
                console.log(error);
            }));
        }
    });

    //rendering guaranter
    const renderTempGuarantors = (guaranters) => {
        $(".temp-guarantor").html("");
        var guaranterTotal = 0;
        guaranters.forEach(tempGuaranter => {
            guaranterTotal = parseInt(guaranterTotal) + parseInt(tempGuaranter.g_amount);
            $(".temp-guarantor").append(`
                <tr>
                    <td class="text-left"
                        style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                        ${tempGuaranter.user.name}
                    </td>
                    <td class="text-left"
                        style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                        ${numberWithCommas(tempGuaranter.g_amount)}
                    </td>
                    <td class="text-left"
                        style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                        ${numberWithCommas(tempGuaranter.due_amount*0.75)}
                    </td>
                    <td class="text-left"
                        style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                        <a name="" class="btn btn-sm btn-outline-primary edit-guarantor" href="#" data-id="${tempGuaranter.id}"
                        data-guarantor="${tempGuaranter.guarantor}|${tempGuaranter.user.name}" data-amount="${tempGuaranter.g_amount}"
                            role="button">
                            <i class="fa fa-edit"></i>
                        </a>
                        <a name="" class="btn btn-sm btn-outline-danger delete-guarantor" href="#"
                            role="button" data-id="${tempGuaranter.id}">
                            <i class="fa fa-trash" aria-hidden="true"></i>
                        </a>
                    </td>
                </tr>
            `)
        });
        var remainder = parseInt($("#loan_amount").val().replace(/,/g, "")) - parseInt($("#expected_loan").val()) - guaranterTotal;
        console.log(parseInt($("#loan_amount").val().replace(/,/g, "")), "-", parseInt($("#expected_loan").val()), "-", guaranterTotal)
        $(".temp-guarantor").append(`
            <tr>
                <th style="border-left: none; border-right: none;">Total Guaranteed
                </th>
                <th style="border-left: none; border-right: none;">
                    ${numberWithCommas(guaranterTotal)}</th>
                <th style="border-left: none; border-right: none;"></th>
                <th style="border-left: none; border-right: none;"></th>
            </tr>
            <tr>
                <th style="border-left: none; border-right: none; ">Not Guaranteed
                </th>
                <th style="border-left: none; border-right: none;">${numberWithCommas(remainder)} 
                    <small class="text-danger remainder-error"></small>
                </th>
                <input id="remainder-holder" type="hidden" value="${remainder}"/>
            </tr>
        `);
    }

    //fetching temp guaranters
    const fetchTempGuarantors = () => {
        $.when(getRequest("tempguarantor/fetch").done(response => {
            $(".temp-guarantor").html("");
            renderTempGuarantors(response);
        }).fail(error => {
            console.log(error);
        }))
    }

    $('#months_taken').change(function() {
        const loan = $('#loan_amount').val().replace(/,/g, "");
        const months = $('#months_taken').val();
        const fee = $('#fee').val();
        const expected = $('#expected').val();
        const final = (loan * Math.pow(1.05, months));
        value = parseFloat(parseInt(final)).toFixed(0);
        $("#return").val(value);
        $("#fee_return").text(numberWithCommas(value))

        //fetch arrears
        $.when(
            getRequest("/fetch/arrears")
            .done((response) => {
                var userArrears = parseInt(response.arrears);
                if(userArrears <= 0){
                    userArrears = 0;
                    $("#arrears_span").text("No Arrears");
                }else{
                    $("#arrears_span").text(numberWithCommas(userArrears));
                }
                const fees = parseInt($("#fee").val());
                $("#disburse_span").text(numberWithCommas(loan - fees - userArrears));
            })
            .fail((error) => {
                console.log(error);
            })
        );
    });
    //fetch arrears


    // submitting loan request
    $("#loan-form").submit(function(e) {
        e.preventDefault();
        var actionUrl = "loans/create";
        if ($("#loanrequest-btn").attr("btn-action") !== "save") {
            actionUrl = `loans/edit/${$("#loanrequest-btn").attr("data-id")}`;
        }
        const amount = $("#total-amount").val();
        const expected_amount = $("#expected_loan").val();
        const loanmount = parseInt($("#loan_amount").val().replace(/,/g, ""));
        if (loanmount > (2 * parseInt(amount))) {
            $(".loan-amount-validity").text("Amount should be below: " + numberWithCommas(2 * parseInt(amount)) + "UGX");
            $(window).scrollTop(0);
        } else {
            if ((parseInt($("#remainder-holder").val()) == 0 && expected_amount < loanmount) || (expected_amount >= loanmount)) {
                $("#loanrequest-btn").html("Submiting...").prop("disabled", true);
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
                    }).done((response) => {
                        window.location.reload();
                    })
                    .fail((error) => {
                        console.log(error);
                    });
            } else {
                $(".remainder-error").text(" : This amount is not guaranted, Please clear it before")
            }
        }
    });
    
    //editing guaranters
    $(document).on("click", ".edit-guarantor", function(e) {
        e.preventDefault();
        $("#guarantor_id").val($(this).attr("data-guarantor").split("|")[0]);
        $("#g_amount").val(numberWithCommas($(this).attr("data-amount")));
        $("#add-guarantor").html(`<i class="fa fa-save"></i> Save Guarantor`).prop("disabled", false);
        $("#add-guarantor").attr("btn-action", "edit");
        $("#add-guarantor").attr("btn-id", $(this).attr("data-id"));
    });

    //delete guaranters
    $(document).on("click", ".delete-guarantor", function(e) {
        e.preventDefault();
        const id = { "id": $(this).attr("data-id") }
        $.when(postActions("guarantor/delete", id).done(response => {
            fetchTempGuarantors();
            emptyGuarantorInputs();
            $("#add-guarantor").html(`<i class="fa fa-plus" aria-hidden="true"></i> Guarantor`).prop("disabled", false);
            $("#add-guarantor").attr("btn-action", "save");
            $("#add-guarantor").attr("btn-id", "0");
        }).fail(error => {
            console.log(error);
        }));
    });

    //declining guarantor request
    $(document).on("click", ".refuse-icon", function(e) {
        e.preventDefault();
        var cancelExp = {
            "id": parseInt($(this).attr("id-data"))
        }
        $.when(postActions("guarantor/decline", cancelExp).done(response => {
            if (response.msg.includes("Successful")) {
                window.location.reload();
            } else {
                console.log("error occured");
            }
        }).fail(error => {
            console.log(error);
        }))
    });

    //accepting guarantor request
    $(document).on("click", ".yes-icon", function(e) {
        e.preventDefault();
        console.log(parseInt($(this).attr("loan-data")));
        var acceptExp = {
            "id": parseInt($(this).attr("id-data")),
            "loans_id": parseInt($(this).attr("loan-data"))
        }
        $.when(postActions("guarantor/approve", acceptExp).done(response => {
            if (response.msg.includes("Successful")) {
                window.location.reload();
            } else {
                console.log("error occured");
            }
        }).fail(error => {
            console.log(error);
        }))
    });

    $(document).on("click", ".edit-btn", function(e) {
        e.preventDefault();
        //retrieve loan
        const sendData = {
            id: parseInt($(this).attr("data-id"))
        }
        $.when(
            postActions("/fetch/totalamountdue/", sendData)
            .done((response) => {
                $("#total-amount-span").text(numberWithCommas(response.total_amount) + " UGX");
                $("#total-amount").val(response.total_amount);
                const amount = $("#total-amount").val();
                $("#expected_loan_span").text(numberWithCommas((75 / 100) * parseInt(amount)) + " UGX");
                $("#expected_loan").val((75 / 100) * parseInt(amount));
                $(".loan_limit_span").text(numberWithCommas(2 * parseInt(amount)) + " UGX");
                $("#loan_limit").val(2 * parseInt(amount));
            })
            .fail((error) => {
                console.log(error);
            })
        );

        $.when(
            postActions("/details/loans", sendData)
            .done((response) => {
                $("#loan_amount").val(numberWithCommas(response.loanamount));
                $("#months_taken").val(response.monthstaken);
                $("#payment_mode").val(response.payment_mode);
                $("#reasondesc").val(response.desc);

                //displaying guarantors
                const loan = $("#loan_amount").val().replace(/,/g, "");
                const exp = $("#expected_loan").val();
                $("#loan_amount").removeAttr("max");
                if (loan < parseInt(exp)) {
                    $("#fee").val(20000);
                    $("#fee_span").text(numberWithCommas(20000));
                    $("#total-amount2").val(0)
                    $("#expected").val(0)
                    // $(".resty").addClass("lily");
                } else {
                    // $(".resty").removeClass("lily")
                    $("#fee").val(100000)
                    $("#fee_span").text(numberWithCommas(100000));

                    //fetch guarannters
                    fetchTempGuarantors();
                }

                // calculating fees and arreas
                const months = $('#months_taken').val();
                const final = (loan * Math.pow(1.05, months));
                value = parseFloat(parseInt(final)).toFixed(2);
                $("#return").val(value);
                $("#fee_return").text(numberWithCommas(value))

                //fetch arrears
                $.when(
                    getRequest("/fetch/arrears")
                    .done((arrearresponse) => {
                        const userArrears = parseInt(arrearresponse.arrears);
                        $("#arrears_span").text(numberWithCommas(userArrears));
                        const fees = parseInt($("#fee").val());;
                        $("#disburse_span").text(numberWithCommas(loan - fees - userArrears));
                    })
                    .fail((error) => {
                        console.log(error);
                    })
                );

                //setting editing button
                $("#loanrequest-btn").attr("btn-action", "edit")
                $("#loanrequest-btn").attr("data-id", response.id)
                $("#loanrequest-btn").html(`<i class="fa fa-save"></i> Save Loan Changes`);
                $("#loans").modal("show");
            })
            .fail((error) => {
                console.log(error);
            })
        );
    });

    //icon when clicked to delete loan
    $(document).on("click", ".delete-btn", function(e) {
        $("#confirm-delete-loans").modal("show");
        const delete_id = $(this).attr("data-id");
        $("#delete-confirm").attr("id-data", delete_id);
    });

    //when a delete button is clicked from the warning modal for loans
    $(document).on("click", "#delete-confirm", function(e) {
        e.preventDefault();

        //disabling button and changing html
        $(this)
            .prop("disabled", true)
            .html(`<i class="fa fa-spinner" aria-hidden="true"></i> Deleting...`);
        var data_delete = { id: $(this).attr("id-data") };
        $.when(
            postActions("loans/delete/confirmed", data_delete)
            .done((response) => {
                //returning button html and enabling it
                $("#deleteloan-confirm").attr("id-data", "");
                window.location.reload();
            })
            .fail((error) => {
                console.log(error);
            })
        );
    });

    //icon when clicked to Widraw loan
    $(document).on("click", ".widtraw-loan-btn", function(e) {
        $("#confirm-withdraw-loans").modal("show");
        const withdraw_loanfees = $(this).attr("data-loanfees");
        const withdraw_id = $(this).attr("data-id");
        $("#withdraw-confirm").attr("id-data", withdraw_id);
        $(".loan-fees").text(withdraw_loanfees + " UGX");
    });

    //icon when clicked to request to clear loan
    $(document).on("click", ".clear-loan-btn", function(e) {
        const loan_id = $(this).attr("data-id");
        $(this)
            .prop("disabled", true)
            .html(`<i class="fa fa-spinner" aria-hidden="true"></i> Requesting...`);
        var data_delete = { id: loan_id };
        
        $.when(
            postActions("loans/requestClearance", data_delete)
            .done((response) => {
                window.location.reload();
            })
            .fail((error) => {
                console.log(error);
            })
        );
    });

    //when a delete button is clicked from the warning modal for loans
    $(document).on("click", "#withdraw-confirm", function(e) {
        e.preventDefault();

        //disabling button and changing html
        $(this)
            .prop("disabled", true)
            .html(`<i class="fa fa-spinner" aria-hidden="true"></i> Withdrawing Loan...`);
        var data_withdraw = { id: $(this).attr("id-data") };
        $.when(
            postActions("loans/withdraw/confirmed", data_withdraw)
            .done((response) => {
                //returning button html and enabling it
                $("#withdraw-confirm").attr("id-data", "");
                window.location.reload();
            })
            .fail((error) => {
                console.log(error);
            })
        );
    });

    //status actions on the loan
    const loansStatusAction = (data) => {
        $.when(
            postActions("/loans/fetchactions", data)
            .done((response) => {
                window.location.reload();
            })
            .fail((error) => {
                console.log(error);
            })
        );
    }

    //recommending a loan by the finance
    $(document).on("click", ".recommend-finance-btn", function(e) {
        e.preventDefault();
        //disabling button and changing html
        $(this)
            .prop("disabled", true)
            .html(`<i class="fa fa-spinner" aria-hidden="true"></i> Recommending...`);
        var loans_id = $(this).attr("data-id");
        var reason = "no reason";
        var status = "recommended";
        const data = {
            loans_id,
            reason,
            status
        }
        loansStatusAction(data);
    });

    //Clarifying/Rerecommending a loan by the finance
    $('#rerecommend-loan').submit(function(e) {
        e.preventDefault();
        //disabling button and changing html
        $("#rerecommend-finance-btn")
            .prop("disabled", true)
            .html(`<i class="fa fa-spinner" aria-hidden="true"></i> Rerecommending...`);
        var loans_id = $("#rerecommend_id_holder").val();
        var reason = $("#finance_rerecommend_res").val();
        var status = "clarified";
        const data = {
            loans_id,
            reason,
            status
        }
        loansStatusAction(data);
    });

    //decline a loan by the finance
    $('#decline-loan').submit(function(e) {
        e.preventDefault();
        //disabling button and changing html
        $("#decline-finance-btn")
            .prop("disabled", true)
            .html(`<i class="fa fa-spinner" aria-hidden="true"></i> Declining...`);
        var loans_id = $("#decline_id_holder").val();
        var reason = $("#finance_decline_res").val();
        var status = "declined";
        const data = {
            loans_id,
            reason,
            status
        }
        loansStatusAction(data);
    });

    //accept a loan by the chairperson
    $(document).on("click", ".accept-chairperson-btn", function(e) {
        e.preventDefault();
        //disabling button and changing html
        $(this)
            .prop("disabled", true)
            .html(`<i class="fa fa-spinner" aria-hidden="true"></i> Accepting...`);
        var loans_id = $(this).attr("data-id");
        var reason = "no reason";
        var status = "approved";
        const data = {
            loans_id,
            reason,
            status
        }
        loansStatusAction(data);
    });

    //Decline/request for clarification of a loan by the Chairperson
    $('#chair-decline-loan').submit(function(e) {
        e.preventDefault();
        //disabling button and changing html
        $("#decline-chairperson-btn")
            .prop("disabled", true)
            .html(`<i class="fa fa-spinner" aria-hidden="true"></i> Declining...`);
        var loans_id = $("#decline_id_holder").val();
        var reason = $("#chairperson_decline_res").val();
        var status = "clarify";
        const data = {
            loans_id,
            reason,
            status
        }
        loansStatusAction(data);
    });

    //seting up the image viewer whn check is select.
    $("#check-holder").attr("src", "")




    const fetchPendingloan = () => {
        var monthData = { "date": ($("#monthloan").val()) }
        $.when(postActions("fetch/pendingloan", monthData).done(response => {
            renderPendingloan(response.loans);
            $(".borrow").html(`${numberWithCommas(response.borrow)}`);
            $(".runningloan").html(`${numberWithCommas(response.runningloan)}`);
            $(".saved").html(`${numberWithCommas(response.saved)}`);
        }).fail(error => {
            console.log(error);
        }))
    }
    fetchPendingloan();
    const renderPendingloan = loansData => {
        $(".pendingloan-tbody").html("");

        loansData.forEach(loan => {
            return $(".pendingloan-tbody").append(`
                        <tr>
                            <td>
                                <div class="d-flex align-items-center">
                                    <div class="">
                                        <h4 class="m-b-0 font-14">
                                            ${loan.desc}
                                            ${(loan.status === "pending")&&(loan.reason !== "not cancelled")? 
                                                '<br><strong class="text-muted" style="font-size: 12px;">Chairman Reason:</strong><br><I class="text-muted" style="font-size: 12px;">'+loan.reason+'<I/>': ' '}
                                        </h4>
                                    </div>
                                </div>
                            </td>
                            <td><span class="font-14">${numberWithCommas(loan.loanamount)}</span></td>
                            <td><span class="font-14">${loan.monthstaken}</span></td>
                            <td><span class="font-14">${numberWithCommas(loan.processingfee)}</span></td>
                            <td><span class="font-14">${numberWithCommas(loan.return)}</span></td>
                            
                            <td><span class="font-14">${loan.name}</span></td>
                            <td><span class="font-14">${loan.fwpnumber}</span></td>
                            <td><span class="font-14">${loan.last_payment}</span></td>
                            <td><span class="font-14">${loan.created_at}</span></td>
                            <td>
                                ${(loan.status === "pending")&&(loan.reason !== "not cancelled")? 
                                '<span class="label label-rounded label-danger">Declined</span>':
                                '<span class="label label-rounded label-primary">'+loan.status+'</span>'}
                            </td>
                            <td>
                                <span class="loanaction-icons">
                                    ${(loan.status === "pending")&&(loan.reason !== "not cancelled") ? 
                                    '<a style="color: #00ff9f" href="#" class="reco-again" id-data="'+loan.id+'"><i class="ti-heart"></i></a>' : 
                                    '<a style="color: #00ff9f" href="#" class="reco-icon" id-data="'+loan.id+'"><i class="ti-heart"></i></a>'} | 
                                    <a style="color: #e86060;" href="#" class="declin-icon" id-data="${loan.id}"><i class="mdi mdi-block-helper"></i></a>
                                </span>
                            </td>
                        </tr>
                    `)
        });
    }
    $(".pendingLoan").change(function() {
        $.when(postActions("fetch/pendingloan", { "date": ($(this).val()) }).done(response => {
            renderPendingloan(response.loans);
            $(".borrow").html(`${numberWithCommas(response.borrow)}`);
            $(".runningloan").html(`${numberWithCommas(response.runningloan)}`);
            $(".saved").html(`${numberWithCommas(response.saved)}`);
        }).fail(error => {
            console.log(error);
        }))
    });

    $(document).on("click", ".reco-icon", function(e) {
        e.preventDefault();
        var recomLoan = {
            "id": $(this).attr("id-data"),
            "loanaction": "recommend",
            "reason": "not cancelled",
            "reasoner": $("deny-text").attr("user")
        }
        $.when(postActions("fetchactions", recomLoan).done(response => {
            fetchPendingloan();
        }).fail(error => {
            console.log(error);
        }))
    });

    $(document).on("click", ".reco-again", function(e) {
        e.preventDefault();
        $("#deny-text").attr("loan-id", $(this).attr("id-data"));
        $("#deny-text").attr("user", "rerecommend");
        $("#loandeclineTitle").html("Reason for recommending the loan again")
        $(".loandecliner").html('<i class="ti-check color-success"></i> Re-recommend');
        $("#declinereason").modal("show");
    })

    $(document).on("click", ".declin-icon", function(e) {
        e.preventDefault();
        $("#deny-text").attr("loan-id", $(this).attr("id-data"));
        $("#loandeclineTitle").html("Reason for declining loan")
        $(".loandecliner").html('<i class="mdi mdi-block-helper"></i> Decline');
        $("#declinereason").modal("show");

    });
    //submitting reason
    $('#loanreason-form').submit(function(e) {
        e.preventDefault();
        var status = "declined";
        switch ($("#deny-text").attr("user")) {
            case 'chairman':
                status = "pending"
                break;
            case 'rerecommend':
                status = "recommend"
                break;
            default:
                break;
        }
        var actionLoan = {
            "id": $("#deny-text").attr("loan-id"),
            "loanaction": status,
            "reason": $("#deny-text").val()
        }
        $.when(postActions("fetchactions", actionLoan).done(response => {
            fetchPendingloan();
            fetchRecoLoan();
            $("#deny-text").val(" ");
            $("#declinereason").modal("hide");
        }).fail(error => {
            console.log(error);
        }))
    })

    const fetchRecoLoan = () => {
        var monthData = { "date": ($("#monthloan").val()) }
        $.when(postActions("fetchRecoLoan", monthData).done(response => {
            renderRecoLoan(response);
        }).fail(error => {
            console.log(error);
        }))
    }
    fetchRecoLoan();
    const renderRecoLoan = loansData => {
        $(".recommendedloan-tbody").html("");
        loansData.forEach(loan => {
            return $(".recommendedloan-tbody").append(`
                        <tr>
                            <td>
                                <div class="d-flex align-items-center">
                                    <div class="">
                                        <h4 class="m-b-0 font-14">
                                            ${loan.desc}
                                            ${(loan.status === "recommend")&&(loan.reason !== "not cancelled")? 
                                                '<br><strong class="text-muted" style="font-size: 12px;">Treasurer Reason:</strong><br><I class="text-muted" style="font-size: 12px;">'+loan.reason+'<I/>': ' '}
                                        </h4>
                                    </div>
                                </div>
                            </td>
                            <td><span class="font-14">${numberWithCommas(loan.loanamount)}</span></td>
                            <td><span class="font-14">${loan.monthstaken}</span></td>
                            <td><span class="font-14">${numberWithCommas(loan.processingfee)}</span></td>
                            <td><span class="font-14">${numberWithCommas(loan.return)}</span></td>
                            <td><span class="font-14">${loan.name}</span></td>
                            <td><span class="font-14">${loan.fwpnumber}</span></td>
                            <td><span class="font-14">${loan.last_payment}</span></td>
                            <td><span class="font-14">${loan.created_at}</span></td>
                            <td><span class="label label-rounded label-warning">${loan.status}</span></td>
                            <td>
                                <span class="action-icons">
                                    <a href="#" class="approveloan-icon" id-data="${loan.id}">Approve</a> | 
                                    <a style="color: #e86060;" href="#" class="declineloan-admin" id-data="${loan.id}">Decline</a>
                                </span>
                            </td>
                        </tr>
                    `)
        });
    }
    $(".recoLoan").change(function() {
        $.when(postActions("fetchRecoLoan", { "date": ($(this).val()) }).done(response => {
            renderRecoLoan(response);
        }).fail(error => {
            console.log(error);
        }))
    });

    $(document).on("click", ".declineloan-admin", function(e) {
        e.preventDefault();
        $("#deny-text").attr("loan-id", $(this).attr("id-data"));
        $("#deny-text").attr("user", "chairman");
        $("#declinereason").modal("show");
    })


    $(document).on("click", ".approveloan-icon", function(e) {
        e.preventDefault();
        var acceptLoan = {
            "id": $(this).attr("id-data"),
            "loanaction": "approved",
            "reason": "not cancelled",
            "reasoner": $("deny-text").attr("user")
        }
        $.when(postActions("fetchactions", acceptLoan).done(response => {
            fetchRecoLoan();
        }).fail(error => {
            console.log(error);
        }))
    });

    const fetchAllLoans = () => {
        var monthData = { "date": ($("#monthloan").val()) }
        $.when(postActions("fetch/loans", monthData).done(response => {
            renderAllLoans(response.loans);
            $(".year_total").html(`${numberWithCommas(response.totalYear)} UGX`);
            $(".month_total").html(`${numberWithCommas(response.totalMonth)} UGX`);
        }).fail(error => {
            console.log(error);
        }))
    }
    fetchAllLoans();
    const renderAllLoans = loansData => {
        $(".allLoans-tbody").html("");
        loansData.forEach(loan => {
            var lastpay = loan.last_payment;
            var current = $("#hiddendate").val();
            var spanCla;
            switch (loan.status) {
                case 'approved':
                    if (current >= lastpay) {
                        spanCla = "label label-rounded label-danger"
                    } else {
                        spanCla = "label label-rounded label-success"
                    }
                    break;
                default:
                    break;
            }
            return $(".allLoans-tbody").append(`
                        <tr>
                            <td>
                                <div class="d-flex align-items-center">
                                    <div class="">
                                        <h4 class="m-b-0 font-14">${loan.desc}</h4>
                                    </div>
                                </div>
                            </td>
                            <td><span class="font-14">${numberWithCommas(loan.loanamount)}</span></td>
                            <td><span class="font-14">${loan.monthstaken}</span></td>
                            <td><span class="font-14">${numberWithCommas(loan.processingfee)}</span></td>
                            <td><span class="font-14">${numberWithCommas(loan.return)}</span></td>
                            <td><span class="font-14">${loan.name}</span></td>
                            <td><span class="font-14">${loan.fwpnumber}</span></td>
                            <td><span class="font-14">${loan.last_payment}</span></td>
                            <td><span class="font-14">${loan.created_at}</span></td>
                            <td><span class="${spanCla}">${loan.status}</span></td>
                            
                            <td>
                                <span class="clear-icons">
                                    ${(loan.status === 'approved')? '<a href="#" class="cleared-icon" id-data="'+loan.id+'" g-data="'+loan.name_quarantor+'" seize-data="'+loan.seize+'" loan-data="'+loan.loanamount+'" lastloan-data="'+loan.last_payment+'" loanreturn-data="'+loan.return+'" lastmonth-data="'+loan.monthstaken+'"><i class="ti-check color-success"></i></a> ':' '}
                                </span>
                            </td>
                        </tr>
                    `)
        });
    }
    $(".allLoan").change(function() {
        $.when(postActions("fetch/loans", { "date": ($(this).val()) }).done(response => {
            renderAllLoans(response.loans);
            $(".year_total").html(`${numberWithCommas(response.totalYear)}`);
            $(".month_total").html(`${numberWithCommas(response.totalMonth)}`);
        }).fail(error => {
            console.log(error);
        }))
    })
    $(document).on("click", ".cleared-icon", function(e) {
        e.preventDefault();
        var current = $("#hiddendate").val();
        var lastpayment = $("#update_lastpayment").val($(this).attr("lastloan-data"));
        console.log(lastpayment.val())
        console.log(current)
        $("#update_lastpayment").val($(this).attr("lastloan-data"));
        $("#update_loanamount").val($(this).attr("loan-data"));
        $("#update_return").val($(this).attr("loanreturn-data"));
        $(".guarantor").val($(this).attr("g-data"));
        var guar = $(".guarantor").val($(this).attr("g-data"));
        console.log(guar.val())
        if (guar.val() !== "NONE") {
            // $(".yesguar").removeClass("noguar");
            $("#seize").val($(this).attr("seize-data"))
        }
        $("#updatemonths_taken").val($(this).attr("lastmonth-data"));
        $(".loanupdater").attr("update-id", $(this).attr("id-data"));
        $("#update").modal("show");
    });


    //submitting updates
    $('#update-form').submit(function(e) {
        e.preventDefault();
        var clearLoan = {
            "id": $(".loanupdater").attr("update-id"),
            "updatemonths_taken": $("#updatemonths_taken").val(),
            "update_return": $("#update_return").val(),
            "seize": $("#seize").val(),
        }
        $.when(postActions("cleared", clearLoan).done(response => {
            fetchAllLoans();
            // $("#deny-text").val(" ");
            $("#update").modal("hide");
            // $(".yesguar").addClass("noguar");
        }).fail(error => {
            console.log(error);
        }))
    })

    $('#updatemonths_taken').change(function() {
        const loan = $('#update_loanamount').val();
        const months = $('#updatemonths_taken').val();
        const final = loan * Math.pow(1.05, months);
        console.log(final)
        parseFloat(final).toFixed(2);
        value = parseFloat(final).toFixed(2);
        $("#update_return").val(value);
        console.log(value)


    });


    const fetchClearedLoans = () => {
        var monthData = { "date": ($("#monthloan").val()) }
        $.when(postActions("fetch/cleared", monthData).done(response => {
            renderClearedLoans(response.loans);
            $(".year_total").html(`${numberWithCommas(response.totalYear)} UGX`);
            $(".month_total").html(`${numberWithCommas(response.totalMonth)} UGX`);
        }).fail(error => {
            console.log(error);
        }))
    }
    fetchClearedLoans();
    const renderClearedLoans = loansData => {
        $(".ClearedLoans-tbody").html("");
        loansData.forEach(loan => {
            return $(".ClearedLoans-tbody").append(`
                        <tr>
                            <td>
                                <div class="d-flex align-items-center">
                                    <div class="">
                                        <h4 class="m-b-0 font-14">${loan.desc}</h4>
                                    </div>
                                </div>
                            </td>
                            <td><span class="font-14">${numberWithCommas(loan.loanamount)}</span></td>
                            <td><span class="font-14">${loan.monthstaken}</span></td>
                            <td><span class="font-14">${numberWithCommas(loan.processingfee)}</span></td>
                            <td><span class="font-14">${numberWithCommas(loan.return)}</span></td>
                            <td><span class="font-14">${loan.name_quarantor}</span></td>
                            <td><span class="font-14">${numberWithCommas(loan.g_amount)}</span></td>
                            <td><span class="font-14">${loan.name}</span></td>
                            <td><span class="font-14">${loan.fwpnumber}</span></td>
                            <td><span class="font-14">${loan.created_at}</span></td>
                            <td><span class="label label-rounded label-success">${loan.status}</span></td>
                        </tr>
                    `)
        });
    }
    $(".ClearedLoan").change(function() {

        $.when(postActions("fetch/cleared", { "date": ($(this).val()) }).done(response => {
            renderClearedLoans(response.loans);
            $(".year_total").html(`${numberWithCommas(response.totalYear)}`);
            $(".month_total").html(`${numberWithCommas(response.totalMonth)}`);
        }).fail(error => {
            console.log(error);
        }))
    });

    //fetch departure details
    $("#member_depart").change(function() {
        $.when(postActions("fetch/cleared", { "date": ($(this).val()) }).done(response => {
            renderClearedLoans(response.loans);
            $(".year_total").html(`${numberWithCommas(response.totalYear)}`);
            $(".month_total").html(`${numberWithCommas(response.totalMonth)}`);
        }).fail(error => {
            console.log(error);
        }))
    });
});