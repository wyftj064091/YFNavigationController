//
//  YFNavigationController.h
//  YFNavigationControllerSample
//
//  Created by Wu Yifeng on 14/10/28.
//  Copyright (c) 2014年 YifengWu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YFNavigationController;

@protocol YFNavigationControllerDelegate <NSObject>

- (void)navigationController:(YFNavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (void)navigationController:(YFNavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end

@interface YFNavigationController : UIViewController

@property(nonatomic, readonly, retain) UIViewController *topViewController;

@property(nonatomic, readonly, retain) UIViewController *visibleViewController;

@property(nonatomic, copy) NSArray *viewControllers;

@property(nonatomic, readonly) UINavigationBar *navigationBar;

@property(nonatomic, getter=isNavigationBarHidden) BOOL navigationBarHidden;

@property(nonatomic,readonly) UIToolbar *toolbar;

@property(nonatomic,getter=isToolbarHidden) BOOL toolbarHidden;

@property(nonatomic, assign) id<YFNavigationControllerDelegate> delegate;

- (id)initWithRootViewController:(UIViewController *)rootViewController;

- (instancetype)initWithNavigationBarClass:(Class)navigationBarClass toolbarClass:(Class)toolbarClass;

- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated;

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (UIViewController *)popViewControllerAnimated:(BOOL)animated;

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated;

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (void)setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated;

- (void)setToolbarHidden:(BOOL)hidden animated:(BOOL)animated;

@end
