//
//  NewsViewController.m
//  Controller切换
//
//  Created by WangXueqi on 17/9/5.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "NewsViewController.h"
#import "ListCollectionViewCell.h"
#import "ChangeLabel.h"

static NSString * reuseID = @"reuseID";
@interface NewsViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView * listScrollView;
@property(nonatomic,strong)UICollectionView * listCollectionView;
@property(nonatomic,copy)NSArray * dataArray;
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.listScrollView];
    [self.view addSubview:self.listCollectionView];
    [self setupChannelLabel];
}

- (NSArray *)dataArray {
//测试的数据
    if (!_dataArray) {
        _dataArray = [NSArray arrayWithObjects:@"一",@"二",@"三",@"四",@"五",@"六",@"七", nil];
    }
    return _dataArray;
}

- (UIScrollView *)listScrollView {

    if (!_listScrollView) {
        _listScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 44)];
        _listScrollView.backgroundColor = [UIColor grayColor];
        _listScrollView.bounces = NO;
        _listScrollView.showsHorizontalScrollIndicator = NO;
        _listScrollView.showsVerticalScrollIndicator = YES;
//        _listScrollView.contentSize = CGSizeMake(ScreenWidth*2, 0);
    }
    return _listScrollView;
}

/** 设置频道标题 */
- (void)setupChannelLabel
{
    CGFloat margin = 20.0;
    CGFloat x = 8;
    CGFloat h = 44;
    int i = 0;
    for (NSString * titleStr in self.dataArray) {
        ChangeLabel *label = [ChangeLabel channelLabelWithTitle:titleStr];
        label.frame = CGRectMake(x, 0, 50 + margin, h);
        label.backgroundColor = [UIColor redColor];
        [self.listScrollView addSubview:label];
        
        x += label.bounds.size.width;
        label.tag = i++;
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick:)]];
    }
    self.listScrollView.contentSize = CGSizeMake(x + margin, 0);
}

/** 频道Label点击事件 */
- (void)labelClick:(UITapGestureRecognizer *)recognizer
{
//    DDChannelLabel *label = (DDChannelLabel *)recognizer.view;
//    // 点击label后，让bigCollectionView滚到对应位置。
//    [_bigCollectionView setContentOffset:CGPointMake(label.tag * _bigCollectionView.frame.size.width, 0)];
//    // 重新调用一下滚定停止方法，让label的着色和下划线到正确的位置。
//    [self scrollViewDidEndScrollingAnimation:self.bigCollectionView];
}

- (UICollectionView *)listCollectionView {

    if (!_listCollectionView) {
        // 高度 = 屏幕高度 - 导航栏高度64 - 频道视图高度44
        CGFloat h = ScreenHeight - 64 - self.listScrollView.height ;
        CGRect frame = CGRectMake(0, self.listScrollView.bottom, ScreenWidth, h);
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _listCollectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
        _listCollectionView.backgroundColor = [UIColor whiteColor];
        _listCollectionView.delegate = self;
        _listCollectionView.dataSource = self;
        [_listCollectionView registerClass:[ListCollectionViewCell class] forCellWithReuseIdentifier:reuseID];
        
        // 设置cell的大小和细节
        flowLayout.itemSize = _listCollectionView.bounds.size;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        _listCollectionView.pagingEnabled = YES;
        _listCollectionView.showsHorizontalScrollIndicator = NO;
    }
    return _listCollectionView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    cell.textStr = self.dataArray[indexPath.row];
    
    // 如果不加入响应者链，则无法利用NavController进行Push/Pop等操作。
    [self addChildViewController:(UIViewController *)cell.newsDetail];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"%zi",indexPath.row);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    if (scrollView == _listCollectionView) {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
