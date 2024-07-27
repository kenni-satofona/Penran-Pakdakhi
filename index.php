<?php 
    session_start();
    require "function/functions.php";
    
    if (isset($_SESSION["login"]) || isset($_COOKIE['login'])) {
        header("Location: dashboard");
        exit;
    }
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" href="img/favicon.png">
    <title>Penran - Dakhi</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
        crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
        type="text/css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/modal.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            color: black;
        }

        .parallax {
            background: url(img/bg3.jpg);
            background-attachment: fixed;
            background-repeat: no-repeat;
        }

        .parallax2 {
            background: url(img/team.jpg);
            background-attachment: fixed;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .navbar,
        .footer {
            background-color: #333;
            color: orangered;
        }

        .navbar .nav-link,
        .footer a {
            color: white;
        }

        .navbar .nav-link:hover,
        .footer a:hover {
            color: #ddd;
        }

        .headline,
        .foot-fitur h4 {
            font-weight: 600;
        }

        .isi-fitur {
            font-weight: 300;
        }

        .button {
            background-color: #333;
            color: chocolate;
            border: 2px solid #333;
            transition: all 0.3s ease;
        }

        .button:hover {
            background-color: wheat;
            color: #333;
        }

        .text-light {
            color: orangered !important;
        }

        .konten h1 {
            font-size: 30pt;
            font-weight: 500;
        }

        .konten p {
            font-size: 14pt;
        }
    </style>
</head>

<body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top main-nav" id="mainNav">
        <div class="container">
            <a class="js-scroll-trigger" href="#page-top">
                <img src="img/logo.png" width="20px" style="margin-right: 10px; margin-bottom: 2px;">
            </a>
            <a class="navbar-brand js-scroll-trigger" href="#page-top">Penran Pak Dakhi</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#features">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#contact">Contact Us</a>
                    </li>
                    <li class="nav-item">
                        <a href="login" class="nav-link">Sign in</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Navigation -->

    <!-- header -->
    <header id="home" class="text-light parallax">
        <div class="container konten">
            <h1>Welcome to Penran - Dakhi</h1>
            <p class="lead">Aplikasi pencatatan keuangan harian dengan fitur transaksi terbaik</p>
            <a href="login" class="btn btn-outline-light button">Get Started</a>
        </div>
    </header>
    <!-- header -->

    <!-- features -->
    <section id="features" class="bg-light">
        <div class="container konten2">
            <div class="garis text-center">FEATURES</div>

            <div class="col-lg-12 foot-fitur">
                <h4 class="headline text-center">Penran - Dakhi</h4>
                <p class="isi-fitur text-center">Penran - Dakhi adalah aplikasi web pencatatan keuangan harian yang
                    mempunyai fitur-fitur menarik untuk memonitoring keuangan harian anda. Direkomendasikan bagi para
                    remaja
                    yang kesulitan dalam melakukan pengelolaan keuangannya. </p>
            </div>

            <div class="row row2">
                <div class="col-lg-6 fiturs">
                    <div class="gbr">
                        <div class="box">
                            <img src="img/transaksi.jpg" class="gambar-fitur img" width="100%">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 fiturs">
                    <h4 class="headline">Transaksi Harian</h4>
                    <p class="isi-fitur">
                        Kami memberikan fitur transaksi harian yang akan menampilkan data
                        harian yang bisa mempermudah anda dalam mengelola keuangan pribadi. dan data keuangan anda akan
                        tersimpan dengan aman di dalam aplikasi ini.</p>
                </div>
            </div>

            <div class="row row2">
                <div class="col-lg-6 fiturs text-right">
                    <h4 class="headline">Rekening Pribadi</h4>
                    <p class="isi-fitur">Kami menyediakan fitur rekening pribadi yang dapat mempermudah anda dalam
                        melakukan pengelolaan keuangan di penran dan juga di rekening anda. Dengan fitur ini,
                        pengelolaan
                        uang anda di rekening menjadi lebih mudah dan terkelola dengan baik.</p>
                </div>
                <div class="col-lg-6 fiturs">
                    <div class="gbr">
                        <div class="box">
                            <img src="img/rekening.jpg" class="gambar-fitur img" width="100%">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row row2">
                <div class="col-lg-6 fiturs">
                    <div class="gbr">
                        <div class="box">
                            <img src="img/monitor.jpg" class="gambar-fitur img" width="100%">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 fiturs">
                    <h4 class="headline">Monitoring Keuangan</h4>
                    <p class="isi-fitur">Monitoring keuangan tentunya sangat diperlukan untuk mengelola pengeluaran dan
                        pemasukan kita. kami menyediakan dashboard yang berisi beberapa fitur, seperti saldo, total
                        uang yang masuk dan keluar, dan rekening.</p>
                </div>
            </div>
        </div>
    </section>
    <!-- features -->

    <!-- contact -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="garis garis2 text-center">CONTACT US</div>
                    <div class="row text-center">
                        <div class="col col1">
                            <a href="https://www.facebook.com" target="_blank">
                                <img src="https://img.icons8.com/color/480/000000/facebook.png" width="70%">
                            </a>
                        </div>
                        <div class="col col2">
                            <a href="https://plus.google.com" target="_blank">
                                <img src="https://img.icons8.com/color/96/000000/google-plus-squared.png" width="70%">
                            </a>
                        </div>
                        <div class="col col3">
                            <a href="https://www.instagram.com" target="_blank">
                                <img src="https://img.icons8.com/color/480/000000/instagram-new.png" width="70%">
                            </a>
                        </div>
                        <div class="col col4">
                            <a href="https://www.linkedin.com" target="_blank">
                                <img src="https://img.icons8.com/color/452/linkedin.png" width="70%">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- contact -->

    <!-- footer -->
    <footer class="footer bg-dark text-center text-white">
        <div class="container p-4">
            <section class="mb-4">
                <a class="btn btn-outline-light btn-floating m-1" href="https://www.facebook.com" role="button"><i
                        class="fab fa-facebook-f"></i></a>
                <a class="btn btn-outline-light btn-floating m-1" href="https://plus.google.com" role="button"><i
                        class="fab fa-google-plus-g"></i></a>
                <a class="btn btn-outline-light btn-floating m-1" href="https://www.instagram.com" role="button"><i
                        class="fab fa-instagram"></i></a>
                <a class="btn btn-outline-light btn-floating m-1" href="https://www.linkedin.com" role="button"><i
                        class="fab fa-linkedin-in"></i></a>
            </section>

            <section class="mb-4">
                <p>
                    Penran - Dakhi adalah aplikasi web pencatatan keuangan harian yang mempunyai fitur-fitur menarik untuk memonitoring keuangan harian anda.
                </p>
            </section>

            <section class="">
                <form action="">
                    <div class="row d-flex justify-content-center">
                        <div class="col-auto">
                            <p class="pt-2">
                                <strong>Sign up for our newsletter</strong>
                            </p>
                        </div>
                        <div class="col-md-5 col-12">
                            <div class="form-outline form-white mb-4">
                                <input type="email" id="form5Example21" class="form-control" />
                                <label class="form-label" for="form5Example21">Email address</label>
                            </div>
                        </div>
                        <div class="col-auto">
                            <button type="submit" class="btn btn-outline-light mb-4">
                                Subscribe
                            </button>
                        </div>
                    </div>
                </form>
            </section>
        </div>

        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            © 2024 Penran - Dakhi
        </div>
    </footer>
    <!-- footer -->

    <!-- Bootstrap core JavaScript -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/scrolling-nav.js"></script>

</body>

</html>
