# Diretório aonde os arquivos foram extraídos do zip do TSE
diretorio <- "C:/Pasta"

# Lista todos os arquivos CSV
arquivos <- list.files(
  path = diretorio,
  pattern = "\\.csv$",
  full.names = TRUE
)

# Lê e consolida os arquivos em um único dataframe
df <- do.call(rbind, lapply(arquivos, read.csv, 
                            stringsAsFactors = FALSE,
                            sep = ";",
                            fileEncoding = "Latin1"))

# Conferindo os dados
resultado <- aggregate(QT_VOTOS_TOT ~ NM_CANDIDATO, data = df, FUN = sum)
print(resultado)

# Carrega a lib
library(benford.analysis)
# Roda a análise
bfd.tse <- benford(df$QT_VOTOS_TOT)

# Gráfico
plot(bfd.tse)
