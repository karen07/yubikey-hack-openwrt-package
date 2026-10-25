include $(TOPDIR)/rules.mk

PKG_NAME:=yubikey-hack
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

# Local sources are located next to the *-openwrt-package repository.
PKG_LOCAL_SOURCE_DIR:=$(abspath $(realpath $(CURDIR))/../../$(PKG_NAME))

ifeq ($(wildcard $(PKG_LOCAL_SOURCE_DIR)/CMakeLists.txt),)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/karen07/yubikey-hack
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_MIRROR_HASH:=skip
endif

PKG_LICENSE:=AGPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Karen Khachatryan <karen0734@gmail.com>

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/yubikey-hack
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+kmod-usb-hid +kmod-usb-serial-ch341
  TITLE:=Get data from YubiKey
  URL:=https://github.com/karen07/yubikey-hack
endef

define Package/yubikey-hack/description
  Get data from YubiKey
endef

ifneq ($(wildcard $(PKG_LOCAL_SOURCE_DIR)/CMakeLists.txt),)
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) $(PKG_LOCAL_SOURCE_DIR)/. $(PKG_BUILD_DIR)/
endef
endif

define Package/yubikey-hack/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/yubikey-hack $(1)/usr/bin/yubikey-hack

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/yubikey-hack $(1)/etc/init.d/yubikey-hack
endef

$(eval $(call BuildPackage,yubikey-hack))
