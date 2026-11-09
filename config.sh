#!/usr/bin/env bash
# config.sh — parametros compartilhados por todos os scripts do experimento.
# Todos os outros scripts leem estas variaveis (com: source config.sh).
# A ideia: mudar o experimento aqui, em um lugar so.

# ---------------------------------------------------------------------------
# AMBIENTE e ALVO: o que permite os MESMOS scripts rodarem nos dois cenarios.
# ---------------------------------------------------------------------------

# Ambiente do experimento. Vira etiqueta nos dados.
#   "loopback"   -> cliente e servidor na mesma maquina (notebook)
#   "dois-hosts" -> cliente e servidor em maquinas diferentes
# Pode sobrescrever na hora de rodar:  AMBIENTE=dois-hosts ./scripts/...
AMBIENTE="${AMBIENTE:-loopback}"

# Para onde o cliente iperf3 aponta:
#   loopback    -> 127.0.0.1
#   dois-hosts  -> IP do servidor na rede (ex.: 192.168.50.1)
# Troque so esta variavel para migrar do notebook para as duas maquinas.
ALVO="${ALVO:-127.0.0.1}"

# Porta usada pelo servidor iperf3.
PORTA="${PORTA:-5201}"

# ---------------------------------------------------------------------------
# A MATRIZ DO EXPERIMENTO
# ---------------------------------------------------------------------------

# Modos de rede comparados.
MODOS=(pasta slirp4netns host bridge)

# Niveis de concorrencia (numero de conexoes simultaneas).
CONCORRENCIAS=(1 4 16 64)

# Repeticoes por cenario (nunca 1 so: rede tem variancia).
REPETICOES=10

# Duracao de cada rodada, em segundos.
DURACAO=10

# ---------------------------------------------------------------------------
# OUTROS
# ---------------------------------------------------------------------------

# Imagem usada para o servidor iperf3 dentro do container.
IMAGEM="docker.io/networkstatic/iperf3"

# Pasta onde os dados brutos sao salvos (fica fora do git).
SAIDA="${SAIDA:-dados}"
