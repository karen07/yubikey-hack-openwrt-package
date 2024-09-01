include $(TOPDIR)/rules.mk

PKG_NAME:=yubikey-hack
PKG_VERSION:=1.0.0
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0-or-later

ifeq ("$(wildcard ../yubikey-hack)", "")
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/karen07/yubikey-hack.git
PKG_SOURCE_VERSION:=03b1e584807850726ddd485bb975167cb97aa846
endif

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/yubikey-hack
	SECTION:=net
	CATEGORY:=Network
	DEPENDS:=kmod-usb-hid kmod-usb-serial-ch341
	TITLE:=Get data from YubiKey
	URL:=https://github.com/karen07/yubikey-hack
endef

define Package/yubikey-hack/description
	Get data from YubiKey
endef

ifneq ("$(wildcard ../yubikey-hack)", "")
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ../yubikey-hack/* $(PKG_BUILD_DIR)/
endef
endif

define Package/yubikey-hack/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/yubikey-hack $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/yubikey-hack $(1)/etc/init.d/
endef

$(eval $(call BuildPackage,yubikey-hack))
