include $(TOPDIR)/rules.mk

PKG_NAME:=yubikey-hack
PKG_VERSION:=1.0.0
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0-or-later

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/karen07/yubikey-hack.git
PKG_SOURCE_VERSION:=d3091a359e190a7cea2cf27d59b6afbce03da309

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/yubikey-hack
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Get data from YubiKey
	URL:=https://github.com/karen07/yubikey-hack
endef

define Package/yubikey-hack/description
	Get data from YubiKey
endef

#define Build/Prepare
#	mkdir -p $(PKG_BUILD_DIR)
#	$(CP) ../yubikey-hack/* $(PKG_BUILD_DIR)/
#endef

define Package/yubikey-hack/install
	$(CP) ./files/* $(1)/
	chmod +x $(1)/etc/init.d/yubikey-hack

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/yubikey-hack $(1)/usr/bin/
endef

$(eval $(call BuildPackage,yubikey-hack))
