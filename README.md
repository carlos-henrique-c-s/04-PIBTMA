# PRODUTO INTERNO BRUTO TRIMESTRAL DO MARANHÃO (PIBTMA)

## EXECUÇÃO DO BENCHMARKING

1. Os métodos de benchmarking nas contas nacionais são utilizados para derivar séries trimestrais que sejam consistentes com seus benchmarks anuais correspondentes e, ao mesmo tempo, preservar os movimentos de curto prazo dos indicadores econômicos trimestrais.

2. Nas Contas Nacionais Trimestrais (CNT), o benchmarking serve a dois propósitos:
   * Distribuição trimestral (ou interpolação) de dados anuais para construir séries temporais de estimativas de CNT com benchmarks ("séries históricas"); e
   * Extrapolação trimestral para derivar as estimativas de CNT para os trimestres para os quais os benchmarks das Contas Nacionais Anuais (CNA) ainda não estão disponíveis ("séries projetadas").

3. Os *papers* de base para a aplicação do modelo no R, são:
   * Adjustment of Monthly or Quarterly Series to Annual Totals: An Approach Based on Quadratic Minimization - [Denton, 1971](https://www.jstor.org/stable/2284856);
   * Adjusting sub-annual series to yearly benchmarks - [Cholette, 1984](https://www150.statcan.gc.ca/n1/en/pub/12-001-x/1984001/article/14348-eng.pdf?st=QABqgdwE);
   * Temporal Disaggregation of Time Series - [Sax e Steiner, 2013](https://cran.r-project.org/web/packages/tempdisagg/index.html).

## EXECUÇÃO DO AJUSTE SAZONAL

1. As variáveis econômicas são influenciadas por padrões sistemáticos e recorrentes dentro do ano devido a fatores climáticos e sociais, comumente conhecidos como padrão sazonal (ou sazonalidade). O ajuste sazonal compreende a remoção tanto dos movimentos sazonais dentro do ano quanto da influência dos efeitos de calendário (como o número diferente de dias úteis ou feriados móveis). Ao remover o impacto repetido desses efeitos, os dados ajustados sazonalmente destacam a tendência subjacente de longo prazo e as inovações de curto prazo na série;
2. Para fins de ajuste sazonal, assume-se geralmente que uma série temporal é composta por quatro componentes principais:
   * O componente de tendência-ciclo;
   * O componente sazonal;
   * O componente de calendário;
   * O componente irregular.

3. Os *papers* de base para a aplicação do modelo no R, são:
   * X-13ARIMA-SEATS Seasonal Adjustment Program - [USCB, 2024](https://www.census.gov/data/software/x13as.X-13ARIMA-SEATS.html#list-tab-635278563);
   * X-13arima-seats com R: um estudo de caso para a produção industrial brasileira - [Ferreira et. al, 2015](https://repositorio.fgv.br/items/22cb8deb-0c68-48aa-9f3d-00c209adb0a2);
   * Seasonal: R Interface to X-13-ARIMA-SEATS - [Sax e Eddelbuettel, 2022](https://cran.r-project.org/web/packages/seasonal/index.html).

