<?php 
  session_start();
  require 'function/functions.php'; 
  require 'function/loginRegister.php';

  // cek cookie
  if (isset($_COOKIE['id']) && isset($_COOKIE['key'])) {
    $id = $_COOKIE['id'];
    $key = $_COOKIE['key'];

    // ambil username berdasarkan id
    global $koneksi;
    $result = mysqli_query($koneksi, "SELECT username FROM users WHERE id_user = $id");
    $row = mysqli_fetch_assoc($result);

    // cek cookie dan username
    if ($key === hash('sha256', $row['username'])) {
        $_SESSION['login'] = true;
    }
  }

  if (isset($_SESSION["login"])) {
    header("Location: dashboard");
    exit;
  } elseif (isset($_COOKIE['login'])) {
    header("Location: dashboard");
    exit;
  }
  
  // login
  if (isset($_POST['login'])) {
    login($_POST);
  }

  // register
  if (isset($_POST['sign-up'])) {
    if (register($_POST) > 0) {
      echo "
          <script>
              swal('Berhasil','Akun anda berhasil didaftarkan!','success');
          </script>
      ";
    } else {
      echo mysqli_error($koneksi);
    }
  }

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="shortcut icon" href="img/favicon.png">
  <title>Login Page</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <style>
    body {
      background: url('img/body.png');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      font-family: "Roboto", sans-serif;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
      position: relative;
    }
    .img {
      background: url('img/login-bg.jpg');
      background-size: cover;
      background-position: center;
      height: 100%;
      top: 0;
      position: absolute;
      width: 100%;
      z-index: 2;
      opacity: 0.5; /* Optional: adjust opacity for background image */
    }
    .card {
      border: none;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
      width: 100%;
      max-width: 500px;
      background: rgba(255, 255, 255, 0.9); /* Slightly transparent background */
      z-index: 3;
    }
    .card-header {
      background: linear-gradient(135deg, #ffc107, #ff9800); /* Yellow gradient */
      color: #fff;
      text-align: center;
      padding: 20px;
    }
    .card-body {
      padding: 30px;
      background: #fff;
    }
    .form-control {
      border-radius: 30px;
      border: 1px solid #ced4da;
      background-color: #fff8e1; /* Light yellow background */
    }
    .btn-primary {
      background: #ffc107; /* Yellow color */
      border: none;
      border-radius: 30px;
      padding: 10px 20px;
      transition: background 0.3s ease;
    }
    .btn-primary:hover {
      background: #ff9800; /* Darker yellow color */
    }
    .btn-social {
      border-radius: 30px;
      padding: 10px 20px;
      font-size: 14px;
      color: #fff;
      text-align: center;
      margin: 5px 0;
      display: block;
      width: 100%;
    }
    .toggle-forms {
      cursor: pointer;
      color: #ffc107; /* Yellow color */
      text-decoration: underline;
    }
    .toggle-forms:hover {
      color: #ff9800; /* Darker yellow color */
    }
    .sub-title {
      font-size: 14px;
      margin-top: 10px;
      color: #333; /* Dark text color for better contrast */
    }
    .social-login {
      margin-top: 20px;
    }
    .social-login span {
      font-size: 14px;
      color: #333;
    }
  </style>
</head>

<body>
  <div class="img"></div>
  <div class="card">
    <div class="card-header">
      <h4 id="form-title">Login</h4>
      <div class="sub-title">Gunakan akun Anda untuk masuk atau daftar</div>
    </div>
    <div class="card-body">
      <div class="login-form">
        <form method="POST">
          <div class="form-group">
            <input type="text" name="user-email" class="form-control" placeholder="Username / Email" autocomplete="off" required>
          </div>
          <div class="form-group">
            <input type="password" name="password-login" class="form-control" placeholder="Password" required>
          </div>
          <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" name="ingatkansaya">
            <label class="form-check-label">Ingatkan Saya</label>
          </div>
          <button type="submit" name="login" class="btn btn-primary btn-block">Login</button>
          <p class="text-center mt-3">Belum punya akun? <span class="toggle-forms" data-target="signup">Daftar</span></p>
        </form>
      </div>
      <div class="signup-form" style="display: none;">
        <form method="POST">
          <div class="form-group">
            <input type="text" name="email-registrasi" class="form-control" placeholder="Email" autocomplete="off" required>
          </div>
          <div class="form-group">
            <input type="text" name="username-registrasi" class="form-control" placeholder="Username" autocomplete="off" required>
          </div>
          <div class="form-group">
            <input type="password" name="password-registrasi" class="form-control" placeholder="Password" autocomplete="off" required>
          </div>
          <div class="form-group">
            <input type="password" name="password-confirm" class="form-control" placeholder="Confirm Password" autocomplete="off" required>
          </div>
          <button type="submit" name="sign-up" class="btn btn-primary btn-block">Sign Up</button>
          <p class="text-center mt-3">Sudah punya akun? <span class="toggle-forms" data-target="login">Login</span></p>
        </form>
      </div>
      <div class="social-login text-center" style="display: none;">
        <span>Atau masuk dengan</span>
      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
    $(document).ready(function () {
      $('.toggle-forms').on('click', function () {
        var target = $(this).data('target');
        if (target === 'signup') {
          $('.login-form').hide();
          $('.signup-form').show();
          $('#form-title').text('Sign Up');
        } else {
          $('.signup-form').hide();
          $('.login-form').show();
          $('#form-title').text('Login');
        }
      });
    });
  </script>
</body>

</html>
