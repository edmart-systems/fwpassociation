<!doctype html>
<html class="no-js" lang="en">
<head>
<script type="text/javascript">
      window.onload = function() { window.print();
        var is_chrome = function () { return Boolean(window.chrome); }
            if(is_chrome)
            {
            setTimeout(function(){document.location.href = "/savings_profile/{{ $user->id }}";}, 0); 
            }
            else
            {
           setTimeout(function(){document.location.href = "/savings_profile/{{ $user->id }}";}, 0);
            }
        }
   
 </script>
 <style>
   .table, .table th, .table td {
  border: 1px solid black;
  border-collapse: collapse;
}
td{
     color: black !important;
     font-size: 23px; 
}
 </style>
</head>
<body style="font-family: Courier New, Courier,Lucida Sans Typewriter, Lucida Typewriter, monospace;">
  <div class="row">

  <div style=" transform: scale(1,1.5); font-size: 16px; text-align: center;">
    <center>
    <table>
      <tr width="100%">
        <td width="15%"><img src="{{ asset('images/logo.jpg') }}" width="60px;"></td>
        <td width="70%">
          <div style=" font-size: 20px; text-transform: uppercase;"><strong>Friends With a Purpose</strong></div>
          <div><strong>Email:</strong>info@fwpassociation.com</div>
        </td>
        <td width="15%"></td>
      </tr>
    </table>
  </center>
</div>
<br>
<center><h3 style="text-decoration: underline;">SAVINGS FOR {{ strtoupper($user->name) }}</h3></center>
<table style="margin: 4px; padding: 4px;">
    <tr width="100%">
      <td width="15%">Print <strong>Date:</strong></td>
      <td width="35%"><strong>{{ date('Y-m-d H:m:s a') }} </strong></td>
      <td width="20%">Printed By:</td>
      <td width="30%"><strong>{{ Auth()->user()->name }} </strong></td>
    </tr>
  </table>
  <table width="100%" class="table">
    <thead>
        <tr>
            <th>Total Deposit</th>
            <th>Late Payments</th>
            <th>Late for Meeting</th>
            <th>Absenteeism</th>
            <th>Marriage</th>
            <th>Birth</th>
            <th>Death</th>
            <th>Graduation</th>
            <th>Consecration</th>
            <th>Sickness</th>
            <th>Date</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($details as $detail)
        <tr>
            <td>{{ number_format($detail['monthly']) }}</td>
            <td>{{ number_format($detail['late_payment']) }}</td>
            <td>{{ number_format($detail['late_meeting']) }}</td>
            <td>{{ number_format($detail['absenteeism']) }}</td>
            <td>{{ number_format($detail['marriage']) }}</td>
            <td>{{ number_format($detail['birth']) }}</td>
            <td>{{ number_format($detail['death']) }}</td>
            <td>{{ number_format($detail['graduation']) }}</td>
            <td>{{ number_format($detail['consecration']) }}</td>
            <td>{{ number_format($detail['sickness']) }}</td>
            <td style="white-space: nowrap;">{{ $detail['date'] }}</td>
        </tr>
    @endforeach
    </tbody>
</table>
<br>
<h3>Other Details</h3>
<table>
    <tr width="100%">
        <td width="35%">
            <table>
                <tr>
                    <td><h4>Member Name: </h4></td>
                    <td><h4>{{ strtoupper($user->name) }}</h4></td>
                </tr>
                <tr>
                    <td><h4>FWP Number: </h4></td>
                    <td><h4>{{ $user->fwpnumber }}</h4></td>
                </tr>
                <tr>
                    <td><h4>Social Contributions: </h4></td>
                    <td><h4>{{ number_format($totalsoc) }}</h4></td>
                </tr>
            </table>
        </td>
        <td width="35%">
            <table>
                <tr>
                    <td><h4>Total Fines: </h4></td>
                    <td><h4>{{ number_format($totalfin) }}</h4></td>
                </tr>
                <tr>
                    <td><h4>Total Deposits: </h4></td>
                    <td><h4>{{ number_format($totaldep) }}</h4></td>
                </tr>
                <tr>
                    <td><h4>Expected Savings: </h4></td>
                    <td><h4>{{ number_format($expected) }}</h4></td>
                </tr>
            </table>
        </td>
        <td width="30%">
            <table>
                <tr>
                    <td><h4>Amount Due to Member: </h4></td>
                    <td><h4>{{ number_format($due_amount) }}</h4></td>
                </tr>
                <tr>
                    <td><h4>90% of Amount Due: </h4></td>
                    <td><h4>{{ number_format(0.9 * $due_amount) }}</h4></td>
                </tr>
                <tr>
                    <td><h4>Arrears: </h4></td>
                    <td><h4>{{ number_format($arrears) }}</h4></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<br>
<table>
  <tr width="100%">
    <td width="100%">
      <table>
        <tr>
          <td><strong>Stamp & Signature:</strong></td>
          <td>.............................</td>
        </tr>
      </table>
    </td>
  </tr>
</table><br>
  <div>
    <p style="text-align: center;">Printed From Friends With a Purpose System.</p>
  </div>
  <hr style="border-style: dashed;">

</div>
       
</body>
</html>
