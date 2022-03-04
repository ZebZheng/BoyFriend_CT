//___FILEHEADER___

#import "___FILEBASENAME___.h"
#import "___VARIABLE_productName___Cell.h"
#import "___VARIABLE_productName___ListModel.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()

/// Collection Section 四边间距
@property(nonatomic, assign) UIEdgeInsets insetSection;
/// item之间的间距
@property(nonatomic, assign) CGFloat minimumInteritemSpacing;
/// section中不同的item之间的行间距
@property(nonatomic, assign) CGFloat minimumLineSpacing;
/// 一行或者一列的数量
@property(nonatomic, assign) NSInteger interitemNumber;
/// Item 的高
@property(nonatomic, assign) CGFloat itemHeight;

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

- (instancetype)init{
    self = [super init];
    if (self) {
        self.insetSection = UIEdgeInsetsMake(10, 10, 20, 10);
        self.minimumLineSpacing = 50;
        self.minimumInteritemSpacing = 10;
        self.interitemNumber = 6;
        self.itemHeight = 120;
    }
    return self;
}

//MARK: - 下拉
-(void)refreshData {
    @weakify(self);
    [self asyncGetListWithPage:1 successBlock:^(BaseResponseData *result) {
        @strongify(self);
        [self.dataSource removeAllObjects];
        if (self.isNeedPaging) {
            ___VARIABLE_productName___ListModel * listModel = result.extendModel;
            [self.dataSource addObject:listModel.records];
            [self dataSetWithPageNow:listModel.current Count:listModel.pages];
        } else {
            NSArray * listModel = result.extendModel;
            [self.dataSource addObject:listModel];
            [self dataSetWithPageNow:1 Count:1];
        }
        self.reloadCollectionView = YES;
        if (self.dataSource.count==0) {
            BFBlock_Safe_Calls(self.placeholderBlock,YES,BFPlaceholderViewTypeNoList,NO);
        }else{
            BFBlock_Safe_Calls(self.placeholderBlock,NO,BFPlaceholderViewTypeNoList,NO);
        }
        
    } failureBlock:^(BaseResponseData *result) {
        @strongify(self);
        self.endRefreshing = YES;
        [self showMessageInView:result.info];

        if ([result.code isEqualToString:BFInteger_To_String(Server_Code_Minus1009)]) {
            BFBlock_Safe_Calls(self.placeholderBlock,YES,BFPlaceholderViewTypeNoNet,YES);
        } else {
            BFBlock_Safe_Calls(self.placeholderBlock,NO,BFPlaceholderViewTypeNoList,NO);
        }
    }];
}

//MARK: - 上提
-(void)getMoreData {
    if (self.pageNow==self.count) {
        self.endRefreshing = YES;
        return;
    }
    @weakify(self);
    [self asyncGetListWithPage:self.pageNow + 1 successBlock:^(BaseResponseData *result) {
        @strongify(self);
        ___VARIABLE_productName___ListModel * listModel = result.extendModel;
        if (self.dataSource.count>0) {
            NSMutableArray *tempArr = [NSMutableArray arrayWithArray:self.dataSource.firstObject];
            [tempArr addObjectsFromArray:listModel.records];
            [self.dataSource replaceObjectAtIndex:0 withObject:tempArr];
        } else {
            [self.dataSource addObject:listModel.records];
        }
        self.reloadCollectionView = YES;
        [self dataSetWithPageNow:listModel.current Count:listModel.pages];
        
    } failureBlock:^(BaseResponseData *result) {
        @strongify(self);
        self.endRefreshing = YES;
        [self showMessageInView:result.info];
    }];
}

/**
 *  获取列表数据
 *
 */
- (void)asyncGetListWithPage:(NSInteger)page
                successBlock:(successCallback)successBlock
                failureBlock:(failCallback)failureBlock {
    NSMutableDictionary * mDic = [NSMutableDictionary new];
    Class class = nil;
    if (self.isNeedPaging) {
        [mDic setValue:[NSString stringWithFormat:@"%zd",page] forKey:@"page"];
        [mDic setValue:BFApi_ListPageSize forKey:@"rows"];
        class = [___VARIABLE_productName___ListModel class];
    } else {
        class = [___VARIABLE_productName___InfoModel class];
    }
    [[NetWorkHelper sharedInstance] getWithUriString:<#uri#> parameters:mDic successBlock:^(id responseObject) {
        [self handleResponse:responseObject Resp:class completion:^(BOOL success, BaseResponseData *respData) {
            if (success) {
                BFBlock_Safe_Calls(successBlock, respData);
            } else {
                BFBlock_Safe_Calls(failureBlock, respData);
            }
        }];
    } failureBlock:^(BaseResponseData *error) {
        BFBlock_Safe_Calls(failureBlock, error);
    }];
}

#pragma mark - 协议
//MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource
///定义每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewFlowLayout * layout = (UICollectionViewFlowLayout *)collectionViewLayout;
        ///水平
    if (layout.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        CGFloat h = ((collectionView.bf_height - self.insetSection.top - self.insetSection.bottom - self.minimumInteritemSpacing * (self.interitemNumber - 1)) - 2);
        return CGSizeMake(self.itemHeight,h/self.interitemNumber);
        
    } else {
        CGFloat w = BFScreen_Width - self.insetSection.left - self.insetSection.right - self.minimumInteritemSpacing * (self.interitemNumber - 1) - 2;
        return CGSizeMake(w/self.interitemNumber , self.itemHeight);
    }
}
///定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return self.insetSection;
}

///每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return self.minimumInteritemSpacing;
}

///每个section中不同的item之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return self.minimumLineSpacing;
}

//MARK: - 展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ___VARIABLE_productName___InfoModel * infoModel = [[self.dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    ___VARIABLE_productName___Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([___VARIABLE_productName___Cell class]) forIndexPath:indexPath];

    [cell bf_setupWithData:infoModel];
    
    return cell;
}
//MARK: - 被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

}

@end
