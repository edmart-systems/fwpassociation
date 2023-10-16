<!doctype html>
<html lang="en">

<head>
    <title>Friends With a Purpose</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" type="text/css" href="{{ asset('css/style.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('css/custom.css') }}">
    <style>
        body,
        html {
            box-shadow: inset 0 0 0 1000px rgba(5, 10, 200, .30);
            overflow: scroll;
        }

    </style>
</head>

<body style="overflow: scroll;">
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-5">
                    <center><img src="{{ asset('images/logo.jpg') }}" alt="Logo" width="65px;"
                            style="border-radius: 50%"></center>
                    <h2 class="heading-section">FWP Association</h2>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-12 col-lg-10">
                    <div class="wrap d-md-flex">
                        <div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
                            <div class="text w-100">
                                <h2 style="font-size: 25px;">Welcome to FWP Association</h2><br>
                                <span class="text-left">
                                    <h2 style="font-size: 20px;">Vision</h2>
                                    <p>
                                        "A united, excellent and prosperous memberships"
                                    </p>
                                    <h2 style="font-size: 20px;">Mission</h2>
                                    <p>
                                        To promote prosperity through unity, innovation and investment
                                    </p>
                                    <h2 style="font-size: 20px;">Main Objective</h2>
                                    <p>
                                        To maintain a spirit of fellowship while encouraging financial growth for one
                                        another
                                    </p>
                                    <h2 style="font-size: 20px;">Specific Objectives</h2>
                                    <small>
                                        <ol style="padding-left: 0px;">
                                            <li>To promote/enhance development amongst the members through assisting the
                                                members bothe in agony and joy.</li>
                                            <li>To create and promote the system of saving and credit among the members.
                                            </li>
                                            <li>Undertake any other activities related to the above for the prosperity
                                                of members.</li>
                                        </ol>
                                    </small>
                                </span>
                            </div>
                        </div>
                        <div class="login-wrap p-4 p-lg-5">
                            <div class="d-flex">
                                <div class="w-100">
                                    <h3 class="mb-4">Register</h3>
                                    <p style="margin-top: -20px;">Create a free account</p>
                                </div>
                            </div>
                            @if (session()->has('invalid'))
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <button type="button" class="close" data-dismiss="alert"
                                        aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                        <span class="sr-only">Close</span>
                                    </button>
                                    <strong>Error Occuired!</strong><br> {{ session('invalid') }}.
                                </div>
                            @endif
                            <form action="{{ route('register') }}" class="signin-form" method="POST">
                                @csrf
                                <div class="form-group mb-3">
                                    <label class="label" for="name">Username</label>
                                    <input id="name" type="text"
                                        class="form-control @error('name') is-invalid @enderror" name="name"
                                        value="{{ old('name') }}" required autocomplete="name" autofocus
                                        placeholder="Username">
                                    <span class="focus-input100">
                                        @error('name')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </span>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="name">FWP Number</label>
                                    <input id="fwpnumber" type="text"
                                        class="form-control @error('fwpnumber') is-invalid @enderror" name="fwpnumber"
                                        value="{{ old('fwpnumber') }}" required autocomplete="fwpnumber" autofocus
                                        placeholder="FWP Number">
                                    <span class="focus-input100">
                                        @error('fwpnumber')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </span>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="name">Email</label>
                                    <input id="email" type="email"
                                        class="form-control @error('email') is-invalid @enderror" name="email"
                                        value="{{ old('email') }}" required autocomplete="email" autofocus
                                        placeholder="Email Address">
                                    <span class="focus-input100">
                                        @error('email')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </span>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="password">Password</label>
                                    <input type="password" class="form-control @error('password') is-invalid @enderror"
                                        name="password" required autocomplete="current-password" id="password"
                                        placeholder="Enter Password">
                                    <span class="focus-input100">
                                        @error('password')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </span>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="password">Confirm Password</label>
                                    <input type="password" class="form-control" id="password-confirm"
                                        name="password_confirmation" required autocomplete="new-password"
                                        placeholder="Confirm Password">
                                </div>
                                <div class="form-group">
                                    <button type="submit"
                                        class="form-control btn btn-primary submit px-3 login_btn">Sign Up</button>
                                </div>
                                <center>
                                    <p>Already have an account? <a href="{{ route('login') }}">Sign In</a></p>
                                </center>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="{{ asset('js/jquery.min.js') }}"></script>
    <script src="{{ asset('js/popper.js') }}"></script>
    <script src="{{ asset('js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('js/main2.js') }}"></script>

</body>

</html>
