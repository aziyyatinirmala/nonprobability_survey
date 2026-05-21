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

# 3. Statistik Deskriptif

Statistik deskriptif dilakukan menggunakan:

```r
summary(wifi)
describe(wifi)
```

Analisis ini menghasilkan:
- nilai minimum,
- maksimum,
- mean,
- median,
- standar deviasi.

Interpretasi:
- Mean yang tinggi menunjukkan tingkat kepuasan mahasiswa yang tinggi.
- Standar deviasi menunjukkan tingkat keragaman jawaban responden.

---

# 4. Rata-rata Tiap Indikator

Rata-rata dihitung menggunakan:

```r
colMeans(wifi)
```

Hasil rata-rata digunakan untuk mengetahui indikator mana yang memperoleh penilaian tertinggi dan terendah dari mahasiswa.

Visualisasi dilakukan menggunakan diagram batang agar lebih mudah dibandingkan antar indikator.

Interpretasi:
- Indikator dengan mean tertinggi menunjukkan aspek layanan internet yang paling memuaskan.
- Indikator dengan mean rendah menunjukkan aspek yang perlu diperbaiki.

---

# 5. Uji Validitas

Uji validitas dilakukan menggunakan korelasi item-total.

```r
cor(
  wifi[, i],
  rowSums(wifi[, -i])
)
```

Kriteria:
- r hitung > 0,30 → item valid
- r hitung ≤ 0,30 → item tidak valid

Interpretasi:
- Item valid berarti pertanyaan mampu mengukur kepuasan mahasiswa dengan baik.
- Semakin tinggi nilai korelasi, semakin baik kualitas item pertanyaan.

---
# 6. Hasil Uji Reliabilitas

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

