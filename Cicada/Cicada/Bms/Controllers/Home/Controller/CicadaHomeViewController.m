//
//  CicadaHomeViewController.m
//  Cicada
//
//  Created by 知了 on 2020/11/12.
//

#import "CicadaHomeViewController.h"
#import "TestViewController.h"
#import "CicadaTabWidget.h"

@interface CicadaHomeViewController ()<UIScrollViewDelegate, CicadaTabWidgetDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) CicadaTabWidget *tabWidget;

@end
@implementation CicadaHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hideBackButton];
    [self.view addSubview:self.tabWidget];
    [self.view addSubview:self.scrollView];
//    [[CicadaRequest getInstance]get:@"https://dev-tninfo.tpyzq.com/news/hkstocks" parameters:@{@"page":@"1",@"limit":@"10",@"classno":@"6"} headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//        NSLog(@"23333");
//        NSLog(@"%@",dic);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//    }];
    
    [[CicadaRequest getInstance]download:@"https://haokan.baidu.com/v?vid=7733094183378600995&pd=pcshare" parameters:@{} headers:nil progress:^(NSProgress * _Nonnull progress) {
        NSLog(@"progress:---%@",progress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"成功:---%@",dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败:---%@",error);
    }];
}

- (CicadaTabWidget *)tabWidget {
    if (!_tabWidget) {
        _tabWidget = [[CicadaTabWidget alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
        _tabWidget.tabDataSource = @[@"推荐",@"豆瓣",@"电视剧",@"综艺",@"电影",@"动漫",@"纪录片"];
        _tabWidget.delegate = self;
    }
    return  _tabWidget;
}

#pragma mark  CicadaTabWidgetDelegate
- (void)tabWidget:(CicadaTabWidget *)tabWidget didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.width * indexPath.row, 0) animated:YES];
}

#pragma mark  UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self.scrollView setContentOffset:CGPointMake(kScreenWidth * index, 0) animated:YES];
    [self.tabWidget selectIndex:index finishBlock:nil];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.tabWidget.bottom, kScreenWidth, kScreenHeight - kNavigationHeight - kTabbarHeight - self.tabWidget.height)];
        _scrollView.backgroundColor = UIColor.greenColor;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(self.tabWidget.tabDataSource.count * kScreenWidth, 0);
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        [self.tabWidget.tabDataSource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth * idx, 0, kScreenWidth, _scrollView.height)];
            view.backgroundColor = randomColor;
            [_scrollView addSubview:view];
        }];
    }
    return _scrollView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[TestViewController new] animated:YES];
}

@end
