#!/usr/bin/env bash
set -o errexit

echo "====== INSTALANDO DEPENDENCIAS ======"
bundle install

echo "====== PRECOMPILANDO ASSETS ======"
bundle exec rails assets:precompile

echo "====== PREPARANDO BASE DE DATOS ======"
bundle exec rails db:prepare

echo "====== BUILD COMPLETADO ======"