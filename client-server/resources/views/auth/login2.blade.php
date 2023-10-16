<!doctype html>
<html lang="en">
  <head>
  	<title>Friends With a Purpose</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" type="text/css" href="{{asset('css/style.css')}}">
	<link rel="stylesheet" type="text/css" href="{{asset('css/custom.css')}}">
<style>
	body,html{
		box-shadow: inset 0 0 0 1000px rgba(5, 10, 200, .30);
		overflow: scroll;
	}
</style>
	</head>
	<body>
	<section class="ftco-section">
		<div class="container section1">
			<div class="row justify-content-center">
				<div class=" text-center mb-5">
					<center><img src="{{ asset('images/logo.jpg') }}" alt="Logo" width="65px;" style="border-radius: 50%"></center>
					<h2 class="heading-section">FWP Association</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-10 col-lg-10">
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
                                            To maintain a spirit of fellowship while encouraging financial growth for one another
                                        </p>
								 </span>
							</div>
			      </div>
						<div class="login-wrap p-4 p-lg-5">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			<h3 class="mb-4">Sign In</h3>
			      			<p style="margin-top: -20px;">Please Login to continue</p>
			      		</div>
			      	</div>
							<form action="{{ route('login') }}" class="signin-form" method="POST">
								@if ($status==="newMember")
								<div>
									<div class="alert alert-danger" style="font-size: 12px;" role="alert">
										Your Accout is<strong> not active</strong> now, please contact the chairman for activation
									</div>
									<a class="btn btn-sm btn-outline-primary" href="{{route('login')}}"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i> back to login</a>
								</div>
							@endif
							@if ($status==="inactive")
								<div>
									<div class="alert alert-danger" style="font-size: 12px;" role="alert">
										If<strong> you didn't login</strong> successfully, your account is inactive. please contact the chairman for activation
									</div>
									<a class="btn btn-sm btn-outline-primary" href="{{route('login')}}"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i> back to login</a>
								</div>
							@endif
							@if ($status === "login")
							@csrf
			      		<div class="form-group mb-3">
			      			<label class="label" for="name">Email</label>
			      			<input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
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
		              <input type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password" id="password">
		              <span class="focus-input100">
						@error('password')
								<span class="invalid-feedback" role="alert">
									<strong>{{ $message }}</strong>
								</span>
							@enderror
							</span>
		            </div>
		            <div class="form-group">
		            	<button type="submit" class="form-control btn btn-primary submit px-3 login_btn">Sign In</button>
		            </div>
		            <div class="form-group d-md-flex">
		            	<div class="w-50 text-left">
			            	<label class="checkbox-wrap checkbox-primary mb-0">Remember Me
									  <input type="checkbox" checked>
									  <span class="checkmark"></span>
										</label>
									</div>
									<div class="w-50 text-md-right">
										<a href="#">Forgot Password</a>
									</div>
		            </div>
		            <center><p>Don't have an account? <a href="{{ route('register') }}">Sign Up</a></p></center>
		            @endif
		          </form>
		        </div>
		      </div>
				</div>
			</div>
		</div>
	</section>
	</body>
	<script src="{{asset('js/jquery.min.js')}}"></script>
  <script src="{{asset('js/popper.js')}}"></script>
  <script src="{{asset('js/bootstrap.min.js')}}"></script>
  <script src="{{asset('js/main2.js')}}"></script>
</html>

