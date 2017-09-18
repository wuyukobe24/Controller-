//
//  ChangeLabel.m
//  Controller切换
//
//  Created by WangXueqi on 17/9/5.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "ChangeLabel.h"

@implementation ChangeLabel

+ (instancetype)channelLabelWithTitle:(NSString *)title
{
    ChangeLabel *label = [self new];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:18];
    [label sizeToFit];
    label.userInteractionEnabled = YES;
    return label;
}

@end
