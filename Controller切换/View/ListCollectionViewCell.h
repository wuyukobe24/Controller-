//
//  ListCollectionViewCell.h
//  Controller切换
//
//  Created by WangXueqi on 17/9/5.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsDetailViewController;
@interface ListCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)NewsDetailViewController * newsDetail;
@property(nonatomic,copy)NSString * textStr;
@end
