#!/bin/bash

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
tmux send-keys 'bash /home/utnso/Desktop/ejecutar-tp/filesystem.sh' C-m

tmux select-pane -t 1
tmux send-keys 'bash /home/utnso/Desktop/ejecutar-tp/memoria.sh' C-m

tmux select-pane -t 2
tmux send-keys 'bash /home/utnso/Desktop/ejecutar-tp/cpu.sh' C-m

tmux select-pane -t 3
tmux send-keys 'bash /home/utnso/Desktop/ejecutar-tp/kernel.sh' C-m

# Adjuntarse a la sesión
tmux attach -t $SESSION_NAME