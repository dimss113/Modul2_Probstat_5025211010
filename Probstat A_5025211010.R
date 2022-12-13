library("Rlab")
library(ggplot2)
library(dplyr)

# soal nomor 1a (menentukan standar deviasi dari data selisih pasangan pengamatan tabel)
## diketahui n = 9, 
n <- 20
df.data <- data.frame(x = c(78, 75, 67, 77, 70, 72, 78, 74, 77), 
                      y = c(100, 95, 70, 90, 90, 90, 89, 90, 100))

mean.x <- with(df.data, mean(x))
mean.y <- with(df.data, mean(y, na.rm = T))

mean.data <- c(mean.x, mean.y)

df.data2 <- rbind(df.data, mean.data)

row.names(df.data2)[dim(df.data2)[1]] <- "means"

#standar deviation
sd.x <- with(df.data, sd(x, na.rm = T))
sd.y <- with(df.data, sd(y, na.rm = T))
print(paste("standar deviasi sebelum: ", as.character(sd.x)))
print(paste("standar deviasi sebelum: ", as.character(sd.y)))

# menyimpan nilai dari standar deviasi sebelum dan sesudah.
sd.data <- c(sd.x, sd.y)

# input sd.data pada dataframe data2 dengan nama barisnya 'standar deviasi'
df.data2 <- rbind(df.data2, sd.data)
row.names(df.data2)[dim(df.data2)[1]] <- "Standard deviation"
df.data2

#

print("Menentukan standar deviation dari data sesudah dan sebelum")

sdeviation <- sd.y-sd.x
sdeviation


# soal nomor 1b carilah nilai t (p-value)
## dalam menentukan t(p-value) kita bisa menggunakan function yang disediakan yaitu t.test
x = c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y = c(100, 95, 70, 90, 90, 90, 89, 90, 100)
t.test(x, y, alternative = "greater", var.equal =  FALSE)


# soal nomor 1c apakah terdapat pengaruh yang signifikan secara statistik
## diketahui siginifikan value = 0,05, 
## H0 = tidak ada pengaruh signifikan dalam hal kadar saturasi oksigen
## H1 = ada pengaruh signifikan

## perbandingan x dan y
var.test(x, y)

## menentukan apakah ho diterima atau ditolak, 
t.test(x, y, var.equal = TRUE)


