################################################################################
#
# FBA
#
################################################################################
# Version.: Commits on Apr 6, 2019
LIBRETRO_FBA_VERSION = 9fc762065d0d27322a668603a7c383f2e1183012
LIBRETRO_FBA_SITE = $(call github,libretro,fbalpha,$(LIBRETRO_FBA_VERSION))
LIBRETRO_FBA_LICENSE="Non-commercial"

ifeq ($(BR2_ARM_FPU_NEON_VFPV4)$(BR2_ARM_FPU_NEON)$(BR2_ARM_FPU_NEON_FP_ARMV8),y)
    LIBRETRO_FBA_EXTRA_ARGS = HAVE_NEON=1
else
    LIBRETRO_FBA_EXTRA_ARGS = HAVE_NEON=0
endif

define LIBRETRO_FBA_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" \
        $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" LD="$(TARGET_CXX)" RANLIB="$(TARGET_RANLIB)" AR="$(TARGET_AR)" -C $(@D)/ -f makefile.libretro platform="$(LIBRETRO_PLATFORM)" $(LIBRETRO_FBA_EXTRA_ARGS)
endef

define LIBRETRO_FBA_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/fbalpha_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/fba_libretro.so
endef

$(eval $(generic-package))
