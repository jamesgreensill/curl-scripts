#!/bin/bash

DOCKER_TEMPLATE=$(curl https://pastebin.com/raw/u5XJ8EAc)

echo 'PSRJ Stack Docker Setup'

function find_replace {
        _find=$1
        _replace=$2
        _content=$3

        echo "$_content" | sed "s|$_find|$_replace|g"
}


function set_variable {
        _variable=$1
        read -p "Enter value for $_variable: " _input
        DOCKER_TEMPLATE=$(find_replace "%$_variable%" "$_input" "$DOCKER_TEMPLATE")
}

set_variable "TIMEZONE"
set_variable "PLEX_CONFIG_PATH"
set_variable "ROOT_MEDIA_PATH"
set_variable "SONARR_CONFIG_PATH"
set_variable "DOWNLOADS_PATH"
set_variable "RADARR_CONFIG_PATH"
set_variable "JACKETT_CONFIG_PATH"
set_variable "DELUGE_CONFIG_PATH"
set_variable "VPN_USER"
set_variable "VPN_PASS"
set_variable "VPN_CONFIG_PATH"

echo "$DOCKER_TEMPLATE" > "docker-compose.yml"
