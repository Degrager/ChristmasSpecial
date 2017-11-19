@interface SBDockView : UIView
@end

@interface SBDockIconListView : UIView
@end

@interface SBRootFolderView : UIView
@end

@interface SBRootFolderController : UIViewController
@end





@interface SBIcon : NSObject
@end

@interface SBIconView : UIView
@end

@interface SBIconViewMap : NSObject
- (id)iconViewForIcon:(SBIcon *)icon;
@end

@interface SBIconModel : NSObject
- (id)expectedIconForDisplayIdentifier:(id)arg1;
@end

@interface SBIconController : UIViewController
- (SBIconViewMap *)homescreenIconViewMap;
+ (id)sharedInstance;
- (id)model;
@end



@interface _UIBackdropView : UIView
- (id)initWithFrame:(CGRect)arg1 autosizesToFitSuperview:(BOOL)arg2 settings:(id)arg3;
- (id)initWithPrivateStyle:(int)arg1;
- (id)initWithSettings:(id)arg1;
- (id)initWithStyle:(int)arg1;

- (void)setBlurFilterWithRadius:(float)arg1 blurQuality:(id)arg2 blurHardEdges:(int)arg3;
- (void)setBlurFilterWithRadius:(float)arg1 blurQuality:(id)arg2;
- (void)setBlurHardEdges:(int)arg1;
- (void)setBlurQuality:(id)arg1;
- (void)setBlurRadius:(float)arg1;
- (void)setBlurRadiusSetOnce:(BOOL)arg1;
- (void)setBlursBackground:(BOOL)arg1;
- (void)setBlursWithHardEdges:(BOOL)arg1;
@end

@interface _UIBackdropViewSettings : NSObject
+(id) settingsForStyle:(int)arg1;
@end

//Prefs

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.people.christmas.plist"


inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline int GetPrefInt(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}