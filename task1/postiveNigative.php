<?php  
$sign = " ";

if ($_POST){
    
    if ($_POST['first']>0){
        $sign="positve";
    }
    elseif($_POST['first']<0){$sign="nigative";}
    else{$sign="zero";}
    

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
      <div class="container">
      <div class="col-12 text-center">
                        <h1 class="h1 text-danger"> Check positive and nigative </h1>
                    </div>
  <form method='post' >
  <div class="form-group">
    <label for="first_num"> Number</label>
    <input type="number" name="first" class="form-control" id="first_num" aria-describedby="emailHelp" placeholder="first num" value="<?php if(isset($_POST['first'])){echo $_POST['first'];} ?>">
  </div>
 
  
  <button  type="submit" class="btn btn-danger">Check</button>
</form>
<div>
<?php echo "<div>sign is $sign</div>" ?>
</div>
</div>
      
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>