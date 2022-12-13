# Praktikum Probabilitas Statistik Modul 2
**<br>Dimas Fadilah Akbar_5025211010**
**<br>Kelas Probstat A**

## Requirement
- R for windows
- RStudio

## Instalasi Library 
- library Rlab
- library dplyr
- library ggplot
> pada praktikum ini akan menggunakan fungsi-fungsi yang tersedia pada library Rlab, dplyr, dan ggplot. Untuk itu perlu melakukan instalasi dengan mengetikkan code berikut pada console di RStudio
```r
install.packages("Rlab")
install.packages("dplyr")
install.packages("ggplot2")
```

## Soal Nomor 1

### a) Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas!
dalam menyelesaikan persoalan ini kita bisa menghitung standar deviasi dari masing-masing perlakukan yaitu sebelum dan sesudah.
- kita bisa simpan data kita pada dataframe terlebih dahulu

```r
df.data <- data.frame(x = c(78, 75, 67, 77, 70, 72, 78, 74, 77), 
                      y = c(100, 95, 70, 90, 90, 90, 89, 90, 100))
```

- kemudian kita bisa menentukan mean dari masing-masing kondisi A dan B

```r
mean.x <- with(df.data, mean(x))
mean.y <- with(df.data, mean(y, na.rm = T))
```

- kemudian dataframe data tadi bisa kita gabungkan dengan mean dalam satu tabel dengan fungsi rbind (Fungsi rbind() merepresentasikan fungsi pengikat baris untuk vektor, bingkai data, dan matriks untuk diatur sebagai baris. Ini digunakan untuk menggabungkan beberapa bingkai data untuk manipulasi data.)

```r
df.data2 <- rbind(df.data, mean.data
row.names(df.data2)[dim(df.data2)[1]] <- "means"
```

- selanjutnya adalah menentukan standar deviasi A dan B

```r
sd.x <- with(df.data, sd(x, na.rm = T))
sd.y <- with(df.data, sd(y, na.rm = T))
print(paste("standar deviasi sebelum: ", as.character(sd.x)))
print(paste("standar deviasi sebelum: ", as.character(sd.y)))
```

output:

```
"standar deviasi sebelum:  3.86580450158107"
"standar deviasi sebelum:  8.83333333333333"
```

- inputkan standar deviasi dalam dataframe 2 

```r
df.data2 <- rbind(df.data2, sd.data)
row.names(df.data2)[dim(df.data2)[1]] <- "Standard deviation"
df.data2
```

output:

```r
                           x          y
1                  78.000000 100.000000
2                  75.000000  95.000000
3                  67.000000  70.000000
4                  77.000000  90.000000
5                  70.000000  90.000000
6                  72.000000  90.000000
7                  78.000000  89.000000
8                  74.000000  90.000000
9                  77.000000 100.000000
means              74.222222  90.444444
Standard deviation  3.865805   8.833333
```

- hasil selisih dari standar deviasi sesudah dan sebelum adalah
```r
sdeviation <- sd.y-sd.x
sdeviation
```

output:
```
4.967529
```

### b) Carilah nilai t (p-value)
- dalam menentukan nilai t(p-value) kita bisa menggunakan function t.test dengan parameter (x, y, alternative, var.equal)

```r
x = c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y = c(100, 95, 70, 90, 90, 90, 89, 90, 100)
t.test(x, y, alternative = "greater", var.equal =  FALSE)
```

output:

```r
	Welch Two Sample t-test

data:  x and y
t = -5.0473, df = 10.956, p-value = 0.9998
alternative hypothesis: true difference in means is greater than 0
95 percent confidence interval:
 -21.99644       Inf
sample estimates:
mean of x mean of y 
 74.22222  90.44444 
```
### c) tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

- dalam menentukan apakah H0 dan H1 diterima kita bisa menentukann p value. apabila p value < signifikan value maka tolak H0 dan sebaliknya terima H1.

```r
## perbandingan x dan y
var.test(x, y)

## menentukan apakah ho diterima atau ditolak, 
t.test(x, y, var.equal = TRUE)
```

output:
```r
	F test to compare two variances

data:  x and y
F = 0.19153, num df = 8, denom df = 8, p-value = 0.03101
alternative hypothesis: true ratio of variances is not equal to 1
95 percent confidence interval:
 0.04320235 0.84909000
sample estimates:
ratio of variances 
         0.1915272 

	Two Sample t-test

data:  x and y
t = -5.0473, df = 16, p-value = 0.000119
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -23.035747  -9.408698
sample estimates:
mean of x mean of y 
 74.22222  90.44444 
```

> dapat disimpulkan bahwa p value kurang dari signifikan value sehingga H0 ditolak

## Soal Nomor 2
> Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan library seperti referensi pada modul). 

### a) Apakah Anda setuju dengan klaim tersebut?

```
Setuju
```

### b) Jelaskan maksud dari output yang dihasilkan! 
> diketahui bahwa xbar = 23500, rata-rata populasi = 20000, sd = 3900 dan n = 100
- untuk null hipotesisnya adalah

```
H0: μ <= 20000
```

- untuk alternatif hipotesisnya adalah]

```
H1:  μ > 20000
```

### c)  Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
- menentukan p-value dan z-score

```r
## menentukan p-value dan juga z-score
xbar = 23500
miu0 = 20000
sd = 3900
n = 100
z <- (xbar-miu0)/(sd/sqrt(n));
p_value = pnorm(z)
print(paste("p-value: ", as.character(p_value)))

significant_val = .05
z.alpha = qnorm(significant_val)
print(paste("z-score: ", as.character(-z.alpha)))
```

output:

```r
"p-value:  1"
"z-score:  1.64485362695147"
```

> kesimpulan: statistik uji-z menurut informasi yang kami miliki dari pernyataan tersebut. kami menggunakan statistik-z karena kami mengetahui rata-rata μ dan standar deviasi σ, juga kami mengetahui bahwa ukuran sampel ≥30. Kemudian, kami menghitung nilai kritis kiri. Sekarang, kita dapat menyimpulkan bahwa uji statistik 8.974359 lebih dari nilai kritis -1.959964. Konsekuensinya, pada tingkat signifikansi 0,05, kita menerima klaim yang berarti sebuah mobil berjarak di atas 20.000 km/tahun.

> 
Nilai P mendekati 1 menunjukkan tidak ada perbedaan antara kelompok selain karena kebetulan.

