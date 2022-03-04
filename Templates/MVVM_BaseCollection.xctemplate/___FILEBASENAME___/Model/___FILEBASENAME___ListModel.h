//___FILEHEADER___

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class ___VARIABLE_productName___InfoModel;
@interface ___FILEBASENAMEASIDENTIFIER___ : BaseModel

@property (nonatomic,assign) NSInteger pages; // 总页数
@property (nonatomic,assign) NSInteger current; // 当前页

@property (nonatomic,copy) NSString *total; // 总条数
@property (nonatomic,copy) NSString *size; // 每页个数

@property (nonatomic,strong) NSArray <___VARIABLE_productName___InfoModel *> *records;

@end


@interface ___VARIABLE_productName___InfoModel : BaseModel

@end


NS_ASSUME_NONNULL_END
