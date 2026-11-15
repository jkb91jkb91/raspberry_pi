#!/bin/bash
set -euo pipefail

PROJECT_DIR=~/programs/raspberry_pi/qbittorrent

echo "== Tworzę katalogi =="
mkdir -p "$PROJECT_DIR/config"
sudo mkdir -p /srv/downloads
sudo chown -R "$USER:$USER" /srv/downloads

cd "$PROJECT_DIR"

if [ ! -f compose.yaml ]; then
  echo "BŁĄD: brak pliku compose.yaml w $PROJECT_DIR"
  echo "Wklej go najpierw, dopiero potem odpal ten skrypt."
  exit 1
fi

echo "== Odpalam stack =="
docker compose up -d

echo "== Czekam na pierwszy start kontenera =="
sleep 8

echo "== Status =="
docker compose ps


echo"LOGIN= admin"
echo "== Hasło tymczasowe (jeśli zostało wygenerowane) =="
docker compose logs qbittorrent | grep -i "temporary password" || echo "Nie znaleziono hasła w logach — może już ustawione wcześniej albo trzeba poczekać dłużej, sprawdź: docker compose logs qbittorrent"

echo "== Gotowe. Panel: http://$(hostname -I | awk '{print $1}'):8080 =="
