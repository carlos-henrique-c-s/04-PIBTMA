#===============================================================================
# (1) PREPARACAO DO AMBIENTE
#===============================================================================

rm(list = ls())

aviso = getOption('warn')
options(warn = -1)
options(encoding = 'latin1')
options(warn = aviso)
rm(aviso)

aviso = getOption('warn')
options(warn = -1)
options(scipen = 999)
options(warn = aviso)
rm(aviso)

#===============================================================================
# (2) PREPARACAO DOS PACOTES
#===============================================================================

install.packages("tidyverse")
install.packages("openxlsx")
install.packages("tempdisagg")
install.packages("lubridate")
install.packages("ggplot2")
install.packages("seasonal")

library("tidyverse")
library("openxlsx")
library("tempdisagg")
library("lubridate")
library("seasonal")

#===============================================================================
# (3) PREPARACAO DAS BASES DE DADOS
#===============================================================================

### Carregamento da base de indices da estimativa do PIB trimestral do Maranhao

trimestre = read.xlsx(xlsxFile = "C:/Users/chenr/OneDrive/IMESC/ESTIMATIVA DO PB/1. TRIMESTRAL/4. Execução/PIB TRI MA/BENCHMARK.xlsx",
                      sheet = "TRIMESTRE") %>% 
  round(digits = 2)

trimestre = trimestre[1:48, ]

# Criacao de vetores para cada atividade a ser ajustada - PIB trimestral

agro_tri = ts(trimestre[, 1], start = 2010, frequency = 4)
ind_tri_01 = ts(trimestre[, 2], start = 2010, frequency = 4)
ind_tri_02 = ts(trimestre[, 3], start = 2010, frequency = 4)
ind_tri_03 = ts(trimestre[, 4], start = 2010, frequency = 4)
ind_tri_04 = ts(trimestre[, 5], start = 2010, frequency = 4)
ind_tri = ts(trimestre[, 6], start = 2010, frequency = 4)
serv_tri_01 = ts(trimestre[, 7], start = 2010, frequency = 4)
serv_tri_02 = ts(trimestre[, 8], start = 2010, frequency = 4)
serv_tri_03 = ts(trimestre[, 9], start = 2010, frequency = 4)
serv_tri_04 = ts(trimestre[, 10], start = 2010, frequency = 4)
serv_tri_05 = ts(trimestre[, 11], start = 2010, frequency = 4)
serv_tri_06 = ts(trimestre[, 12], start = 2010, frequency = 4)
serv_tri_07 = ts(trimestre[, 13], start = 2010, frequency = 4)
serv_tri = ts(trimestre[, 14], start = 2010, frequency = 4)
vab_tri = ts(trimestre[, 15], start = 2010, frequency = 4)
imp_tri = ts(trimestre[, 16], start = 2010, frequency = 4)
PIB_tri = ts(trimestre[, 17], start = 2010, frequency = 4)

# Carregamento da base de indices do SCR do Maranhao

ano = read.xlsx(xlsxFile = "C:/Users/chenr/OneDrive/IMESC/ESTIMATIVA DO PB/1. TRIMESTRAL/4. Execução/PIB TRI MA/BENCHMARK.xlsx",
                sheet = "ANO") %>% 
  round(digits = 2)

ano = ano * 4

# Criacao de vetores para cada atividade de ajuste - PIB anual

agro_ano = ts(ano[, 1], start = 2010, frequency = 1)
ind_ano_01 = ts(ano[, 2], start = 2010, frequency = 1)
ind_ano_02 = ts(ano[, 3], start = 2010, frequency = 1)
ind_ano_03 = ts(ano[, 4], start = 2010, frequency = 1)
ind_ano_04 = ts(ano[, 5], start = 2010, frequency = 1)
ind_ano = ts(ano[, 6], start = 2010, frequency = 1)
serv_ano_01 = ts(ano[, 7], start = 2010, frequency = 1)
serv_ano_02 = ts(ano[, 8], start = 2010, frequency = 1)
serv_ano_03 = ts(ano[, 9], start = 2010, frequency = 1)
serv_ano_04 = ts(ano[, 10], start = 2010, frequency = 1)
serv_ano_05 = ts(ano[, 11], start = 2010, frequency = 1)
serv_ano_06 = ts(ano[, 12], start = 2010, frequency = 1)
serv_ano_07 = ts(ano[, 13], start = 2010, frequency = 1)
serv_ano = ts(ano[, 14], start = 2010, frequency = 1)
vab_ano = ts(ano[, 15], start = 2010, frequency = 1)
imp_ano = ts(ano[, 16], start = 2010, frequency = 1)
PIB_ano = ts(ano[, 17], start = 2010, frequency = 1)

#===============================================================================
# (4) APLICACAO DO MODELO - BENCHMARK - METODO DENTON
#===============================================================================

# Aplicacao do metodo Denton

agro_tri = td(agro_ano ~ 0 + agro_tri, method = "denton-cholette")
ind_tri_01 = td(ind_ano_01 ~ 0 + ind_tri_01, method = "denton-cholette")
ind_tri_02 = td(ind_ano_02 ~ 0 + ind_tri_02, method = "denton-cholette")
ind_tri_03 = td(ind_ano_03 ~ 0 + ind_tri_03, method = "denton-cholette")
ind_tri_04 = td(ind_ano_04 ~ 0 + ind_tri_04, method = "denton-cholette")
ind_tri = td(ind_ano ~ 0 + ind_tri, method = "denton-cholette")
serv_tri_01 = td(serv_ano_01 ~ 0 + serv_tri_01, method = "denton-cholette")
serv_tri_02 = td(serv_ano_02 ~ 0 + serv_tri_02, method = "denton-cholette")
serv_tri_03 = td(serv_ano_03 ~ 0 + serv_tri_03, method = "denton-cholette")
serv_tri_04 = td(serv_ano_04 ~ 0 + serv_tri_04, method = "denton-cholette")
serv_tri_05 = td(serv_ano_05 ~ 0 + serv_tri_05, method = "denton-cholette")
serv_tri_06 = td(serv_ano_06 ~ 0 + serv_tri_06, method = "denton-cholette")
serv_tri_07 = td(serv_ano_07 ~ 0 + serv_tri_07, method = "denton-cholette")
serv_tri = td(serv_ano ~ 0 + serv_tri, method = "denton-cholette")
vab_tri = td(vab_ano ~ 0 + vab_tri, method = "denton-cholette")
imp_tri = td(imp_ano ~ 0 + imp_tri, method = "denton-cholette")
PIB_tri = td(PIB_ano ~ 0 + PIB_tri, method = "denton-cholette")

# Geracao das previsoes

agro_tri = data.frame(predict(agro_tri))
ind_tri_01 = data.frame(predict(ind_tri_01))
ind_tri_02 = data.frame(predict(ind_tri_02))
ind_tri_03 = data.frame(predict(ind_tri_03))
ind_tri_04 = data.frame(predict(ind_tri_04))
ind_tri = data.frame(predict(ind_tri))
serv_tri_01 = data.frame(predict(serv_tri_01))
serv_tri_02 = data.frame(predict(serv_tri_02))
serv_tri_03 = data.frame(predict(serv_tri_03))
serv_tri_04 = data.frame(predict(serv_tri_04))
serv_tri_05 = data.frame(predict(serv_tri_05))
serv_tri_06 = data.frame(predict(serv_tri_06))
serv_tri_07 = data.frame(predict(serv_tri_07))
serv_tri = data.frame(predict(serv_tri))
vab_tri = data.frame(predict(vab_tri))
imp_tri = data.frame(predict(imp_tri))
PIB_tri = data.frame(predict(PIB_tri))

# Geracao dos resultados

Data = seq.Date(from = as_date("2010-01-01"),
                  to = as_date("2021-12-31"),
                  by = "3 month")

trimestre = data.frame("Ano" = year(Data),
                       "Trimestre" = quarter(Data),
                       "Agropecuária" = round(agro_tri$predict.agro_tri., digits = 2),
                       "059" = round(ind_tri_01$predict.ind_tri_01., digits = 2),
                       "109" = round(ind_tri_02$predict.ind_tri_02., digits = 2),
                       "359" = round(ind_tri_03$predict.ind_tri_03., digits = 2),
                       "419" = round(ind_tri_04$predict.ind_tri_04., digits = 2),
                       "Indústria" = round(ind_tri$predict.ind_tri., digits = 2),
                       "459" = round(serv_tri_01$predict.serv_tri_01., digits = 2),
                       "499" = round(serv_tri_02$predict.serv_tri_02., digits = 2),
                       "589" = round(serv_tri_03$predict.serv_tri_03., digits = 2),
                       "649" = round(serv_tri_04$predict.serv_tri_04., digits = 2),
                       "680" = round(serv_tri_05$predict.serv_tri_05., digits = 2),
                       "849" = round(serv_tri_06$predict.serv_tri_06., digits = 2),
                       "003" = round(serv_tri_07$predict.serv_tri_07., digits = 2),
                       "Serviços" = round(serv_tri$predict.serv_tri., digits = 2),
                       "VAB" = round(vab_tri$predict.vab_tri., digits = 2),
                       "IMPOSTOS" = round(imp_tri$predict.imp_tri., digits = 2),
                       "PIB" = round(PIB_tri$predict.PIB_tri., digits = 2))

openxlsx::write.xlsx(x = trimestre,
                     "Método Denton.xlsx")


#===============================================================================
# (5) GERACAO DE RESULTADOS - BENCH
#===============================================================================

dados = read.xlsx(xlsxFile = "C:/Users/chenr/OneDrive/IMESC/ESTIMATIVA DO PB/1. TRIMESTRAL/4. Execução/Resultados.xlsx") %>%
  mutate(VALOR = round(as.numeric(VALOR), digits = 2))

# Graficos de linha

dados %>% 
  filter(ANO > 2014 & ATIVIDADE == "Serviços" & (VARIAVEL == "Índice encadeado" | VARIAVEL == "Índice encadeado dessazonalizado")) %>%
  ggplot2::ggplot(aes(PERIODO, VALOR, group = 1))+
  geom_line(aes(colour = VARIAVEL),
            size=1.5,
            show.legend = F)+
  facet_wrap(vars(VARIAVEL),
             nrow = 2)+
  theme_replace()+
  theme(axis.text.x = element_text(angle = 90, size = 15),
        axis.text.y = element_text(size = 15),
        strip.text = element_text(face = "bold", size = 18))+
  labs(x = " ",
       y = " ")

# Graficos de barra

dados %>% 
  filter(ANO > 2019 & ATIVIDADE == "Serviços" & (VARIAVEL == "Variação trimestral" | VARIAVEL == "Variação interanual" | VARIAVEL == "Variação na margem" | VARIAVEL == "Variação anual")) %>%
  ggplot2::ggplot(aes(PERIODO, VALOR))+
  geom_bar(aes(fill = VARIAVEL),
            size=1.5,
            show.legend = F,
           position = "dodge",
           stat = "identity")+
  facet_wrap(vars(VARIAVEL),
             nrow = 2)+
  theme_replace()+
  theme(axis.text.x = element_text(angle = 90, size = 15),
        axis.text.y = element_text(size = 15),
        strip.text = element_text(face = "bold", size = 18))+
  labs(x = " ",
       y = " ")

# Salvamento de grafico

ggsave(filename = "SERV2.png",
       width = 13,
       height = 9,
       units = "in",
       dpi = 800)


#===============================================================================
# (6) APLICACAO DO AJUSTE SAZONAL
#===============================================================================

# Instalacao do pacote seasonal



# Crregar o pacote seasonal



# Chegcagem do pacote seasonal



# Transformacao para uma serie temporal



# Analise grafica



#===============================================================================
# (7) GERACAO DE RESULTADOS - SEAS
#===============================================================================












