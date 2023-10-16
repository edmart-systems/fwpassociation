<!doctype html>
<html class="no-js" lang="en">
<head>
<script type="text/javascript">
      window.onload = function() { window.print();
        var is_chrome = function () { return Boolean(window.chrome); }
            if(is_chrome)
            {
            setTimeout(function(){document.location.href = "/savings";}, 0); 
            }
            else
            {
           setTimeout(function(){document.location.href = "/savings";}, 0);
            }
        }
   
 </script>
 <style>
   .table, .table th, .table td {
  border: 1px solid black;
  border-collapse: collapse;
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
<center><h3 style="text-decoration: underline;">SAVINGS SUMMARY</h3></center>
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
            <th>No</th>
            <th>Name</th>
            <th>FWP Number</th>
            <th>Total Deposits</th>
            <th>Arrears</th>
            <th>Fines</th>
            <th>Amount Due</th>
            <th>90% of Due Amount</th>
            <th>Running Loan</th>
        </tr>
    </thead>
    <tbody>
        @foreach($details as $detail)
        <tr>
            <td>{{ $loop->iteration }}</td>
            <td>{{ $detail['name'] }}</td>
            <td>{{ $detail['fwpnumber'] }}</td>
            <td>{{ number_format($detail['deposits']) }}</td>
            <td>{{ number_format($detail['arrears']) }}</td>
            <td>{{ number_format($detail['fines']) }}</td>
            <td>{{ number_format($detail['due_amount']) }}</td>
            <td>{{ number_format(0.9*$detail['due_amount']) }}</td>
            <td>{{ number_format($detail['runningloan'])  }}</td>
        </tr>
        @endforeach
    </tbody>
</table>
<br>
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
