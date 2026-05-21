# ================================
# 1. MEMANGGIL PACKAGE
# ================================

library(readxl)
library(dplyr)
library(psych)
library(ggplot2)
library(likert)
library(corrplot)

# ================================
# 2. MEMBACA DATA
# ================================

wifi <- read_excel("C:/Users/Asus/Documents/FILE SEMESTER 5/Data Responden Excel.xlsx")

# ================================
# 3. MENGUBAH NAMA VARIABEL
# ================================

colnames(wifi) <- c(
  "Akses_Mudah",
  "Internet_Cepat",
  "Koneksi_Stabil",
  "Membantu_Kuliah",
  "Internet_Jam_Kuliah",
  "Gangguan_Jarang",
  "Kualitas_Baik",
  "Internet_Luar_Jam",
  "Sesuai_Kebutuhan"
)

# Mengubah data menjadi numerik
wifi[] <- lapply(wifi, as.numeric)

# ================================
# 4. STATISTIK DESKRIPTIF
# ================================

summary(wifi)

describe(wifi)

# ================================
# 5. RATA-RATA TIAP INDIKATOR
# ================================

rata_rata <- colMeans(wifi)

rata_df <- data.frame(
  Indikator = names(rata_rata),
  Mean = rata_rata
)

rata_df

# ================================
# 6. DIAGRAM BATANG
# ================================

ggplot(rata_df,
       aes(x = reorder(Indikator, Mean),
           y = Mean)) +
  
  geom_bar(stat = "identity") +
  coord_flip() +
  
  labs(
    title = "Rata-rata Penilaian Mahasiswa terhadap WiFi FMIPA",
    x = "Indikator",
    y = "Rata-rata"
  )

# ================================
# 7. UJI VALIDITAS
# ================================

validitas <- data.frame(
  Item = names(wifi),
  
  r_hitung = sapply(1:ncol(wifi), function(i) {
    
    cor(
      wifi[, i],
      rowSums(wifi[, -i])
    )
    
  })
)

validitas

# Keputusan validitas
validitas$Keputusan <- ifelse(
  validitas$r_hitung > 0.30,
  "Valid",
  "Tidak Valid"
)

validitas

# ================================
# 8. UJI RELIABILITAS
# ================================

alpha(wifi)

# ================================
# 9. KORELASI ANTAR ITEM
# ================================

korelasi <- cor(wifi)

corrplot(
  korelasi,
  method = "color",
  type = "upper",
  tl.col = "black",
  tl.srt = 45
)

# ================================
# 10. VISUALISASI LIKERT
# ================================

wifi_likert <- data.frame(
  lapply(
    wifi,
    factor,
    levels = 1:5,
    labels = c("STS", "TS", "N", "S", "SS")
  )
)

likert_obj <- likert(wifi_likert)

plot(likert_obj)

# ================================
# 11. KATEGORI KEPUASAN
# ================================

wifi$Total_Skor <- rowSums(wifi)

wifi$Kategori <- cut(
  wifi$Total_Skor,
  breaks = c(0, 20, 30, 40, 50),
  labels = c(
    "Tidak Puas",
    "Kurang Puas",
    "Puas",
    "Sangat Puas"
  )
)

table(wifi$Kategori)

# Diagram kategori
ggplot(wifi, aes(x = Kategori)) +
  
  geom_bar() +
  
  labs(
    title = "Kategori Kepuasan Mahasiswa",
    x = "Kategori",
    y = "Jumlah Mahasiswa"
  )

# ================================
# 12. MENYIMPAN HASIL
# ================================

write.csv(
  wifi,
  "hasil_pengolahan_wifi.csv",
  row.names = FALSE
)

# ================================
# 13. INFORMASI POPULASI DAN SAMPEL
# ================================

N <- 52   # Populasi
n <- 31   # Sampel

# ================================
# 14. NAIVE ESTIMATION
# ================================

naive_estimation <- data.frame(
  
  Indikator = names(wifi[,1:9]),
  
  Mean_Naive = colMeans(wifi[,1:9])
)

naive_estimation

# Rata-rata keseluruhan naive
mean_naive_total <- mean(
  naive_estimation$Mean_Naive
)

mean_naive_total

# ================================
# 15. WEIGHT ESTIMATION
# ================================

# Menghitung total skor tiap indikator
total_indikator <- colSums(wifi[,1:9])

# Menghitung bobot
bobot <- total_indikator /
  sum(total_indikator)

bobot

# Weighted estimation
weighted_estimation <- data.frame(
  
  Indikator = names(wifi[,1:9]),
  
  Bobot = bobot,
  
  Mean_Weighted =
    colMeans(wifi[,1:9]) * bobot
)

weighted_estimation

# Rata-rata weighted total
mean_weight_total <- sum(
  weighted_estimation$Mean_Weighted
)

mean_weight_total

# ================================
# 16. TABEL PERBANDINGAN
# ================================

perbandingan <- data.frame(
  
  Indikator = names(wifi[,1:9]),
  
  Naive_Estimation =
    naive_estimation$Mean_Naive,
  
  Bobot =
    round(bobot, 4),
  
  Weighted_Estimation =
    round(weighted_estimation$Mean_Weighted, 4)
)

perbandingan

# ================================
# 17. VISUALISASI PERBANDINGAN
# ================================

library(tidyr)

perbandingan_long <- perbandingan %>%
  
  pivot_longer(
    
    cols = c(
      Naive_Estimation,
      Weighted_Estimation
    ),
    
    names_to = "Metode",
    
    values_to = "Nilai"
  )

ggplot(
  perbandingan_long,
  
  aes(
    x = Indikator,
    y = Nilai,
    fill = Metode
  )
) +
  
  geom_bar(
    stat = "identity",
    position = "dodge"
  ) +
  
  coord_flip() +
  
  labs(
    title = "Perbandingan Naive dan Weighted Estimation",
    x = "Indikator",
    y = "Nilai Estimasi"
  )

# ================================
# 18. DISTRIBUSI FREKUENSI RESPONDEN
# ================================

distribusi <- table(wifi$Kategori)

distribusi

# Mengubah ke data frame
distribusi_df <- as.data.frame(distribusi)

colnames(distribusi_df) <- c(
  "Kategori",
  "Frekuensi"
)

distribusi_df

# Menambahkan persentase
distribusi_df$Persentase <- round(
  
  distribusi_df$Frekuensi / sum(distribusi_df$Frekuensi) * 100,
  
  2
)

distribusi_df

# ================================
# 19. GRAFIK DISTRIBUSI RESPONDEN
# ================================

ggplot(
  distribusi_df,
  
  aes(
    x = Kategori,
    y = Frekuensi
  )
) +
  
  geom_bar(
    stat = "identity"
  ) +
  
  labs(
    title = "Distribusi Frekuensi Kepuasan Responden",
    x = "Kategori Kepuasan",
    y = "Frekuensi"
  )

# ================================
# 20. HISTOGRAM TOTAL SKOR
# ================================

ggplot(
  wifi,
  
  aes(x = Total_Skor)
) +
  
  geom_histogram(
    binwidth = 2
  ) +
  
  labs(
    title = "Histogram Total Skor Responden",
    x = "Total Skor",
    y = "Frekuensi"
  )

# ================================
# 21. PERHITUNGAN SLOVIN
# ================================

# Jumlah populasi
N <- 52

# Margin of error 12%
e <- 0.12

# Rumus Slovin
# n = N / (1 + N(e)^2)

n_slovin <- N / (1 + N * (e^2))

n_slovin

# Pembulatan sampel
n_slovin_bulat <- round(n_slovin)

n_slovin_bulat

# ================================
# 22. TABEL HASIL SLOVIN
# ================================

slovin_df <- data.frame(
  
  Populasi = N,
  
  Margin_Error = e,
  
  Sampel_Slovin = round(n_slovin, 2),
  
  Sampel_Dibutuhkan = n_slovin_bulat,
  
  Sampel_Penelitian = n
)

slovin_df