//___FILEHEADER___

#import "___FILEBASENAME___.h"
#import "___VARIABLE_productName___Cell.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()


@end

@implementation ___FILEBASENAMEASIDENTIFIER___




//MARK: - 下拉
-(void)refreshData{
    
}

//MARK: - 上提
-(void)getMoreData {
    
}

#pragma mark - 协议
//MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return UICollectionViewFlowLayoutAutomaticSize;
}

//MARK: - 展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ___VARIABLE_productName___Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([___VARIABLE_productName___Cell class]) forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[___VARIABLE_productName___Cell alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    }
    return cell;
}
//MARK: - 被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

}

@end
