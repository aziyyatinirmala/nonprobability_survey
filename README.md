# nonprobability_survey
# Survei Kepuasan Mahasiswa Statistika terhadap Fasilitas WiFi dan Internet di FMIPA Universitas Mataram

## Deskripsi Project

Project ini merupakan pengolahan data hasil survei kepuasan mahasiswa Program Studi Statistika terhadap fasilitas WiFi dan internet di FMIPA Universitas Mataram menggunakan bahasa pemrograman R.

Penelitian ini bertujuan untuk mengetahui tingkat kepuasan mahasiswa terhadap kualitas jaringan internet kampus berdasarkan beberapa indikator pelayanan WiFi, kemudian dianalisis menggunakan metode statistik deskriptif, uji instrumen, naive estimation, weighted estimation, distribusi frekuensi, serta perhitungan ukuran sampel menggunakan rumus Slovin.

Analisis dilakukan menggunakan software RStudio dengan beberapa package pendukung visualisasi dan pengolahan data statistik.

---

# Latar Belakang

Internet dan WiFi kampus merupakan fasilitas penting dalam menunjang proses pembelajaran mahasiswa, terutama dalam:
- mengakses e-learning,
- mencari referensi akademik,
- mengerjakan tugas,
- melakukan praktikum,
- dan aktivitas perkuliahan lainnya.

Kualitas internet yang baik dapat meningkatkan efektivitas pembelajaran mahasiswa. Sebaliknya, jaringan internet yang lambat atau tidak stabil dapat menghambat aktivitas akademik.

Berdasarkan kondisi tersebut, dilakukan survei kepuasan mahasiswa Statistika terhadap fasilitas WiFi dan internet di FMIPA Universitas Mataram.

---

# Tujuan Analisis

Penelitian ini bertujuan untuk:
1. Mengetahui tingkat kepuasan mahasiswa terhadap fasilitas WiFi FMIPA.
2. Mengetahui indikator yang memiliki penilaian tertinggi dan terendah.
3. Menguji validitas dan reliabilitas instrumen kuesioner.
4. Membandingkan hasil naive estimation dan weighted estimation.
5. Mengetahui distribusi tingkat kepuasan mahasiswa.
6. Menghitung ukuran sampel menggunakan rumus Slovin.

---

# Dataset

Dataset berasal dari hasil penyebaran kuesioner kepada mahasiswa Program Studi Statistika FMIPA Universitas Mataram.

Karakteristik data:
- Jenis data: Data primer
- Skala pengukuran: Skala Likert 1–5
- Jumlah populasi: 52 mahasiswa
- Jumlah sampel: 31 mahasiswa

Keterangan skala Likert:
| Skor | Keterangan |
|---|---|
| 1 | Sangat Tidak Setuju |
| 2 | Tidak Setuju |
| 3 | Netral |
| 4 | Setuju |
| 5 | Sangat Setuju |

---

# Indikator Penelitian

Penelitian menggunakan 9 indikator penilaian, yaitu:

| No | Indikator |
|---|---|
| 1 | Akses WiFi mudah digunakan |
| 2 | Kecepatan internet baik |
| 3 | Koneksi internet stabil |
| 4 | Internet membantu kegiatan kuliah |
| 5 | Internet dapat digunakan saat jam kuliah |
| 6 | Gangguan internet jarang terjadi |
| 7 | Kualitas internet baik |
| 8 | Internet dapat digunakan di luar jam kuliah |
| 9 | Internet sesuai kebutuhan mahasiswa |

---

# Software dan Package

Analisis dilakukan menggunakan:
- R Programming Language
- RStudio

Package yang digunakan:

```r
library(readxl)
library(dplyr)
library(psych)
library(ggplot2)
library(likert)
library(corrplot)
library(tidyr)
```

---

# Tahapan Analisis Data

# 1. Import Data

Data dibaca dari file Excel menggunakan package `readxl`.

```r
wifi <- read_excel("Data Responden Excel.xlsx")
```

Tahap ini bertujuan untuk memasukkan data responden ke dalam R agar dapat diolah lebih lanjut.

---

# 2. Mengubah Nama Variabel

Setiap kolom data diubah menjadi nama variabel yang lebih mudah dipahami.

Contoh:
- `Akses_Mudah`
- `Internet_Cepat`
- `Koneksi_Stabil`

Tujuan tahap ini adalah mempermudah interpretasi hasil analisis.

---
# Hasil Analisis dan Pembahasan

# 1. Statistik Deskriptif

Analisis statistik deskriptif dilakukan untuk melihat gambaran umum jawaban responden terhadap setiap indikator kepuasan fasilitas WiFi dan internet di FMIPA Universitas Mataram.

Tabel berikut menunjukkan nilai minimum, maksimum, median, dan rata-rata setiap indikator.

| Indikator | Min | Median | Mean | Max |
|---|---|---|---|---|
| Akses_Mudah | 1 | 3 | 3.548 | 5 |
| Internet_Cepat | 1 | 3 | 3.161 | 5 |
| Koneksi_Stabil | 1 | 3 | 3.129 | 5 |
| Membantu_Kuliah | 1 | 4 | 3.677 | 5 |
| Internet_Jam_Kuliah | 1 | 3 | 3.452 | 5 |
| Gangguan_Jarang | 1 | 3 | 2.613 | 4 |
| Kualitas_Baik | 1 | 3 | 3.097 | 5 |
| Internet_Luar_Jam | 1 | 3 | 3.387 | 5 |
| Sesuai_Kebutuhan | 1 | 4 | 3.452 | 5 |

## Interpretasi Statistik Deskriptif

Hasil statistik deskriptif menunjukkan bahwa sebagian besar indikator memiliki nilai rata-rata di atas 3. Hal ini menunjukkan bahwa mahasiswa cenderung memberikan penilaian cukup baik terhadap fasilitas WiFi dan internet di FMIPA Universitas Mataram.

Indikator dengan nilai rata-rata tertinggi adalah **Membantu_Kuliah** sebesar 3,677. Hasil ini menunjukkan bahwa mahasiswa merasa fasilitas internet cukup membantu dalam menunjang kegiatan perkuliahan dan aktivitas akademik.

Indikator **Akses_Mudah**, **Internet_Jam_Kuliah**, dan **Sesuai_Kebutuhan** juga memiliki rata-rata yang cukup tinggi, yaitu di atas 3,4. Kondisi ini menunjukkan bahwa mahasiswa merasa akses internet cukup mudah digunakan dan mampu memenuhi kebutuhan akademik mereka.

Indikator dengan nilai rata-rata terendah adalah **Gangguan_Jarang** sebesar 2,613. Nilai ini menunjukkan bahwa mahasiswa masih merasakan adanya gangguan atau ketidakstabilan jaringan internet selama penggunaan WiFi kampus.

Nilai minimum sebesar 1 pada seluruh indikator menunjukkan terdapat responden yang memberikan penilaian sangat rendah terhadap layanan internet. Nilai maksimum sebesar 5 menunjukkan terdapat responden yang merasa sangat puas terhadap fasilitas internet yang tersedia.

---

# 2. Rata-rata Tiap Indikator

Rata-rata tiap indikator digunakan untuk mengetahui tingkat kepuasan mahasiswa pada masing-masing aspek layanan WiFi dan internet.

| Indikator | Mean |
|---|---|
| Akses_Mudah | 3.548 |
| Internet_Cepat | 3.161 |
| Koneksi_Stabil | 3.129 |
| Membantu_Kuliah | 3.677 |
| Internet_Jam_Kuliah | 3.452 |
| Gangguan_Jarang | 2.613 |
| Kualitas_Baik | 3.097 |
| Internet_Luar_Jam | 3.387 |
| Sesuai_Kebutuhan | 3.452 |

## Histogram Rata-rata Indikator

```text
Membantu_Kuliah         ████████████████████ 3.677
Akses_Mudah             ██████████████████   3.548
Internet_Jam_Kuliah     █████████████████    3.452
Sesuai_Kebutuhan        █████████████████    3.452
Internet_Luar_Jam       ████████████████     3.387
Internet_Cepat          ██████████████       3.161
Koneksi_Stabil          █████████████        3.129
Kualitas_Baik           █████████████        3.097
Gangguan_Jarang         ███████████          2.613
```

## Interpretasi Rata-rata Indikator

Berdasarkan nilai rata-rata indikator, mahasiswa memberikan penilaian paling tinggi terhadap indikator **Membantu_Kuliah**. Hasil ini menunjukkan bahwa keberadaan WiFi kampus dinilai cukup membantu proses pembelajaran mahasiswa Statistika FMIPA Universitas Mataram.

Indikator **Akses_Mudah** juga memperoleh nilai tinggi. Kondisi ini menunjukkan bahwa mahasiswa merasa cukup mudah dalam mengakses jaringan WiFi kampus.

Indikator **Gangguan_Jarang** memperoleh nilai rata-rata paling rendah dibanding indikator lainnya. Hal ini menunjukkan bahwa mahasiswa masih cukup sering mengalami gangguan jaringan internet selama penggunaan WiFi.

Secara umum seluruh indikator memiliki rata-rata di atas 3, sehingga dapat disimpulkan bahwa tingkat kepuasan mahasiswa terhadap fasilitas WiFi dan internet FMIPA Universitas Mataram tergolong cukup baik.

---

# 3. Uji Validitas

Uji validitas dilakukan untuk mengetahui apakah setiap item pertanyaan mampu mengukur kepuasan mahasiswa dengan baik.

Kriteria pengujian:
- r hitung > 0,30 → Valid
- r hitung ≤ 0,30 → Tidak Valid

| Item | r hitung | Keputusan |
|---|---|---|
| Akses_Mudah | 0.668 | Valid |
| Internet_Cepat | 0.840 | Valid |
| Koneksi_Stabil | 0.798 | Valid |
| Membantu_Kuliah | 0.839 | Valid |
| Internet_Jam_Kuliah | 0.784 | Valid |
| Gangguan_Jarang | 0.347 | Valid |
| Kualitas_Baik | 0.790 | Valid |
| Internet_Luar_Jam | 0.724 | Valid |
| Sesuai_Kebutuhan | 0.807 | Valid |

## Interpretasi Uji Validitas

Hasil uji validitas menunjukkan bahwa seluruh item pertanyaan memiliki nilai r hitung lebih besar dari 0,30. Hasil ini menunjukkan bahwa seluruh item kuesioner dinyatakan valid dan mampu mengukur tingkat kepuasan mahasiswa terhadap fasilitas WiFi dan internet di FMIPA Universitas Mataram.

Indikator dengan nilai validitas tertinggi adalah **Internet_Cepat** sebesar 0,840. Hasil ini menunjukkan bahwa indikator kecepatan internet memiliki hubungan yang sangat kuat terhadap total skor kepuasan mahasiswa.

Indikator **Membantu_Kuliah** dan **Sesuai_Kebutuhan** juga memiliki nilai korelasi yang tinggi. Kondisi ini menunjukkan bahwa kedua indikator tersebut sangat berpengaruh dalam mengukur kepuasan mahasiswa terhadap layanan internet kampus.

Indikator dengan nilai validitas paling rendah adalah **Gangguan_Jarang** sebesar 0,347. Meskipun demikian, nilai tersebut masih berada di atas batas minimum validitas sehingga item tetap dinyatakan valid.

Secara keseluruhan, instrumen penelitian dapat digunakan untuk analisis lebih lanjut karena seluruh item telah memenuhi syarat validitas.

---
# 4. Hasil Uji Reliabilitas

Hasil uji reliabilitas menggunakan Cronbach’s Alpha diperoleh nilai sebesar 0,92.

| Statistik | Nilai |
|---|---|
| Cronbach’s Alpha | 0.92 |

## Interpretasi

Nilai Cronbach’s Alpha sebesar 0,92 menunjukkan bahwa instrumen penelitian memiliki tingkat reliabilitas yang sangat tinggi.

Berdasarkan kriteria reliabilitas:
| Nilai Alpha | Interpretasi |
|---|---|
| > 0,90 | Sangat Reliabel |
| 0,70 – 0,90 | Reliabel |
| 0,60 – 0,70 | Cukup Reliabel |

Karena nilai alpha lebih besar dari 0,90, maka seluruh item pertanyaan pada kuesioner dinyatakan sangat reliabel dan memiliki konsistensi internal yang sangat baik dalam mengukur kepuasan mahasiswa terhadap fasilitas WiFi dan internet di FMIPA Universitas Mataram.

# 5. Korelasi Antar Indikator

Analisis korelasi dilakukan untuk melihat hubungan antar indikator kepuasan mahasiswa terhadap fasilitas WiFi dan internet di FMIPA Universitas Mataram.

Visualisasi korelasi ditampilkan menggunakan `corrplot`, dimana:
- warna biru tua menunjukkan korelasi positif yang kuat,
- warna biru muda menunjukkan korelasi positif yang lebih lemah,
- warna mendekati putih menunjukkan hubungan yang rendah.

## Interpretasi Korelasi

Berdasarkan heatmap korelasi, sebagian besar indikator memiliki hubungan positif antar variabel. Hasil ini menunjukkan bahwa peningkatan kualitas pada satu aspek layanan internet cenderung diikuti oleh peningkatan kepuasan pada aspek lainnya.

Indikator **Internet_Cepat**, **Koneksi_Stabil**, dan **Membantu_Kuliah** memiliki korelasi yang cukup kuat. Kondisi ini menunjukkan bahwa kecepatan dan kestabilan internet sangat berpengaruh terhadap efektivitas penggunaan internet dalam menunjang kegiatan perkuliahan mahasiswa.

Indikator **Akses_Mudah** juga memiliki hubungan positif dengan sebagian besar indikator lainnya. Hasil ini menunjukkan bahwa kemudahan akses WiFi berkontribusi terhadap tingkat kepuasan mahasiswa secara umum.

Indikator **Gangguan_Jarang** terlihat memiliki korelasi yang lebih rendah dibanding indikator lain. Kondisi ini menunjukkan bahwa mahasiswa masih mengalami gangguan jaringan yang mempengaruhi persepsi kepuasan terhadap layanan internet.

Korelasi yang dominan positif menunjukkan bahwa kualitas layanan WiFi dan internet di FMIPA Universitas Mataram saling berkaitan antar indikator. Semakin baik kualitas jaringan internet, maka tingkat kepuasan mahasiswa juga cenderung meningkat.

Secara keseluruhan, hasil korelasi menunjukkan bahwa indikator-indikator dalam penelitian memiliki hubungan yang cukup baik dalam mengukur kepuasan mahasiswa terhadap fasilitas WiFi dan internet.

# 6. Visualisasi Skala Likert

Visualisasi skala Likert digunakan untuk melihat distribusi jawaban responden terhadap setiap indikator kepuasan fasilitas WiFi dan internet di FMIPA Universitas Mataram.

Kategori jawaban terdiri dari:
- STS = Sangat Tidak Setuju
- TS = Tidak Setuju
- N = Netral
- S = Setuju
- SS = Sangat Setuju

Diagram menunjukkan persentase jawaban responden pada masing-masing indikator.

## Interpretasi Visualisasi Likert

Berdasarkan diagram Likert, sebagian besar responden memberikan jawaban pada kategori **Setuju (S)** dan **Sangat Setuju (SS)** terhadap beberapa indikator layanan WiFi dan internet FMIPA Universitas Mataram.

Indikator **Membantu_Kuliah** memperoleh persentase tertinggi pada kategori positif. Sebanyak 61% responden memberikan jawaban **Sangat Setuju**, sedangkan 35% memberikan jawaban **Setuju**. Hasil ini menunjukkan bahwa fasilitas internet sangat membantu mahasiswa dalam kegiatan perkuliahan dan aktivitas akademik.

Indikator **Sesuai_Kebutuhan** juga menunjukkan tingkat kepuasan yang tinggi. Sebanyak 52% responden menjawab **Sangat Setuju** dan 35% menjawab **Setuju**. Kondisi ini menunjukkan bahwa layanan internet kampus dinilai cukup mampu memenuhi kebutuhan mahasiswa.

Indikator **Akses_Mudah**, **Internet_Luar_Jam**, dan **Internet_Jam_Kuliah** juga memperoleh dominasi jawaban positif pada kategori **Setuju** dan **Sangat Setuju**. Hasil ini menunjukkan bahwa mahasiswa merasa akses WiFi cukup mudah digunakan baik saat jam kuliah maupun di luar jam perkuliahan.

Indikator **Internet_Cepat** dan **Koneksi_Stabil** memiliki persentase jawaban netral yang masih cukup besar. Kondisi ini menunjukkan bahwa sebagian mahasiswa merasa kualitas kecepatan dan kestabilan internet belum sepenuhnya optimal.

Indikator dengan tingkat kepuasan paling rendah adalah **Gangguan_Jarang**. Sebanyak 35% responden memberikan jawaban **Sangat Tidak Setuju**, sedangkan hanya 10% yang menjawab **Sangat Setuju**. Hasil ini menunjukkan bahwa mahasiswa masih cukup sering mengalami gangguan jaringan internet selama menggunakan fasilitas WiFi kampus.

Indikator **Kualitas_Baik** menunjukkan mayoritas jawaban berada pada kategori netral dan setuju. Kondisi ini menunjukkan bahwa kualitas internet dinilai cukup baik, tetapi masih terdapat beberapa aspek yang perlu ditingkatkan.

Secara keseluruhan, visualisasi Likert menunjukkan bahwa mayoritas mahasiswa Statistika FMIPA Universitas Mataram merasa cukup puas terhadap fasilitas WiFi dan internet kampus, terutama dalam mendukung aktivitas akademik. Meskipun demikian, aspek kestabilan jaringan dan gangguan internet masih perlu mendapatkan perhatian lebih lanjut.

# 7. Naive Estimation

Naive estimation digunakan untuk menghitung nilai rata-rata setiap indikator kepuasan mahasiswa tanpa memberikan bobot tertentu pada masing-masing indikator.

Pada metode ini:
- seluruh indikator dianggap memiliki kontribusi yang sama,
- estimasi dilakukan menggunakan rata-rata langsung dari data responden.

---

# Tabel Hasil Naive Estimation

| Indikator | Mean Naive |
|---|---|
| Akses_Mudah | 3.548 |
| Internet_Cepat | 3.161 |
| Koneksi_Stabil | 3.129 |
| Membantu_Kuliah | 3.677 |
| Internet_Jam_Kuliah | 3.452 |
| Gangguan_Jarang | 2.613 |
| Kualitas_Baik | 3.097 |
| Internet_Luar_Jam | 3.387 |
| Sesuai_Kebutuhan | 3.452 |

---

# Rata-rata Keseluruhan Naive Estimation

| Statistik | Nilai |
|---|---|
| Mean Naive Total | 3.280 |

---

# Interpretasi Naive Estimation

Berdasarkan hasil naive estimation, diperoleh rata-rata keseluruhan sebesar 3,280. Hasil ini menunjukkan bahwa tingkat kepuasan mahasiswa Statistika terhadap fasilitas WiFi dan internet di FMIPA Universitas Mataram berada pada kategori cukup baik.

Indikator dengan nilai rata-rata tertinggi adalah **Membantu_Kuliah** sebesar 3,677. Hasil ini menunjukkan bahwa fasilitas internet kampus dinilai cukup membantu mahasiswa dalam menunjang proses pembelajaran dan aktivitas akademik.

Indikator **Akses_Mudah**, **Internet_Jam_Kuliah**, dan **Sesuai_Kebutuhan** juga memiliki nilai rata-rata yang cukup tinggi. Kondisi ini menunjukkan bahwa mahasiswa merasa akses internet kampus cukup mudah digunakan serta mampu mendukung kebutuhan perkuliahan.

Indikator dengan nilai rata-rata paling rendah adalah **Gangguan_Jarang** sebesar 2,613. Hasil ini menunjukkan bahwa mahasiswa masih cukup sering mengalami gangguan jaringan selama menggunakan fasilitas WiFi kampus.

Nilai rata-rata pada sebagian besar indikator berada di atas angka 3. Kondisi ini menunjukkan bahwa persepsi mahasiswa terhadap kualitas layanan internet FMIPA Universitas Mataram cenderung positif meskipun masih terdapat beberapa aspek yang perlu ditingkatkan.

Secara umum, hasil naive estimation menunjukkan bahwa fasilitas WiFi dan internet di FMIPA Universitas Mataram telah memberikan manfaat bagi mahasiswa, terutama dalam mendukung kegiatan akademik dan pembelajaran.

# 8. Weighted Estimation

Weighted estimation digunakan untuk menghitung estimasi kepuasan mahasiswa dengan memberikan bobot pada setiap indikator berdasarkan proporsi total skor masing-masing indikator.

Pada metode ini:
- indikator dengan kontribusi lebih besar akan memiliki bobot lebih tinggi,
- hasil estimasi menjadi lebih proporsional dibanding naive estimation.

Bobot dihitung menggunakan total skor setiap indikator dibanding total seluruh skor indikator.

---

# Tabel Bobot Indikator

| Indikator | Bobot |
|---|---|
| Akses_Mudah | 0.1202 |
| Internet_Cepat | 0.1071 |
| Koneksi_Stabil | 0.1060 |
| Membantu_Kuliah | 0.1246 |
| Internet_Jam_Kuliah | 0.1169 |
| Gangguan_Jarang | 0.0885 |
| Kualitas_Baik | 0.1049 |
| Internet_Luar_Jam | 0.1148 |
| Sesuai_Kebutuhan | 0.1169 |

---

# Tabel Hasil Weighted Estimation

| Indikator | Bobot | Mean Weighted |
|---|---|---|
| Akses_Mudah | 0.1202 | 0.4266 |
| Internet_Cepat | 0.1071 | 0.3386 |
| Koneksi_Stabil | 0.1060 | 0.3317 |
| Membantu_Kuliah | 0.1246 | 0.4582 |
| Internet_Jam_Kuliah | 0.1169 | 0.4036 |
| Gangguan_Jarang | 0.0885 | 0.2313 |
| Kualitas_Baik | 0.1049 | 0.3249 |
| Internet_Luar_Jam | 0.1148 | 0.3887 |
| Sesuai_Kebutuhan | 0.1169 | 0.4036 |

---

# Interpretasi Weighted Estimation

Berdasarkan hasil weighted estimation, indikator **Membantu_Kuliah** memiliki bobot terbesar yaitu 0,1246 dan nilai weighted estimation tertinggi sebesar 0,4582. Hasil ini menunjukkan bahwa mahasiswa menilai fasilitas WiFi dan internet sangat berperan dalam membantu kegiatan perkuliahan dan aktivitas akademik.

Indikator **Akses_Mudah**, **Internet_Jam_Kuliah**, dan **Sesuai_Kebutuhan** juga memiliki nilai weighted estimation yang cukup tinggi. Kondisi ini menunjukkan bahwa mahasiswa merasa akses internet kampus cukup mudah digunakan dan mampu mendukung kebutuhan pembelajaran.

Indikator **Gangguan_Jarang** memiliki bobot paling rendah sebesar 0,0885 dan weighted estimation terendah sebesar 0,2313. Hasil ini menunjukkan bahwa gangguan jaringan masih menjadi salah satu kelemahan utama layanan internet di FMIPA Universitas Mataram.

Perbedaan nilai weighted estimation antar indikator menunjukkan bahwa setiap indikator memiliki kontribusi yang berbeda dalam membentuk tingkat kepuasan mahasiswa secara keseluruhan.

Indikator dengan bobot tinggi menunjukkan bahwa aspek tersebut lebih dominan dalam mempengaruhi kepuasan mahasiswa terhadap fasilitas WiFi dan internet kampus.

Secara umum, hasil weighted estimation menunjukkan bahwa mahasiswa cukup puas terhadap fasilitas WiFi dan internet FMIPA Universitas Mataram, terutama dalam mendukung kegiatan akademik. Meskipun demikian, aspek kestabilan jaringan dan gangguan internet masih perlu ditingkatkan agar kualitas layanan menjadi lebih optimal.

# 9. Perbandingan Naive Estimation dan Weighted Estimation

Analisis perbandingan dilakukan untuk melihat perbedaan hasil estimasi tingkat kepuasan mahasiswa menggunakan dua metode, yaitu:
- Naive Estimation
- Weighted Estimation

## Tabel Perbandingan Naive Estimation dan Weighted Estimation

| Indikator | Naive Estimation | Bobot | Weighted Estimation |
|---|---|---|---|
| Akses_Mudah | 3.548 | 0.1202 | 0.4266 |
| Internet_Cepat | 3.161 | 0.1071 | 0.3386 |
| Koneksi_Stabil | 3.129 | 0.1060 | 0.3317 |
| Membantu_Kuliah | 3.677 | 0.1246 | 0.4582 |
| Internet_Jam_Kuliah | 3.452 | 0.1169 | 0.4036 |
| Gangguan_Jarang | 2.613 | 0.0885 | 0.2313 |
| Kualitas_Baik | 3.097 | 0.1049 | 0.3249 |
| Internet_Luar_Jam | 3.387 | 0.1148 | 0.3887 |
| Sesuai_Kebutuhan | 3.452 | 0.1169 | 0.4036 |

## Penjelasan Metode

### Naive Estimation
Naive estimation merupakan metode estimasi sederhana yang menghitung rata-rata langsung dari setiap indikator tanpa memberikan bobot tertentu.

Pada metode ini:
- seluruh indikator dianggap memiliki kontribusi yang sama,
- tidak ada penyesuaian berdasarkan tingkat pengaruh indikator.

### Weighted Estimation
Weighted estimation merupakan metode estimasi yang menggunakan pembobotan pada setiap indikator berdasarkan proporsi total skor.

Pada metode ini:
- indikator dengan kontribusi lebih besar akan memiliki bobot lebih tinggi,
- hasil estimasi menjadi lebih proporsional.

---

# Interpretasi Grafik

Berdasarkan grafik perbandingan, nilai **Naive Estimation** pada seluruh indikator terlihat lebih tinggi dibandingkan **Weighted Estimation**. Kondisi ini terjadi karena metode weighted estimation melakukan penyesuaian menggunakan bobot masing-masing indikator.

Indikator **Membantu_Kuliah** memiliki nilai naive estimation tertinggi dibanding indikator lainnya. Hasil ini menunjukkan bahwa mahasiswa merasa fasilitas WiFi dan internet sangat membantu dalam proses pembelajaran dan aktivitas akademik.

Indikator **Akses_Mudah**, **Internet_Jam_Kuliah**, dan **Sesuai_Kebutuhan** juga memiliki nilai estimasi yang cukup tinggi. Kondisi ini menunjukkan bahwa mahasiswa merasa akses internet cukup mudah digunakan dan sesuai dengan kebutuhan perkuliahan.

Indikator **Gangguan_Jarang** memiliki nilai estimasi paling rendah baik pada naive estimation maupun weighted estimation. Hasil ini menunjukkan bahwa mahasiswa masih cukup sering mengalami gangguan jaringan internet selama menggunakan fasilitas WiFi kampus.

Perbedaan antara naive estimation dan weighted estimation pada setiap indikator terlihat tidak terlalu besar. Kondisi ini menunjukkan bahwa distribusi bobot antar indikator relatif stabil dan tidak terdapat indikator yang memiliki pengaruh sangat dominan dibanding indikator lainnya.

Weighted estimation menghasilkan nilai yang lebih kecil karena nilai rata-rata indikator dikalikan dengan bobot proporsional masing-masing indikator. Hasil ini memberikan estimasi yang lebih realistis terhadap kontribusi setiap indikator dalam membentuk kepuasan mahasiswa secara keseluruhan.

Secara umum, kedua metode menunjukkan pola yang sama, dimana indikator yang memiliki tingkat kepuasan tinggi tetap berada pada posisi tertinggi, sedangkan indikator dengan tingkat kepuasan rendah tetap berada pada posisi terendah. Hasil ini menunjukkan konsistensi penilaian mahasiswa terhadap kualitas fasilitas WiFi dan internet di FMIPA Universitas Mataram.

# 10. Distribusi Frekuensi Kepuasan Responden

Distribusi frekuensi digunakan untuk mengetahui jumlah responden pada setiap kategori tingkat kepuasan terhadap fasilitas WiFi dan internet di FMIPA Universitas Mataram.

Kategori kepuasan dibagi menjadi:
- Tidak Puas
- Kurang Puas
- Puas
- Sangat Puas

## Tabel Distribusi Frekuensi Responden

| Kategori | Frekuensi | Persentase (%) |
|---|---|---|
| Tidak Puas | 2 | 6,45 |
| Kurang Puas | 15 | 48,39 |
| Puas | 14 | 45,16 |
| Sangat Puas | 0 | 0,00 |

---

# Grafik Distribusi Frekuensi Responden

Grafik distribusi frekuensi menunjukkan jumlah mahasiswa pada setiap kategori kepuasan.

## Interpretasi Distribusi Frekuensi

Berdasarkan tabel distribusi frekuensi, sebagian besar mahasiswa berada pada kategori **Kurang Puas** dengan jumlah 15 responden atau sebesar 48,39%.

Kategori **Puas** berada pada posisi kedua dengan jumlah 14 responden atau sebesar 45,16%. Hasil ini menunjukkan bahwa meskipun sebagian mahasiswa merasa cukup puas terhadap fasilitas WiFi dan internet, masih terdapat banyak mahasiswa yang merasa layanan internet belum optimal.

Kategori **Tidak Puas** terdiri dari 2 responden atau sebesar 6,45%. Hasil ini menunjukkan masih terdapat mahasiswa yang merasa kualitas layanan internet kurang memadai untuk mendukung aktivitas akademik.

Kategori **Sangat Puas** tidak memiliki responden sama sekali. Kondisi ini menunjukkan bahwa belum terdapat mahasiswa yang merasa sangat puas terhadap fasilitas WiFi dan internet di FMIPA Universitas Mataram.

Secara keseluruhan, distribusi frekuensi menunjukkan bahwa tingkat kepuasan mahasiswa masih berada pada kategori sedang dan belum mencapai tingkat kepuasan maksimal. Hasil ini menunjukkan bahwa kualitas layanan internet FMIPA Universitas Mataram masih memerlukan peningkatan, terutama pada aspek kestabilan jaringan dan gangguan internet.

---

# 11. Histogram Total Skor Responden

Histogram digunakan untuk melihat pola persebaran total skor kepuasan mahasiswa terhadap fasilitas WiFi dan internet di FMIPA Universitas Mataram.

Histogram menampilkan:
- sebaran total skor responden,
- frekuensi kemunculan skor,
- pola distribusi kepuasan mahasiswa.

## Interpretasi Histogram

Berdasarkan histogram total skor responden, sebagian besar mahasiswa memiliki skor kepuasan pada kategori menengah hingga tinggi. Kondisi ini menunjukkan bahwa mayoritas mahasiswa memberikan penilaian cukup baik terhadap fasilitas WiFi dan internet kampus.

Sebaran skor terlihat terkonsentrasi pada rentang skor kategori **Kurang Puas** dan **Puas**. Hasil ini sejalan dengan distribusi frekuensi sebelumnya yang menunjukkan dominasi responden pada kedua kategori tersebut.

Tidak terdapat konsentrasi skor yang sangat tinggi pada kategori **Sangat Puas**. Kondisi ini menunjukkan bahwa kualitas layanan internet FMIPA Universitas Mataram masih belum sepenuhnya memenuhi harapan mahasiswa.

Histogram juga menunjukkan adanya variasi jawaban antar responden. Sebagian mahasiswa merasa cukup puas terhadap layanan internet, sedangkan sebagian lainnya masih mengalami kendala terutama pada kestabilan jaringan dan gangguan internet.

Secara umum, histogram menunjukkan bahwa tingkat kepuasan mahasiswa terhadap fasilitas WiFi dan internet FMIPA Universitas Mataram berada pada tingkat sedang dan masih memerlukan peningkatan kualitas layanan.

# 12. Perhitungan Ukuran Sampel Menggunakan Rumus Slovin

Rumus Slovin digunakan untuk menentukan jumlah sampel minimum yang diperlukan dalam penelitian berdasarkan jumlah populasi dan tingkat kesalahan (margin of error).

Pada penelitian ini:
- Jumlah populasi (\(N\)) = 52 mahasiswa
- Margin of error (\(e\)) = 12% atau 0,12

Rumus Slovin yang digunakan:

:contentReference[oaicite:0]{index=0}

Keterangan:
- \(n\) = jumlah sampel
- \(N\) = jumlah populasi
- \(e\) = margin of error

---

# Substitusi Perhitungan Slovin

Perhitungan jumlah sampel dilakukan sebagai berikut:

:contentReference[oaicite:1]{index=1}

Hasil perhitungan:

\[
n = 29.73
\]

Hasil tersebut kemudian dibulatkan menjadi:

\[
n = 30
\]

---

# Tabel Hasil Perhitungan Slovin

| Populasi | Margin Error | Sampel Slovin | Sampel Dibutuhkan | Sampel Penelitian |
|---|---|---|---|---|
| 52 | 0,12 | 29,73 | 30 | 31 |

---

# Interpretasi Perhitungan Slovin

Berdasarkan hasil perhitungan menggunakan rumus Slovin, jumlah sampel minimum yang dibutuhkan dalam penelitian adalah sebanyak 30 responden.

Penelitian ini menggunakan 31 responden dari total populasi 52 mahasiswa. Jumlah tersebut lebih besar dibanding jumlah sampel minimum hasil perhitungan Slovin.

Hasil ini menunjukkan bahwa jumlah sampel penelitian telah memenuhi syarat minimum pengambilan sampel berdasarkan rumus Slovin dengan margin of error sebesar 12%.

Penggunaan 31 responden dinilai sudah cukup representatif untuk menggambarkan tingkat kepuasan mahasiswa Statistika terhadap fasilitas WiFi dan internet di FMIPA Universitas Mataram.

Semakin besar jumlah sampel yang digunakan dibanding batas minimum Slovin, maka semakin baik kemampuan sampel dalam merepresentasikan kondisi populasi penelitian.

Secara umum, hasil perhitungan Slovin menunjukkan bahwa data penelitian layak digunakan untuk analisis statistik lebih lanjut karena jumlah sampel telah memenuhi ketentuan ukuran sampel minimum penelitian.

# Output yang Dihasilkan

Project ini menghasilkan:
- Statistik deskriptif
- Tabel validitas
- Tabel reliabilitas
- Diagram batang indikator
- Grafik Likert
- Tabel naive estimation
- Tabel weighted estimation
- Tabel distribusi frekuensi
- Histogram responden
- Hasil Slovin
- Persentase error penelitian

