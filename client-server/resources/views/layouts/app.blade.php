<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('images/logo.jpg') }}">
    <title>Friends With a Purpose</title>
    <style type="text/css">
        .left-sidebar li a:hover {
            text-decoration: none;
        }

        .left-sidebar {
            overflow-x: hidden;
        }

        .stat {
            text-align: center;
        }

        .page {
            margin: 0 auto !important;
        }

        th,
        td {
            border: solid thin;
            padding: 0.5rem;
        }

        #btn {
            font-size: 12;
        }

        #loan {
            font-size: 12;
            font-style: bold;
            text-align: center;
        }

        /* table {
            margin: 0 auto;
            border: 1px solid black;
            border-collapse: collapse;
            border-bottom: 1px solid black;
        }

        table thead tr th {
            border-bottom: 1px solid rgb(253, 229, 229);
        }

        table tbody tr td {
            border-bottom: 1px solid black;

        } */

        .Exp {
            color: #800020 !important;
        }

        #par {
            border: 2px solid black;
        }

        .lily {
            display: none;
        }

        .nopayout {
            display: none;
        }

        .noname {
            display: none;
        }

        .noloanpdfname {
            display: none;
        }

        .nomembername {
            display: none;
        }

        .nopdfname {
            display: none;
        }

        .noguar {
            display: none;
        }

        .notification {
            /* background-color: #555; */
            /* color: white; */
            text-decoration: none;
            padding: 8px 15px;
            position: relative;
            display: inline-block;
            border-radius: 2px;
        }

        /* .notification:hover {
        background: red;
        } */

        .notification .badge3 {
            display: none;
        }

        .notification .badge2 {
            /* display: none; */
            position: absolute;
            top: 0px;
            right: 0px;
            padding: 3px 8px;
            border-radius: 25%;
            background: red;
            color: white;
        }

        /*New*/
        .card-box {
            position: relative;
            color: #fff;
            padding: 20px 10px 40px;
            margin: 20px 0px;
            box-shadow: 0 10px 10px rgb(0 0 0 / 41%);
        }

        .card-box:hover {
            text-decoration: none;
            color: #f1f1f1;
        }

        .card-box:hover .icon i {
            font-size: 72px;
            transition: 1s;
            -webkit-transition: 1s;
        }

        .card-box .inner {
            padding: 5px 10px 0 10px;
        }

        .card-box h3 {
            font-size: 20px;
            font-weight: bold;
            margin: 0 0 8px 0;
            white-space: nowrap;
            padding: 0;
            text-align: left;
            color: black;
        }

        .card-box p {
            font-size: 15px;
            color: #000;
        }

        .card-box .icon {
            position: absolute;
            top: 26px;
            bottom: 5px;
            right: 5px;
            z-index: 0;
            font-size: 52px;
            color: rgba(0, 0, 0, 0.200);
        }

        .card-box .card-box-footer {
            position: absolute;
            left: 0px;
            bottom: 0px;
            text-align: center;
            padding: 3px 0;
            color: #fff;
            background: #EC8B39;
            width: 100%;
            text-decoration: none;
        }

        .card-box:hover .card-box-footer {
            background: rrgba(0, 0, 0, 0.1);
        }

        .bg-blue {
            background-color: #fff !important;
        }

        .bg-green {
            background-color: #00a65a !important;
        }

        .bg-orange {
            background-color: #f39c12 !important;
        }

        .bg-red {
            background-color: #d9534f !important;
        }

        .card {
            border-radius: 12px;
            box-shadow: 0 6px 10px -4px rgb(0 0 0 / 15%);
            background-color: #fff;
            color: #252422;
            margin-bottom: 20px;
            position: relative;
            border: 0 none;
            transition: transform .3s cubic-bezier(.34, 2, .6, 1), box-shadow .2s ease;
        }

        .card-tasks {
            text-align: left;
        }

    </style>
    <?php
    echo ' 
                                                                    <script>
                                                                    function addCommas(x) {
                                                                        //remove commas
                                                                        retVal = x ? parseFloat(x.replace(/,/g, \'\')) : 0;
                                                                
                                                                        //apply formatting
                                                                        return retVal.toString().replace(/\\B(?=(\\d{3})+(?!\\d))/g, ",");
                                                                    }
                                                                    </script>';
    ?>
    <!-- Custom CSS -->
    <link href="{{ asset('assets/libs/chartist/dist/chartist.min.css') }}" rel="stylesheet">
    <link href="{{ asset('dist/css/style.min.css') }}" rel="stylesheet">
    <link href="{{ asset('vendor/bootstrap-datepicker/css/bootstrap-datepicker.min.css') }}" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-notify/0.2.0/css/bootstrap-notify.css">
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/toastr.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/custom.css') }}" rel="stylesheet">
    {{-- @stack('styles') --}}
    <link href="{{ asset('/css/loan_request.css') }}" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.1/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.0.0/css/buttons.dataTables.min.css">
</head>

<body class="text-decoration-none">
    <div id="app">
        {{-- <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div> --}}
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
            data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
            <header class="topbar" data-navbarbg="skin5">
                <nav class="navbar top-navbar fixed-top navbar-expand-md navbar-dark">
                    <div class="navbar-header" data-logobg="skin5" style="background-color: #ec8b39">
                        <a class="navbar-brand" href="{{ route('home') }}?">
                            <b class="logo-icon">
                                <img height="60px" src="{{ asset('images/logo.jpg') }}" alt="logo" />
                            </b>
                            <span class="font-14">Friends With a Purpose</span>
                        </a>
                        <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i
                                class="ti-menu ti-close"></i></a>
                    </div>
                    <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5"
                        style="background-color: #ec8b39">
                        <ul class="navbar-nav float-left mr-auto">
                            <li class="nav-item search-box"> <a class="nav-link waves-effect waves-dark"
                                    href="javascript:void(0)"><i class="ti-search"></i></a>
                                <form class="app-search position-absolute">
                                    <input type="text" class="form-control" placeholder="Search &amp; enter"> <a
                                        class="srh-btn"><i class="ti-close"></i></a>
                                </form>
                            </li>
                        </ul>
                        <ul class="navbar-nav float-right">
                            <li class="nav-item dropdown">
                                <a class="logout" href="{{ route('logout') }}" onclick="event.preventDefault();
                                    document.getElementById('logout-form').submit();">
                                    <i class="fa fa-power-off m-r-5 m-l-5"></i> Logout
                                </a>
                                <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                    style="display: none;">
                                    @csrf
                                </form>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>

            <main>

                @include('layouts.modal')

                <div class="row" style="margin-right:15px;">
                    {{-- @unless(isset($noSideBar)) --}}
                    <div class="col-md-3 col-sm-12 col-sx-12">
                        @include('layouts.side')
                    </div>
                    {{-- @endunless --}}
                </div>
                <div class='notifications top-right'></div>
                @yield('content')
                @include('layouts.footer')
            </main>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/buttons/2.0.0/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.html5.min.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.print.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-notify/0.2.0/js/bootstrap-notify.js"></script>
        <script src="{{ asset('vendor/bootstrap-notify/bootstrap-notify.min.js') }}"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.1.0/echarts-en.common.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <!-- Bootstrap tether Core JavaScript -->
        <script src="{{ asset('assets/libs/popper.js/dist/umd/popper.min.js') }}"></script>
        <script src="{{ asset('assets/libs/bootstrap/dist/js/bootstrap.min.js') }}"></script>
        <script src="{{ asset('dist/js/app-style-switcher.js') }}"></script>
        <script src="{{ asset('vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js') }}"></script>
        @yield('dynamic-js')

        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function() {
                $('#example').DataTable({
                    dom: 'Bfrtip',
                    buttons: [
                        'copy', 'csv', 'excel', 'pdf', 'print'
                    ]
                });
                //setting up month inputs
                const setMonth = () => {
                    var d = new Date();
                    var currentMonth;
                    (d.getMonth() + 1) >= 10 ?
                        currentMonth = (d.getMonth() + 1) :
                        currentMonth = "0" + (d.getMonth() + 1);
                    $("#month").val(d.getFullYear() + "-" + currentMonth);
                    $("#year").val(d.getFullYear());
                    // console.log("month set");
                }
                setMonth();

                // setMonth();
                // function setMonth() {
                //     var d = new Date()
                //     var currentMonth
                //     (d.getMonth() + 1) >= 10 ?
                //         currentMonth = (d.getMonth() + 1) :
                //         currentMonth = "0" + (d.getMonth() + 1);
                //     $(".month").val(d.getFullYear() + "-" + currentMonth);
                //     $(".month-all").val(d.getFullYear() + "-" + currentMonth);
                //     $(".cancel-month").val(d.getFullYear() + "-" + currentMonth);
                // }
                //Empty inputs
                const emptyInputs = () => {
                    $("#desc").val("");
                    $("#budget").val("");
                    $("#reason-text").val("");
                }

                //Get function request
                const getRequest = url => {
                    return $.ajax({
                        url: url,
                        type: "get",
                        dataType: "json"
                    });
                };

                // //check for connectivity
                // setInterval(() => {
                //     $.when(getRequest("check").then(response => {}).fail(error => {
                //         $(".connection-check").html("Your may be disconnected from internet");
                //     }))
                // }, 6000);

                //setting up commas in budget
                const numberWithCommas = (number) => {
                    var parts = number.toString().split(".");
                    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    return parts.join(".");
                }

                //post function request
                const postActions = (actionUrl, sendData) => {
                    return $.ajax({
                        url: actionUrl,
                        type: "post",
                        data: JSON.stringify(sendData),
                        dataType: 'json',
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        contentType: "application/json",
                        cache: false,
                        processData: false,
                    });
                }

                //closing modal
                $(document).on("click", ".modal-close", e => {
                    emptyInputs();
                    $("#request-btn").attr("btn-action", "save").html('<i class="mdi mdi-check"></i> Request');
                })

                //User activation/Deactivation/reset Password actions
                $(document).on("click", ".action", function() {
                    var initialUrl = "status/actions";
                    var action;
                    switch ($(this).attr('btn-action')) {
                        case "activate":
                            action = {
                                "id": $(this).attr('data-id'),
                                "action": "Activated"
                            }
                            break;
                        case "deactivate":
                            action = {
                                "id": $(this).attr('data-id'),
                                "action": "Deactivated"
                            }
                            break;
                        case "newactivate":
                            action = {
                                "id": $(this).attr('data-id'),
                                "action": "NewActivate"
                            }
                            break;
                        case "reset":
                            initialUrl = "reset";
                            action = {
                                "id": $(this).attr('data-id')
                            }
                            break;

                        default:
                            break;
                    }

                    $.when(postActions(initialUrl, action).done(response => {
                        location.reload();
                    }).fail(error => {
                        $(".alert-danger").removeClass("d-none");
                        console.log(error)
                    }))
                })

                // $('#pdf-year').datepicker({
                //     minViewMode: 'years',
                //     autoclose: true,
                //     format: 'yyyy'
                // });

                // $('.top-right').notify({
                //     message: { text: "Hello its working" }
                // }).show();

                $('#profile-form').submit(function(e) {
                    e.preventDefault();
                    var actionUrl = "edit/profile";
                    $('#profile-btn').html('Submiting...');
                    $("#profile-btn").prop('disabled', true);
                    $.ajax({
                            url: actionUrl,
                            type: "post",
                            data: new FormData(this),
                            dataType: 'json',
                            headers: {
                                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                            },
                            contentType: false,
                            cache: false,
                            processData: false,
                        })
                        .done(response => {
                            $('#profile-btn').html('Update Profile');
                            $("#profile-btn").prop('disabled', false);
                            location.reload();
                        })
                        .fail(error => {
                            console.log(error);
                        });
                });

                // submitting an expense
                $('#expense-form').submit(function(e) {
                    e.preventDefault();
                    var actionUrl = "expense";
                    if ($("#request-btn").attr("btn-action") !== "save") {
                        actionUrl = `expenses/edit/${$("#request-btn").attr("btn-id")}`;
                    }
                    $('#request-btn').html('Submiting...');
                    $("#request-btn").prop('disabled', true);
                    $.ajax({
                            url: actionUrl,
                            type: "post",
                            data: new FormData(this),
                            dataType: 'json',
                            headers: {
                                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                            },
                            contentType: false,
                            cache: false,
                            processData: false,
                        })
                        .done(response => {
                            fetchExpenses();
                            $(expenses).modal("hide");
                            emptyInputs();
                            $('#request-btn').html('<i class="mdi mdi-check"></i> Request').attr(
                                "btn-action", "save");
                            $("#request-btn").prop('disabled', false);
                        })
                        .fail(error => {
                            console.log(error);
                        });
                });

                const fetchExpenses = () => {
                    var monthData = {
                        "date": ($("#month").val())
                    }
                    $.when(postActions("expenses/fetch", monthData).done(response => {
                        renderExpenses(response);
                    }).fail(error => {
                        console.log(error);
                    }))
                }
                fetchExpenses();
                $(".fetchExp").change(function() {
                    $.when(postActions("expenses/fetch", {
                        "date": ($(this).val())
                    }).done(response => {
                        renderExpenses(response);
                    }).fail(error => {
                        console.log(error);
                    }))
                });

                const renderExpenses = expensesData => {
                    $(".expenses-tbody").html("");
                    expensesData.forEach(expense => {
                        var spanClass;
                        switch (expense.status) {
                            case 'pending':
                                spanClass = "label label-rounded label-primary"
                                break;
                            case 'approved':
                                spanClass = "label label-rounded label-success"
                                break;
                            case 'declined':
                                spanClass = "label label-rounded label-danger"
                                break;
                            case 'recommend':
                                spanClass = "label label-rounded label-warning"
                                break;
                            default:
                                break;
                        }
                        return $(".expenses-tbody").append(`
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="">
                                            <h4 class="m-b-0 font-14">
                                                ${expense.desc}
                                                ${(expense.status === "declined") ? '<br><strong class="text-muted" style="font-size: 12px;">Reason:</strong><br><I class="text-muted" style="font-size: 12px;">'+expense.reason+'<I/>': ' '}
                                            </h4>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="font-14">${numberWithCommas(expense.budget)}</span></td>
                                <td><span class="font-14">${expense.name}</span></td>
                                <td><span class="font-14">${expense.created_at}</span></td>
                                <td><span class="${spanClass}">${expense.status}</span></td>
                                <td>
                                    <span class="action-icons">
                                        ${(expense.status === 'pending') ? '<a href="#" class="edit-icon" disabled id-data="'+expense.id+'" budget-data="'+expense.budget+'" desc-data="'+expense.desc+'"><i class="ti-pencil-alt"></i></a> | ': '__'}
                                        ${(expense.status === 'pending') ? '<a href="#" class="delete-icon" id-data="'+expense.id+'"><i class="fa fa-trash color-danger" aria-hidden="true"></i></a> | ': ' '}
                                    </span>
                                </td>
                            </tr>
                        `)
                    });
                }

                $(document).on("click", ".edit-icon", function(e) {
                    e.preventDefault();
                    $("#budget").val($(this).attr("budget-data"));
                    $("#desc").val($(this).attr("desc-data"));
                    $("#request-btn").attr("btn-action", "edit").html('<i class="fa fa-save"></i> Save Changes')
                        .attr("btn-id", $(this).attr('id-data'));
                    $("#expenses").modal("show");
                });

                // $(document).on("click", ".delete-icon", function(e) {
                //     e.preventDefault();
                //     var deleteExp = {"id": $(this).attr("id-data")}
                //     $.when(postActions("expenses/delete", deleteExp).done(response => {
                //         fetchExpenses();
                //     }).fail(error => {
                //         console.log(error);
                //     }));
                // });



                //icon when clicked to delete loan
                $(document).on("click", ".delete-icon", function(e) {
                    $("#delete-alert-expenses").modal("show");
                    $("#deleteExpense-confirm").attr("id-data", $(this).attr("id-data"));
                });

                //when a delete button is clicked from the warning modal for loans
                $(document).on("click", "#deleteExpense-confirm", function(e) {
                    e.preventDefault();

                    //disabling button and changing html
                    $(this)
                        .prop("disabled", true)
                        .html(`<i class="fa fa-spinner" aria-hidden="true"></i> Deleting...`);
                    var deleteExp = {
                        id: $(this).attr("id-data")
                    };
                    $.when(
                        postActions("expenses/delete", deleteExp)
                        .done((response) => {
                            fetchExpenses();

                            //closing modal
                            $("#delete-alert-expenses").modal("hide");

                            //returning button html and enabling it
                            $(this)
                                .prop("disabled", false)
                                .html(
                                    `<i class="fa fa-trash" aria-hidden="true"></i> Confirm Delete`
                                );
                            $("#deleteExpense-confirm").attr("id-data", "");
                        })
                        .fail((error) => {
                            console.log(error);
                        })
                    );
                });





                $(document).on("click", ".recommend-icon", function(e) {
                    e.preventDefault();
                    var recomExp = {
                        "id": $(this).attr("id-data"),
                        "action": "recommend",
                        "reason": "not cancelled",
                        "reasoner": $("reason-text").attr("user")
                    }
                    $.when(postActions("actions", recomExp).done(response => {
                        fetchPendingExp();
                    }).fail(error => {
                        console.log(error);
                    }))
                });

                $(document).on("click", ".recommend-again", function(e) {
                    e.preventDefault();
                    $("#reason-text").attr("exp-id", $(this).attr("id-data"));
                    $("#reason-text").attr("user", "rerecommend");
                    $("#reasonTitle").html("Reason for recommending the expense again")
                    $(".decliner").html('<i class="ti-check color-success"></i> Re-recommend');
                    $("#reason").modal("show");
                })

                $(document).on("click", ".decline-icon", function(e) {
                    e.preventDefault();
                    $("#reason-text").attr("exp-id", $(this).attr("id-data"));
                    $("#reasonTitle").html("Reason for declining expense")
                    $(".decliner").html('<i class="mdi mdi-block-helper"></i> Decline');
                    $("#reason").modal("show");
                });

                $(document).on("click", ".decline-admin", function(e) {
                    e.preventDefault();
                    $("#reason-text").attr("exp-id", $(this).attr("id-data"));
                    $("#reason-text").attr("user", "chairman");
                    $("#reason").modal("show");
                })

                //submitting reason
                $('#reason').submit(function(e) {
                    e.preventDefault();
                    var status = "declined";
                    switch ($("#reason-text").attr("user")) {
                        case 'chairman':
                            status = "pending"
                            break;
                        case 'rerecommend':
                            status = "recommend"
                            break;
                        default:
                            break;
                    }
                    var actionExp = {
                        "id": $("#reason-text").attr("exp-id"),
                        "action": status,
                        "reason": $("#reason-text").val()
                    }
                    $.when(postActions("actions", actionExp).done(response => {
                        fetchPendingExp();
                        fetchRecoExp();
                        $("#reason-text").val(" ");
                        $("#reason").modal("hide");
                    }).fail(error => {
                        console.log(error);
                    }))
                })

                $(document).on("click", ".approve-icon", function(e) {
                    e.preventDefault();
                    var acceptExp = {
                        "id": $(this).attr("id-data"),
                        "action": "approved",
                        "reason": "not cancelled",
                        "reasoner": $("reason-text").attr("user")
                    }
                    $.when(postActions("actions", acceptExp).done(response => {
                        fetchRecoExp();
                    }).fail(error => {
                        console.log(error);
                    }))
                });

                const fetchPendingExp = () => {
                    var monthData = {
                        "date": ($("#month").val())
                    }
                    $.when(postActions("fetch/pending", monthData).done(response => {
                        renderPendingExp(response);
                    }).fail(error => {
                        console.log(error);
                    }))
                }
                fetchPendingExp();
                const renderPendingExp = expensesData => {
                    $(".pending-tbody").html("");
                    expensesData.forEach(expense => {
                        return $(".pending-tbody").append(`
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="">
                                            <h4 class="m-b-0 font-14">
                                                ${expense.desc}
                                                ${(expense.status === "pending")&&(expense.reason !== "not cancelled")? 
                                                    '<br><strong class="text-muted" style="font-size: 12px;">Chairman Reason:</strong><br><I class="text-muted" style="font-size: 12px;">'+expense.reason+'<I/>': ' '}
                                            </h4>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="font-14">${numberWithCommas(expense.budget)}</span></td>
                                <td><span class="font-14">${expense.name}</span></td>
                                <td><span class="font-14">${expense.created_at}</span></td>
                                <td>
                                    ${(expense.status === "pending")&&(expense.reason !== "not cancelled")? 
                                    '<span class="label label-rounded label-danger">Declined</span>':
                                    '<span class="label label-rounded label-primary">'+expense.status+'</span>'}
                                </td>
                                <td>
                                    <span class="action-icons">
                                        ${(expense.status === "pending")&&(expense.reason !== "not cancelled") ? 
                                        '<a style="color: #00ff9f" href="#" class="recommend-again" id-data="'+expense.id+'"><i class="ti-heart"></i></a>' : 
                                        '<a style="color: #00ff9f" href="#" class="recommend-icon" id-data="'+expense.id+'"><i class="ti-heart"></i></a>'} | 
                                        <a style="color: #e86060;" href="#" class="decline-icon" id-data="${expense.id}"><i class="mdi mdi-block-helper"></i></a>
                                    </span>
                                </td>
                            </tr>
                        `)
                    });
                }
                $(".pendingExp").change(function() {
                    $.when(postActions("fetch/pending", {
                        "date": ($(this).val())
                    }).done(response => {
                        renderPendingExp(response);
                    }).fail(error => {
                        console.log(error);
                    }))
                });

                const fetchRecoExp = () => {
                    var monthData = {
                        "date": ($("#month").val())
                    }
                    $.when(postActions("fetchReco", monthData).done(response => {
                        renderRecoExp(response);
                    }).fail(error => {
                        console.log(error);
                    }))
                }
                fetchRecoExp();
                const renderRecoExp = expensesData => {
                    $(".recommend-tbody").html("");
                    expensesData.forEach(expense => {
                        return $(".recommend-tbody").append(`
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="">
                                            <h4 class="m-b-0 font-14">
                                                ${expense.desc}
                                                ${(expense.status === "recommend")&&(expense.reason !== "not cancelled")? 
                                                    '<br><strong class="text-muted" style="font-size: 12px;">Treasurer Reason:</strong><br><I class="text-muted" style="font-size: 12px;">'+expense.reason+'<I/>': ' '}
                                            </h4>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="font-14">${numberWithCommas(expense.budget)}</span></td>
                                <td><span class="font-14">${expense.name}</span></td>
                                <td><span class="font-14">${expense.created_at}</span></td>
                                <td><span class="label label-rounded label-warning">${expense.status}</span></td>
                                <td>
                                    <span class="action-icons">
                                        <a href="#" class="approve-icon" id-data="${expense.id}"><i class="ti-check color-success"></i></a> | 
                                        <a style="color: #e86060;" href="#" class="decline-admin" id-data="${expense.id}"><i class="mdi mdi-block-helper"></i></a>
                                    </span>
                                </td>
                            </tr>
                        `)
                    });
                }
                $(".recoExp").change(function() {
                    $.when(postActions("fetchReco", {
                        "date": ($(this).val())
                    }).done(response => {
                        renderRecoExp(response);
                    }).fail(error => {
                        console.log(error);
                    }))
                });

                const fetchAllExpenses = () => {
                    var monthData = {
                        "date": ($("#month").val())
                    }
                    $.when(postActions("fetch/expenses", monthData).done(response => {
                        renderAllExpenses(response.expenses);
                        $(".year-total").html(`${numberWithCommas(response.totalYear)} UGX`);
                        $(".month-total").html(`${numberWithCommas(response.totalMonth)} UGX`);
                    }).fail(error => {
                        console.log(error);
                    }))
                }
                fetchAllExpenses();

                const renderAllExpenses = expensesData => {
                    $(".all-tbody").html("");
                    expensesData.forEach(expense => {
                        return $(".all-tbody").append(`
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="">
                                            <h4 class="m-b-0 font-14">${expense.desc}</h4>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="font-14">${numberWithCommas(expense.budget)}</span></td>
                                <td><span class="font-14">${expense.name}</span></td>
                                <td><span class="font-14">${expense.created_at}</span></td>
                                <td><span class="label label-rounded label-success">${expense.status}</span></td>
                            </tr>
                        `)
                    });
                }
                $(".allExp").change(function() {
                    $.when(postActions("fetch/expenses", {
                        "date": ($(this).val())
                    }).done(response => {
                        renderAllExpenses(response.expenses);
                        $(".year-total").html(`${numberWithCommas(response.totalYear)}`);
                        $(".month-total").html(`${numberWithCommas(response.totalMonth)}`);
                    }).fail(error => {
                        console.log(error);
                    }))
                })
                // setTimeout(() => {
                //     fetchPendingExp();
                //     fetchExpenses();
                //     fetchRecoExp();
                //     fetchAllExpenses();
                // }, 6000);


                //Background task for reducing balance
                $.when(getRequest("/loans/reducingBalance").then(response => {
                    if (response.msg == "reload") {
                        window.location.reload();
                    }
                }).fail(error => {
                    console.log(error);
                }));

                //submitting Email for editing Bio data
                $('#editbioemail').submit(function(e) {
                    console.log("submitting");
                    e.preventDefault();
                    var actionUrl = "/biodata/requestedit";
                    $('#submit-email').html('Submiting...');
                    $("#submit-email").prop('disabled', true);
                    $.ajax({
                            url: actionUrl,
                            type: "post",
                            data: new FormData(this),
                            dataType: 'json',
                            headers: {
                                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                            },
                            contentType: false,
                            cache: false,
                            processData: false,
                        })
                        .done(response => {
                            $('#email-response').html(`<div class="alert alert-success alert-dismissible fade show"
                                                                    role="alert">
                                                                    <button type="button" class="close"
                                                                        data-dismiss="alert" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                    <strong>${response.msg}</strong>
                                                                </div>`);
                            $('#submit-email').html('Sent Email');
                            $("#submit-email").prop('disabled', false);
                            location.reload();
                        })
                        .fail(error => {
                            console.log(error);
                        });
                });
            });
        </script>
        <!--Wave Effects -->
        <script src="{{ asset('/js/toastr.min.js') }}"></script>
        <script>
            @if (Session::has('success'))
                toastr.success("{{ Session::get('success') }}")
            @endif
        </script>
        <script src="{{ asset('dist/js/waves.js') }}"></script>
        <!--Menu sidebar -->
        <script src="{{ asset('dist/js/sidebarmenu.js') }}"></script>
        <!--Custom JavaScript -->
        <script src="{{ asset('dist/js/custom.js') }}"></script>
        <!--This page JavaScript -->
        <!--chartis chart-->
        {{-- <script src="{{asset('assets/libs/chartist/dist/chartist.min.js')}}"></script>
    <script src="{{asset('assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js')}}"></script> --}}
        {{-- <script src="{{asset('dist/js/pages/dashboards/dashboard1.js')}}"></script> --}}
</body>

</html>
