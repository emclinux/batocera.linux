################################################################################
#
# FCEUMM
#
################################################################################
# Version.: Commits on Nov 16, 2020
LIBRETRO_FCEUMM_VERSION = 9223fe174f3326b68d746e9fd25b5021a239e488
LIBRETRO_FCEUMM_SITE = $(call github,libretro,libretro-fceumm,$(LIBRETRO_FCEUMM_VERSION))
LIBRETRO_FCEUMM_LICENSE = GPLv2

LIBRETRO_FCEUMM_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI3),y)
	LIBRETRO_FCEUMM_PLATFORM = rpi3
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI4),y)
	LIBRETRO_FCEUMM_PLATFORM = rpi4
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ODROIDGOA),y)
	LIBRETRO_FCEUMM_PLATFORM = classic_armv8_a35
endif

define LIBRETRO_FCEUMM_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile.libretro platform="$(LIBRETRO_FCEUMM_PLATFORM)"
endef

define LIBRETRO_FCEUMM_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/fceumm_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/fceumm_libretro.so
endef

$(eval $(generic-package))
