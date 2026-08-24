# yubikey-hack OpenWrt package

This repository contains the OpenWrt package definition for [yubikey-hack](https://github.com/karen07/yubikey-hack), a small remote YubiKey activation experiment.

The package installs the `yubikey-hack` binary together with an OpenWrt init script. It declares the USB HID and CH341 serial kernel modules used by the original hardware setup.

For development, the Makefile can build from a sibling `../yubikey-hack` checkout. Otherwise OpenWrt fetches the tagged upstream source specified by `PKG_VERSION`.

## Описание

Этот репозиторий содержит описание пакета OpenWrt для [yubikey-hack](https://github.com/karen07/yubikey-hack), небольшого эксперимента по удаленной активации YubiKey.

Пакет устанавливает бинарный файл `yubikey-hack` вместе со скриптом запуска OpenWrt. Он объявляет модули ядра USB HID и CH341 для последовательного порта, использовавшиеся в исходной аппаратной конфигурации.

При разработке Makefile может собирать исходники из соседнего каталога `../yubikey-hack`. Если такого каталога нет, OpenWrt загружает версию исходников по тегу, заданному в `PKG_VERSION`.

## Что находится в репозитории

- `yubikey-hack/Makefile` - описание OpenWrt package;
- `yubikey-hack/files/etc/init.d/yubikey-hack` - init script;
- `openwrt-build.env` - параметры пакета для общего CI;
- `.github/workflows/openwrt-build.yml` - вызов общего reusable workflow.

## Сборка

Сборка выполняется через GitHub Actions. Workflow этого репозитория вызывает общий reusable workflow из [openwrt-package-ci](https://github.com/karen07/openwrt-package-ci).

CI можно запустить:

- push тега вида `vX.Y.Z` - значение тега используется как версия OpenWrt;
- вручную через `workflow_dispatch`, указав версию OpenWrt и при необходимости фильтры target/subtarget.

Параметры этого пакета хранятся в `openwrt-build.env`. Общие `openwrt-build.sh`, `openwrt-matrix.py` и логика сборки через OpenWrt SDK находятся в `openwrt-package-ci`.

Для ручной сборки каталог `yubikey-hack/` можно использовать как обычный package directory внутри OpenWrt buildroot/SDK.

## Связанные проекты

- [yubikey-hack](https://github.com/karen07/yubikey-hack) - основной проект, Linux service, ESP32 sketch и описание аппаратной схемы.
