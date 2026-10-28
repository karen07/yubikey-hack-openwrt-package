# YubiKey Hack OpenWrt Package

OpenWrt packaging for [yubikey-hack](https://github.com/karen07/yubikey-hack), an
experiment in remote YubiKey activation using a relay-controlled hardware setup.

Пакет OpenWrt для [yubikey-hack](https://github.com/karen07/yubikey-hack) - эксперимента по
удалённой активации YubiKey с помощью реле.

## Описание

Пакет устанавливает бинарный файл `yubikey-hack` вместе со скриптом запуска OpenWrt. Он объявляет модули ядра USB HID и CH341 для последовательного порта, использовавшиеся в исходной аппаратной конфигурации.

При разработке Makefile может собирать исходники из соседнего каталога `../yubikey-hack`. Если такого каталога нет, OpenWrt загружает версию исходников по тегу, заданному в `PKG_VERSION`.

## Разработка и проверка изменений

**Основные точки изменения:**

- `yubikey-hack/Makefile` - зависимости, версия и правила установки (приложение и init-скрипт);
- `yubikey-hack/files/etc/init.d/yubikey-hack` - автозапуск и управление сервисом OpenWrt;
- `openwrt-build.env` - параметры сборки для общего CI;
- `.github/workflows/openwrt-build.yml` - вызов переиспользуемого OpenWrt workflow.

**Проверка изменений:** Изменения функциональности: логика Linux/ESP32 находится в отдельном `yubikey-hack`. Для упаковки проверяйте `Makefile`, `openwrt-build.env` и CI вместе; тестируйте итоговый пакет на нужной версии OpenWrt, поскольку сборка приложения сама по себе не проверяет установку и зависимости.

## Сборка

Сборка выполняется через GitHub Actions. Workflow этого репозитория вызывает общий reusable workflow из [openwrt-package-ci](https://github.com/karen07/openwrt-package-ci).

CI можно запустить:

- push тега вида `vX.Y.Z` - значение тега используется как версия OpenWrt;
- вручную через `workflow_dispatch`, указав версию OpenWrt и при необходимости фильтры target/subtarget.

Параметры этого пакета хранятся в `openwrt-build.env`. Общие `openwrt-build.sh`, `openwrt-matrix.py` и логика сборки через OpenWrt SDK находятся в `openwrt-package-ci`.

Для ручной сборки каталог `yubikey-hack/` можно использовать как обычный package directory внутри OpenWrt buildroot/SDK.

## Структура проекта

- `yubikey-hack/Makefile` - описание OpenWrt package;
- `yubikey-hack/files/etc/init.d/yubikey-hack` - init script;
- `openwrt-build.env` - параметры пакета для общего CI;
- `.github/workflows/openwrt-build.yml` - вызов общего reusable workflow.

## Связанные проекты

- [yubikey-hack](https://github.com/karen07/yubikey-hack) - основной проект, Linux service, ESP32 sketch и описание аппаратной схемы.

## Лицензия

Проект распространяется под лицензией GNU Affero General Public License v3.0. Подробности см. в файле [LICENSE](LICENSE).
