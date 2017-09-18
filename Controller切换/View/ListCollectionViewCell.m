//
//  ListCollectionViewCell.m
//  Controller切换
//
//  Created by WangXueqi on 17/9/5.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "ListCollectionViewCell.h"
#import "NewsDetailViewController.h"
@implementation ListCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setTextStr:(NSString *)textStr {

    _textStr = textStr;
    _newsDetail = [[NewsDetailViewController alloc]init];
    _newsDetail.text = textStr;
    _newsDetail.view.frame = self.bounds;
    [self addSubview:_newsDetail.view];
}

@end
