include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Christmas
Christmas_FILES = crsRootListController.m
Christmas_INSTALL_PATH = /Library/PreferenceBundles
Christmas_FRAMEWORKS = UIKit
Christmas_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Christmas.plist$(ECHO_END)
