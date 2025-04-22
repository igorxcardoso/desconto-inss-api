#!/bin/bash
set -e

# Espera o banco subir antes de continuar
bundle exec rails db:prepare

exec "$@"
