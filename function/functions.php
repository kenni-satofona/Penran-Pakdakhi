<?php
$db_host = 'localhost'; // atau sesuai dengan konfigurasi Anda
$db_user = 'root'; // atau user lain jika Anda menggunakan user berbeda
$db_pass = ''; // password user database
$db_name = 'dompet-qu'; // pastikan ini sesuai dengan nama database Anda

$koneksi = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
if (!$koneksi) {
    die("Gagal terhubung ke database: " . mysqli_connect_error());
}

// fungsi query
function query($query) {
    global $koneksi;
    $result = mysqli_query($koneksi, $query);
    if (!$result) {
        die("Query gagal: " . mysqli_error($koneksi));
    }
    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }
    return $rows;
}

// tambah data Pemasukkan
function tambahMasuk($dataMasuk) {
    global $koneksi;
    $tanggalMasuk = htmlspecialchars($dataMasuk["tanggal"]);
    $keteranganMasuk = htmlspecialchars($dataMasuk["keterangan"]);
    $sumber = htmlspecialchars($dataMasuk["sumber"]);
    $jumlah = htmlspecialchars($dataMasuk["jumlah"]);
    $username = htmlspecialchars($dataMasuk["username"]);

    // query insert data
    $query = "INSERT INTO pemasukkan (id, tanggal, keterangan, sumber, jumlah, username) VALUES (NULL, '$tanggalMasuk', '$keteranganMasuk', '$sumber', '$jumlah', '$username')";
    mysqli_query($koneksi, $query);           

    return mysqli_affected_rows($koneksi);
}

// tambah data Pengeluaran
function tambahKeluar($dataKeluar) {
    global $koneksi;
    $tanggalKeluar = htmlspecialchars($dataKeluar["tanggal"]);
    $keteranganKeluar = htmlspecialchars($dataKeluar["keterangan"]);
    $keperluan = htmlspecialchars($dataKeluar["keperluan"]);
    $jumlah = htmlspecialchars($dataKeluar["jumlah"]);
    $username = htmlspecialchars($dataKeluar["username"]);

    // query insert data
    $query = "INSERT INTO pengeluaran (id, tanggal, keterangan, keperluan, jumlah, username) VALUES (NULL, '$tanggalKeluar', '$keteranganKeluar', '$keperluan', '$jumlah', '$username')";
    mysqli_query($koneksi, $query);           

    return mysqli_affected_rows($koneksi);
}

// format tanggal indonesia
function tgl_indo($tgl) {
    $tanggal = substr($tgl, 8, 2);
    $nama_bulan = array("Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Ags", "Sep", "Okt", "Nov", "Des");
    $bulan = $nama_bulan[(int)substr($tgl, 5, 2) - 1];
    $tahun = substr($tgl, 0, 4);

    return $tanggal.'-'.$bulan.'-'.$tahun;
}

// fungsi transfer saldo rekening
function transfer($dataTransfer) {
    global $koneksi;
    $username = htmlspecialchars($dataTransfer['username']);
    $username2 = htmlspecialchars($dataTransfer['username2']);
    $tanggal = htmlspecialchars($dataTransfer['tanggal']);
    $saldoRekening = htmlspecialchars($dataTransfer['saldoRekening']);
    $jumlah = htmlspecialchars($dataTransfer['jumlah']);
    $jumlahConvert = str_replace('.', '', $jumlah);

    if ($jumlahConvert > $saldoRekening) {
        echo "<script>alert('Maaf, saldo anda tidak cukup!');</script>";
        return false;
    }
    // query insert data
    $query = "INSERT INTO rekening_masuk(jumlah, tanggal, username) VALUES('$jumlah', '$tanggal', '$username')";
    $query2 = "INSERT INTO rekening_keluar(jumlah, tanggal, username) VALUES('$jumlah', '$tanggal', '$username2')";
    mysqli_query($koneksi, $query);
    mysqli_query($koneksi, $query2);

    return mysqli_affected_rows($koneksi);
}
?>
