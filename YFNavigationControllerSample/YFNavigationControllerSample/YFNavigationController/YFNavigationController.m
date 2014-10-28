//
//  YFNavigationController.m
//  YFNavigationControllerSample
//
//  Created by Wu Yifeng on 14/10/28.
//  Copyright (c) 2014年 YifengWu. All rights reserved.
//

#import "YFNavigationController.h"

@interface _NavigationArea : NSObject
{
    UINavigationBar * _navigationBar;
    Class _class;
}

- (id)initWithBarClass:(Class)navigationBarClass;

@end

@interface _ToolbarArea : NSObject
{
    UIToolbar * _toolbar;
    Class _class;
}

- (id)initWithToolbarClass:(Class)toolbarClass;

@end

@implementation _NavigationArea

- (id)initWithBarClass:(Class)navigationBarClass
{
    self = [super init];
    if (self) {
        _class = navigationBarClass;
    }
    
    return self;
}

@end

@implementation _ToolbarArea

- (id)initWithToolbarClass:(Class)toolbarClass
{
    self = [super init];
    if (self) {
        _class = toolbarClass;
    }
    
    return self;
}
@end

#pragma mark - 
#pragma mark NavigationController Constants
static const NSUInteger _kViewControllerDefaultCapacity = 5;

@interface YFNavigationController()
{
    NSMutableArray * _containerViewControllers;
    _NavigationArea * _navigationArea;;
    _ToolbarArea * _toolBarArea;

    id<YFNavigationControllerDelegate> delegate;
}

@end

@implementation YFNavigationController

#pragma mark -
#pragma mark Private
- (void)_internalInitWithBarClass:(Class)navigationBarClass toolbarClass:(Class)toolbarClass
{
    _containerViewControllers = [[NSMutableArray alloc] initWithCapacity:_kViewControllerDefaultCapacity];
    _navigationArea = [[_NavigationArea alloc] initWithBarClass:navigationBarClass];
    _toolBarArea = [[_ToolbarArea alloc] initWithToolbarClass:toolbarClass];
}

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super init];
    if (self) {
        [self _internalInitWithBarClass:NULL toolbarClass:NULL];
        if (nil != rootViewController && [rootViewController isKindOfClass:[UIViewController class]]) {
            [_containerViewControllers addObject:rootViewController];
        }else {
            NSLog(@"Error appeared in %s, root view controller is nil or is not a view controller instance.",__FUNCTION__);
        }
    }
    
    return self;
}

- (instancetype)initWithNavigationBarClass:(Class)navigationBarClass toolbarClass:(Class)toolbarClass
{
    self = [super init];
    if (self) {
        [self _internalInitWithBarClass:navigationBarClass toolbarClass:toolbarClass];
    }
    
    return self;
}

- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated;

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (UIViewController *)popViewControllerAnimated:(BOOL)animated;

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated;

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (void)setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated;

- (void)setToolbarHidden:(BOOL)hidden animated:(BOOL)animated;

@end
