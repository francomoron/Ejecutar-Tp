#!/bin/bash

#RECIBIR PARAMETROS
DIR=$1
TIME=$2
ARCHIVO_A_EJECUTAR=$3
TAMANIO_ARCHIVO=$4

# Nombre de la sesión
SESSION_NAME="mi_sesion"

# Crear una nueva sesión en modo desacoplado
tmux new-session -d -s $SESSION_NAME

# Dividir la ventana en 4 paneles
tmux split-window -h
tmux split-window -v
tmux select-pane -t 0
tmux split-window -v

# Seleccionar y ejecutar el script en cada panel
tmux select-pane -t 0
tmux send-keys "bash ./filesystem.sh $DIR $TIME" C-m

tmux select-pane -t 1
tmux send-keys "bash ./memoria.sh $DIR $TIME" C-m

tmux select-pane -t 2
tmux send-keys "bash ./cpu.sh $DIR $TIME" C-m

tmux select-pane -t 3
tmux send-keys "bash ./kernel.sh $DIR $TIME $ARCHIVO_A_EJECUTAR $TAMANIO_ARCHIVO" C-m

# Adjuntarse a la sesión
tmux attach -t $SESSION_NAME
