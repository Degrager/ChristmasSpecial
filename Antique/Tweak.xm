#import "Bits.h"
#import "Headers.h"


UIView *dockBackView;
SBDockView *dockView;
%hook CCUIControlCenterContainerView
-(void) layoutSubviews {
     %orig;

UIView *dynamicsView = [self valueForKey:@"_dynamicsContainerView"];

if(!dockBackView) {
dockBackView = [[UIView alloc] initWithFrame:CGRectMake(8, -12, self.bounds.size.width - 16, 103)];
[dockBackView setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.72]];
[dockBackView setClipsToBounds:YES];
[dockBackView.layer setCornerRadius:30];
[dynamicsView addSubview:dockBackView];
  }

if(!dockView) {
dockView = [[%c(SBDockView) alloc] initWithDockListView:[[%c(SBIconController) sharedInstance] dockListView] forSnapshot:NO];
[dockView setFrame:dockBackView.bounds];
[dockBackView addSubview:dockView];
[dockView setUserInteractionEnabled:YES];
  }
}
%end


%hook SBIconView
-(void) layoutSubviews {
      %orig;

if([self isInDock]) {
UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
[self addGestureRecognizer:tap];
   }
}


%new
- (void) handleTap:(UITapGestureRecognizer *)recognizer {
    [[UIApplication sharedApplication] launchApplicationWithIdentifier:self.icon.applicationBundleID suspended:NO];
}
%end




%hook CCUIBackgroundDarkeningWithPlatterCutoutView
-(void)layoutSubviews {
      [self removeFromSuperview];
}
%end


UIVisualEffectView *visualEffectViewController;
%hook CCUIControlCenterViewController
-(void) viewDidLoad {
      %orig;

UIVisualEffect *blurEffectDark = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];

  visualEffectViewController = [[UIVisualEffectView alloc] initWithEffect:blurEffectDark];
  [visualEffectViewController setFrame:[UIScreen mainScreen].bounds];
[visualEffectViewController setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.78]];
  [visualEffectViewController setHidden:NO];


_UIVisualEffectFilterView *_grayscaleSubview = [visualEffectViewController valueForKey:@"_grayscaleSubview"];
  [_grayscaleSubview removeFromSuperview];

  [self.view addSubview:visualEffectViewController];
  [self.view sendSubviewToBack:visualEffectViewController];
}

-(void)_loadPages {
  HUHomeControlCenterViewController *homePageController = [[NSClassFromString(@"HUHomeControlCenterViewController") alloc] initWithNibName:nil bundle:nil];

  CCUISystemControlsPageViewController *settingsPageController = [[NSClassFromString(@"CCUISystemControlsPageViewController") alloc] initWithNibName:nil bundle:nil];

  [self _removeContentViewController:settingsPageController];
  [self _removeContentViewController:homePageController];
}

-(void)setRevealPercentage:(double)arg1 {
      %orig;
[visualEffectViewController setAlpha:arg1];
}

-(double) contentHeightForOrientation:(long long)arg1 {
        return 98;
}
%end


%hook CCUIImmediateTouchScrollView
-(void) layoutSubviews {
      [self removeFromSuperview];
}
%end


%hook CCUIControlCenterPagePlatterView
-(void) layoutSubviews {
      %orig;

    NCMaterialView *_baseMaterialView = [self valueForKey:@"_baseMaterialView"];
    [_baseMaterialView removeFromSuperview];

    UIImageView *_whiteLayerView = [self valueForKey:@"_whiteLayerView"];
    [_whiteLayerView removeFromSuperview];
}
%end


%hook SBRootFolderView
-(void) layoutSubviews {
     %orig;


SBDockView *dockView = [self valueForKey:@"_dockView"];
[dockView removeFromSuperview];
}
%end