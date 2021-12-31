<?php 
 
 if(isset($_POST['enterProducts'])){
     $chooseTable = productTable();
 }

 if(isset($_POST['theBill'])){
    $billTable = billTable();
}

 function productTable() {
    $table="<table class='table table-sm table-dark'>
    <thead>
      <tr>
        <th scope='col'>product name </th>
        <th scope='col'>price</th>
        <th scope='col'>quantity</th>
      </tr>
    </thead>
    <tbody>" ;
    for($i=0; $i < $_POST['numV']; $i++){
    $table .="
      <tr>
        <th scope='row'><input type='text' class='form-control' name='product$i'></th>
        <th scope='row'><input type='text' class='form-control' name='price$i'></th>
        <th scope='row'><input type='text' class='form-control' name='quantity$i'></th>
      </tr>";
    }
   $table .="   
    </tbody>
  </table>
  <button type='submit' name='theBill' id='theBill' class='btn btn-primary'>The Bill</button>"
  ;
  return $table;
  
 }
 function billTable(){
    $table="<table class='table table-sm table-dark'>
    <thead>
      <tr>
        <th scope='col'>product name </th>
        <th scope='col'>price</th>
        <th scope='col'>quantity</th>
        <th scope='col'>subtotal</th>
      </tr>
    </thead>
    <tbody>" ;
    $total=0;
    for($i=0; $i < $_POST['numV']; $i++){
        $subTotal=$_POST['price'.$i]*$_POST['quantity'.$i];
        $total += $subTotal;
    $table .="
      <tr>
        <th scope='row'>{$_POST['product'.$i]}</th>
        <th scope='row'>{$_POST['price'.$i]}</th>
        <th scope='row'>{$_POST['quantity'.$i]}</th>
        <th scope='row'>$subTotal</th>
      </tr>";
    }
    $discout=percentOfDiscout($total)*$total;
    $totalAfterDiscount=$total-$discout;
    $deliveryy=delivery($_POST['city']);
    $totalPlusDelevary= ($total+$deliveryy);
   $table .="  <tr>
   <th>client name</th>
   <th>{$_POST['userName']}</th>
   </tr>  
   <tr>
   <th>City</th>
   <th>{$_POST['city']}</th>
   </tr>  
   <tr>
   <th>Total</th>
   <th>$total</th>
   </tr>  
   <tr>
   <th>Discount</th>
   <th>$discout</th>
   </tr>  
   <tr>
   <th>total After Discount</th>
   <th>$totalAfterDiscount</th>
   </tr>  
   <tr>
   <th>delivery</th>
   <th>$deliveryy</th>
   </tr>  
   <tr>
   <th>total plus delivary</th>
   <th></th>
   </tr>  
    </tbody>
  </table>"
  ;
  return $table;
 }
function percentOfDiscout($totalPrice){
    if ($totalPrice < 1000) {
        return 0;
    } elseif ($totalPrice >= 1000 && $totalPrice < 3000) {
        return 0.1;
    } elseif ($totalPrice >= 3000 && $totalPrice < 4500) {
        return 0.15;
    } else {
        return 0.2;
}}
function delivery ($city){
    switch ($city) {
        case 'cairo':
           return 0; 
        case 'giza':
            return 30;
        case 'alex':
            return 50;       
        default:
            return 100;  
    }
}

?>

<!doctype html>
<html lang="en">
  <head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>
      <div  class='container' >
          <div class='h1'><h1>super market</h1></div>

<form method='post'>
  <div class="form-group">
    <label for="userName">user name</label>
    <input type="text" name="userName" class="form-control" id="userName" aria-describedby="userName" placeholder="Enter user" value="<?= isset($_POST['userName']) ?  $_POST['userName'] : ''?>">
  </div>
  <div class="form-group">
  <label for="city">user name</label>

  <select id='city' name='city' class='form-control'>
  <option <?= (isset($_POST['city'] )&& $_POST['city']=='cairo') ? 'selected' :'' ?> value='cairo'>cairo</option>
  <option <?= (isset($_POST['city'] )&& $_POST['city']=='Giza') ? 'selected' :'' ?> value='Giza'>Giza</option>
  <option <?= (isset($_POST['city'] )&& $_POST['city']=='Alex') ? 'selected' :'' ?> value='Alex'>Alex</option>
  <option <?= (isset($_POST['city'] )&& $_POST['city']=='Other') ? 'selected' :'' ?> value='Other'>Other</option>
</select>
  </div>
  <div class="form-group ">
  <label class="form-check-label" for="numV">Number of varieties</label>
    <input type="number" name='numV' class="form-control" id="numV" value="<?= isset($_POST['numV']) ? $_POST['numV']:'' ?>">
    
  </div>
  <button type="submit" name='enterProducts' id='enterProducts' class="btn btn-primary">enter ptoducts</button>
  <?php 
  if (isset( $chooseTable)){
      echo  $chooseTable;
    
  }
  if (isset($billTable)){
    echo $billTable;
  
}
  
  ?>
</form>
      </div>
      
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>
