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
-kita bisa simpan data kita pada dataframe terlebih dahulu

```r
df.data <- data.frame(x = c(78, 75, 67, 77, 70, 72, 78, 74, 77), 
                      y = c(100, 95, 70, 90, 90, 90, 89, 90, 100))
```

-kemudian kita bisa menentukan mean dari masing-masing kondisi A dan B

```r
mean.x <- with(df.data, mean(x))
mean.y <- with(df.data, mean(y, na.rm = T))
```

-kemudian dataframe data tadi bisa kita gabungkan dengan mean dalam satu tabel dengan fungsi rbind (Fungsi rbind() merepresentasikan fungsi pengikat baris untuk vektor, bingkai data, dan matriks untuk diatur sebagai baris. Ini digunakan untuk menggabungkan beberapa bingkai data untuk manipulasi data.)

```r
df.data2 <- rbind(df.data, mean.data
row.names(df.data2)[dim(df.data2)[1]] <- "means"
```

-selanjutnya adalah menentukan standar deviasi A dan B

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

-inputkan standar deviasi dalam dataframe 2 

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

-hasil selisih dari standar deviasi sesudah dan sebelum adalah
```r
sdeviation <- sd.y-sd.x
sdeviation
```

output:
```
4.967529
```



