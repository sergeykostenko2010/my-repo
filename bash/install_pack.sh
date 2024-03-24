#!/bin/bash

# Функция для проверки успешной установки пакета
check_installation() {
    if rpm -q "$1" &>/dev/null; then
        echo -e "\e[32mПакет $1 успешно установлен\e[0m"
    else
        echo -e "\e[31mОшибка: Не удалось установить пакет $1\e[0m"
    fi
}

# Установка пакетов
install_packages() {
    for package in "$@"; do
        sudo dnf install -y "$package" >/dev/null 2>&1
        check_installation "$package"
    done
}

# Список пакетов для установки
packages=("package1" "package2" "package3")

# Вызов функции для установки пакетов
install_packages "${packages[@]}"
