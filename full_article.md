---
abstract: |
    Dokumen ini *live document *merupakan tesis Program Magister Teknik Air
    Tanah, Fakultas Ilmu dan Teknologi Kebumian, Institut Teknologi Bandung
    atas nama Saudara Sri Aditya dibawah bimbingan saya.

    Variasi harian data kualitas air masih jarang dianalisis. Riset ini
    adalah hasil awal dari riset observasi data kualitas air Sungai
    Cikapundung di tahun 2017 (periode Maret-Mei 2017). Makalah ini
    menjelaskan hasil sementara dari riset yang masih berjalan untuk
    mengetahui variasi harian yang mungkin terjadi pada parameter: Debit
    (meter/detik), temperatur air sungai (derajat Celcius), temperatur udara
    (derajat Celcius), TDS (total dissolved solids) (ppm), dan kelembaban
    udara (%). Pengukuran dilakukan dengan alat portabel merk Lutron,
    masing-masing dengan ketelitian 0.01 pada masing-masing satuan yang
    berkaitan. Pengukuran dilakukan empat kali di masing-masing lokasi:
    pukul 10.00, 12.00, 14.00, dan 16.00.

    Pengukuran dilakukan pada tiga lokasi di DAS S. Cikapundung (diurutkan
    dari utara-selatan): S. Ciawitali lokasi Curug Panganten (L1) dan Grand
    Royal Pancanaka (L2), S. Cibeureum lokasi Pondok Hijau Indah (L3). Tata
    guna lahan berevolusi dari lahan terbuka berupa hutan dan lahan
    perkebunan/pertanian di lokasi L1 dan L2, menjadi perumahan di L3.

    TDS menunjukkan peningkatan signifikan dari utara ke selatan, khususnya
    di lokasi L3 (perumahan) dengan variasi harian tidak signifikan, kecuali
    pada L3. Di L3 terjadi penurunan lebih dari 100 ppm di akhir pengukuran
    pukul 16.00, sebanyak dua kali dari tiga kali pengukuran. Temperatur air
    sungai (Temp\_R) memperlihatkan pola yang teratur di semua lokasi.
    Berawal dari suhu 22-24 oC di pagi hari, naik menjadi 24-26oC di siang
    dan sore hari. Variasi suhu tidak terlihat di sore hari. Temperatur
    udara (Temp\_air) memperlihatkan pola acak, dipengaruhi pula oleh cuaca
    yang sering terjadi hujan di sore hari. Menimbulkan kesan bahwa suhu di
    siang dan sore hari lebih panas dibanding di pagi hari. Kelembaban udara
    (moist) memperlihatkan pola rendah di pagi hari dan meningkat di siang
    dan sore hari dengan kenaikan bisa lebih dari 2 kali lipat. Seluruh pola
    ini tidak dipengaruhi oleh cuaca yang sedang dalam kondisi hujan. Salah
    satu dugaannya adalah bahwa aliran air tanah masuk ke dalam sungai lebih
    dominan di tiga lokasi ini.

    Hasil pengukuran menunjukkan bahwa variasi harian dapat dimunculkan
    sebagai salah satu aspek menarik dari kualitas air. Hasil akhir dari
    riset ini diharapkan dapat mengkuantifikasi pengaruh drainase sawah dan
    pemukiman ke aliran sungai utama di sekitar lokasi penelitian. Untuk
    meningkatkan kualitas analisisnya, perangkat data logger perlu
    diinstalasi di kemudian hari.
author:
- Dasapta Erwin Irawan
- 'aditya.sri.gf'
bibliography:
- 'bibliography/converted\_to\_latex.bib'
title: 'Pola dan distribusi temperatur, dan TDS air sungai di Bandung'
---

PENDAHULUAN
===========

[\[721192\]]{}

Latar belakang
--------------

[\[295619\]]{}

Sungai merupakan komponen penting bagi kehidupan dan dalam kehidupan
manusia. Fungsi utama sungai di wilayah Cekungan Bandung saat ini adalah
sebagai sumber air untuk pengairan lahan pertanian, rumah tangga, dan
industri. Kelestarian lingkungan sungai (meliputi aspek biogeofisik)
dapat menurun kualitasnya sejalan dengan penurunan kualitas air.
Gejalanya dapat diamati dengan mudah, misalnya: bau busuk air, warna air
yang hitam, keruh, yang ditambah dengan efeknya kepada kesehatan.
Penyakit kulit dan pencernaan adalah yang paling banyak diderita
masyarakat akibat lingkungan air yang tercemar, akibat sistem sanitasi
yang buruk
[@rohmat2009solusi; @marganingrum2013diferensiasi; @astuti2013faktor].
Pada banyak lokasi, air kotor dari pemukiman, industri, serta limbah
pertanian dibuang langsung ke sungai utama (Gambar [\[608387\]]{}).
Kondisi ini merupakan hal yang menarik untuk ditelaah.

![[Titik pembuangan limbah rumah tangga ke aliran Sungai Cibeureum,
Bandung
[\[608387\]]{}]{}](figures/aditya1-1/aditya1-1){width="0.28\columnwidth"}

Masalah yang dikaji
-------------------

[\[847145\]]{}

Beberapa penelitian saat ini telah mengetahui zonasi interaksi antara
air tanah dan air Sungai Cikapundung  dan kedekatan diantara kedua tubuh
air tersebut [@darul2016conceptual; @tanuwijaya2017anomali]. Kami
tertarik untuk mengetahui fluktuasi harian dan bulanan beberapa
parameter air, yang terdiri dari: temperatur air, temperatur udara,
total dissolved solids (TDS), kelembaban udara, untuk mencari
korelasinya dengan kondisi lingkungan di sekitarnya. Hipotesis kami
adalah, bahwa TDS sebagai salah satu indikasi pencemaran yang dapat
diukur dengan alat yang murah akan berkorelasi dengan tata guna lahan di
sekitarnya. Untuk itu kami memilih tiga wilayah yang menjadi target
penelitian diantaranya Curug Panganten (CP), Grand Royal Pancanaka (GRP)
(Sungai Ciawitali) dan Perumahan Pondok Hijau Indah (PHI) (Sungai
Cibeureum) (lokasi lihat Gambar [\[770198\]]{}). Lokasi CP dipilih untuk
merepresentasikan wilayah yang masih natural, lokasi GRP mewakili
wilayah dengan lahan pesawahan, serta PHI untuk wilayah perumahan.

Pendekatan
----------

[\[104098\]]{}

Dalam penelitian ini, kami mengumpulkan data secara *time series*
(kohort). Pada setiap titik dilakukan pengukuran temperatur air dan
temperatur udara, TDS, dan kelembaban udara dengan frekuensi empat kali
per hari, seminggu dua kali, selama 8 bulan pada tahun 2017. Data-data
tersebut kemudian akan dianalisis polanya serta korelasinya dengan tata
guna lahan di sekitarnya. Harapannya, kami dapat mengekstraksi tipe
fluktuasi temperatur, TDS, dan kelembaban udara pada setiap lokasi tipe.
 

![[Tiga lokasi observasi
[\[770198\]]{}]{}](figures/map(1)/adit-maps){width="1.00\columnwidth"}

Sistematika pembahasan
----------------------

[\[878701\]]{}

Dalam kajian ini, sistematika pembahasan yang dilakukan adalah sebagai
berikut :

**Bab 1 Pendahuluan:** Bab ini berisi tentang latar belakang yang
mendasari dipilihnya penelitian  ini, rumusan permasalahan, maksud dan
tujuan yang ingin dicapai,  kerangka pemikiran, serta sistematika
pembahasan yang dilakukan untuk menyelesaikannya.

**Bab 2 Tinjauan Pustaka:** Berisi tentang uraian teori, aturan, standar
ataupun pedoman yang berkaitan dengan permasalahan secara teoritis.

**Bab 3 Metode: **Pada bab  ini akan diuraikan metodologi

**Bab 4 Gambaran umum wilayah penelitian:** Pada bab ini akan
dideskripsikan kondisi biogeofisik secara regional

**Bab 5 Hasil dan pembahasan:** Pada bab ini akan dibahas mengenai

**Bab 6 Kesimpulan dan rekomendasi:** Pada bab ini berisi kesimpulan dan
rekomendasi

TINJAUAN PUSTAKA
================

[\[483723\]]{}

Tinjauan pustaka dilakukan dalam tiga topik, yaitu: interaksi antara air
tanah dan air sungai (atau air permukaan), kualitas air, serta
kontaminasi air. Bab ini disusun berdasarkan pencarian informasi melalui
basis data [Scopus](http://scopus.com)dan [Google
Scholar](http://scholar.google.com).

Telaah bibliometrik
-------------------

[\[923899\]]{}

Metode bibliometrik ini bertujuan untuk membuat visualisasi lanskap
riset di bidang kualitas air sungai dan air tanah . Dengan teknik ini,
kami dapat menggambarkan situasi riset terkait dan bagaimana
karakternya, mencakup: distribusi berdasarkan tahun, penulis, afiliasi,
dan lembaga, serta keterkaitan antar artikel. Di sini kami memanfaatkan
basis data Scopus dan Google Scholar, didukung perangkat open source
VosViewer juga digunakan untuk membangun visualisasinya [@Irawan2018]. 

Zat padat terlarut
------------------

[\[813223\]]{}

Air adalah pelarut yang baik. Zat padat terlarut atau *total dissolved
solids* (TDS) adalah akibatnya. Padatan yang dimaksud di sini adalah
mineral, garam, logam, kation atau anion yang terlarut dalam air.
Semakin banyak yang terlarut, maka semakin tinggi nilai TDS nya,
biasanya diukur dalam satuan parts per million (ppm). TDS dapat berasal
dari air secara alamiah atau dari zat pencemar (kontaminan). Dalam kasus
air sungai, biasanya semakin ke arah hilir, nilai TDS akan makin
tinggi `ins_cite`. Secara alamiah TDS akan berasal dari mineral-mineral
yang berasal dari bebatuan atau tanah yang ada di sepanjang bantaran
sungai. Di sisi lain, TDS akan meningkat bila dalam perjalanannya, air
sungai menerima kontaminan akan berasal dari saluran-saluran limbah
rumah tangga atau industri yang bermuara ke sungai.  

Kualitas air sungai sangat sensitif terhadap perubahan tata guna lahan.
Salah satu indikatornya adalah BOD, yang akan cepat berubah bila ada
pencemaran yang berkaitan dengan bahan organik, seperti perkebunan
Sawit [@Presipitasi11012]. Hal yang sama terjadi untuk parameter TSS dan
TDS [@Liu2017; @Putra2014].

Suhu air dan suhu udara
-----------------------

[\[925040\]]{}

Suhu air sungai akan sangat berhubungan dengan suhu udara. Hal yang
berlainan dapat terjadi untuk kasus air tanah. Suhu air tanah dalam atau
sangat dalam yang mengalir dalam akuifer tertekan dapat saja tidak
berhubungan dengan suhu udara. Dalam riset ini hipotesis kami adalah
bila suhu air sungai memiliki tren yang mengikuti suhu udara, maka dapat
diinterpretasikan bahwa air tanah yang mengalir ke sungai berasal dari
akuifer tak tertekan .  

METODE PENELITIAN
=================

[\[696273\]]{}

Jenis riset
-----------

[\[372084\]]{}

Riset ini berjenis eksploratori yang bertujuan untuk mengetahui berbagai
korelasi dan hubungan sebab akibat yang mungkin terjadi pada data atau
variabel yang diukur di lapangan. Fokus utama dari riset ini adalah
pengukuran variasi data kualitas air yang terdiri dari debit sungai,
temperatur air sungai dan temperatur udara, zat padatan terlarut (TDS),
dan pH. Variasi data ini secara rinci masih sangat jarang ditelaah.  

Pengelolaan data
----------------

[\[123052\]]{}

Data dari riset ini terdiri dari tabel, foto dan video. Secara
keseluruhan data tersebut disimpan dalam repositori proyek Open Science
Framework (OSF) [@Irawan_Aditya_2018]. Seluruh data akan dipublikasikan
dengan
lisensi [CC-BY](https://creativecommons.org/licenses/by/4.0/) [@mo1ngc]
saat tesis ini telah lolos proses sidang magister.

Uraian data
-----------

[\[961733\]]{}

Data yang didapatkan dari riset ini merupakan bagian dari observasi data
kualitas air Sungai Cikapundung di tahun 2017. Makalah ini menjelaskan
hasil sementara dari riset yang masih berjalan untuk mengetahui variasi
harian yang mungkin terjadi pada parameter sebagai berikut.

[1.0]{}[CCC]{} Variables & Units (satuan) & Singkatan\
Debit & meter kubik/detik & m3/det\
Temperatur air sungai & derajat Celsius & oC\
Temperatur udara & derajat Celsius & oC\
Zat padatan terlarut & parts per million & ppm\

Pengukuran dilakukan dengan alat portabel merk Lutron, masing-masing
dengan ketelitian 0.01 pada masing-masing satuan yang berkaitan.
Pengukuran dilakukan empat kali di masing-masing lokasi: pukul 10.00,
12.00, 14.00, dan 16.00. Pengukuran dilakukan pada tiga lokasi di DAS S.
Cikapundung (diurutkan dari utara-selatan): S. Ciawitali lokasi Curug
Panganten (L1) dan Grand Royal Pancanaka (L2), S. Cibeureum lokasi
Pondok Hijau Indah (L3). Tata guna lahan berevolusi dari lahan terbuka
berupa hutan dan lahan perkebunan/pertanian di lokasi L1 dan L2, menjadi
perumahan di L3 (akan dijelaskan pada Bab [\[641224\]]{}.

Data

GAMBARAN UMUM WILAYAH PENELITIAN
================================

[\[641224\]]{}

Sungai Ciawitali Curug Panganten (L1)
-------------------------------------

[\[147502\]]{}

Curug Panganten adalah salah satu obyek wisata di kawasan Bandung Utara
(yang masuk dalam Kota Cimahi) [@senari]. Terletak di ketinggian 1050
mdpl (meter di atas permukaan laut), curug ini berada di tepi Jalan
Cihanjuang km 5,6 [@bebas] Kawasan tersebut adalah kawasan lindung
(lihat video lampiran yang dibuat berdasarkan street view oleh Rudy
Sutiady pada Bulan Desember 2017). 

Saluran Sodetan Grand Royal Pancanaka (L2)
------------------------------------------

[\[952529\]]{}

Sungai Cibeureum Pondok Hijau Indah (L3)
----------------------------------------

[\[275674\]]{}

HASIL DAN PEMBAHASAN
====================

[\[543921\]]{}

TDS menunjukkan peningkatan signifikan dari utara ke selatan, khususnya
di lokasi L3 (perumahan) dengan variasi harian tidak signifikan, kecuali
pada L3. Di L3 terjadi penurunan lebih dari 100 ppm di akhir pengukuran
pukul 16.00, sebanyak dua kali dari tiga kali pengukuran. Temperatur air
sungai (Temp\_R) memperlihatkan pola yang teratur di semua lokasi.
Berawal dari suhu 22-24 oC di pagi hari, naik menjadi 24-26oC di siang
dan sore hari. Variasi suhu tidak terlihat di sore hari. Temperatur
udara (Temp\_air) memperlihatkan pola acak, dipengaruhi pula oleh cuaca
yang sering terjadi hujan di sore hari. Menimbulkan kesan bahwa suhu di
siang dan sore hari lebih panas dibanding di pagi hari. Kelembaban udara
(moist) memperlihatkan pola rendah di pagi hari dan meningkat di siang
dan sore hari dengan kenaikan bisa lebih dari 2 kali lipat. Seluruh pola
ini tidak dipengaruhi oleh cuaca yang sedang dalam kondisi hujan. Salah
satu dugaannya adalah bahwa aliran air tanah masuk ke dalam sungai lebih
dominan di tiga lokasi ini.

Keberadaan data sangat penting dalam analisis lingkungan dan data
terbuka (*open data*) akan mempercepat perkembangan ilmu dan kedalaman
analisis. Beberapa insiatif dan konsep telah pernah dibuat . Tapi
eksekusinya belum pernah dilakukan secara kontinyu.

KESIMPULAN DAN REKOMENDASI
==========================

[\[219322\]]{}

Hasil pengukuran menunjukkan bahwa variasi harian dapat dimunculkan
sebagai salah satu aspek menarik dari kualitas air. Hasil akhir dari
riset ini diharapkan dapat mengkuantifikasi pengaruh drainase sawah dan
pemukiman ke aliran sungai utama di sekitar lokasi penelitian. Untuk
meningkatkan kualitas analisisnya, perangkat data logger perlu
diinstalasi di kemudian hari.

Keberadaan data sangat penting dalam analisis lingkungan dan data
terbuka (*open data*) akan mempercepat perkembangan ilmu dan kedalaman
analisis. Beberapa insiatif dan konsep telah pernah dibuat. Tapi
eksekusinya belum pernah dilakukan secara kontinyu.
