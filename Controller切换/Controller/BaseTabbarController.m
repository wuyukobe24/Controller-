//
//  BaseTabbarController.m
//  Controller切换
//
//  Created by WangXueqi on 17/9/5.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "BaseTabbarController.h"
#import "NewsViewController.h"
#import "PersonViewController.h"
@interface BaseTabbarController ()

@end

@implementation BaseTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController];
}

- (void)addChildViewController {

    [self addChildViewController:[[NewsViewController alloc]init] andTitle:@"新闻" andImageName:@"found_no" selectImageName:@"found_yes"];
    [self addChildViewController:[[PersonViewController alloc]init] andTitle:@"我的" andImageName:@"my_no" selectImageName:@"my_yes"];
}

-(void)addChildViewController:(UIViewController *)VC andTitle:(NSString *)title andImageName:(NSString *)imageName selectImageName:(NSString *)selectImageName {
    
    VC.title = title;
    VC.tabBarItem.image = [UIImage imageNamed:imageName];
    VC.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
//    self.tabBar.tintColor = [UIColor colorWithRed:13/255.0 green:184/255.0 blue:246/255.0 alpha:1];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:VC];    
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
