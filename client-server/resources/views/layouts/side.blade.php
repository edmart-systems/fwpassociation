<aside class="left-sidebar" style="position: fixed; overflow-y: auto;" data-sidebarbg="skin6">
    <div class="scroll-sidebar">
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <li>
                    <div class="user-profile d-flex no-block dropdown m-t-20">
                        <div class="user-pic"><img src={{ asset('profiles/' . Auth()->user()->image) }}
                                alt="users" class="rounded-circle" width="40" /></div>
                        <div class="user-content hide-menu m-l-10 ml-2">
                            <a href="javascript:void(0)" class="" id=" Userdd" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <h5 class="m-b-0 user-name font-medium">{{ Auth()->user()->name }}</h5>
                                <span class="op-5 user-email">{{ Auth()->user()->email }}</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="Userdd">
                                <a class="dropdown-item" href="{{ route('profile') }}"><i
                                        class="ti-user m-r-5 m-l-5"></i> My Profile</a>
                                <a class="dropdown-item" href="{{ route('biodata1', Auth()->user()->id) }}"><i
                                        class="ti-user m-r-5 m-l-5"></i> My Bio Data</a>
                                <a class="dropdown-item" href="javascript:void(0)"><i
                                        class="ti-settings m-r-5 m-l-5"></i> Account Setting</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault();
                                    document.getElementById('logout-form').submit();">
                                    <i class="fa fa-power-off m-r-5 m-l-5"></i> Logout
                                </a>
                                <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                    style="display: none;">
                                    @csrf
                                </form>
                            </div>
                        </div>
                    </div>
                </li>
                <!-- side bar items -->
                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('home') }}"
                        aria-expanded="false">
                        <i class="mdi mdi-view-dashboard"></i>
                        <span class="hide-menu">Dashboard</span>
                    </a>
                </li>
                <!-- Navigation -->
                <!-- Divider -->
                <hr class="my-3">
                <!-- Heading -->
                <h6 class="navbar-heading p-0 text-muted">
                    <span class="docs-normal"
                        style="font-size: 15px; color: #EC8B39;margin-left:22px;"><strong>Association
                            Expenses</strong></span>
                </h6>
                @if (Auth()->user()->userType === 'chairman' || Auth()->user()->userType === 'treasurer')
                @else
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('welcome') }}"
                            aria-expanded="false">
                            <i class="mdi mdi-file"></i>
                            <span class="hide-menu">Expense Request</span>
                        </a>
                    </li>
                @endif
                <?php
                $numx = DB::table('expenses')
                    ->where('status', 'pending')
                    ->count();
                $numxx = DB::table('expenses')
                    ->where('status', 'recommended')
                    ->count();
                ?>
                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('allExpenses') }}"
                        aria-expanded="false">
                        <i class="mdi mdi-file"></i>
                        <span class="hide-menu">Approved Expenses</span>
                    </a>
                </li>
                @if (Auth()->user()->userType === 'treasurer')
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('pending') }}"
                            aria-expanded="false">
                            <i class="mdi mdi-file"></i>
                            <span class="hide-menu">Pending Expenses
                                @if ($numx > 0)
                                    <p class="badge" style="background-color: #ec8b39; color: white;">
                                        {{ $numx }}</p>
                                @endif
                            </span>
                        </a>
                    </li>
                @endif
                @if (Auth()->user()->userType === 'chairman')
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="{{ route('recommended') }}" aria-expanded="false">
                            <i class="mdi mdi-file"></i>
                            <span class="hide-menu">Recommended Expenses
                                @if ($numxx > 0)
                                    <p class="badge" style="background-color: #ec8b39; color: white;">
                                        {{ $numxx }}</p>
                                @endif
                            </span>
                        </a>
                    </li>
                @endif
                @if (Auth()->user()->userType === 'chairman' || Auth()->user()->userType === 'treasurer')
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('declined') }}"
                            aria-expanded="false">
                            <i class="mdi mdi-file"></i>
                            <span class="hide-menu">Declined Expenses</span>
                        </a>
                    </li>
                @endif
                <!-- Divider -->
                <hr class="my-3">
                <!-- Heading -->
                <h6 class="navbar-heading p-0 text-muted">
                    <span class="docs-normal" style="font-size: 15px; color: #EC8B39;margin-left:22px;">
                        <strong>FWP Members Loans</strong></span>
                </h6>
                <?php
                $pendingLoans = DB::table('loans')
                    ->where('status', 'pending')
                    ->count();
                $approvedLoans = DB::table('loans')
                    ->where('status', 'approved')
                    ->count();
                $RecoLoans = DB::table('loans')
                    ->where('status', 'recommended')
                    ->count();
                $runningLoans = DB::table('loans')
                    ->where('status', 'pay')
                    ->count();
                $guarantor_requests = DB::table('guarantors')
                    ->where(['user_id' => Auth::user()->id, 'status' => 'NONE'])
                    ->count();
                ?>
                @if (Auth()->user()->userType === 'Member')
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('loans') }}"
                            aria-expanded="false">
                            <i class="mdi mdi-file"></i>
                            <span class="hide-menu">Loan Request
                                @if ($guarantor_requests > 0)
                                    <p class="badge" style="background-color: #ec8b39; color: white;">
                                        {{ $guarantor_requests }}</p>
                                @endif
                            </span>
                        </a>
                    </li>
                @endif

                @if (Auth()->user()->userType === 'chairman' || Auth()->user()->userType === 'treasurer')
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="{{ route('ClearedLoans') }}" aria-expanded="false">
                            <i class="mdi mdi-coin"></i>
                            <span class="hide-menu">Cleared Loans</span>
                        </a>
                    </li>
                @endif
                @if (Auth()->user()->userType === 'treasurer')
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="{{ route('pendingloan') }}" aria-expanded="false">
                            <i class="mdi mdi-cash"></i>
                            <span class="hide-menu">Pending Loans
                                @if ($pendingLoans > 0)
                                    <p class="badge" style="background-color: #ec8b39; color: white;">
                                        {{ $pendingLoans }}</p>
                                @endif
                            </span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect tryloan waves-dark sidebar-link"
                            href="{{ route('approvedLoans') }}" aria-expanded="false">
                            <i class="mdi mdi-coin"></i>
                            <span class="hide-menu">Approved Loans
                                @if ($approvedLoans > 0)
                                    <p class="badge" style="background-color: #ec8b39; color: white;">
                                        {{ $approvedLoans }}</p>
                                @endif
                            </span>
                        </a>
                    </li>
                @endif
                @if (Auth()->user()->userType === 'chairman' || Auth()->user()->userType === 'treasurer')
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect tryloan waves-dark sidebar-link"
                            href="{{ route('allLoans') }}" aria-expanded="false">
                            <i class="mdi mdi-coin"></i>
                            <span class="hide-menu">Running Loans
                                @if ($runningLoans > 0)
                                    <p class="badge" style="background-color: #ec8b39; color: white;">
                                        {{ $runningLoans }}</p>
                                @endif
                            </span>
                        </a>
                    </li>
                @endif
                @if (Auth()->user()->userType === 'chairman')
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="{{ route('recommendedloan') }}" aria-expanded="false">
                            <i class="mdi mdi-cash"></i>
                            <span class="hide-menu">Recommended Loans
                                @if ($RecoLoans > 0)
                                    <p class="badge" style="background-color: #ec8b39; color: white;">
                                        {{ $RecoLoans }}</p>
                                @endif
                            </span>
                        </a>
                    </li>
                @endif
                <!-- Divider -->
                <hr class="my-3">
                <!-- Heading -->
                <h6 class="navbar-heading text-muted">
                    <span class="docs-normal" style="font-size: 15px; color: #EC8B39;margin-left:22px;">
                        <strong>FWP Members Savings</strong>
                    </span>
                </h6>
                <!-- Navigation -->
                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('savings') }}"
                        aria-expanded="false">
                        <i class="mdi mdi-bank"></i>
                        <span class="hide-menu">Savings Summary</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('AllSavings') }}"
                        aria-expanded="false">
                        <i class="mdi mdi-bank"></i>
                        <span class="hide-menu">All Savings</span>
                    </a>
                </li>
                <!-- Divider -->
                <?php
                $num = DB::table('saving_logs')
                    ->where('approve', 2)
                    ->count();
                $num0 = DB::table('saving_logs')
                    ->where('approve', 0)
                    ->count();
                $depature_req = DB::table('departures')
                    ->where('status', 2)
                    ->count();
                $pendingBio = DB::table('biodatas')
                    ->where('status', 0)
                    ->count();
                $pendingEditBio = DB::table('biodatas')
                    ->where('status', 2)
                    ->count();
                $depature_reco = DB::table('departures')
                    ->where('status', 1)
                    ->count();
                ?>
                <!-- Navigation -->
                @if (Auth()->user()->userType === 'chairman' || Auth()->user()->userType === 'treasurer')
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="{{ route('savings_approve') }}" aria-expanded="false">
                            <i class="mdi mdi-bank"></i>
                            <span class="hide-menu">Pending savings
                                @if ($num0 > 0)
                                    <p class="badge" style="background-color: #ec8b39; color: white;">
                                        {{ $num0 }}</p>
                                @endif
                            </span>
                        </a>
                    </li>
                @endif

                @if (Auth()->user()->userType === 'treasurer')
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="{{ route('rejected_savings') }}" aria-expanded="false">
                            <i class="mdi mdi-bank"></i>
                            <span class="hide-menu">Rejected savings
                                @if ($num > 0)
                                    <p class="badge" style="background-color: #ec8b39; color: white;">
                                        {{ $num }}</p>
                                @endif
                            </span>
                        </a>
                    </li>
                @endif
                <!-- Divider -->
                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('charges') }}"
                        aria-expanded="false">
                        <i class="fa fa-minus-square"></i>
                        <span class="hide-menu">Charges</span>
                    </a>
                </li>
                <hr class="my-3">
                <!-- Heading -->
                <h6 class="navbar-heading p-0 text-muted">
                    <span class="docs-normal"
                        style="font-size: 15px; color: #EC8B39;margin-left:22px;"><strong>Member
                            Departure</strong></span>
                </h6>
                @if (Auth()->user()->userType === 'chairman' || Auth()->user()->userType === 'treasurer')
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="{{ route('membersDeparture') }}" aria-expanded="false">
                            <i class="fa fa-user-times"></i>
                            <span class="hide-menu">Departure Requests
                                @if ($depature_req > 0)
                                    <p class="badge" style="background-color: #ec8b39; color: white;">
                                        {{ $depature_req }}</p>
                                @endif
                            </span>
                        </a>
                    </li>
                @endif
                @if (Auth()->user()->userType === 'chairman')
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="{{ route('recommended_departures') }}" aria-expanded="false">
                            <i class="fa fa-user-times"></i>
                            <span class="hide-menu">Recommended Requests
                                @if ($depature_reco > 0)
                                    <p class="badge" style="background-color: #ec8b39; color: white;">
                                        {{ $depature_reco }}</p>
                                @endif
                            </span>
                        </a>
                    </li>
                @endif
                @if (Auth()->user()->userType === 'chairman' || Auth()->user()->userType === 'treasurer')
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="{{ route('declined_departures') }}" aria-expanded="false">
                            <i class="fa fa-user-times"></i>
                            <span class="hide-menu">Declined Requests</span>
                        </a>
                    </li>
                @endif
                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('departed') }}"
                        aria-expanded="false">
                        <i class="fa fa-user-times"></i>
                        <span class="hide-menu">Departed</span>
                    </a>
                </li>
                <hr class="my-3">
                <!-- Heading -->
                <h6 class="navbar-heading p-0 text-muted">
                    <span class="docs-normal" style="font-size: 15px; color: #EC8B39;margin-left:22px;"><strong>FWP
                            Management</strong></span>
                </h6>
                <!-- Navigation -->
                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('profile') }}"
                        aria-expanded="false">
                        <i class="mdi mdi-account-network"></i>
                        <span class="hide-menu">Profile</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('members') }}"
                        aria-expanded="false">
                        <i class="mdi mdi-border-all"></i>
                        <span class="hide-menu">Members</span>
                    </a>
                </li>
                @if (Auth()->user()->userType == 'General Secretary')
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="{{ route('pendingBio') }}" aria-expanded="false">
                            <i class="fa fa-user-times"></i>
                            <span class="hide-menu"> New Filled Forms
                                @if ($pendingBio > 0)
                                    <p class="badge" style="background-color: #ec8b39; color: white;">
                                        {{ $pendingBio }}</p>
                                @endif
                            </span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="{{ route('editBioRequest') }}" aria-expanded="false">
                            <i class="fa fa-user-times"></i>
                            <span class="hide-menu"> Bio Data Edit Requests
                                @if ($pendingEditBio > 0)
                                    <p class="badge" style="background-color: #ec8b39; color: white;">
                                        {{ $pendingEditBio }}</p>
                                @endif
                            </span>
                        </a>
                    </li>
                @endif
            </ul>
        </nav>
    </div>
</aside>
