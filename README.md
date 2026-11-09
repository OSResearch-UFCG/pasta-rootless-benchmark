# Análise do custo de desempenho da rede rootless em contêineres

Estudo do custo de desempenho do **pasta**, o componente que fornece conectividade
a contêineres *rootless* no Podman, fazendo a ponte entre o contêiner e a rede da
máquina por meio de um processo em espaço de usuário. Esse passo extra, que o modo tradicional (com root) não exige, introduz um custo em **CPU e latência**, que este
projeto se propõe a medir e explicar no nível do sistema operacional.

Projeto da disciplina de Projeto de Sistemas Operacionais — UFCG.

## O que é medido

- **Modos de rede comparados:** pasta, slirp4netns, host, bridge.
- **Métricas:** uso de CPU, latência, throughput.
- **Variável:** número de conexões simultâneas, concorrência: 1, 4, 16, 64.
- **Repetições:** 10 por cenário.

## Ambientes

O experimento roda em dois cenários complementares, usando os mesmos scripts:

- **Ambiente A: loopback:** cliente e servidor na mesma máquina. Sem o teto de uma
  rede física, permite empurrar a carga e expor o gargalo do pasta.
- **Ambiente B: dois hosts:** cliente e servidor em máquinas distintas, ligadas por
  cabo. Mede o custo em condições realistas.

Para alternar entre os ambientes, basta mudar `AMBIENTE` e `ALVO` no `config.sh`. Nenhum script precisa ser reescrito.

## Estrutura

```
config.sh          parâmetros do experimento
scripts/           scripts de medição e orquestração
analise/           geração de gráficos e tabelas
dados/             resultados brutos
```

## Como usar

_(em construção, será preenchido conforme os scripts ficam prontos)_

## Ambiente de referência

Medições realizadas no seguinte ambiente:

### Ambiente A: loopback
| Componente   | Versão                       |
|--------------|------------------------------|
| Máquina      | Dell Inspiron 3501           |
| CPU          | Intel Core i7-1165G7 (4 núcleos / 8 threads) |
| Memória      | 8 GB                         |
| Distribuição | Ubuntu 26.04.1 LTS           |
| Kernel       | 7.0.0-34-generic             |
| Podman       | 5.7.0                        |
| pasta        | 0.0~git20260120.386b5f5-1    |
| slirp4netns  | 1.3.3 (libslirp 4.9.1)       |
| iperf3       | 3.20                         |
