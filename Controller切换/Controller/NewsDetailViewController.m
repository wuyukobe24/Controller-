//
//  NewsDetailViewController.m
//  Controller切换
//
//  Created by WangXueqi on 17/9/5.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()
@property(nonatomic,strong)UILabel * label;
@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:0.3f];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.label];
    NSLog(@"当前是：%@",_text);
}

- (UILabel *)label {

    if (!_label) {
        UILabel * label = [[UILabel alloc]init];
        label.frame = CGRectMake(0, arc4random()%200, ScreenWidth, 50);
//        label.center = self.view.center;
        label.textAlignment = NSTextAlignmentCenter;
        _label = label;
    }
    _label.text = _text;
    return _label;
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
