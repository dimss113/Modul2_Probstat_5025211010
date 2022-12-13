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



