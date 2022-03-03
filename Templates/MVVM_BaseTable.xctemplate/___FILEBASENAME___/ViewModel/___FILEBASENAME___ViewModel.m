//___FILEHEADER___

#import "___FILEBASENAME___.h"
#import "___VARIABLE_productName___Cell.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()


@end

@implementation ___FILEBASENAMEASIDENTIFIER___



//MARK: - 下拉
-(void)refreshData{
    @weakify(self);
    [self asyncGet<#name#>ListWithPage:1 Success:^(BaseResponseData *result) {
        @strongify(self);
        ___VARIABLE_productName___ListModel * listModel = result.extendModel;
        [self.dataSource removeAllObjects];
        [self.dataSource addObject:listModel.records];
        self.reloadTableView = YES;
        [self dataSetWithPageNow:listModel.current Count:listModel.pages];
        if (self.dataSource.count==0) {
            BFBlock_Safe_Calls(self.placeholderBlock,YES,BFPlaceholderViewTypeNoList,NO);
        }else{
            BFBlock_Safe_Calls(self.placeholderBlock,NO,BFPlaceholderViewTypeNoList,NO);
        }
        
    } Failure:^(BaseResponseData *result) {
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
    [self asyncGet<#name#>ListWithPage:self.pageNow + 1 Success:^(BaseResponseData *result) {
        @strongify(self);
        ___VARIABLE_productName___ListModel * listModel = result.extendModel;
        if (self.dataSource.count>0) {
            NSMutableArray *tempArr = [NSMutableArray arrayWithArray:self.dataSource.firstObject];
            [tempArr addObjectsFromArray:listModel.records];
            [self.dataSource replaceObjectAtIndex:0 withObject:tempArr];
        } else {
            [self.dataSource addObject:listModel.records];
        }
        self.reloadTableView = YES;
        [self dataSetWithPageNow:listModel.current Count:listModel.pages];
        
    } Failure:^(BaseResponseData *result) {
        @strongify(self);
        self.endRefreshing = YES;
        [self showMessageInView:result.info];
    }];
}

/**
 *  获取列表数据
 *
 */
- (void)asyncGet<#name#>ListWithPage:(NSInteger)page
                     Success:(successCallback)successBlock
                     Failure:(failCallback)failureBlock {
    NSMutableDictionary * mDic = [NSMutableDictionary new];
    [mDic setValue:[NSString stringWithFormat:@"%zd",page] forKey:@"page"];
    [mDic setValue:BFApi_ListPageSize forKey:@"rows"];

    [[NetWorkHelper sharedInstance] getWithUriString:<#url#> Parameters:mDic  Success:^(id responseObject) {
        [self handleResponse:responseObject Resp:[___VARIABLE_productName___ListModel class] completion:^(BOOL success, BaseResponseData *respData) {
            if (success) {
                BFBlock_Safe_Calls(successBlock, respData);
            } else {
                BFBlock_Safe_Calls(failureBlock, respData);
            }
        }];
    } Failure:^(BaseResponseData *error) {
        BFBlock_Safe_Calls(failureBlock, error);
    }];
}


#pragma mark - 协议
//MARK: - UITableViewDelegate, UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ___VARIABLE_productName___InfoModel * infoModel = [[self.dataSource objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    ___VARIABLE_productName___Cell * cell = [tableView dequeueReusableCellWithIdentifier:[___VARIABLE_productName___Cell bf_reuseIdentifier]];
    if(cell==nil){
        cell=[[___VARIABLE_productName___Cell alloc] initWithStyle:UITableViewCellStyleDefault      reuseIdentifier:[___VARIABLE_productName___Cell bf_reuseIdentifier]];
    }
    [cell bf_setupWithData:infoModel];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
