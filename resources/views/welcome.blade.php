<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>MasuKerja</title>
  <!-- Font Awesome Icons -->
  <link href="plugins/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic'
    rel='stylesheet' type='text/css'>
  <!-- Plugin CSS -->
  <link href="plugins/magnific-popup/magnific-popup.css" rel="stylesheet">
  <!-- Theme CSS - Includes Bootstrap -->
  <link href="dist/css/creative.css" rel="stylesheet" type="text/css">
</head>

<body id="page-top">
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger text-info" href="#page-top"><img src="dist/img/logo.png" class="img-fluid"
          style="height: 40px; margin-right: 5px;">MasuKerja</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
        data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto my-2 my-lg-0">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger text-muted-50" href="#about">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger text-muted-50" href="#services">Features</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger text-muted-50" href="#portfolio">Tips</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger text-muted-50" href="#download">Download</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger text-muted-50" href="#contact">Contact</a>
          </li>
            @auth
                <li class="nav-item">
                    <a class="nav-link text-muted-50" href="{{ url('/home') }}">Home</a>
                </li>
            @else
                <li class="nav-item">
                    <a class="nav-link text-muted-50" href="{{ route('login') }}">Login</a>
                </li>

                @if (Route::has('register'))
                    <li class="nav-item">
                        <a class="nav-link text-muted-50" href="{{ route('register') }}">Register</a>
                    </li>
                @endif
            @endauth
        </ul>
      </div>
    </div>
  </nav>

  <!-- Masthead -->
  <header class="masthead bg-light " class="ftco-blocks-cover-1" style="background-image: url('dist/img/bg.jpg');">
    <div class="container h-100">
      <div class="row h-100 align-items-center justify-content-center text-center">
        <div class="col-lg-10 align-self-end">
          <h1 class="text-uppercase text-center font-weight-bold">Cari Kerja? <br> ya MasuKerja</h1>
          <hr style="color: #187FC4">
        </div>
        <div class="col-lg-8 align-self-baseline">
          <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">Temukan
            Selanjutnya</a>
        </div>
      </div>
    </div>
  </header>

  <!-- About Section -->
  <section class="page-section" id="about" style="background-color: #187FC4">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 text-center">
          <h2 class="text-white mt-0">Temukan pekerjaan terbaikmu!<br>Generasi Industri 4.0</h2>
          <hr class="divider light my-4">
          <p class="text-white-50 font-weight-bold mb-4">merupakan generasi maju yang dimana segala jenis sesuatu bisa
            dicapai, salahsatunya mencari pekerjaan yang bagus dengan gaji yang besar bukan merupakan hal yang sulit
            lagi.</p>
          <a class="btn btn-light btn-xl js-scroll-trigger" href="#services">Mulai!</a>
        </div>
      </div>
    </div>
    <!-- </section> -->
  </section>

  <!-- Services Section -->
  <section class="page-section" id="services" style="font-style: ">
    <div class="container">
      <h2 class="text-center mt-0">Temukan Fitur Terbaikmu</h2>
      <hr class="divider light my-4">
      <div class="row">
        <div class="col-lg-3 col-md-6 text-center">
          <div class="mt-5">
            <img style="width: 100% " src="dist/img/stat.jpg" alt="Image" class="img-fluid">
            <!-- <i class="fas fa-4x fa-gem text-primary mb-4"></i> -->
            <h3 class="h4 mb-2">Data Statistik</h3>
            <p class="text-muted mb-0">Informasi tentang kebutuhan tenaga kerja di negara indonesia ini kian hari
              semakin meningkat hal itu terbukti dengan adanya data statistik</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="mt-5">
            <img style="width: 100% " src="dist/img/info.jpg" alt="Image" class="img-fluid">
            <!-- <i class="fas fa-4x fa-laptop-code text-primary mb-4"></i> -->
            <h3 class="h4 mb-2">Artikel Informasi</h3>
            <p class="text-muted mb-0">Anda bisa mencari pekerjaan yang baru saja di update oleh sebuah perusahaan dan
              anda juga bisa mencari informasi lebih detail terkait pekerjaan yang anda mau.</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="mt-5">
            <!-- <i class="fas fa-4x fa-globe text-primary mb-4"></i> -->
            <img style="width: 100%;  " src="dist/img/test.jpg" alt="Image" class="img-fluid">
            <h3 class="h4 mb-2">Tes Kepribadian</h3>
            <p class="text-muted mb-0">Anda bisa melakukan tes kepribadian untuk mengetahui tipe kepribadian anda dan
              untuk memudahkan perusahaan untuk mengetahuinya juga.</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="mt-5">
            <!-- <i class="fas fa-4x fa-heart text-primary mb-4"></i> -->
            <img style="width: 100%;  " src="dist/img/hire.jpg" alt="Image" class="img-fluid">
            <h3 class="h4 mb-2">Pencarian</h3>
            <p class="text-muted mb-0">Anda bisa memasukkan data anda kemudian anda bisa melakukan proses pendaftaran
              pada suatu perusahaan tertentu.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="page-section" id="about" style="background-color: #187FC4">
    <div class="site-section section-2" id="portfolio" style="background-color: #187FC4">
      <div class="container">
        <div class="row justify-content-center text-center mb-5 section-2-title">
          <div class="col-md-8">
            <div class="container">
              <h2 class="text-white mt-0">++500 Pekerjaan yang tersedia pada MasuKerja dengan beberapa kriteria </h2>
            </div>
          </div>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-lg-7">
          <div class="row">
            <div class="col-lg-6 mr-auto pr-lg-5">
              <div class="feature-3">
                <h3 class="text-white">Kreatif Teknologi</h3>
                <p class="text-white-50 font-weight-light">Pekerja zaman sekarang harus bisa menciptakan sebuah ide
                  kreatif untuk perkembangan dunia industri.</p>
              </div>
            </div>
            <div class="col-lg-6 ml-auto pl-lg-5">
              <div class="feature-3">
                <h3 class="text-white">Kerja Cerdas</h3>
                <p class="text-white-50 font-weight-light">Bekerja dengan menggunakan seluruh kemampuan yang kita miliki
                  dan belajar menggali kemampuan yang belum kita miliki.</p>
              </div>
            </div>
            <div class="col-lg-6 mr-auto pr-lg-5">
              <div class="feature-3">
                <h3 class="text-white">Kualitas</h3>
                <p class="text-white-50 font-weight-light">Jadilah pekerja yang memiliki kualitas tinggi demi hasil yang
                  maksimal.</p>
              </div>
            </div>
            <div class="col-lg-6 ml-auto pl-lg-5">
              <div class="feature-3">
                <h3 class="text-white">Kerja Keras</h3>
                <p class="text-white-50 font-weight-light">Kerja keras tanpa mengenal lelah dan pantang menyerah dalam
                  mengahdapi masalah untuk hasil yang bagus.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Call to Action Section -->
  <section class="page-section bg-dark text-white" id="download">
    <div class="container text-center">
      <h2 class="mb-4"> Dapatkan Aplikasinya !!</h2>
      <p class="text-white">
        <p> Dan dapatkan pekerjaan terdekat yang kamu mau.....</br> </p>
        <img src="dist/img/googleplay.png" alt="gplay" class="img-fluid" style="width: 200px;">
    </div>
  </section>

  <!-- Contact Section -->
  <section class="page-section" id="contact">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 text-center">
          <h2 class="mt-0">Contact</h2>
          <hr class="divider my-4">
          <p class="text-muted mb-5">Aplikasi MasuKerja Ini dibuat untuk menghubungkan antara pelamar dan perusahaan
            untuk cepat menemukan pekerjaan.</p>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4 ml-auto text-center mb-5 mb-lg-0">
          <i class="fas fa-phone fa-3x mb-3 text-muted"></i>
          <div>+62 85730622110</div>
        </div>
        <div class="col-lg-4 mr-auto text-center">
          <i class="fas fa-envelope fa-3x mb-3 text-muted"></i>
          <!-- Make sure to change the email address in anchor text AND the link below! -->
          <a class="d-block" href="mailto:masukerja@gmail.com">masukerja@gmail.com</a>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="bg-light py-5">
    <div class="container">
      <div class="small text-center text-muted">Copyright &copy; MasuKerja | Rekayasa Perangkat Lunak | G.E.I | PENS
      </div>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="plugins/jquery/jquery.min.js"></script>
  <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="plugins/jquery-easing/jquery.easing.min.js"></script>
  <script src="plugins/magnific-popup/jquery.magnific-popup.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="dist/js/creative.js"></script>

</body>

</html>
