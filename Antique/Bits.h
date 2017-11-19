/* Dock Headers */
@interface SBDockView : UIView
-(id) initWithDockListView:(id)arg1 forSnapshot:(BOOL)arg1;
-(id) dockListView;
@end

@interface SBDockIconListView : UIView
@end
/* Dock Headers */


/* Homescreen Headers */
@interface SBRootFolderView : UIView
@end

@interface SBRootFolderController : UIViewController
@end
/* Homescreen Headers */




/* Icons and Application Headers */
@interface SBIcon : NSObject
-(id) applicationBundleID;
@end

@interface SBIconView : UIView
@property(retain, nonatomic) SBIcon *icon;
-(BOOL) isInDock;
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
-(id) dockListView;
- (id)model;
@end

@interface UIApplication (Christmas)
-(BOOL) launchApplicationWithIdentifier:(NSString *)identifier suspended:(BOOL)suspended;
@end
/* Icons and Application Headers */



/* Blurring Headers */
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
/* Blurring Headers */