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
//MARK: - UITableViewDelegate, UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ___VARIABLE_productName___Cell * cell = [tableView dequeueReusableCellWithIdentifier:[___VARIABLE_productName___Cell bf_reuseIdentifier]];
    if(cell==nil){
        cell=[[___VARIABLE_productName___Cell alloc] initWithStyle:UITableViewCellStyleDefault      reuseIdentifier:[___VARIABLE_productName___Cell bf_reuseIdentifier]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
