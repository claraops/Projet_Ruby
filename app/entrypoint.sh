#!/bin/bash
set -e
#supprimer un eventuel fichier de PID de serveur existant
rm -f /app/tmp/pids/server.pid

#executer le commande donnée en argument
exec "$@"

