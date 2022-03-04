//___FILEHEADER___

#import "___FILEBASENAME___.h"
#import "___VARIABLE_productName___View.h"
#import "___VARIABLE_productName___ViewModel.h"
#import "___VARIABLE_productName___Cell.h"
@interface ___FILEBASENAMEASIDENTIFIER___ ()

@property (nonatomic,strong) ___VARIABLE_productName___View * productView;
@property (nonatomic,strong) ___VARIABLE_productName___ViewModel * productViewModel;

@end

@implementation ___FILEBASENAMEASIDENTIFIER___
#pragma mark - Lifecycle
-(instancetype)init{
    if (self=[super init]) {
        // 如果需要分页  建议 同步开启 上提  下拉 刷新
        self.isNeedPaging = <#YES#>;
//        self.isUseRefreshHeader = YES;
//        self.isUseRefreshFooter = YES;
//        self.isAutoRequestMore = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeView];
    [self initializeViewData];
    [self bindControlEvent];
    
}

#pragma mark - init
/**** 视图初始化 ****/
-(void)initializeView {
    [self.collectionView registerClass:[___VARIABLE_productName___Cell class] forCellWithReuseIdentifier:___VARIABLE_productName___Cell.bf_reuseIdentifier];
}
/**** 数据初始化 ****/
-(void)initializeViewData {
    [self bindControlEventViewModel:self.productViewModel];
    [self refreshHeaderAction];
}
/**** 事件绑定 ****/
-(void)bindControlEvent {
    
}


#pragma mark - function


#pragma mark - logical processing（逻辑处理）


#pragma mark - Data


#pragma mark - Event Response / IBActions


#pragma mark - Protocol / delegat


#pragma mark - Notification


#pragma mark - Setter


#pragma mark - Getter
- (___VARIABLE_productName___View *)productView {
    if (!_productView) {
        _productView = [___VARIABLE_productName___View.alloc init];
    }
    return _productView;
}
- (___VARIABLE_productName___ViewModel *)productViewModel {
    if (!_productViewModel) {
        _productViewModel = [___VARIABLE_productName___ViewModel.alloc init];
    }
    return _productViewModel;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
