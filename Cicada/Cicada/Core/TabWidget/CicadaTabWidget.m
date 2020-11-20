//
//  CicadaTabWidget.m
//  Cicada
//
//  Created by 知了 on 2020/11/15.
//

#import "CicadaTabWidget.h"

static NSString *tabCellReuseIdentifier = @"tabCellReuseIdentifier";

@interface CicadaTabWidget()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation CicadaTabWidget

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = COLOR_WHITE;
        [self initialize];
        [self addViews];
    }
    return self;
}

- (void)initialize {
    self.selectedIndex = 0;
    self.halfSpace = 20;
    
}

- (void)addViews {
    [self addSubview:self.collectionView];
}

#pragma mark  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return  1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  self.tabDataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CicadaTabCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:tabCellReuseIdentifier forIndexPath:indexPath];
    [cell handleData:self.tabDataSource[indexPath.row]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CicadaTabModel *model = self.tabDataSource[indexPath.row];
    return model.tabCellSize;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self selectIndex:indexPath.row finishBlock:nil];
    if ([self.delegate respondsToSelector:@selector(tabWidget:didSelectItemAtIndexPath:)]) {
        [self.delegate tabWidget:self didSelectItemAtIndexPath:indexPath];
    }
}

#pragma mark  lazy

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = COLOR_WHITE;
        [_collectionView registerClass:[CicadaTabCollectionViewCell class] forCellWithReuseIdentifier:tabCellReuseIdentifier];
    }
    return _collectionView;
}

- (void)setTabDataSource:(NSArray *)tabDataSource {
    NSMutableArray *tmpDataSource = @[].mutableCopy;
    [tabDataSource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CicadaTabModel *model = [[CicadaTabModel alloc]init];
        model.defaultHalfSpace = self.halfSpace;
        model.title = AssignmentStr(obj);
        //设置默认选中
        model.isSelected = idx == self.selectedIndex;
        [tmpDataSource addObject:model];
    }];
    _tabDataSource = tmpDataSource;
}

- (void)selectIndex:(NSInteger)selectIndex finishBlock:(void(^_Nullable)(void))finishBlock {
    [self.tabDataSource enumerateObjectsUsingBlock:^(CicadaTabModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.isSelected = selectIndex == idx;
    }];
    [self.collectionView reloadData];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:selectIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    !finishBlock ? : finishBlock();
}

@end
