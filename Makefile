export ARCHS = armv7 arm64 arm64e
# export ARCHS = arm64
export TARGET = iphone:clang:13.0:10.0
GO_EASY_ON_ME = 1
export FINALPACKAGE=1

include $(THEOS)/makefiles/common.mk

# export THEOS_DEVICE_IP=192.168.11.13
# export THEOS_DEVICE_PORT=22

TWEAK_NAME = DVirtualHome
DVirtualHome_FILES = Tweak.xm
DVirtualHome_FRAMEWORKS = UIKit AudioToolbox

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += dvirtualhome
include $(THEOS_MAKE_PATH)/aggregate.mk
