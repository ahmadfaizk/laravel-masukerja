-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 02, 2019 at 01:59 AM
-- Server version: 10.3.18-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_masukerja`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text COLLATE utf8_bin NOT NULL,
  `id_kategory` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `name`, `date`, `description`, `id_kategory`) VALUES
(1, 'Bukan Gaji Tinggi, Ini 5 Tanda Raih Pekerjaan Impssda', '2019-11-20 16:01:10', 'Meraih pekerjaan yang sesuai impian maupun jalan hidup ternyata tidak melulu terkait gaji yang tinggi. Rahasianya justru terletak pada engagement positif dalam karier tersebut.\r\nMenurut The Ladders, kondisi meraih pekerjaan impian agak serupa dengan bertemu jodoh impian. Ketika single, mungkin seseorang berpikir jodoh impian adalah yang punya banyak uang, tetapi kenyataannya yang membuat nyaman dengan pasangan belum tentu uang, melainkan perasaan  pasangan adalah sosok yang tepat.', 2),
(2, 'awdaad', '2019-11-19 14:22:00', 'awddsda', 1),
(3, 'ads', '2019-11-20 16:01:24', 'awddad', 1),
(4, 'asdcad', '2019-11-20 16:07:18', 'wad', 1);

-- --------------------------------------------------------

--
-- Table structure for table `article_category`
--

CREATE TABLE `article_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `article_category`
--

INSERT INTO `article_category` (`id`, `name`) VALUES
(1, 'Teknologi'),
(2, 'Pekerjaan');

-- --------------------------------------------------------

--
-- Table structure for table `code_answer`
--

CREATE TABLE `code_answer` (
  `id` int(11) UNSIGNED NOT NULL,
  `code` varchar(1) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `code_answer`
--

INSERT INTO `code_answer` (`id`, `code`) VALUES
(1, 'E'),
(2, 'I'),
(3, 'S'),
(4, 'N'),
(5, 'T'),
(6, 'F'),
(7, 'J'),
(8, 'P');

-- --------------------------------------------------------

--
-- Table structure for table `code_question`
--

CREATE TABLE `code_question` (
  `id` int(11) UNSIGNED NOT NULL,
  `code` varchar(5) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `code_question`
--

INSERT INTO `code_question` (`id`, `code`) VALUES
(1, 'EI'),
(2, 'SN'),
(3, 'TF'),
(4, 'JP');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `company` varchar(100) COLLATE utf8_bin NOT NULL,
  `id_job_field` int(11) UNSIGNED NOT NULL,
  `id_job_source` int(11) UNSIGNED NOT NULL,
  `id_job_location` int(11) UNSIGNED NOT NULL,
  `min_salary` int(11) NOT NULL,
  `max_salary` int(11) NOT NULL,
  `posting_date` date NOT NULL,
  `closing_date` date NOT NULL,
  `url` varchar(150) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `name`, `company`, `id_job_field`, `id_job_source`, `id_job_location`, `min_salary`, `max_salary`, `posting_date`, `closing_date`, `url`, `description`) VALUES
(3, 'Senior Merchandiser Furniture', 'Quartindo Sejati Furnitama PT', 10, 2, 5, 3500000, 5000000, '2019-11-24', '2019-12-24', 'https://www.jobs.id/lowongan/MjgwNjM4/senior-merchandiser-furniture-quartindo-sejati-furnitama-pt', 'Deskripsi Pekerjaan\r\nLiaise with factory on customer\'s needs which include pre- production samples, price quotation and\r\n tracking production\r\nParticipate in the product development stage in order to ensure samples match with required\r\n specification and quality standard\r\nFollow up on order details and communicate requirements to factory\r\nTrack production process throughout to ensure specifications have been met\r\nAble to identify problems and work our alternative solutions with factories to resolve any problems\r\n which may arise\r\nCheck quality of products in different production stages\r\nAble to make and maintain quality protocols to ensure customer satisfaction\r\n\nPersyaratan\r\nCandidate must possess at least Diploma, Bachelor\'s Degree in Commerce or equivalent.\r\nRequired language(s):\r\nEnglish, Mandarin\r\nAt least 3\r\nYear(s) of working experience in\r\nsales merchandising experience within furniture, and/or export manufacturing industry\r\nPreferably Staff (non-management & non-supervisor) specialized in Merchandising or equivalent.\r\nGeneral knowledge of furniture or product production\r\nGood command in written and spoken English\r\nService oriented with attention to details\r\nMature, independent with a positive attitude\r\nAble to work in a team but also a self-starter'),
(4, 'Advertising', 'Yayasan Nurul Hayat', 15, 2, 6, 3000000, 3200000, '2019-11-22', '2019-12-07', 'https://www.jobs.id/lowongan/MjgzMzIz/advertising-yayasan-nurul-hayat', 'Deskripsi Pekerjaan\r\nMembuat dan mengelola Website Perusahaan\r\nIntegrasi website dengan web yang lain (transfer data house to house)\r\n\nPersyaratan\r\nLaki-laki , Muslim\r\nPendidikan minimal D3 Sistem Informasi/ Informatika\r\nMenguasai Facebook ads dan Google ads\r\nMenguasai bahasa program, Java, PHP,\r\nhtml, css, js, dan RESTful API\r\nMempunyai ketertarikan dibidang sistem informasi\r\nJujur dan Bertanggung Jawab\r\nMampu bekerja dibawah tekanan\r\nMampu Bekerja sama dalam tim'),
(5, 'Info Lowongan Kerja Kantor', 'Surya Otopart PT', 30, 2, 7, 4000000, 5000000, '2019-11-24', '2019-12-24', 'https://www.jobs.id/lowongan/MjgyNTYz/info-lowongan-kerja-kantor-surya-otopart-pt', 'Deskripsi Pekerjaan\r\nBerikut Adalah POSISI Pekerjaan yang Dibutuhkan :\r\n• Posisi : Staff Administrasi\r\n• Posisi : Staff Data Entry\r\n• Posisi : Staff Accounting\r\n• Posisi : Staff Quality Control\r\n• Posisi : Staff Gudang\r\n• Posisi : Resepsionis\r\n• Posisi : Operator Produksi / Mesin\r\n• Posisi : SPG & SPB\r\n• Posisi : Packing Barang\r\n• Posisi : Office Boy / Girl\r\n• Posisi : Cleaning Service\r\n• Posisi : Secure Parking\r\n• Posisi : Security\r\n• Posisi : Driver Kantor & Driver Pribadi\r\nPersyaratan :\r\n• Pendidikan Minimal SMP, SMA/k sederajat\r\n• Bertanggung Jawab Terhadap Pekerjaan\r\n• Pria / Wanita Usia Maksimal 42 tahun\r\n• Pengalaman / Non Pengalaman\r\n• Siap Memajukan Perusahaan\r\n• Boleh berjilbab / berkacamata\r\n• Bisa Bekerja dalam team\r\n• Sopan, Elegan Jujur\r\n• Displin dalam Kerja\r\nFasilitas :\r\nGaji Pokok UMR JAKARTA (negotiable sesuai posisi)\r\n• Transportasi + harian\r\n• Mess / Transport / Jemputan\r\n• Seragam, Bonus + Shifting\r\n• Jaminan kesehatan BPJS\r\n• Lembur Normative\r\n• Premi Kehadiran\r\n• FASILITAS Full\r\nCARA MELAMAR :\r\nCara mendaftar,silahkan Hubungi\r\nVia Watshapp\r\nKe\r\nNomor\r\n:\r\n0 *- 8 * - 1 *- 5 -\r\n1 - 7 - 5 - 8 - 9 - 7 - 0 - 8\r\n\nPersyaratan\r\nsiap kerja'),
(6, 'Business Consultant (Sales)', 'Rifan Financindo Bandung PT', 7, 2, 3, 3000000, 5000000, '2019-11-23', '2019-12-08', 'https://www.jobs.id/lowongan/MjgxMzkz/business-consultant-sales-rifan-financindo-bandung-pt', 'Deskripsi Pekerjaan\r\nJob desk:\r\nMenyusun informasi dan data yang relevan\r\nPenghubung erat dengan staf penjualan dan antar-agen broker\r\nMenentukan sentimen pasar melalui penelitian, penilaian dan analisis data\r\nMelakukan pemantauan dan kinerja pasar internasional\r\nMempersiapkan dan penyediakan informasi perdagangan harian\r\nMenafsirkan laporan keuangan / pasar\r\nMenginformasikan staf penjualan tentang gerakan / harga pasar\r\nMengeksekusi perdagangan\r\nMendapatkan informasi dari staf penjualan tentang masalah klien\r\nFasilitas:\r\nAlat komunikasi (Telpon)\r\nKomputer dan jaringan internet\r\nDriver dan kendaraan operasional\r\nBenefit\r\nKomisi tidak terbatas\r\nGaji tetap\r\nJenjang Karir\r\nOR\r\nBounty\r\nTrainning education\r\n\nPersyaratan\r\n- Laki-Laki / Perempuan, umur minimal 22 tahun\r\n- Tinggi minimal Pria :160cm, wanita :155cm\r\n- Pendidikan Minimal SMA\r\n- Penampilan Menarik Dan Baik Dalam Berkomunikasi\r\n- Bisa Mengoprasikan Komputer\r\n- Motivasi Tinggi, Banyak Relasi, Energik Dan Jujur\r\n- Bisa Bekerjasama Dalam Tim'),
(7, 'Product Stylist', 'Panmomo Retail Indonesia PT', 15, 2, 8, 0, 0, '2019-11-22', '2019-11-25', 'https://www.jobs.id/lowongan/MjgwNzUw/product-stylist-panmomo-retail-indonesia-pt', 'Deskripsi Pekerjaan\r\nmempersiapkan dekor sebelum proses pembuatan video produk dimulai\r\n\nPersyaratan\r\nLaki - Laki & Perempuan\r\nPendidikan minimal D3\r\nBerpengalaman dibidangnya\r\nRajin, pekerja keras, disiplin dan bertanggung jawab\r\nSiap bekerja dalam team'),
(8, 'Trainer', 'Cipta Power Service PT', 17, 2, 9, 4000000, 8000000, '2019-11-22', '2019-11-25', 'https://www.jobs.id/lowongan/MjgwNzcw/trainer-cipta-power-service-pt', 'Deskripsi Pekerjaan\r\nmempersiapkan kebutuhan pelatihan secara efektif dan sistematis\r\nmemberikan coaching kepada karyawan terutama spg & sales\r\nmemberikan motivasi positif untuk mengembangkan percaya diri\r\nmemberikan motivasi untuk penjualan\r\nmampu memberikan coaching dalam bahasa inggris\r\nmenjalin hubungan baik dengan client\r\n\nPersyaratan\r\nlaki laki atau perempuan\r\nusia maksimal 35 tahun\r\npendidikan minimal d3\r\nberpenampilan menarik\r\nmampu berbahasa inggris\r\nberpengalaman traineer spg & sales min. 1 tahun\r\nmampu memberikan coaching dan motivasi penjualan\r\npercaya diri ,disiplin dan jujur'),
(9, 'SUPERVISOR ACCOUNTING', 'Sinar Bintang Timur CV', 9, 2, 6, 0, 0, '2019-11-24', '2019-12-24', 'https://www.jobs.id/lowongan/MjgyNjkx/supervisor-accounting-sinar-bintang-timur-cv', 'Deskripsi Pekerjaan\r\nMengontrol dan mengelola fungsi finance, tax dan accounting dalam proses data untuk membuat laporan\r\nMenjalankan dan mengembangkan strategi untuk mengelola asset kewajiban pajak perusahaan agar efisien, akurat dan tepat waktu\r\nMengntrol dan memonitoring arus kas perusahaan (Cashflow)\r\nBertanggung jawab terhadap proses merencanakan, menyusun anggaran perusahaan sampai penggunaan anggaran\r\nMelakukan Analisa dan evaluasi terhadap laporan keuangan (SPT, Laporan keuangan dan laporan pajak bulanan tahunan)\r\nMenjalin kerjasama dan komunikasi yang baik dan tim Finance, Tax dan Accounting serta semua divisi yang ada pada internal perusahaan\r\nMenyajika laporan laporan terkait hasil kinerja bagaiannya maupun laporan yang bersifat khusus untuk direksi.\r\n\nPersyaratan\r\nUsia Max 30\r\nth\r\nS1 Accounting Administration\r\nDiutamakan memiliki pengalaman Min 4\r\nth'),
(10, 'Perawat Bedah', 'RSIA Resti Mulya', 12, 2, 10, 0, 0, '2019-11-22', '2019-11-25', 'https://www.jobs.id/lowongan/Mjc4Mjk4/perawat-bedah-rsia-resti-mulya', 'Persyaratan\r\nPendidikan D3 Keperawatan\r\nMemiliki STR\r\nBisa Pasang infus anak dan dewasa\r\nBisa melakukan RJP\r\nPengalaman minimum 2 tahun sebagai perawat bedah\r\nDapat berkomunikasi yang baik dengan pasien, dokter, keluarga pasien dan rekan kerja.\r\nDapat menghitung dosis obat\r\nMemiliki Pelatihan BTCLS\r\nBisa bekerja dalam tim'),
(11, 'DIGITAL MARKETING OFFICER', 'Sumbermas Sejahtera CV', 15, 2, 6, 0, 0, '2019-11-22', '2019-12-15', 'https://www.jobs.id/lowongan/MjgzOTAz/digital-marketing-officer-sumbermas-sejahtera-cv', 'Deskripsi Pekerjaan\r\nmembuat marketing plan untuk memasarkan produk-produk alat teknik melalui media sosial, marketplace, dsb.\r\nmeningkatkan penjualan produk melalui\r\nmedia online\r\nmenjawab korespondensi tanya jawab pada media sosial perusahaan.\r\n\nPersyaratan\r\npria/wanita usia\r\n22-30 tahun\r\nminimal pendidikan D3 Komputer\r\nterbiasa menggunakan media online untuk penjualan merupakan nilai tambah\r\nmahir menggunakan komputer/tablet/gadget elektronik\r\nmahir dan kreatif dalam hal copywriting & SEO\r\nsanggup bekerja dalam target'),
(12, 'Asisten Manager', 'Equityworld Surabaya PT', 7, 2, 11, 3000000, 5000000, '2019-11-23', '2019-12-16', 'https://www.jobs.id/lowongan/MjY5MjI2/asisten-manager-equityworld-surabaya-pt', 'Deskripsi Pekerjaan\r\nMembantu pelaksanaan kerja Manager dalam :\r\nMelakukan Perjanjian Bertemu dengan Client\r\nFollow up dengan Client setelah bertemu\r\nMempersiapkan berkas/dokumen untuk kegiatan dengan client\r\nMaintenance ke client\r\nFollow Up data\r\nMencari data calon klien dan mengatur jadwal meeting\r\n\nPersyaratan\r\npria / wanita\r\nmax usia 30 tahun\r\npendidikan SMA (diutmakan D3 keatas)\r\nmenguasai bahasa inggris aktif\r\nmampu microsoft office\r\nbisa power point\r\nlancar berkomunikasi\r\nBerani\r\nberpenampilan menarik\r\nsuka tantangan\r\ncerewet\r\nberwawasan luas\r\nsiap ditempatkan di surabaya (mulai interview dan test )'),
(13, 'Adm Gudang', 'Saboga Food Indonesia PT', 7, 2, 3, 0, 0, '2019-11-22', '2019-12-22', 'https://www.jobs.id/lowongan/MTkyOTM3/adm-gudang-saboga-food-indonesia-pt', 'Persyaratan\r\nLaki-laki\r\nMin DIII / Sederajat\r\npaham proses gudang, stock opname, penataan barang masuk dan keluar khususnya gudang makanan\r\npengalaman min 2 thn\r\nusia max 45 thn'),
(14, 'Office Boy', 'Numex Teknologi Indonesia', 38, 2, 12, 2000000, 2500000, '2019-11-24', '2019-12-24', 'https://www.jobs.id/lowongan/MTkzNTI5/office-boy-numex-teknologi-indonesia', 'Deskripsi Pekerjaan\r\nPembersihan & perawatan kantor\r\nMenjaga & menyusun aset kantor\r\nMembantu menyediakan kebutuhan karyawan\r\nMengirim/mengambil dokumen antar divisi\r\nBersedia bekerja lembur dan jika dibutuhkan bekerja di hari libur\r\n\nPersyaratan\r\nLaki-Laki\r\nPendidikan minimal SMA/SMK\r\nMemiliki pengalaman sebagai Office Boy / Cleaning Service min. 1 thn (Diutamakan)\r\nTeliti, cekatan, jujur, dan bertanggungjawab'),
(15, 'Technical Marketing', 'Sumber Usaha Radiator PT', 15, 2, 4, 0, 0, '2019-11-22', '2019-12-22', 'https://www.jobs.id/lowongan/MjgxNzA3/technical-marketing-sumber-usaha-radiator-pt', 'Deskripsi Pekerjaan\r\nMelakukan telemarketing membuat perjanjian untuk bertemu dengan custumer.\r\nFollow up Customer melalui website perusahaan.\r\nMembuat laporan kunjungan ke custumer setiap hari.\r\nDapat mewakili perusahaan secara Profesional.\r\nBekerjasama dengan Team Enggineering untuk lebih memastikan customer akan menerima.\r\n\nPersyaratan\r\nPria / Wanita Sehat Jasmani dan Rohani, Usia Max 30 Tahun.\r\nPendidikan minimal D3 / S1 ( Teknik Kimia / Teknik Mesin).\r\nMampu Mengopersikan computer ( MS office ).\r\nPenampilan menarik, menyukai tantangan dan bertanggung jawab.\r\nMemiliki SIM A.\r\nPaham dengan ISO 9001:2015, ISO 14001:2015, OHSAS 18001 : 2007, SMK3\r\nBersedia ditempatkan diCikarang'),
(16, 'ADMINISTRASI', 'Autobest PT', 7, 2, 3, 0, 0, '2019-11-22', '2019-12-14', 'https://www.jobs.id/lowongan/Mjc2NDk0/administrasi-autobest-pt', 'Deskripsi Pekerjaan\r\nMengelola dokumen\r\nFilling data entry / mengisi data\r\nMelakukan perekapan data\r\nMelakukan arsip data\r\n\nPersyaratan\r\nTeliti\r\nMemiliki kemampuan berhitung dengan baik\r\nMemiliki kemampuan menggunakan applikasi administratif secara offline maupun online\r\nKemampuan untuk tetap tenang di bawah tekanan\r\nMampu melakukan pendekatan metodis dan menyeluruh untuk kerja\r\nMampu bekerja dalam tim\r\nDapat berkomunikasi dengan baik\r\nMemiliki inisiatif\r\nBelum Menikah\r\nFresh Graduate'),
(17, 'Credit Marketing Officer - CMO', 'Bima Multi Finance PT', 15, 2, 13, 0, 0, '2019-11-22', '2019-12-11', 'https://www.jobs.id/lowongan/MjgzNTA5/credit-marketing-officer-cmo-bima-multi-finance-pt', 'Deskripsi Pekerjaan\r\nPENEMPATAN : Solo, Klaten, Sragen, Lampung, Pringsewu\r\n\nPersyaratan\r\nPria / Wanita\r\nPendidikan minimal D3/ S1 semua jurusan/ minimal SMU berpengalaman\r\nsebagai Marketing/ Sales pada perusahaan pembiayaan atau perbankan\r\nUsia maksimal 37 tahun dengan pengalaman + 3 tahun\r\nFresh graduate diperbolehkan\r\nPekerja keras dengan attitude yang baik dan loyalitas tinggi\r\nMampu bekerja secara team\r\nMampu bekerja dibawah tekanan\r\nMemiliki SIM C dan kendaraan bermotor'),
(18, 'Salesman Banjarmasin', 'Gujati 59 Utama PT', 10, 2, 14, 0, 0, '2019-11-22', '2019-12-22', 'https://www.jobs.id/lowongan/MjgxNTQy/salesman-banjarmasin-gujati-59-utama-pt', 'Deskripsi Pekerjaan\r\n.\r\n\nPersyaratan\r\npria, maks 40tahun\r\npendidikan minimal SMA sederajat\r\npengalaman sales farmasi/herbal min 1tahun\r\nmengenal area penempatan, Banjarmasin'),
(19, 'Staff Teknisi', 'Gunung Himun Peratama PT', 11, 2, 10, 3000000, 4000000, '2019-11-22', '2019-12-13', 'https://www.jobs.id/lowongan/Mjc4MTA3/staff-teknisi-gunung-himun-peratama-pt', 'Deskripsi Pekerjaan\r\nMengerti tentang kelistrikan\r\nMengerti instalasi kelistrikan\r\nMengerti jaringan komputer\r\nBekerja secara mobile\r\n\nPersyaratan\r\nPria\r\nusia maksimal 35 tahun\r\nPendidikan min.\r\nSMA / Sederajat\r\nPengalaman dibidangnya min. 1 tahun\r\nMampu bekerja sama secara team maupun individu'),
(20, 'Office Sales', 'Surya Logam Universal PT', 10, 2, 10, 0, 0, '2019-11-22', '2019-12-13', 'https://www.jobs.id/lowongan/MTkwNDQ3/office-sales-surya-logam-universal-pt', 'Deskripsi Pekerjaan\r\nMelayani PO Customer\r\nMengirim Penawaran dan Merespon Permintaan Harga Customer Secara E-mail\r\n\nPersyaratan\r\nMinimal Lulusan SMA Semua Jurusan\r\nPria / Wanita Maksimal Usia 35 Tahun\r\nMemiliki Kemampuan Komunikasi Pelayanan Yang Baik\r\nMengoperasikan Komputer MS ( Word,Excel )'),
(21, 'Marketing', 'Valbury Bali PT', 10, 2, 15, 5000000, 7000000, '2019-11-24', '2019-12-24', 'https://www.jobs.id/lowongan/MTcxMTI0/marketing-valbury-bali-pt', 'Deskripsi Pekerjaan\r\nMengumpulkan Prospecting List\r\nContacting dan buat Appointment\r\nMengikuti trening tentang Company\r\n\nPersyaratan\r\nLaki-laki atau perermpuan, minimal 19 tahun\r\nBerpenampilan menarik\r\nMampu berkomunikasi dengan baik\r\nMempunyai relasi yang luas\r\nPengalaman di bidang Marketind dan Keuangan di utamakan.\r\nFasilitas\r\nyang akan diperoleh di VAF adalah:\r\nAda bonus & komisi\r\nJam kerja 9.00-17.00 WITA\r\n[Posisi Prioritas]'),
(22, 'Administration Staff', 'Sinarmulia Sukses Makmur PT', 7, 2, 7, 0, 0, '2019-11-22', '2019-12-22', 'https://www.jobs.id/lowongan/OTUyMjY/administration-staff-sinarmulia-sukses-makmur-pt', 'Persyaratan\r\nPria/Wanita\r\nPendidikan min. SMA/SMK-S1Fresh Graduate are wellcome\r\nPengalaman di bidang yang sama lebih diutamakan\r\nMemiliki semangat kerja dan motivasi yang kuat\r\nMemiliki komunikasi yang baik dan mampu bekerja dengan Tim\r\nMenguasai sistem accurate & Myob\r\nPenempatan: Jakarta, Bekasi dan tangerang'),
(23, 'Purchasing Supervisor', 'Formosa Bag Indonesia PT', 16, 2, 16, 5000000, 7000000, '2019-11-22', '2019-12-09', 'https://www.jobs.id/lowongan/MjgzNDQ4/purchasing-supervisor-formosa-bag-indonesia-pt', 'Deskripsi Pekerjaan\r\nJob Description :\r\nReceive and review request of goods from all departement daily and monthly\r\nCheck the necessity and budget precisely\r\nCollecting the price, availability, accuracy of delivery and quality of goods from supplier in order to select them\r\nDo the purchasing process, start from offering, price offering, preparing administration\r\nCoordinate with other departement to fix goods specification and delivery time\r\nCommunicate with outsiders related to import activities\r\n\nPersyaratan\r\nGood Communication in English and Mandarin\r\nAt least 2 years working experience in related field is requires for this position\r\nPreferably had\r\nworked in Nike/Adidas factory\r\nGood knowledge and understand about analyze stock\r\nGood knowledge and understand about Import proccess\r\nGood knowledge and understand about Purchase and Product Development\r\nProficient in Microsoft Word, Excel and PPT.'),
(24, 'Marketing', 'Raffles Institute of Higher Education', 15, 2, 17, 0, 0, '2019-11-22', '2019-12-22', 'https://www.jobs.id/lowongan/MTIzNDU2/marketing-raffles-institute-of-higher-education', 'Persyaratan\r\nDiutamakan \r\npria\r\nUsia maksimal 27 tahun\r\nPendidikan minimal S1 dari semua jurusan\r\nPengalaman 2 tahun (\r\nfresh graduate welcome to apply)\r\nBersedia ditempatkan di Jakarta'),
(25, 'Staff Quality Control', 'Aroma Kopikrim Indonesia PT', 14, 2, 5, 2800000, 3000000, '2019-11-22', '2019-12-13', 'https://www.jobs.id/lowongan/MjgxNjkw/staff-quality-control-aroma-kopikrim-indonesia-pt', 'Persyaratan\r\nPerempuan\r\nUsia minimal 26 tahun, usia maksimal 30 tahun\r\nS1 Teknologi Pangan / Biologi / Teknik Kimia / Kimia\r\nPengalaman minimal 2 tahun di bidang yang sama\r\nPengalaman di perusahaan Consumer Goods (nilai tambah)\r\nGood looking\r\nLancar berbahasa Inggris\r\nLeadership\r\nKomunikatif\r\nJujur\r\nTekun\r\nInisiatif\r\nBertanggung jawab terhadap pekerjaan'),
(26, 'Finance & Accounting', 'Abhimata Persada PT', 9, 2, 17, 7000000, 8000000, '2019-11-22', '2019-12-22', 'https://www.jobs.id/lowongan/Mjc4MTg1/finance-accounting-abhimata-persada-pt', 'Deskripsi Pekerjaan\r\nThe incumbent would be responsible for daily cash flow duties, such as payment, collection, and financial reporting.\r\nResponsible for accounting reports, including bank reconciliation, profit & loss reports, AR/AP reports.\r\nResponsible for budgeting/ cost accounting and financial statements.\r\n\nPersyaratan\r\nBachelor degree, max. 27 years old, majoring Finance and Accounting.\r\nHaving min. 1 year experience as finance or accounting staff/ officer.\r\nFresh graduates are encouraged to apply.\r\nUnderstand financial statements and accounting reports.\r\nAble to do consolidation accounting reports.\r\nExperienced in audit/ accounting, financial, & tax consultant would be an advantage.\r\nHaving good communication and coordination skills, a team player.\r\nSelf-driven, having willingness to learn, well-adaptable.\r\nAble to work in dynamic environment and adaptive to change.'),
(27, 'Staff Pajak', 'ELS Computer', 9, 2, 18, 1500000, 2000000, '2019-11-22', '2019-12-22', 'https://www.jobs.id/lowongan/OTEyMzc/staff-pajak-els-computer', 'Deskripsi Pekerjaan\r\nPembuatan dan pengurusan EFaktur\r\nMenguasai dan memahami tentang hal perpajakan\r\n\nPersyaratan\r\nPria / Wanita maks. 30 tahun\r\nBackground bisa akuntansi\r\nPengalaman kerja min. 1 tahun.\r\nJujur, ulet dan pekerja keras\r\nDiutamakan Brevet'),
(28, 'Software Engineer Software Tester Consultant', 'Hometech', 6, 2, 3, 0, 0, '2019-11-21', '2019-11-29', 'https://www.jobs.id/lowongan/MjgyOTU2/software-engineer-software-tester-consultant-hometech', 'Deskripsi Pekerjaan\r\nDibutuhkan kandidat yang memiliki kualifikasi baik untuk mengisi posisi FULLTIME IT / Software Engineer. Dengan kemampuan yang berpotensi untuk belajar hal-hal baru dengan basic knowledge programming dan pengetahuan akuntansi dasar.\r\n\nPersyaratan\r\nKriteria Teknis Calon tenaga kerja:\r\n1. Memiiki dasar programming Java atau Python (lebih utama).\r\n2. Lebih jika memiliki sedikit pengalaman di OS Linux.\r\n3. Memiliki semangat belajar hal yang baru.\r\n4. Sikap kerja yang baik, mendukung kerja team.\r\n5. Lulusan minimum D3 Politeknik rekayasa perangkat lunak.\r\n6. Memiliki pengetahuan Basic Accounting'),
(29, 'Progress Advisor Depok', 'Learning Unlimited', 27, 2, 19, 4000000, 4500000, '2019-11-21', '2019-12-21', 'https://www.jobs.id/lowongan/Mjc1MTcy/progress-advisor-depok-learning-unlimited', 'Deskripsi Pekerjaan\r\nThe Progress Advisor is responsible for the implementation of Course Management Procedure, communication among teachers, parents and students, and driving customer retention, referral and recommendation.\r\nThe role:\r\nThe Progress Advisor is a key role among students, parents, and teachers; you work as a coordinator, a supporter. You always accompany the students, orientate theirs growth step by step.\r\nYou will:\r\nManage courses\' schedule and progress\r\nCommunicate among course teachers, parents and kids to track the teaching quality and study results, keep solid relationship with all customers, achieve renewal target\r\nAchieve the targets of retention, referral and customer satisfaction\r\nHandle the complaints and suggestions\r\nOther duties and responsibilities assigned by company when needed\r\n\nPersyaratan\r\nYou have/are:\r\nMaximum 27 years old\r\nUniversity graduate, Bachelor Degree in any major\r\nFresh graduate are welcome to apply\r\nRequired Skill(s): english,\r\nLove children and care about their growth\r\nExcellent self-learning ability\r\nOpen minded, willing to communicate with people, good communication skill\r\nGood team player and focus on details\r\nGood planning and organizing ability, work flexible and able to deal with uncertainties\r\nGood service sense and emotion management\r\nSkilled in Microsoft Office (Word, Excel, PowerPoint, Outlook)\r\nLiving around South Jakarta or Depok Area\r\nWilling to be placed in\r\nEF\r\nDepok\r\nIf you feel that you can meet the qualification and up to the challenge, please send your complete application (application letter, resume, expected salary, and any\r\n related supporting documents) and current color photograph at size 4 x 6 cm.'),
(30, 'Programming Mobile', 'Aarti Jaya PT', 31, 2, 3, 0, 0, '2019-11-21', '2019-12-21', 'https://www.jobs.id/lowongan/Mjg0MjY3/programming-mobile-aarti-jaya-pt', 'Deskripsi Pekerjaan\r\n- Javascript,\r\n- React Native\r\n- Pengetahuan Api\r\n- Android Native\r\n- Familiar dgn cloud apps. Digital ocean, aws, azure, gcp.\r\n\nPersyaratan\r\n- pria, maksimal 35 thn\r\n- pengalaman 2-3 thn di bidang programming mobile. \r\n- Domisili bandung'),
(31, 'Supervisor Sales Retail', 'Altama Surya Anugerah PT', 10, 2, 10, 4000000, 8000000, '2019-11-21', '2019-12-21', 'https://www.jobs.id/lowongan/Mjc2OTI3/supervisor-sales-retail-altama-surya-anugerah-pt', 'Deskripsi Pekerjaan\r\nMemastikan\r\ntarget\r\npenjualan tercapai dan implementasi marketing strategy di lapangan terlaksana\r\nMencari customer baru; menjalin hubungan baik dengan customer existing, memberikan informasi mengenai produk, promosi, dan perusahaan serta melakukan penjualan; memproses pesanan customer; memprioritaskan pengiriman yang urgent dan memonitor apakah pesanan customer sudah tiba untuk memastikan target penjualan tercapai\r\nMembantu FAT melakukan penagihan kepada customer yang sulit untuk memastikan pembayaran sesuai kebijakan perusahaan\r\nMemonitor dan mengusulkan media promosi kepada toko sesuai dengan kebijakan perusahaan serta\r\nmengeksekusi program promosi\r\nMemproses dan mencari solusi atas keluhan pelanggan dengan berkoordinasi dengan pihak internal terkait untuk memastikan kepuasan pelanggan\r\nMencari info mengenai kompetitor serta info dan sampel produk baru\r\n\nPersyaratan\r\nUsia maksimal 35 tahun\r\nPendidikan minimal SMA segala jurusan\r\nMemiliki pengalaman di bidang Sales / Marketing terutama pasar retail atau otomotif selama 1 tahun\r\nMenguasai bahasa Mandarin lebih disukai\r\nMemiliki kemampuan dalam hal penjualan dan strategi marketing\r\nMampu mengoperasikan komputer (Ms. Office, Outlook, Internet)\r\nMemiliki SIM C\r\nBersedia melakukan perjalanan dinas ke luar kota\r\nLaki - Laki'),
(32, 'Telemarketing', 'Swapro International PT', 10, 2, 10, 0, 0, '2019-11-21', '2019-12-08', 'https://www.jobs.id/lowongan/OTc1NzM/telemarketing-swapro-international-pt', 'Deskripsi Pekerjaan\r\nMelakukan penjualan by phone dari data base perusahaan\r\n\nPersyaratan\r\nPria / Wanita, berusia maximal \r\n30\r\n tahun\r\n, \r\nPendidikan minimal D3, dengan IPK min 2,\r\n75, \r\nMampu bekerja dengan target\r\n, \r\nMempunyai kemampuan berkomunikasi yang baik\r\n, \r\nMenguasai computer, \r\nPenempatan di daerah Klender, Cakung, Kelapa Gading, Jatinegara, Bekasi dan JABOTABEK'),
(33, 'Geodesi', 'Elixer Reka Digita PT', 26, 2, 20, 0, 0, '2019-11-21', '2019-12-21', 'https://www.jobs.id/lowongan/MTI0ODAz/geodesi-elixer-reka-digita-pt', 'Persyaratan\r\nPria/Wanita\r\nPendidikan minimal S1 Teknik Geodesi\r\nPengalaman minimal 1 tahun\r\nBersedia ditempatkan di Jakarta Selatan\r\nDisiplin dan bertanggung jawab'),
(34, 'MARKETING EXECUTIVE', 'Indra Megah Makmur PT', 15, 2, 9, 3500000, 7000000, '2019-11-21', '2019-12-21', 'https://www.jobs.id/lowongan/Mjg0Mjc1/marketing-executive-indra-megah-makmur-pt', 'Deskripsi Pekerjaan\r\nMelakukan penjualan unit condotel kepada customer\r\nMemberikan presentasi produk perusahaan kepada customer\r\nMelakukan canvassing, flyering, melakukan posting iklan di internet dan mengikuti pameran-pameran properti\r\nMembantu customer terkait kelengkapan administrasi yang diperlukan terkait dengan pembelian unit\r\n\nPersyaratan\r\nUsia maksimal 35 tahun\r\nPendidikan minimal D3 segala jurusan\r\nMemiliki pengalaman min 2 tahun sebagai Sales/ Marketing diutamakan Property Condotel\r\nBerpenampilan menarik\r\nDapat berkomunikasi dengan baik dan persuasif\r\nMemiliki relasi/ database customer yang luas\r\nMemiliki daya juang yang tinggi\r\nBersedia bekerja di hari weekend (Sabtu & Minggu) dan/atau Hari Libur Nasional (akan libur diantara hari Senin-Jumat)\r\nBersedia ditugaskan keluar kota'),
(35, 'QA Specialist', 'Sinar Continental PT', 20, 2, 21, 0, 0, '2019-11-21', '2019-12-08', 'https://www.jobs.id/lowongan/MjcxMjk0/qa-specialist-sinar-continental-pt', 'Deskripsi Pekerjaan\r\nMelakukan\r\nkomunikasi dengan costumer terkait dengan kualitas produk\r\nMemastikan semua\r\nmasalah diselesaikan dengan baik\r\nMemastikan action plan terhadap masalah berjalan sesuai rencana dan effective\r\nMemastikan prosedur dan standar kerja berjalan dengan baik\r\nIkut serta dalam seluruh kegiatan audit\r\n\nPersyaratan\r\nMax 30 tahun\r\nMinimal S1 Teknik Industri\r\nMemiliki komunikasi skill dan kerjasama yang baik\r\nMemiliki kemampuan analisa yang baik\r\nBerpengalaman di bidang yang sama minimal 1 tahun\r\nDiutamakan yang aktif berbahasa inggris lisan maupun tulisan'),
(36, 'PRAMUSAJI', 'RSIA Belleza Kedaton Bandar Lampung', 19, 2, 22, 0, 0, '2019-11-21', '2019-12-21', 'https://www.jobs.id/lowongan/OTY3Mjg/pramusaji-rsia-belleza-kedaton-bandar-lampung', 'Deskripsi Pekerjaan\r\nMenyiapkan dan mengantarkan makanan ke pasien dengan prosedur yang benar\r\n\nPersyaratan\r\nPerempuan, maksimal usia 25 tahun\r\nPendidikan SMK/D1 Pariwisata\r\nMemahami standar porsedur service internasional\r\nGood performance & good communication\r\nBersedia untuk kerja shift\r\nmampu bekerjasaman dalam tim'),
(37, 'Staff Marketing', 'Intan Safety Glass PT', 16, 2, 8, 3900000, 6000000, '2019-11-21', '2019-12-21', 'https://www.jobs.id/lowongan/MjY5NTY1/staff-marketing-intan-safety-glass-pt', 'Deskripsi Pekerjaan\r\nAbout Us:\r\nAt INTAN we bridge consumers and their infrastructure dream into reality.\r\nEstablished for more than 20 years, INTAN is a glass-processing company offering any type of glass processing capabilities ranging from Tempered Glass, Laminated Glass to Mirror Glass. Our integrated team of production and marketer works with customer to provide service and architectural products of a very high calibre as we strive to break the norms and practices of how industries serve our customers. With over 10,000 projects across Indonesia, our people will continue improving to provide architectural solutions at a larger scope.\r\nTujuan Departemen:\r\nDepartemen Marketing memainkan peran penting dalam menjadi jembatan antara bisnis, produk dan misi perusahaan. Divisi marketing adalah wajah dari perusahaan dan pihak pertama yang mewakili perusahaan dimana pelanggan. Divisinya sendiri bertanggung jawab dalam mengharumkan nama perusahaan di depan publik.\r\nJob Summary:\r\nStaf departemen marketing bertanggung jawab untuk mempromosikan dan mengarahkan penjualan barang atau jasa perusahaan. Diapun harus melakukan tugas sehari-hari yang membuat departemen tetap berfungsi dan memfasilitasi divisi untuk beroperasional dengan efektif dan efisien.\r\nJob Description:\r\nMempersiapkan dan menindaklanjuti tender dan inisiatif kolaborasi\r\nMenganalisis sektor pasar dan pelanggan; mencocokkan permintaan klien dengan penawaran kami dan menganalisis sumber dan tren pendapatan\r\nSecara proaktif mencari pelanggan baru dan peluang dan memperkenalkan profil pengujian kami (Leads)\r\nMenjalankan proses administrasi penjualan secara efisien dari pencarian lead hingga faktur penjualan\r\nMenjaga hubungan dekat dengan klien dan mitra (target kunjungan)\r\nBeroperasi sebagai titik kontak utama untuk setiap dan semua hal khusus untuk pelanggan Anda\r\nBerkomunikasi dengan berbagai pihak dengan keterampilan presentasi dan negosiasi yang kuat.\r\nMembantu dalam persiapan keluaran penelitian untuk menjawab pemangku kepentingan internal dan kebutuhan manajemen senior\r\nAtur pertemuan vendor / pelanggan dan kunjungan pabrik\r\nMembantu dengan kegiatan promosi dan melakukan desain promosi\r\nFasilitas:\r\nBPJS Kesehatan\r\nBPJS Ketenaga Kerjaan\r\nGaji + Komisi\r\nBagi Lamaran yang tertarik, mohon hubungi bagian HRD di email yang tercantum di Job Post ini jika ada yang ingin di ketahui.\r\n\nPersyaratan\r\nKualifikasi Minimum:\r\nPendidikan Minimal D3 atau sederajat\r\n1-2 Tahun Pengalaman di divisi Marketing atau sederajat\r\nPengertian di Microsoft Office dan pengertian terhadap minimal satu software Leads Gathering/Marketing/CMS\r\nPengetahuan Adobe Photoshop/illustrator, atau software yang semacemnya adalah sebuah plus\r\nMemiliki motivasi tinggi dalam Penjualan\r\nKeterampilan yang diperlukan:\r\nMengerti Social Media, Membuat desain dan mengetahui tren marketing adalah sebuah plus\r\nSikap baik dengan berpikiran detail, kreatif, motivasi diri dan mau belajar, bisa mendorong diri sendiri untuk bekerja\r\nBisa mengikuti arahan atasan, namun cukup kreatif untuk membuat perubahan yang lebih baik.\r\nSikap positif, kemauan yang kuat untuk belajar dan menerima tantangan.\r\nKeterampilan komunikasi (harus mampu memahami semua perintah dan instruksi kerja tertulis dan verbal); dan bisa mengontrol bawahan.'),
(38, 'Electrical Engineer (Panel Specialist)', 'Graha Sumber Prima Elektronik PT', 21, 2, 23, 0, 0, '2019-11-21', '2019-12-10', 'https://www.jobs.id/lowongan/MjgxNTU2/electrical-engineer-panel-specialist-graha-sumber-prima-elektronik-pt', 'Deskripsi Pekerjaan\r\nDesign & Handle Panel LV Inquiries\r\nBertanggung jawab untuk pembuatan BOQ\r\nBertanggung jawab untuk layanan after-sales, tim, laporan, dan kendala customer\r\nBertanggung jawab untuk menyelesaikan masalah yang menghambat pencapaian target divisi, baik itu dengan peningkatan dalam proses implementasi atau dengan mengambil tindakan korektif\r\n\nPersyaratan\r\nMin. D3 (Teknik Listrik, Teknik Elektro, Teknik elektronika Industri)\r\nPengalaman Min. 1 Tahun di bidang yang sama\r\nMengerti cara kerja dan fungsi Panel LV (Panel MDP, Panel SDP, Panel MCC, Panel PKG, Panel CPGS)\r\nBisa membuat design panel LV (Layout, SLD, Skematik Diagram)\r\nSiap di tempatkan di Taman Tekno, BSD Tangerang Selatan\r\nMemiliki pengetahuan tentang Power Supply (Rectifier, UPS, Genset) akan menjadi nilai tambah'),
(39, 'Production Process Engineer', 'TDK Electronics Indonesia PT', 22, 2, 24, 7500000, 9000000, '2019-11-21', '2019-12-21', 'https://www.jobs.id/lowongan/MjcxMzY4/production-process-engineer-tdk-electronics-indonesia-pt', 'Deskripsi Pekerjaan\r\nYour duties:\r\n \r\nWork on rationalization Project\r\nWork to improve operational efficiency\r\nWork to make cost reduction\r\nProcess yield enhancement\r\nStatistical process control\r\n\nPersyaratan\r\nCandidate must possess at least Bachelor\'s Degree in Mechanical Engineering.\r\nAt least 2\r\nYear(s) of working experience in the related field is required for this position.\r\nPreferably Supervisor/Coordinator specialized in Manufacturing/Production Operations or equivalent.\r\nGood understanding in mechanical process, pneumatic, hydrolic, AOI, automation, robotic and mechatronic will be preferable.\r\nGood Interpersonal and analytical skills.\r\nGood communication in English and computer literate.'),
(40, 'Supervisor Pajak', 'Agromedia Pustaka PT', 9, 2, 20, 0, 0, '2019-11-21', '2019-12-13', 'https://www.jobs.id/lowongan/MjY5MTMz/supervisor-pajak-agromedia-pustaka-pt', 'Deskripsi Pekerjaan\r\nMengidentifikasi kebutuhan informasi perpajakan dan menetapkan system perpajakan berdasarkan kebijakan dan prosedur perpajakan yang relevan\r\nMengkoordinasikan dan mengontrol perencanaan, pelaporan, dan pembayaran kewajiban pejak perusahaan agar efisien, akurat, tepat waktu, dan sesuai dengan peraturan pemeritahan yang berlaku\r\nMengkoordinaksikan dan melakukan supervise penyelenggaraan perpajakan seluruh perusahaan untuk memastikan efisiensi biaya dan kepatuhan terhadap peraturan perpajakan\r\nMelakukan pengecekan terhadap surat setoran pajak (SSP), PPh pasal 21 masa, dan PPh pasal 23 masa, PPn masa dan SPT orang pribadi secara bulanan\r\nMelakukan pengecekan terhadap SPT PPh 21 orang pribadi dan badan, PPh pasal 25 untuk badan dan menyajikan SSP untuk membayar kurang bayar setiap tahun\r\nMenerapkan kebijakan perpajakan di perusahaan\r\nMelakukan updating peraturan dan kebijakan baru di bidang pajak, mengikuti pelatihan, mendokumentasikan peraturan yang berkaitan dengan kegiatan perusahaan memberikan masukan ke atasan.\r\n\nPersyaratan\r\nPria/ Wanita Maks. 28 tahun\r\nPendidikan D3 / S1 Pajak /Akuntansi\r\nMahir Mengoperasikan MS. Office Excel\r\nSertifikat Brevet A & B\r\nMengerti Laporan Keuangan dan Pelaporan SPT Badan\r\nMampu menghandle pajak bulanan dan tahunan\r\nMemiliki pengalaman di Akuntan publik min 2 tahun\r\nMemiliki pengalaman di Pajak min 1 tahun\r\nJujur, teliti, tepat waktu ( deadline )\r\nPosisi Penempatan di Jagakarsa'),
(41, 'Customer Relation Officer/ Investor Relation Office', 'Mega Capital Sekuritas PT', 10, 2, 10, 0, 0, '2019-11-22', '2019-12-22', 'https://www.jobs.id/lowongan/Mjg0NTA3/customer-relation-officer-investor-relation-office-mega-capital-sekuritas-pt', 'Persyaratan\r\nPria/Wanita usia maks. 30 tahun\r\nPendidikan min. D3/S1 dari segala jurusan (diutamakan jurusan Ilmu Komunikasi)\r\nBerpenampilan dan berkepribadian menarik\r\nMampu berkomunikasi efektif\r\nMampu membina hubungan interpersonal yang efektif &amp; profesional\r\nMemiliki kemampuan membangun networking yang luas\r\nMemiliki pengalaman bekerja sebagai Customer Service lebih diutamakan\r\nTertarik dengan dunia pasar modal dan digital'),
(42, 'Admin Operation', 'Puncak Finansial Utama PT.', 7, 2, 10, 0, 0, '2019-11-22', '2019-12-22', 'https://www.jobs.id/lowongan/Mjg0NTAy/admin-operation-puncak-finansial-utama-pt', 'Deskripsi Pekerjaan\r\nMenghubungi pelanggan untuk melakukan follow-up dokumen secara online\r\nMelakukan rekonsiliasi harian dokumen fisik dari pelanggan\r\nMelengkapi data pelanggan untuk kebutuhan data aplikasi\r\nMengelola dokumen pelanggan\r\nMembuat report harian, mingguan terkait data pelanggan\r\n\nPersyaratan\r\nUsia Maks. 35 tahun\r\nMemiliki pengalaman min. 1 tahun, lulusan baru dipersilakan melamar\r\nPendidikan terakhir SMA\r\nDapat mengoperasikan komputer dan\r\nDapat mengoperasikan Microsoft Office (Excel)\r\nKomunikatif, persuasif dan teliti\r\nDisiplin dan terorganisir\r\nTerbiasa dengan target kerja\r\nDapat bekerjasama secara tim maupun individu'),
(43, 'Guru Kelas SD', 'Karunia Global School', 17, 2, 25, 0, 0, '2019-11-22', '2019-12-15', 'https://www.jobs.id/lowongan/MjgzODg0/guru-kelas-sd-karunia-global-school', 'Deskripsi Pekerjaan\r\nMembuat laporan tertulis tentang perkembangan siswa kepada Kepala Sekolah\r\nBertemu dengan Orang Tua siswa di tiap akhir semester dan\r\ndiwaktu yang layak untuk membahas perkembangan siswa\r\nTerlibat\r\ndisetiap kegiatan sekolah\r\nMempersiapkan dan mengumpulkan RPP, Nilai, dan pekerjaan administrasi lainnya\r\nMempersiapkan materi sebelum kelas dimulai\r\nMenjalankan kelas berdasarkan RPP yang disiapkan dan dikumpulkan\r\nMembimbing dan memberikan bantuan kepada siswa yang membutuhkan\r\nMengawasi dan mendukung perkembangan siswa serta mengadakan remedial apabila dibutuhkan\r\n\nPersyaratan\r\nLebih diutamakan yang mempunyai NUPTK\r\nUsia 25 s/d 35 tahun\r\nMemiliki pengalaman kerja sesuai dengan posisi yang dilamar minimal 2 tahun\r\nMemiliki latar belakang pendidikan sesuai dengan posisi yang dilamar atau setara, diutamakan tamatan PGSD\r\nMinimal IPK 3.5\r\nFasih menggunakan Microsoft office\r\nDapat bekerja secara professional baik sebagai individu maupun sebagai bagian dari team\r\nAktif berbahasa Inggris. Lebih diutamakan memiliki skor minimum di IELTS 6.0 atau setara'),
(44, 'Flutter Junior Developer', 'Kapital Kusuma Putera PT', 6, 2, 8, 4000000, 5000000, '2019-11-21', '2019-12-21', 'https://www.jobs.id/lowongan/Mjg0MzI1/flutter-junior-developer-kapital-kusuma-putera-pt', 'Persyaratan\r\nWanita / Pria\r\nUsia Mx 27 Tahun\r\nMenguasai Mobile Development (Mengenal Flutter)\r\nDapat bekerjasama dalam tim\r\nJujur dan bertanggung jawab'),
(45, 'Web Programmer Supervisor', 'Top4 Marketing', 6, 2, 6, 4000000, 8000000, '2019-11-22', '2019-12-22', 'https://www.jobs.id/lowongan/Mjg0NTE2/web-programmer-supervisor-top4-marketing', 'Deskripsi Pekerjaan\r\nTop4 is a new feature-rich publishing and advertising platform that allows consumers to find rated businesses, trades people and service providers in their area, and then connect and evaluate the best fit before making a purchasing decision.\r\nBringing together complete business profiles, curated content and social network integration, Top4 helps businesses and brands create engaging customer experiences in a user-friendly, versatile and cost-effective way.\r\nWe looking for PHP Programmers. You must have at least 2 years proven commercial experience working with PHP and Content management systems (CMS) Web Design.\r\nTanggung Jawab Pekerjaan :\r\nResponsibilities:\r\nDesign and develop Web Application.\r\nSupport and maintain Web Application.\r\n\nPersyaratan\r\nKeahlian :\r\nCMS experience – Especially.\r\nGood knowledge of front-end frameworks HTML, CSS, XML, Bootstrap, JQuery and experience working with responsive and adaptive Web Designs.\r\nGood knowledge of back-end web technologies (PHP/PHP5, Apache, MySql, JavaScript and AJAX technologies).\r\nUnderstands in Bitbucket and Github.\r\nUnderstands how to integrating open source and third-party applications into existing systems.\r\nKualifikasi :\r\nCandidate must possess at least Bachelor’s Degree in Computer Science/Information Technology or equivalent.\r\nAt least 2 years commercial experience developing High-End commercial website solutions.\r\nVery reliable and responsible.\r\nOffice based in South East Surabaya.\r\nFresh Graduates are welcome to apply'),
(46, 'Estimator Staff', 'Petra Anugerah Sejahtera PT', 22, 2, 6, 3500000, 4000000, '2019-11-20', '2019-12-20', 'https://www.jobs.id/lowongan/Mjg0MTE0/estimator-staff-petra-anugerah-sejahtera-pt', 'Deskripsi Pekerjaan\r\nMembuat perhitungan RAB\r\nMembuat dan menjelaskan time scedule kurva S\r\nMenghitung dan membuat dokumen laporan perubahan volume pekerjaan\r\nMembuat daftar rincian pekerjaan secera lengkap berdasarkan gambar lelang\r\nMelakukan perhitungan volume dari setiap item pekerjaan\r\nMembuat analisa harga dari setiap item pekerjaan\r\nMembuat dan menyusun dokumen teknis untuk kelengkapan dokumen penawaran\r\n\nPersyaratan\r\nLaki-laki / Perempuan, Usia 19 – 30 Thn.\r\nS1 Teknik Sipil.\r\nBisa membaca gambar kerja, mampu melakukan volume pekerjaan, dan membuat List material.\r\nBisa membuat BOQ (Bill of Quantity).\r\nBisa membuat kelengkapan dokumen teknis penawaran tender ( Metode pelaksanaan, Time Schedule, Kendala Solusi dll)\r\nPengalaman Minimal 1 tahun dibidang yang sama.\r\nBersedia ditugaskan ke luar kota'),
(47, 'Sales Engineer', 'Suprabakti Mandiri PT', 10, 2, 26, 0, 0, '2019-11-21', '2019-12-21', 'https://www.jobs.id/lowongan/Mjg5ODc/sales-engineer-suprabakti-mandiri-pt', 'Persyaratan\r\nMin. D3 in Mechanical\r\nMinimum 1 years experience in relevant industrial sales;\r\nAttract for a new customer network and make a good relationship;\r\nSpreading product to existing customer;\r\nFluent in English communication, writing proposal and product presentation skill;\r\nGood in using AutoCAD;\r\nWilling to travel;\r\nTo be located in Jakarta, Gresik, and Balikpapan.'),
(48, 'Staff Research & Development Pertanian', 'Saraswanti Indo Genetech PT', 20, 2, 27, 0, 0, '2019-11-21', '2019-12-07', 'https://www.jobs.id/lowongan/MjcxMTgx/staff-research-development-pertanian-saraswanti-indo-genetech-pt', 'Deskripsi Pekerjaan\r\nJob Desc : \r\npengembangan produk, riset hama dan penyakit tanaman, pestisida, feromon, pupuk, uji lapang produk, perijinan produk.\r\n\nPersyaratan\r\nUsia maksimal 30 tahun\r\nPendidikan minimal S1 di bidang Pertanian, Ilmu Tanah, Agronomi, Hama & Penyakit tanaman, Agrokimia atau jurusan terkait lainnya.\r\nBerpengalaman minimal 2 tahun di bidang riset pertanian, agrokimia atau bidang terkait lainnya.\r\nBersedia ditempatkan di wilayah Bogor.\r\nPekerja keras, ulet, kreatif dan mandiri.'),
(49, 'Operasional Kantor', 'Equityworld PT', 7, 2, 6, 0, 0, '2019-11-20', '2019-12-20', 'https://www.jobs.id/lowongan/MTcxNzUw/operasional-kantor-equityworld-pt', 'Persyaratan\r\nMinimal SMU/SMK\r\nUsia maksimal 25 Tahun\r\nMenguasai Ms. Office (Ms. Word, Excel, ppt.)\r\nJujur, disiplin, bertanggung jawab\r\nMampu bekerjasama dengan team, serta bisa berkomunikasi dengan baik.'),
(50, 'UI/UX Designer', 'Mpotech Digital System Inc', 18, 2, 28, 0, 0, '2019-11-22', '2019-12-22', 'https://www.jobs.id/lowongan/MTk5MzMw/uiux-designer-mpotech-digital-system-inc', 'Deskripsi Pekerjaan\r\nClosely work with the business analysts, technical team and stakeholders to deliver human-centered designs.\r\nCreate wireframes, storyboards, user flows, process flows and user journey maps to effectively communicate interaction and design ideas\r\nCreate rapid prototypes to validate designs with the stakeholders and users\r\nConduct user research and evaluate user feedback to effectively know the user’s needs\r\nCollaborate with business analyst and engineers to define and implement innovative solutions for the product direction, visuals and experience.\r\nCan communicate and defend designs and key milestone deliverables to peers and executive level stakeholders\r\nEstablish and promote design guidelines, best practices and standards\r\nUse UX tools and methodologies to deliver human-centered designs.\r\n\nPersyaratan\r\nCandidate must possess at least Bachelor\'s/College Degree in Art/Design/Creative Multimedia or equivalent.\r\nAt least 1\r\nYear(s) of working experience in the related field is required for this position.\r\nPreferably 1-4 Yrs Experienced Employee specialized in Arts/Creative/Graphics Design or equivalent.\r\n1-3 years experience with UX or interaction design\r\nKnowledgeable with any rapid prototyping tools for both low and high fidelity (Adobe XD, SketchApp, FramerJS, InvisionApp, MarvelApp, Zeplin, etc.)\r\nGood understanding on Information Architecture, and human psychology\r\nWell-written and usable codes for user interface development that incorporates grid principles and/or responsive layouts\r\nProficiency with graphic design works and familiarity with different graphic design tools\r\nProficiency in HTML, CSS, and JavaScript\r\nHave basic knowledge on designing mobile apps ( android , ios )\r\nUp-to-date with the latest UI trends, techniques, and technologies\r\nPortfolio that showcase your UI/UX design experience and creative design thinking\r\nExcellent verbal and written communication skills\r\nMust be willing to work in Manila, Philippines.'),
(51, 'TAX Consultant (Surabaya)', 'Mandiri Kencana Sentosa PT', 9, 2, 6, 4000000, 5000000, '2019-11-20', '2019-12-20', 'https://www.jobs.id/lowongan/MTY1OTk5/tax-consultant-surabaya-mandiri-kencana-sentosa-pt', 'Deskripsi Pekerjaan\r\nBUSINESS & TAX CONSULTANT\r\nWe can assist with the following:\r\n* personal taxation\r\n* corporate taxation\r\n* tax preparation review\r\n* tax consultant\r\n* tax check up\r\n* tax accounting\r\n* management accounting\r\n* joint venture advisory\r\n* tax accounting improvement\r\n* tax amnesty consultacy & implementation\r\n\nPersyaratan\r\nTanggung Jawab Pekerjaan :\r\nWe serve individual taxpayers, tax professionals, accountants, associations, and new businesses.\r\nSyarat Pengalaman :\r\nFresh Graduate, Accounting\r\nKeahlian :\r\nMenguasai Standar Akuntansi Keuangan Indonesia (high oriented)\r\n Menguasai Peraturan Perpajakan Indonesia (high oriented)\r\n Menguasai Microsoft Office\r\nKualifikasi :\r\nPria/ Wanita 20 – 25 thn\r\n Freshgraduate, Accounting\r\n IPK : >= 3.00\r\nTunjangan :\r\nTunjangan makan, tunjangan transport\r\nInsentif :\r\nAllowance\r\nWaktu Bekerja :\r\nJam 8.00 – 16.30 Senin sd Jumat\r\nOFFICE : SPAZIO OFFICE INTILAND 5TH FLOOR, JL MAYJEND YONO SOEWOYO KAV.3 SURABAYA\r\n[Posisi Prioritas]'),
(52, 'Sales Bahan Bangunan', 'Multi Rekat CV.', 16, 2, 6, 0, 0, '2019-11-22', '2019-12-05', 'https://www.jobs.id/lowongan/MjgzMTkw/sales-bahan-bangunan-multi-rekat-cv', 'Deskripsi Pekerjaan\r\nMampu menjaga hubungan dengan pelanggan baru maupun lama\r\nMembuka pasar baru di daerah yang ditugaskan\r\nMampu menerima dan follow up pesanan dari pelanggan\r\nMudah bersosialisasi dan menjalin hubungan baru\r\nMempelajari dan memahami produk - produk yang ditugaskan\r\nBersedia untuk belajar bersama rekan kerja yang lain\r\n\nPersyaratan\r\nLaki - Laki\r\nUsia minimal 22 tahun, usia maksimal 35 tahun\r\nS1\r\nIPK Diatas 3\r\nPengalaman minimal 3 tahun\r\nKami menawarkan peluang kerja dan kesempatan berkarir yang sama untuk semua level jabatan, suasana kerja yang kondusif dan transparan, serta target kerja yang membuat Anda bisa memberikan kemampuan maksimal bagi perkembangan perusahaan. Kami juga memberikan kesempatan bagi setiap karyawan untuk meningkatkan kapasitas pribadinya sehingga mampu menjadi pengelola dan pemilik dari sebuah unit usaha secara mandiri.'),
(53, 'Recruitment Consultant', 'OS Selnajaya Indonesia PT', 23, 2, 17, 6000000, 12000000, '2019-11-20', '2019-12-01', 'https://www.jobs.id/lowongan/MjgzMDI4/recruitment-consultant-os-selnajaya-indonesia-pt', 'Deskripsi Pekerjaan\r\nAnalyze client\'s inquiries and each of positions\' requirements\r\nSource for candidates in database, job portals, social media, personal network, or any kind of sourcing strategies\r\nSelect qualified candidates based on their resume, document check, and job match\r\nCold-calling and sending direct email to potential candidates to invite them to interview session\r\nExplore candidate potentials and giving advices to candidates regarding career oppportunities that suit them\r\nConduct refference check / background check\r\nCreate Resume of candidates\r\nSubmit resume and introduce candidates to clients within scheduled time\r\nAssist candidate in every step of the recruitment process\r\nMake sure all successful placement is well-retained until at least for 6 months\r\nComplete all report and documentation as part of job responsibility\r\nRepresent Selnajaya in several events such as Job Fair,\r\nWalk-in Interview, or any related event\r\n\nPersyaratan\r\nMale / Female\r\nAge 25 – 35 years old\r\nBachelor degree from any major\r\nExperienced in Recruitment Agency or Headhunter company for at least 1 year\r\nFluent English'),
(54, 'Marketing Project', 'Color and Glory PT', 15, 2, 12, 3000000, 4500000, '2019-11-21', '2019-12-01', 'https://www.jobs.id/lowongan/MjgzMDQ4/marketing-project-color-and-glory-pt', 'Deskripsi Pekerjaan\r\n1. Menghubungi calon ccustomer dari database\r\n2. Mengatur janji temu untuk presentasi product\r\n3. Membuat penawaran harga\r\n4. Follow up customer\r\n5. FOllow up project\r\n6. Menyiapkan dokumen proyek\r\n7. Mengatur pengiriman barang\r\n8. Bekerjasama dalam Team\r\n\nPersyaratan\r\n1. Perempuan max 35th\r\n2. Pengalaman dibidang nya 2thn\r\n3. Mampu bekerja full time\r\n4. Single'),
(55, 'Staff Finance', 'Andika Permata Sawit Lestari PT', 9, 2, 29, 0, 0, '2019-11-20', '2019-12-20', 'https://www.jobs.id/lowongan/Mjg0MTY5/staff-finance-andika-permata-sawit-lestari-pt', 'Persyaratan\r\nPria/Wanita\r\nUsia Maksimal\r\n26 tahun\r\nPendidikan minimal D3 Akuntansi/Manajemen Keuangan\r\nMenguasi Microsoft Excel dan Word\r\nDapat berkomunikasi dengan baik\r\nMampu bekerja individu maupun tim\r\nMampu bekerja dibawah tekanan\r\nMemiliki semangat bekerja yang tinggi\r\nMemiliki pengalaman dibidang yang sama lebih disukai'),
(56, 'Java Developer', 'Fusi Solusi Transformasi PT', 6, 2, 20, 0, 0, '2019-11-22', '2019-12-22', 'https://www.jobs.id/lowongan/Mjc2NDc5/java-developer-fusi-solusi-transformasi-pt', 'Deskripsi Pekerjaan\r\nDevelop enterprise application in Java language\r\nMaintain and improve existing products\r\nCollaborate with other team members in application building and enhancements\r\n\nPersyaratan\r\nMinimum 1 years of experience as JAVA Developer');
INSERT INTO `jobs` (`id`, `name`, `company`, `id_job_field`, `id_job_source`, `id_job_location`, `min_salary`, `max_salary`, `posting_date`, `closing_date`, `url`, `description`) VALUES
(57, 'Barista/ Store Crew', 'Helpster Indonesia', 33, 2, 30, 1500000, 1700000, '2019-11-20', '2019-12-20', 'https://www.jobs.id/lowongan/Mjg0MTQ2/barista-store-crew-helpster-indonesia', 'Deskripsi Pekerjaan\r\nBarista untuk Kopi Kenangan:\r\nMelayani customer, mencatat dan mengantarkan pesanan.\r\nMembantu proses pembuatan minuman.\r\nMenjaga store tetap rapih dan bersih\r\n\nPersyaratan\r\nWajib memiliki polo shirt/ kemeja lengan pendek berwarna hitam.\r\nWajib memiliki celana panjang dan sepatu berwarna hitam.\r\nPria/Wanita max 24 tahun.\r\nTinggi badan Pria 165 cm, Wanita 155 cm.\r\nPria tidak gondrong / kumis brewok lebat.\r\nTidak berkacamata, behel, dan berwajah bersih.\r\nMinimal SMA/SMK/sederajat.\r\nSemangat dan tertarik pada dunia kopi'),
(58, 'Business Strategist - OOH Specialist', 'Supra Media Nusantara PT', 9, 2, 10, 0, 0, '2019-11-20', '2019-12-07', 'https://www.jobs.id/lowongan/MjgzMzEx/business-strategist-ooh-specialist-supra-media-nusantara-pt', 'Deskripsi Pekerjaan\r\nDo research on Government Tender | LPSE\r\nAble to make proposal to pitch to clients or external parties and ensure deadlines are met.\r\nPropose potential business deals\r\nExplore opportunities that add value to the company\r\nDevelop negotiating strategies\r\nAble to do presentation in front of public\r\n\nPersyaratan\r\nCandidate must possess at least Bachelor Degree in any field\r\nMale/Female\r\nBe an expert on company platform and services\r\n2 Year(s) of working experience in Media Owner’s side or ATL /BTL Agency\r\nExcellent communication and interpersonal skill\r\nFlexible working hours\r\nQuick Learner, able to adapt well &possess positive attitude\r\nMax 35 years old\r\nPlacement: JAKARTA UTARA'),
(59, 'Admin Staff', 'Jakarta Derma Clinic', 7, 2, 31, 0, 0, '2019-11-20', '2019-12-20', 'https://www.jobs.id/lowongan/MTczNzM4/admin-staff-jakarta-derma-clinic', 'Deskripsi Pekerjaan\r\nMenerima tamu, dan telpon\r\nMendata klien\r\nMembuat invoice\r\nMelakukan stock perlengkapan\r\nMembuat laporan bulanan\r\nBekerja sesuai SOP klinik\r\n\nPersyaratan\r\nUsia maks. 35 tahun\r\nLulusan D3 semua jurusan\r\nMinimal pengalaman 1 tahun\r\nMenguasai komputer\r\nBerpenampilan menarik dan rapi\r\nJujur, disiplin, bertanggung jawab\r\nMemiliki motivasi kerja yang tinggi\r\n[Posisi Prioritas]'),
(60, 'SALES SUPPORT', 'Makmur Meta Graha Dinamika PT', 10, 2, 9, 4500000, 6500000, '2019-11-20', '2019-12-20', 'https://www.jobs.id/lowongan/MTc3ODY5/sales-support-makmur-meta-graha-dinamika-pt', 'Deskripsi Pekerjaan\r\nResponsibilities:\r\nSales Administration\r\nCreating Sales Order\r\nMaintain Stock\r\nManage Sales Contract\r\nCorrespondence with Customer and principle\r\nDo Secretary job such as: writting letter, writing a meeting notulen, arrange meeting schedule ect\r\n\nPersyaratan\r\nRequirements:\r\nCandidate must possess at least a Bachelor\'s Degree, Secretarial or equivalent.\r\nRequired skill(s): secretarial, Administration And Secretarial Duties.\r\nRequired language(s): English, Bahasa Indonesia\r\nEnglish Active is plus\r\nGood looking and have a good communication skill\r\nAt least 1 year(s) of working experience in the related field is required for this position.\r\nApplicants must be willing to work in Slipi.\r\nPreferably Staff (non-management & non-supervisor)s specializing in Sales - Corporate or equivalent.\r\nFull-Time position(s) available.'),
(61, 'Sales and Promotion Manager', 'KP-Press Indonesia PT', 19, 2, 3, 3000000, 6000000, '2019-11-18', '2019-11-27', 'https://www.jobs.id/lowongan/MjY1MzIx/sales-and-promotion-manager-kp-press-indonesia-pt', 'Deskripsi Pekerjaan\r\nMencari dan Maintenance nasabah untuk transaksi produk perdagangan berjangka komoditi\r\n\nPersyaratan\r\npria/wanita\r\nmax 50 tahun\r\nmin sma/smk/sederajat\r\nD3/S1 diutamakan\r\npengalaman dalam bidang perdagangan berjangka komoditi tidak diutamakan\r\nberpenampilan menarik\r\ndisiplin dan berkemauan tinggi'),
(62, 'Management Trainee (Sarah)', 'Citra Tubindo Tbk PT', 35, 2, 24, 0, 0, '2019-11-20', '2019-11-30', 'https://www.jobs.id/lowongan/MjgwOTIw/management-trainee-sarah-citra-tubindo-tbk-pt', 'Deskripsi Pekerjaan\r\nSARAH (Skill & Ability Readiness through Apprenticeship)\r\nis a proactive effort to provide a continuous supply of manpower to replace employees entering retirement. This program comprises 1 month in house training and 2 months on the job training tandem with employees. Those employees will be your buddies to teach you technical skills in the shop floor. At the end of the program after evaluating your performance and competency development progress, the best participants will be nominated as successor of our employees.\r\nCareer opportunities*:\r\nEngineer (CNC & Tooling, Finisihing, Process)\r\nQA Auditor\r\nTeam Leader\r\n*)if pass the evaluation\r\nFacilities:\r\nLodging**\r\nPocket Money\r\nMeal\r\nAir flight ticket**\r\nCertificate\r\n**provided for candidates coming from out of batam\r\n\nPersyaratan\r\nRequirements :\r\nBachelor degree in Mechanical Engineering\r\nGPA >3.0\r\nExperience in manufacturing\r\nCommit to have minimum 3 months on the job training\r\nGood written and verbal english communication skill\r\nFresh graduate are welcome'),
(63, 'Sales Representative Area Gorontalo', 'Mowilex Indonesia PT', 10, 2, 32, 2800000, 3800000, '2019-11-20', '2019-11-25', 'https://www.jobs.id/lowongan/MjY0NTcx/sales-representative-area-gorontalo-mowilex-indonesia-pt', 'Deskripsi Pekerjaan\r\nKami mencari seorang Sales yang berpengalaman dalam menjalin hubungan baik dan melakukan penjualan produk ke toko retail bahan bangunan di daerah Gorontalo. Anda akan melakukan kunjungan ke toko retail bahan bangunan dan berkoordinasi dengan bagian logistik untuk memastikan produk Mowilex terdistibusi di toko retail bahan bangunan di daerah Gorontalo.\r\nSeorang Sales yang baik harus memiliki pemahaman dan keahlian mengenai strategi dan metode untuk melakukan pendekatan dan penjualan pada toko retail bahan bangunan, serta mampu mengindentifikasi toko-toko yang potensial untuk menjual produk Mowilex.\r\nMowilex menawarkan program bonus yang kompetitif pada tim sales kami dengan bonus berdasarkan evaluasi target setiap\r\n3 bulan.\r\nBanyak tim sales Mowilex yang mendapatkan bonus hingga\r\n18 bulan gaji\r\ntiap tahunnya ketika berhasil\r\nmelampaui target\r\npenjualannya.\r\nTanggung jawab:\r\nMembangun hubungan yang baik dengan toko-toko retail bahan bangunan\r\nMenjalankan program promosi dari perusahaan\r\nMelakukan penjualan produk perusahaan pada toko retail bahan bangunan\r\nMengindentifikasi peluang perluasan area atau wilayah baru\r\nMemastikan toko retail bahan bangunan mejual produk sesuai dengan ketentuan perusahaan\r\nMenerima dan meneruskan komplain dari toko ke bagian terkait di perusahaan\r\nMemantau penyelesaian komplain\r\nMengawasi kinerja SPG/SPB\r\n\nPersyaratan\r\nUsia 20-30 tahun\r\nPendidikan minimal D3, terbuka untuk segala jurusan\r\nDiutamakan yang memiliki pengalaman minimal 1 tahun sebagai sales di industri bahan bangunan dan FMCG\r\nDiutamakan memiliki SIM C, memiliki SIM A menjadi nilai tambah\r\nBerdomisili di dan bersedia untuk mobile ke seluruh area\r\nGorontalo\r\ndan sekitarnya'),
(64, 'Agent Property', 'Harcourts Property', 15, 2, 33, 0, 0, '2019-11-19', '2019-12-19', 'https://www.jobs.id/lowongan/MjczMDYx/agent-property-harcourts-property', 'Deskripsi Pekerjaan\r\nDibutuhkan Partner Sebagai\r\nSales Consultant / Property Marketing\r\nDengan Penghasilan Luar Biasa (Base on Commision)\r\n\nPersyaratan\r\nPengalaman Di Bidang Marketing/Sales\r\nNo Salary/Base On Commision\r\nUmur Maksimal 50 Tahun\r\nBepenampilan Rapi dan Menarik\r\nPintar Berkomunikasi dan Bersosialisasi\r\nRajin\r\nMau Belajar\r\nUlet dan Konsisten\r\nJujur\r\nKomitmen\r\nLaki - Laki & Perempuan'),
(65, 'Waiter dan Game Master', 'The Vault Boardgame Cate', 25, 2, 6, 3500000, 7000000, '2019-11-21', '2019-12-21', 'https://www.jobs.id/lowongan/Mjg0Mjc3/waiter-dan-game-master-the-vault-boardgame-cate', 'Deskripsi Pekerjaan\r\nDibutuhkan Waiter sekaligus Game Guru\r\nTugas / Tanggung Jawab :\r\nMenjalankan tahapan Opening maupun Closing restoran\r\nMengantar hidangan dan meng-clear-up meja makan (bagian waiter / waitress & dining area)\r\nMenyarankan berbagai menu promo, cross sell dan upsell (bagian waiter dan chasier / kasir)\r\nMencatat, memastikan dan menyajikan menu sesuai pesanan pelanggan (bagian waiter dan chasier / kasir).\r\nMenyiapkan dan packaging produk menu di service area (bagian packing and cashiering)\r\nMematuhi dan menjalankan Standard Operations Procedure (SOP)\r\nMemastikan kebersihan di masing-masing area kerja\r\nMenjaga dan merawat peralatan di masing-masing area kerja\r\nMendukung penyelenggaraan standar keselamatan dan keamanan kerja (work safety & security)\r\nMendukung penyelenggaraan standar keselamatan pangan (food safety/HACCP)\r\nMenawarkan dan mengajarkan Boardgame kepada customer\r\n\nPersyaratan\r\nKualifikasi / Persyaratan :\r\nPria dan Wanita\r\nMaksimal usia 30 tahun\r\nPendidikan minimal SMA / SMK / SLTA – S1\r\nSiap bekerja dengan sistem shift and rolling\r\nBersedia bekerja pada hari libur nasional\r\nSemua terbuka bagi fresh graduate\r\nPengalaman lebih disukai\r\nRajin dan bertanggung jawab\r\nTeliti dan Sopan\r\nDapat berkomunikasi dengan baik\r\nDapat bekerja dalam sebuah team'),
(66, 'Staff IT dan Umum', 'Nugroho Lestari PT', 39, 2, 6, 3000000, 4000000, '2019-11-19', '2019-11-26', 'https://www.jobs.id/lowongan/MjcwMzg4/staff-it-dan-umum-nugroho-lestari-pt', 'Deskripsi Pekerjaan\r\nMaintenance & Troubleshoot Hardware (komputer, printer, cctv, etc)\r\nMaintenance & Troubleshoot Software (OS, Aplikasi, Database, Domain, etc)\r\nMaintenance & Management Topologi Network (Mikrotik, LAN, WAN, etc)\r\n\nPersyaratan\r\nPria (diutamakan) / Wanita\r\nUsia max 40 tahun\r\nLulusan pendidikan Keahlian(Informatika)/D3/Sarjana komputer (diutamakan)\r\nMenguasai Networking, hardware dan software\r\nPengalaman di bidang IT minimal\r\n1 tahun (Diutamakan)\r\nBersedia ditugaskan ke luar Jawa (saat dibutuhkan saja)\r\nMampu bekerja dalam tekanan dan Target\r\nMampu belajar dengan cepat dan bekerjasama dalam team\r\nBerkemauan untuk mengembangkan Skill'),
(67, 'Dokter Umum', 'Persada Hospital', 12, 2, 34, 0, 0, '2019-11-19', '2019-12-19', 'https://www.jobs.id/lowongan/MjcyOTQ5/dokter-umum-persada-hospital', 'Persyaratan\r\nPendidikan sesuai jurusan\r\nSTR aktif'),
(68, 'RESTAURANT MANAGER', 'Saji Segar Lestari PT', 23, 2, 10, 8000000, 12000000, '2019-11-19', '2019-12-19', 'https://www.jobs.id/lowongan/MTY3ODcx/restaurant-manager-saji-segar-lestari-pt', 'Deskripsi Pekerjaan\r\nRecruiting, training and supervising staffs.\r\nMaintain high standards of quality control, hygiene, and health and safety.\r\nEnsuring compliance with licensing, hygiene and health and safety legislation/guidelines.\r\nManage reservation schedules\r\n.\r\nTake responsibility for the business performance of the restaurant.\r\nAnalyse and plan restaurant sales levels and profitability.\r\nPrepare reports at the end of the shift/week, including staff control, food control and sales.\r\nCheck stock levels, order supplies and prepare cash drawers and petty cash.\r\n\nPersyaratan\r\nFemale, 21-35 years old.\r\nMinimum of 2 years experience in supervisor level in Food & Beverage sector. (cafe, restaurant, b\r\nakery\r\n)\r\nAble to understand English in both verbal and written. Having additional languages would be advantages\r\nDiploma / Bachelor Degree in Food & Beverage or Hospitality, Management, Communication, Accounting, Economy, and Marketing.\r\nWell groomed and presentable to the customers. (attractive, charming)\r\nAble to handle customers complaints and manage customer relation.\r\nComputer literate (Microsoft Office).\r\nWilling to be place at Central Park Area or Pantai Indah Kapuk.'),
(69, 'Transportation Administrative Staff', 'Nebraska Pratama PT', 7, 2, 9, 4000000, 5500000, '2019-11-19', '2019-12-19', 'https://www.jobs.id/lowongan/Mjg0MDg3/transportation-administrative-staff-nebraska-pratama-pt', 'Deskripsi Pekerjaan\r\nHandle correspondences with vendors and drivers and filing systems for Festronik and Manifest documents.\r\nHandle information requests from clients and visitors and set the schedule for transportation of goods.\r\nExecute timely, efficient, and effective operations of the department.\r\nPrepare administrative reports for the top management.\r\nMaintains and updates contact database.\r\nProvide additional support when needed.\r\n\nPersyaratan\r\nBachelor’s Degree (S1).\r\nMinimum 2 years in the transportation industry sector.\r\nKnowledge of business communications and office management.\r\nStrong communication and writing skills.\r\nHave excellent attention to detail and a team player.\r\nComputer literate.\r\nFor more information pertaining to our scope of work, please visit our website.'),
(70, 'Karyawan Counter Accessories Handphone', 'Zona Accessories', 7, 2, 10, 3500000, 3800000, '2019-11-18', '2019-12-18', 'https://www.jobs.id/lowongan/MTkxMzU3/karyawan-counter-accessories-handphone-zona-accessories', 'Deskripsi Pekerjaan\r\nMengecek barang masuk\r\nPacking barang untuk pajang ke display\r\nMengecek stock pajangan yang kosong\r\nMembuat laporan stock barang\r\nMemisahkan stock barang reject untuk dikembalikan ke supplier.\r\n\nPersyaratan\r\nWanita yang dapat bekerja MULTI TASKING\r\nCepat belajar, INISIATIF dan bertanggung jawab.\r\nMaximal 25 tahun\r\nPendidikan minimal SMK atau sederajat.\r\nBerpenampilan menarik dan ukuran badan IDEAL.\r\nTidak diperkenankan menggunakan HIJAB saat bekerja.\r\nKuat dan terbiasa bekerja keras.\r\nJika anda merasa memenuhi syarat dan sudah membaca deskripsi diatas, segera apply CV anda disini dan lampirkan foto anda terkini yang jelas supaya lebih mudah lolos seleksi. Terima Kasih'),
(71, 'Electrical System Developer', 'Lattice Teknologi Mandiri PT', 26, 2, 3, 0, 0, '2019-11-19', '2019-12-19', 'https://www.jobs.id/lowongan/OTY0Mzk/electrical-system-developer-lattice-teknologi-mandiri-pt', 'Deskripsi Pekerjaan\r\nLattice Teknologi Mandiri \r\nis a system integrator company with main mission to help residential and commercial businesses by providing engineering services solution. With our strong technology & business team, Our team strive to deliver the most effective solution. Would you like to join us ?\r\nWe are looking for a System Developer who has motivation to learn new things related to Technology and Programming, passion in Electronics and also discipline.\r\n\nPersyaratan\r\nFast learner, detail oriented and must be able to work under pressure without loosing creativity.\r\nPositive working attitude, willing to initiate, discipline again without loosing your creativity.\r\nWell Communicate and self managed.\r\nFresh Graduates are welcome.\r\nAvailable to work full time in Bandung.\r\nWilling to travel and/or to be placed outside the city.\r\nTechnical Requirements\r\nStrong knowledge in Embedded Programming, Electronics Components and Electrical Wiring Diagram.\r\nHave a freelance experience is a plus.\r\nWorking experience with C and Communication Protocols is a plus.\r\nFamiliar with web programming is a plus\r\nFamiliar with Linux is a plus.\r\nHands-on.'),
(72, 'Staff Asisten Administrasi', 'Pusat Terapi Anak Matahatiku PT', 7, 2, 20, 0, 0, '2019-11-19', '2019-12-19', 'https://www.jobs.id/lowongan/Mjc0MjE0/staff-asisten-administrasi-pusat-terapi-anak-matahatiku-pt', 'Deskripsi Pekerjaan\r\nMembuat dokumen-dokumen yang dibutuhkan di perusahaan\r\nMengumpulkan dan menyusun dokumen\r\nMelakukan kegiatan surat-menyurat\r\nMemberikan bantuan fisik / data kepada bagian back office dan keuangan\r\nMengerjakan tugas staff administrasi / admin lainnya\r\n\nPersyaratan\r\nPria dan Wanita\r\nUsia maksimal 25 tahun\r\nPendidikan min. SMA / SMK\r\nDapat mengoperasikan komputer minimal Microsoft Word, Excel, dan Power Point\r\nDapat bekerja dalam sebuah team\r\nPengalaman di bidang administrasi kantor (disukai)\r\nBerpenampilan menarik'),
(73, 'Program Magang Bakti Bank Swasta (CS/Teller)', 'Famili Mitra Ekselen PT', 34, 2, 7, 0, 0, '2019-11-20', '2019-12-20', 'https://www.jobs.id/lowongan/MjY0MDQ5/program-magang-bakti-bank-swasta-csteller-famili-mitra-ekselen-pt', 'Deskripsi Pekerjaan\r\nKESEMPATAN BEKERJA DI BANK SWASTA (CS ATAU TELLER):\r\nFAME Consultant\r\nmendapatkan kepercayaan dari salah satu BANK SWASTA TERBESAR dan TERKEMUKA di Indonesia untuk mengadakan rekrutmen peserta calon cs atau teller.\r\nProgram ini\r\nmemberikan kesempatan kepada lulusan SMA/SMK hingga S1 untuk mempersiapkan diri menjadi tenaga profesional di dunia kerja melalui proses pendidikan dan permagangandiberbagai kota besar di Indonesia khususnya di JABODETABEK.\r\nFAME Consultant mengundang Anda yang mempunyai kompetensi, semangat dan integritas tinggi untuk bergabung dengan persyaratan sebagai berikut:\r\n\nPersyaratan\r\nKualifikasi :\r\nBerpenampilan menarik\r\nLulusan SMK/SMA (nilai rata-rata rapor min. 7)\r\nD1-D3 dan S1 (IPK min. 2,50)\r\nUsia 17-24 tahun\r\nSehat Jasmani dan Rohani\r\nRamah dan Mampu berkomunikasi\r\nTidak pernah terlibat NARKOBA dan pelanggaran hukum lainnya\r\nBersedia ditempatkan di seluruh wilayah JABODETABEK\r\nBelum pernah mengikuti program magang sebelumnya/dalam 2 tahun terakhir.\r\nNote : Peserta yang lulus seleksi akan ditempatkan sebagai Teller atau Customer Service di wilayah Jabodetabek. Peserta akan mendapatkan uang saku bulanan + sertifikat + uang bantuan beasiswa.'),
(74, 'Admin Penjualan', 'Ocean Centra Furnindo PT', 7, 2, 4, 3500000, 4000000, '2019-11-20', '2019-12-20', 'https://www.jobs.id/lowongan/Mjg0MTQy/admin-penjualan-ocean-centra-furnindo-pt', 'Deskripsi Pekerjaan\r\nAdm Penjualan\r\nMengecek bon penjualan dari sales via email.\r\nEmail penjualan kepada CS sebagai konfirmasi untuk pengiriman barang yang sudah ditransaksikan sales di store.\r\nMengecek penjualan di B2B apakah sudah sesuai dengan bon penjualan manual.\r\nMengupload faktur pajak ke B2B\r\nMerekap laporan penjualan harian.\r\nMerekap laporan penjualan untuk dibuatkan faktur pajak,\r\nMerekap absen dan menghitung komisi SPG / SPB\r\nMengecek payment dari pameran.\r\nMengecek dan merekap konsiyasi\r\nPengecekan konsinyasi dan barang take away di store agar dibuat retur konsin dan terbit DN untuk barang konsinyasi take away yang sudah ditransaksikan.\r\n\nPersyaratan\r\nPerempuan\r\nMaksimal 32 Tahun\r\nPendidikan minimal SMA/SMK sederajat\r\nMemiliki pengalaman sebagai admin penjualan minimal 1 tahun\r\nKemampuan yang harus dimiliki : Ms. Word dan Ms. Excel\r\nBertanggung jawab, cekatan, teliti\r\nBekerja sesuai deadline'),
(75, 'Store Crew', 'Belah Doeren', 19, 2, 3, 0, 0, '2019-11-19', '2019-11-26', 'https://www.jobs.id/lowongan/MjgwNjU0/store-crew-belah-doeren', 'Deskripsi Pekerjaan\r\nMelayani customer\r\nMenyiapkan pesanan sesuai dengan order\r\nMenghitung dan melaporkan inventory dan stock harian\r\nMenjaga kebersihan dan kerapihan area kerja\r\n\nPersyaratan\r\nWanita/ Pria maks. 25 tahun\r\nPendidikan minimal SMK/SMA\r\nGood looking dan komunikatif\r\nCekatan dan teliti\r\nMemiliki kepribadian menarik\r\nMemiliki pengalaman minimal 1 tahun di bidang F & B\r\nB sebagai cashier dan kitchen\r\nBersedia ditempatkan di manapun (area Bandung)'),
(76, 'Yamaha Sales Coordinator', 'Surya Timur Sakti Jatim PT', 16, 2, 6, 3000000, 4000000, '2019-11-20', '2019-11-28', 'https://www.jobs.id/lowongan/MjgyODYz/yamaha-sales-coordinator-surya-timur-sakti-jatim-pt', 'Deskripsi Pekerjaan\r\nTugas dan tanggung jawab :\r\nMelakukan penjualan sesuai target yang diberikan.\r\nMegatur\r\n dan membantu\r\n anak buah (sales) dalam mencapai target penjualan.\r\nMembuat dan Menjalankan\r\n strategi \r\npenjualan.\r\nMembuat sistem kerja anak buah (sales) untuk meningkatkan penjualan.\r\nMenjaga Hubungan yang Baik dengan Pelanggan yang sudah ada dan mencari Pelanggan baru.\r\nMenangani keluhan pelanggan dan permasalahan dilapangan.\r\nMelakukan kegiatan promosi untuk meningkatkan penjualan.\r\nMembuat laporan penjualan, dll\r\n#Benefits\r\n: -Gaji pokok\r\n - Tunjangan uang makan +transport\r\n \r\n- komisi / \r\ninsentive\r\n\nPersyaratan\r\nKualifikasi :\r\nUsia Maksimal 30 tahun, Minimal lulus Diploma semua jurusan\r\nPengalaman dibidang Otomotif R.2/Sales Retail minimal 1 tahun\r\nMemiliki kemampuan menjual & negosiasi yang baik\r\nOrientasi pada target, mempunyai networking yang luas\r\nMampu bekerja di bawah Tekanan dan Terbiasa bekerja dengan Target\r\nMemiliki Leadership yang tinggi\r\n dan semangat kerja yang tinggi.\r\nUlet, Rajin/Disiplin dan Bertanggung Jawab\r\nMampu mengoperasikan komputer (min. Microsoft Office)\r\nMemiliki Sepeda Motor \r\ndan SIM\r\nLaki - Laki'),
(77, 'TEKNISI', 'Kencana Anakmas Lestari PT', 26, 2, 9, 3500000, 4500000, '2019-11-19', '2019-12-19', 'https://www.jobs.id/lowongan/MTk5MzI2/teknisi-kencana-anakmas-lestari-pt', 'Deskripsi Pekerjaan\r\nMemperbaiki kerusakan alat2 baik di kantor pusat maupun di outlet\r\nMemelihara alat-alat yang ada dengan dibuat jadwal pemeliharaan\r\n\nPersyaratan\r\nPendidikan min SMK Teknik atau STM\r\nMemiliki pengalaman minimal 2 tahun\r\nMemiliki SIM C\r\nMengerti instalasi listrik dan sistem pendingin (AC & Chiller)\r\nmengerti alatalat pemanas (oven, proofer roti)\r\nMengerti alat-alat untuk keperluan restauran\r\nCekatan, Teliti, Bersih dan cermat dalam bekerja\r\nJujur, Disiplin dan dapat bekerja mandiri maupun dengan tim'),
(78, 'Kepala Export Import', 'Bentara Sinarprima PT', 38, 2, 3, 0, 0, '2019-11-19', '2019-12-19', 'https://www.jobs.id/lowongan/MjgxNTYw/kepala-export-import-bentara-sinarprima-pt', 'Deskripsi Pekerjaan\r\n1. mengerti mengenai perundangan-undangan export import\r\n2. mengerti mengenai bea cukai\r\n3. follow up pengiriman export import\r\n4.mengerti proses perijinan yang berkaitan dengan ekport import\r\n\nPersyaratan\r\nBerpengalaman di bidangnya'),
(79, 'Teknisi Mesin', 'Anekaplas Sumbermakmur PT', 26, 2, 27, 0, 0, '2019-11-18', '2019-12-18', 'https://www.jobs.id/lowongan/Mjg0MDQz/teknisi-mesin-anekaplas-sumbermakmur-pt', 'Deskripsi Pekerjaan\r\nMengoperasikan mesin (Mesin Blowing, Mesin Injection)\r\nMemastikan kelancaran produksi\r\nMenjaga mesin dalam keadaan baik\r\n\nPersyaratan\r\nPria\r\nUsia sekitar 25-40 tahun\r\nPengalaman minimal 2 tahun sebagai teknisi mesin pabrik\r\nBertanggung jawab, bersedia lembur bila dibutuhkan\r\nPenempatan untuk di daerah Kawasan Industri Sentul'),
(80, 'HR and GA Manager', 'Furnindo International PT', 23, 2, 35, 0, 0, '2019-11-19', '2019-12-04', 'https://www.jobs.id/lowongan/MTUzODUw/hr-and-ga-manager-furnindo-international-pt', 'Persyaratan\r\nLaki / wanita\r\nPendidikan Min S1( Hukum / Psychology/Human Management )\r\nPengalaman Min 3 tahun di department HRD & GA, Menguasai Bahasa Inggris\r\nBerdaya pikir Kreatif, Inovatif dan Bertanggungjawab\r\n[Posisi Prioritas]'),
(81, 'Tele Consultant', 'Imperia Asia Indonesia PT', 32, 2, 9, 2500000, 3900000, '2019-11-20', '2019-12-20', 'https://www.jobs.id/lowongan/Mjg0MTU2/tele-consultant-imperia-asia-indonesia-pt', 'Deskripsi Pekerjaan\r\nMenawarkan produk & jasa kepada customer.\r\nMemenuhi target penjualan.\r\nMenciptakan strategi marketing yang efektif dan inovatif.\r\nHubungi pelanggan untuk memberi tahu mereka tentang produk atau layanan menggunakan skrip.\r\nMenjawab pertanyaan tentang produk atau perusahaan.\r\n\nPersyaratan\r\nBerumur 19 - 30 tahun.\r\nLaki - Laki & Perempuan.\r\nFresh graduate di perbolehkan melamar.'),
(82, 'Telemarketing', 'Agrodana PT', 16, 2, 10, 0, 0, '2019-11-19', '2019-12-01', 'https://www.jobs.id/lowongan/MjgzMDM1/telemarketing-agrodana-pt', 'Deskripsi Pekerjaan\r\n.\r\n\nPersyaratan\r\nWanita\r\nUsia Min 22 Thn & Max 35 Thn\r\nPendidikan Min. D3 (Semua Jurusan)\r\nPenampilan menarik dan komunikatif.\r\nPengalaman dan non pengalaman.\r\nSupel dan simpatik.\r\nMemiliki tutur kata yang baik dan ramah.'),
(83, 'Surveyor Penutupan Bogor', 'Asuransi Umum BCA PT', 15, 2, 27, 0, 0, '2019-11-19', '2019-12-08', 'https://www.jobs.id/lowongan/MjgzMzk0/surveyor-penutupan-bogor-asuransi-umum-bca-pt', 'Persyaratan\r\nMin. Pendidikan D3\r\nLaki-laki\r\nMau bekerja lapangan\r\nGesit\r\nMemiliki ketertarikan di bidang Otomotif\r\nBersedia penempatan di Bogor Kota\r\nMemiliki Sim C aktif dan Motor'),
(84, 'Supervisor Toko Alexis Jawab Timur', 'Alexis', 7, 2, 36, 0, 0, '2019-11-19', '2019-12-11', 'https://www.jobs.id/lowongan/MjgzNTIw/supervisor-toko-alexis-jawab-timur-alexis', 'Deskripsi Pekerjaan\r\nMengelola karyawan toko, display produk, dan meningkatkan penjualan\r\nMemastikan operasional toko berjalan sesuai SOP\r\nMemastikan karyawan toko bekerja sesuai SOP\r\nStock Opname\r\n\nPersyaratan\r\nPria\r\npendidikan min. SMA/SMK\r\nPengalaman minimal 1 tahun di retail\r\nBersedia mobile'),
(85, 'Collection', 'Australindo Makmur Bersama CV', 7, 2, 3, 0, 0, '2019-11-20', '2019-12-20', 'https://www.jobs.id/lowongan/MTgxOTAw/collection-australindo-makmur-bersama-cv', 'Persyaratan\r\nPendidikan Min D3/S1\r\nUsia maksimal 35 tahun\r\nBerpengalaman di bidang finance min 5 tahun\r\nLokasi Penempatan di Bandung'),
(86, 'Assistant Manager Accounting and Finance', 'APM Automotive Indonesia PT', 9, 2, 37, 9000000, 12000000, '2019-11-21', '2019-12-21', 'https://www.jobs.id/lowongan/MjgyNDM2/assistant-manager-accounting-and-finance-apm-automotive-indonesia-pt', 'Deskripsi Pekerjaan\r\nBerpengalaman dalam membuat dan menganalisa\r\nLaporan Keuangan perusahaan manufacture.\r\nMengerti mengenai kalkulasi HPP/ costing manufacture.\r\nBisa membuat\r\nanalisa inventory/stock perusahaan\r\nDisiplin dan Tegas.\r\nFamiliar dengan ERP System\r\nJujur, teliti dan Bertanggung jawab\r\nBersedia bekerja di dalam tekanan.\r\nAktif berbahasa Inggris.\r\n\nPersyaratan\r\nLaki - Laki & Perempuan\r\nUsia minimal 29 tahun, usia maksimal 37 tahun\r\nS1 Akuntansi\r\nPengalaman minimal 5 tahun'),
(87, 'Recruitment Specialist', 'Promanufacture Indonesia PT', 23, 2, 38, 0, 0, '2019-11-21', '2019-12-21', 'https://www.jobs.id/lowongan/MjgwMTg1/recruitment-specialist-promanufacture-indonesia-pt', 'Persyaratan\r\nRequirements\r\n:\r\nCandidate must possess at least a Bachelor\'s Degree, Master\'s Degree / Post Graduate Degree, Human Resource Management, Psychology, Law or equivalent.\r\nAt least 3 year(s) of working experience in the related field is required for this position.\r\nUnderstanding recruitment process.\r\nApplicants must be willing to work in Semarang or Salatiga.\r\nAccurate, attention to detail, tactful, and fast learners is a must.\r\nAble to operate computer and familiar with Microsoft Office program\r\nGood communication skills and able to work in team\r\nAble to maintain good performance in under pressure conditions.\r\nExcellent communication in English both oral & written and candidates relationship skills.'),
(88, 'Helper', 'Vincent Maestro Group', 19, 2, 6, 0, 0, '2019-11-19', '2019-12-08', 'https://www.jobs.id/lowongan/MjgzNDI5/helper-vincent-maestro-group', 'Persyaratan\r\nMempunyai SIM C yang masih berlaku\r\nFresh Graduate / pengalaman 1 tahun\r\nMaksimal 20 tahun\r\nKesehatan sangat Prima\r\nJujur,\r\nInisiatif Tinggi,\r\nDisiplin, Pekerja Keras\r\nSiap melayani kebutuhan Perusahaan\r\nSiap bekerja dengan tim\r\nSiap bekerja shift\r\nPersyaratan yang harus dibawa pada saat interview :\r\nSurat lamaran ditulis tangan di kertas folio polos putih (F4)\r\nRiwayat hidup ditulis tangan di kertas folio polos putih (F4)\r\nFotocopy Kartu Keluarga\r\nFotocopy KTP\r\nFotocopy SIM\r\nFotocopy Ijazah & Daftar nilai terakhir\r\nFotocopy Sertifikat-sertifikat (jika ada)\r\nPas foto berwarna 4x6'),
(89, 'Java Spring Developer', 'Erporate Solusi Global PT', 31, 2, 30, 5000000, 10000000, '2019-11-20', '2019-12-20', 'https://www.jobs.id/lowongan/Mjg0MTQ4/java-spring-developer-erporate-solusi-global-pt', 'Deskripsi Pekerjaan\r\nDesigning and coding Java EE application\r\nDesigning database and maintaining application level queries\r\nPerforming code debugging\r\nEnhancing and maintaining existing Java web application\r\nWriting technical documentation\r\nResearching new Java technologiess\r\n\nPersyaratan\r\nExperienced at least 2 years in Java development\r\nBachelor degree in computer or engineering\r\nFamiliar with Spring Framework & Hibernate\r\nFamiliar with Bootstrap and JQuery\r\nExperience with Unix environment is a plus\r\nGood analytical thinking\r\nGood personality and attitudes.\r\nFast learner and willing to learn new technology'),
(90, 'SALES COUNTER', 'Amie Jaya Motor', 10, 2, 19, 3600000, 5000000, '2019-11-21', '2019-12-21', 'https://www.jobs.id/lowongan/MTkxODIz/sales-counter-amie-jaya-motor', 'Deskripsi Pekerjaan\r\nDibutuhkan Sales Counter untuk bekerja di CV. Amie Jaya Motor.\r\nTugas-tugas dan kewajiban:\r\nMenawarkan dan menjual motor untuk pelanggan yang datang di dealer\r\nData entry - meminta dan mengisi data dari pelanggan\r\nCustomer service - melayani pertanyaan dan kebutuhan pelanggan terkait pembelian motor\r\nMemberi informasi jelas dan lengkap mengenai motor dan produk-produk serta promosi yang diadakan di Amie Jaya Motor.\r\nBenefit :\r\nGaji pokok UMR, uang makan serta uang transport disediakan. Bonus berupa insentif tersedia bagi yang melebihi target dalam sebulan.\r\n\nPersyaratan\r\nPria/Wanita min. 20 th max. 30 th\r\nLulusan minimum SMU/SMA/SMK atau setara\r\nDomisili: Depok dan sekitarnya\r\nBisa menggunakan komputer\r\nDapat segera bergabung\r\nBersedia untuk menjalankan training di perusahaan selama 3 bulan\r\nBertanggung jawab, proaktif\r\nBisa mempromosikan dan menjual produk dengan baik\r\nBisa bekerja dengan target\r\nTidak harus ada pengalaman sebelumnya, hanya perlu keinginan untuk belajar'),
(91, 'Administrasi / Back Office (Opr)', 'BFI Finance Indonesia Tbk PT.', 7, 2, 10, 0, 0, '2019-11-20', '2019-12-20', 'https://www.jobs.id/lowongan/Mjg0MjE4/administrasi-back-office-opr-bfi-finance-indonesia-tbk-pt', 'Deskripsi Pekerjaan\r\nOverview :\r\nSebuah posisi pekerjaan dengan job desc\r\nTugas dan Tanggung Jawab :\r\nBertanggung jawab dalam administrasi, penginputan, dan penyimpanan dokumen. (terlambat bayar)\r\n\nPersyaratan\r\nKualifikasi :\r\nMin D3 Semua Jurusan\r\nPria/Wanita, maks. 30 thn\r\nBelum menikah\r\nMenyukai pekerjaan administrative\r\nMenguasai MS. Office\r\nTeliti\r\nBerpenampilan menarik'),
(92, 'Salesman', 'Dialogue Group PT', 10, 2, 39, 2900000, 3300000, '2019-11-20', '2019-12-20', 'https://www.jobs.id/lowongan/MjcyOTE4/salesman-dialogue-group-pt', 'Deskripsi Pekerjaan\r\nMelakukan penjualan sesuai target\r\nKunjungan secara rutin kepada pelanggan,dan penambahan outlet / pelanggan baru.\r\nBertanggung jawab terhadap tersedianya produk yang layak jual di sebuah outlet/pasar.\r\nMemeriksa \r\nsecara rutin dan mengetahui jumlah stok di outlet\r\nMelakukan penagihan kepada pelanggan atas penjualan barang yang telah dilakukan.\r\nMemonitor kegiatan pengiriman barang yang dilakukan oleh divisi pengiriman apakah barang tersebut sesuai atau tidak dengan pemesanan oleh pelanggan\r\nKoordinasi antara salesman dengan supervisor apabila menemui kendala, serta dengan principle\r\nMembuat laporan salesman yang berisi data karakteristik pelanggan, data penjualan serta aktivitas kompetitor\r\nMembangun hubungan baik dengan pelanggan\r\n\nPersyaratan\r\nLaki - Laki & Perempuan\r\nUsia max.30 tahun\r\nPendidikan min. SMA / SMK - D3 semua jurusan\r\nFresh graduate / berpengalaman\r\nSingle / menikah\r\nBerdaya juang tinggi dan jujur\r\nMemiliki kemampuan berelasi dan komunikasi yang baik\r\nMampu mempersuasi dan bernegosiasi dengan baik\r\nSiap dengan pekerjaan yang mobilitas tinggi\r\nBersedia dinas ke luar kota'),
(93, 'ENGINEER', 'Spartan Eragon Asia PT', 26, 2, 17, 3500000, 5000000, '2019-11-21', '2019-11-30', 'https://www.jobs.id/lowongan/MTU3NTM4/engineer-spartan-eragon-asia-pt', 'Deskripsi Pekerjaan\r\nprosess Voice Quality Improvement (core Iphone, Node Access, Cellular Network, Interconnection, Network Audit dan Customer Network)\r\nproses Data Quality ( Network Audit, Power Audit, Network Improvement, POP Improvement, Network Protection, Customer RET Exercise, Preventive Maintenance, Onsite Activation, Handover Activation, POC, Project Monitoring)\r\nproses Optimization (Network/SIP, Offnet-Onnet,Manageable, Modernization,Radio NEC NMS Connestion)\r\nproses Problem Improvement (SIP/Non SIP, Customer Link Protection, Chronic Problem, Project Administration\r\n\nPersyaratan\r\nPendidikan & Pengalaman\r\nMinimum S-1 (Telekomunikasi/Elektronika/IT) atau D-3\r\n(Telekomunikasi/Elektronika/IT) Pengalaman 3 th\r\nmemiliki pengetahuan operasi perangkat lunak, perangkat keras khususnya dalam mengelola dan pembuatan laporan yang kompprhensif\r\nKemampuan untuk melakukan analis terhadap suatu situasi dan diagnones masalah secara cepat untuk mendapatkan solusi tepat yang dan dapat dieksekusi sesuai dengan standart\r\nBerbahasa Ingris\r\nKompetensi yang di butuhkan\r\nTerampil\r\nmampu bekerja dalam Team'),
(94, 'DATA ENTRY', 'Solid Group PT', 7, 2, 3, 0, 0, '2019-11-21', '2019-11-25', 'https://www.jobs.id/lowongan/MjgwNzM3/data-entry-solid-group-pt', 'Persyaratan\r\nLaki - Laki & Perempuan\r\nPendidikan minimal SMA / SMK\r\nFresh Graduate dipersilahkan melamar\r\nPekerja keras\r\nDisiplin, jujur, bertanggung jawab'),
(95, 'MARKETING EXECUTIVE', 'Fie Jaya Investindo PT', 15, 2, 3, 2500000, 5000000, '2019-11-19', '2019-12-19', 'https://www.jobs.id/lowongan/Mjg0MTE3/marketing-executive-fie-jaya-investindo-pt', 'Deskripsi Pekerjaan\r\nKami adalah perusahaan integrated design, yang meliputi bidang branding, graphic design, architecture, interior design, integrated marketing, dan multimedia yang berada di bawah PT Fie Jaya Investindo yang telah established selama 15 tahun.\r\nMembantu dalam menganalisa target pasar.\r\nMemperluas jaringan target pasar Fiemo Creative\r\nMembuat kerjasama dengan komunitas-komunitas untuk membantu koneksi.\r\nBerperan aktif dalam kegiatan event-event yang ada di Bandung.\r\nMembuat jadwal meeting dengan target pasar (customer).\r\nMembuat database target pasar seperti perusahaan-perusahaan konvensional ataupun retail.\r\nMemperkenalkan Fiemo Creative.\r\nMenjelaskan produk ataupun jasa yang ada di Fiemo Creative.\r\nMenghubungi target pasar seperti perusahaan-perusahaan konvensional ataupun retail baik via telfon ataupun blast email.\r\nMengidentifikasi kebutuhan target pasar (customer) dan menyediakan serta memenuhi kebutuhan tersebut melalui suatu catatan khusus untuk setiap kliennya secara tersendiri. (keterangan-keterangan pokok atau utama tentang produk, pasaran, saingan, organisasi klien, termasuk personalnya).\r\nMelakukan follow up kepada target pasar (customer) yang memiliki ketertarikan.\r\nMembuat penawaran kepada target pasar (customer) yang memiliki ketertarikan sebagai tindak lanjut untuk menedekati closing.\r\nMembuat strategi untuk dealing projek.\r\nMembuat customer report setiap minggunya secara rutin.\r\nBenefit:\r\nGaji pokok\r\nAsuransi kesehatan\r\nKomisi per project deal\r\nJenjang karir\r\n\nPersyaratan\r\nMinimal 1 tahun pengalaman di bidang marketing\r\nMempunyai kemampuan berkomunikasi yang baik\r\nMempunyai kemampuan negosiasi dan penjualan\r\nKreatif, inovatif, fast learner\r\nBerkomitmen dan bertanggung jawab\r\nBerpenampilan menarik dan rapi\r\nDapat bekerja di bawah tekanan dan target penjualan\r\nBersedia ditempatkan di Bandung\r\nFresh graduate dipersilahkan mendaftar'),
(96, 'INTERNSHIP', 'Valbury Surabaya PT', 30, 2, 6, 0, 0, '2019-11-20', '2019-12-20', 'https://www.jobs.id/lowongan/MTkyNTY5/internship-valbury-surabaya-pt', 'Deskripsi Pekerjaan\r\nMendapatkan training selama 1 minggu\r\nkemudian pihak perusahaan akan memutuskan bagian yang sesuai dengan kemampuan anda\r\n\nPersyaratan\r\nPria/ wanita\r\nBermotivasi besar, ulet & bekerja cerdas\r\nMampu bekerja secara tim dan individu\r\nMinimal semester 6\r\nFasilitas\r\n :\r\nPelatihan/ training selama 1 minggu\r\nGaji, Bonus & Komisi'),
(97, 'Sales Representative', 'Mitra Usaha Sukses CV', 10, 2, 6, 4000000, 6000000, '2019-11-20', '2019-12-20', 'https://www.jobs.id/lowongan/Mjg0MTI0/sales-representative-mitra-usaha-sukses-cv', 'Deskripsi Pekerjaan\r\nmembangun brand image agar market lbh mengenal brand kita\r\nmemperluas jaringan market\r\nmenjaga hubungan dengan pelanggan\r\n\nPersyaratan\r\npria\r\nusia 30 - 35 tahun\r\npendidikan minimal S1\r\npengalaman di bidang bahan bangunan minimal 2 tahun\r\nmemiliki sim A lebih diutamakan\r\nmenguasai bahasa inggris, aktif dan pasif\r\nbisa berbahasa mandarin lebih diutamakan'),
(98, 'Head Chef', 'Thai Makmur PT', 25, 2, 20, 0, 0, '2019-11-21', '2019-11-25', 'https://www.jobs.id/lowongan/MjgwNzYz/head-chef-thai-makmur-pt', 'Deskripsi Pekerjaan\r\nMemahami alur produksi central kitchen\r\nMelatih, memberikan arahan serta membuat standar pembuatan suatu makanan\r\nBertanggung jawab dalam menjaga kualitas produk dan kebersihan central kitchen\r\nBertanggung jawab masalah kualitas dan pengembangan produk\r\nBerkreasi menciptakan menu menu baru/up to date\r\nMengestimasi keperluan bahan baku serta HPP pembuatan menu\r\n\nPersyaratan\r\nLaki - Laki\r\nUsia minimal 26 tahun, usia maksimal 40 tahun\r\nD1/SMK/SMA/Sederajat\r\nPengalaman minimal 2 tahun menjadi head chef\r\nMemiliki pengetahuan tentang perlengkapan kitchen\r\nMempunyai pengalaman di bidang F&B\r\nMemiliki fisik yang energik,kuat, dan sehat\r\nMemiliki sikap tegas, jujur, mandiri dan bertanggung jawab'),
(99, 'Office Boy (Jakarta Pusat)', 'Hippo PT', 36, 2, 17, 0, 0, '2019-11-21', '2019-12-12', 'https://www.jobs.id/lowongan/MjgzNjIy/office-boy-jakarta-pusat-hippo-pt', 'Deskripsi Pekerjaan\r\nMenyapu\r\nMengepel\r\nMengelap\r\nBersih-bersih\r\nMencuci peralatan dapur\r\nMengangkat galon air minum\r\ndan pekerjaan lainnya\r\n\nPersyaratan\r\nPria\r\nMinimal SMA\r\nUsia minimal 20 tahun\r\nDiutamakan domisili dekat Roxy, Jakarta Pusat'),
(100, 'Lowongan Kerja Administrasi', 'Glaxo Indonesia PT', 7, 2, 4, 3950000, 4200000, '2019-11-22', '2019-12-14', 'https://www.jobs.id/lowongan/MjgxODA5/lowongan-kerja-administrasi-glaxo-indonesia-pt', 'Perusahaan berkembang saat ini sedang membuka cabang baru untuk wilayah Jabodetabek. saat ini sedang membutuhkan staff administrasi');

-- --------------------------------------------------------

--
-- Table structure for table `job_favorites`
--

CREATE TABLE `job_favorites` (
  `id_user` int(11) UNSIGNED NOT NULL,
  `id_job` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `job_fields`
--

CREATE TABLE `job_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `job_fields`
--

INSERT INTO `job_fields` (`id`, `name`) VALUES
(6, 'IT'),
(7, 'Administrative & Customer Relationship'),
(9, 'Accounting & Finance'),
(10, 'Sales & Business Development'),
(11, 'Engineer, Network'),
(12, 'Healthcare & Medical'),
(13, 'Manufacturing and Production'),
(14, 'Quality Control'),
(15, 'Marketing & PR'),
(16, 'Sales and Marketing'),
(17, 'Education & Science'),
(18, 'Design'),
(19, 'General Worker'),
(20, 'R&D / Quality Management'),
(21, 'Engineer, Electrical'),
(22, 'Supply Chain & Logistic'),
(23, 'Human Resource'),
(24, 'Legal, Consulting & Advisory'),
(25, 'Food & Beverage'),
(26, 'Engineering / Technician'),
(27, 'Consultant'),
(28, 'Tax Accountant'),
(29, 'Internship'),
(30, 'Fresh Graduate'),
(31, 'IT / MIS, Programmer'),
(32, 'Communications'),
(33, 'Food and Beverage'),
(34, 'Banking Operations'),
(35, 'Engineer, Mechanical'),
(36, 'Others'),
(38, 'General Management & Operational'),
(39, 'Corporate Finance / Investment');

-- --------------------------------------------------------

--
-- Table structure for table `job_location`
--

CREATE TABLE `job_location` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `job_location`
--

INSERT INTO `job_location` (`id`, `name`) VALUES
(3, 'Bandung'),
(4, 'Bekasi'),
(5, 'Demak'),
(6, 'Surabaya'),
(7, 'Jabodetabek'),
(8, 'Tangerang'),
(9, 'Jakarta Barat'),
(10, 'Jakarta Raya'),
(11, 'Malang dan'),
(12, 'Jakarta Utara'),
(13, 'Solo (Surakarta) dan'),
(14, 'Banjarmasin'),
(15, 'Denpasar'),
(16, 'Grobogan'),
(17, 'Jakarta Pusat'),
(18, 'Yogyakarta'),
(19, 'Depok'),
(20, 'Jakarta Selatan'),
(21, 'Cimahi'),
(22, 'Bandar Lampung'),
(23, 'Tangerang Selatan'),
(24, 'Batam'),
(25, 'Jambi'),
(26, 'Balikpapan dan'),
(27, 'Bogor'),
(28, 'Manila'),
(29, 'Pekanbaru'),
(30, 'Yogyakarta dan'),
(31, 'Jakarta Pusat dan'),
(32, 'Gorontalo'),
(33, 'Jakarta Selatan dan'),
(34, 'Malang'),
(35, 'Jepara'),
(36, 'Surabaya dan'),
(37, 'Karawang'),
(38, 'Semarang'),
(39, 'Bandar Lampung dan');

-- --------------------------------------------------------

--
-- Table structure for table `job_sources`
--

CREATE TABLE `job_sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `job_sources`
--

INSERT INTO `job_sources` (`id`, `name`) VALUES
(1, 'Jobstreet'),
(2, 'Jobs.id'),
(3, 'Kalibbr');

-- --------------------------------------------------------

--
-- Table structure for table `mbti_personalities`
--

CREATE TABLE `mbti_personalities` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `nickname` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `characteristic` text COLLATE utf8_bin NOT NULL,
  `suggestion` text COLLATE utf8_bin NOT NULL,
  `job` text COLLATE utf8_bin NOT NULL,
  `partner` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `mbti_personalities`
--

INSERT INTO `mbti_personalities` (`id`, `name`, `nickname`, `description`, `characteristic`, `suggestion`, `job`, `partner`) VALUES
(1, 'INTJ', 'The Mastermind (Si Perencana)', 'INTJ (Mastermind) adalah tipe kepribadian dengan kemampuan perencanaan terbaik dibandingkan tipe kepribadian lainnya. Dia memiliki pandangan yang luas serta menyukai teori dan strategi. Biasanya para Mastermind berpegang teguh pada rencana A, namun juga memiliki rencana B hingga D sebagai cadangan. Mastermind cukup jarang ditemukan, hanya sekitar 1-2 persen dari total populasi manusia. Para Mastermind juga cenderung memiliki rasa percaya diri yang tinggi dan keinginan yang teguh.', 'Visioner, punya perencanaan praktis, & biasanya memiliki ide-ide original serta dorongan kuat untuk mencapainya.Mandiri dan percaya diri. Punya kemampuan analisa yang bagus serta menyederhanakan sesuatu yang rumit dan abstrak menjadi sesuatu yang praktis, mudah difahami & dipraktekkan. Skeptis, kritis, logis, menentukan (determinatif) dan kadang keras kepala.', 'Belajarlah mengungkapkan emosi & perasaan Anda. Cobalah untuk lebih terbuka pada dunia luar, banyak bergaul, banyak belajar, banyak membaca, mengunjungi banyak tempat, eksplorasi hal baru, & memperluas wawasan. Hindari perdebatan tidak penting. Belajarlah untuk berempati, memberi perhatian dan lebih peka terhadap orang lain.', 'Peneliti, Ilmuwan, Insinyur, Teknisi, Pengajar, Profesor, Dokter, Research & Development, Business Analyst, System Analyst, Pengacara, Hakim, Programmers, Posisi Strategis dalam organisasi.', 'ENFP atau ENTP');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_11_15_151858_create_admins_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_answers`
--

CREATE TABLE `test_answers` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8_bin NOT NULL,
  `id_question` int(11) UNSIGNED NOT NULL,
  `id_code` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `test_answers`
--

INSERT INTO `test_answers` (`id`, `name`, `id_question`, `id_code`) VALUES
(1, 'Berinteraksi dengan orang banyak, termasuk orang asing', 1, 5),
(2, 'Berinteraksi dengan sedikit orang, yang telah dikenal', 1, 6),
(3, ' Realistis daripada spekulatif', 2, 3),
(4, 'Spekulatif daripada realistis', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `test_question`
--

CREATE TABLE `test_question` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8_bin NOT NULL,
  `id_code` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `test_question`
--

INSERT INTO `test_question` (`id`, `name`, `id_code`) VALUES
(1, 'Di sebuah pesta, saya...f', 3),
(2, 'Saya lebih ...', 2);

-- --------------------------------------------------------

--
-- Table structure for table `test_results`
--

CREATE TABLE `test_results` (
  `id` int(11) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_personalities` int(11) UNSIGNED NOT NULL,
  `extrovert` int(11) NOT NULL,
  `introvert` int(11) NOT NULL,
  `sensing` int(11) NOT NULL,
  `intuiting` int(11) NOT NULL,
  `thingking` int(11) NOT NULL,
  `feeling` int(11) NOT NULL,
  `judging` int(11) NOT NULL,
  `perceiving` int(11) NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `is_admin`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ahmad Faiz Kamaludin', 1, 'ach.faiz.k@gmail.com', NULL, '$2y$10$Z9Gj62dLoTBDCyHjUL0Pl.q9M7QkUQ.9ZXrJXq8qK46oX/wBPeam2', NULL, '2019-11-14 11:34:56', '2019-11-14 11:34:56'),
(2, 'Admin', 1, 'admin@admin.com', NULL, '$2y$10$.vXUZOVoHp1JupuU02q8p.SSIYNBnXsjwYTmyiLOdvxALc8D62ogW', NULL, '2019-11-14 12:39:11', '2019-11-14 12:39:11'),
(3, 'User', NULL, 'user@user.com', NULL, '$2y$10$k1AMiZeoCumhUEf7tp7cluPAd49PgU85j6TUHxUSMZsmh8pTjrjtS', NULL, '2019-11-15 20:18:20', '2019-11-15 20:18:20'),
(4, 'User', NULL, 'faiz@user.com', NULL, '$2y$10$qfc5ZWkJx8jR13C.0T.7je7.OR7hsQyC6ay7lsO2Ls0ihnKp4Nbjm', NULL, '2019-11-17 20:26:18', '2019-11-17 20:26:18'),
(5, 'Azka', NULL, 'azka@user.com', NULL, '$2y$10$baAcnjlF2PtS2bstfbUObOVWaKmyljXGNgcgtoj4ppqIC57kJu7ty', NULL, '2019-11-17 20:39:34', '2019-11-17 20:39:34'),
(6, 'Kafa', NULL, 'kafa@user.com', NULL, '$2y$10$VDPzXIzeB8JvPpGIVb1E/.2KZ2m18bovf6Axt1vZBpBqXN.f0.dku', NULL, '2019-11-17 20:56:16', '2019-11-17 20:56:16'),
(7, 'Rinda Randi', NULL, 'rinda@gmail.com', NULL, '$2y$10$K.Eg5SttjbNw4gxIOD5NAerAri/OcKZyXvRbAM9LWAPU1IqXPPdeS', NULL, '2019-11-21 20:20:11', '2019-11-21 20:20:11'),
(8, 'Ahmad Faiz', NULL, 'faiz@mail.com', NULL, '$2y$10$fzKyfX1VUZIBAcpueDaEV.4sc81SeQK9Vkp8.wQlwMBCro3ZehilS', NULL, '2019-11-26 06:24:00', '2019-11-26 06:24:00'),
(9, 'dell', NULL, 'dell@mail.com', NULL, '$2y$10$T1br80UxEU1Yt8kezZMXfuc3c/Zkm0XH6jS.YkIIj7q9w/4rUoX8W', NULL, '2019-11-26 07:31:43', '2019-11-26 07:31:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategory` (`id_kategory`);

--
-- Indexes for table `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `code_answer`
--
ALTER TABLE `code_answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `code_question`
--
ALTER TABLE `code_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_job_source` (`id_job_field`),
  ADD KEY `id_job_source_2` (`id_job_source`),
  ADD KEY `id_job_location` (`id_job_location`);

--
-- Indexes for table `job_favorites`
--
ALTER TABLE `job_favorites`
  ADD KEY `id_user` (`id_user`,`id_job`),
  ADD KEY `id_job` (`id_job`);

--
-- Indexes for table `job_fields`
--
ALTER TABLE `job_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_location`
--
ALTER TABLE `job_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_sources`
--
ALTER TABLE `job_sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mbti_personalities`
--
ALTER TABLE `mbti_personalities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `test_answers`
--
ALTER TABLE `test_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_question` (`id_question`),
  ADD KEY `id_kepribadian` (`id_code`);

--
-- Indexes for table `test_question`
--
ALTER TABLE `test_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_code` (`id_code`);

--
-- Indexes for table `test_results`
--
ALTER TABLE `test_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_personalities` (`id_personalities`),
  ADD KEY `id_test` (`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `article_category`
--
ALTER TABLE `article_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `code_answer`
--
ALTER TABLE `code_answer`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `code_question`
--
ALTER TABLE `code_question`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `job_fields`
--
ALTER TABLE `job_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `job_location`
--
ALTER TABLE `job_location`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `job_sources`
--
ALTER TABLE `job_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mbti_personalities`
--
ALTER TABLE `mbti_personalities`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test_answers`
--
ALTER TABLE `test_answers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `test_question`
--
ALTER TABLE `test_question`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `test_results`
--
ALTER TABLE `test_results`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`id_kategory`) REFERENCES `article_category` (`id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_2` FOREIGN KEY (`id_job_field`) REFERENCES `job_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jobs_ibfk_3` FOREIGN KEY (`id_job_source`) REFERENCES `job_sources` (`id`),
  ADD CONSTRAINT `jobs_ibfk_4` FOREIGN KEY (`id_job_location`) REFERENCES `job_location` (`id`);

--
-- Constraints for table `job_favorites`
--
ALTER TABLE `job_favorites`
  ADD CONSTRAINT `job_favorites_ibfk_1` FOREIGN KEY (`id_job`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_favorites_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `test_answers`
--
ALTER TABLE `test_answers`
  ADD CONSTRAINT `test_answers_ibfk_1` FOREIGN KEY (`id_question`) REFERENCES `test_question` (`id`),
  ADD CONSTRAINT `test_answers_ibfk_2` FOREIGN KEY (`id_code`) REFERENCES `code_answer` (`id`);

--
-- Constraints for table `test_question`
--
ALTER TABLE `test_question`
  ADD CONSTRAINT `test_question_ibfk_1` FOREIGN KEY (`id_code`) REFERENCES `code_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
