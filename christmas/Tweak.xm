#import "Bits.h"
#import "Headers.h"


UIView *dockBackView;
%hook CCUIControlCenterContainerView
-(void) layoutSubviews {
     %orig;

UIView *dynamicsView = [self valueForKey:@"_dynamicsContainerView"];

if(!dockBackView) {
dockBackView = [[UIView alloc] initWithFrame:CGRectMake(8, 8, self.bounds.size.width - 16, 82)];
[dockBackView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.58]];
[dockBackView setClipsToBounds:YES];
[dockBackView.layer setCornerRadius: 30];
[dynamicsView addSubview:dockBackView];
  }
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
[visualEffectViewController setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.32]];
  [visualEffectViewController setHidden:FALSE];


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


%hook SBDockIconListView
+ (unsigned long long)iconRowsForInterfaceOrientation:(long long)arg1 {
    return 0;
}

+ (unsigned long long)iconColumnsForInterfaceOrientation:(long long)arg1 {
    return 0;
}
%end