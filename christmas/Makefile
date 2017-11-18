ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:latest:latest
DEBUG = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Christmas
Christmas_FILES = $(wildcard *.xm *.m)
Christmas_FRAMEWORKS = CoreGraphics QuartzCore UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
