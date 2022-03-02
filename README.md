# BoyFriend配套的 CodeSnippets 和 模板

CodeSnippets  部分来源于 https://github.com/QMUI/QMUI_iOS_CodeSnippets

CodeSnippets路径：~/Library/Developer/Xcode/UserData/CodeSnippets

模板路径：~/Library/Developer/Xcode/Templates/

#使用方式

Xcode 的 Code Snippets 文件存放于 ~/Library/Developer/Xcode/UserData/CodeSnippets 目录，只要直接把 codesnippets 文件放到这个目录下（若没有则自己创建），重启 Xcode 即可生效。

Xcode 的 自定义模板 文件存放于 ~/Library/Developer/Xcode/Templates 目录，只要直接把 Templates 文件放到这个目录下（若没有则自己创建 即可生效。

#快捷键

aa1 - 注释 竖

aa2 - 注释 横

aa3 - 注释 三斜杠

action_view - action - View 初始化

action_viewControl - action -ViewControl 初始化

ees - 强引用

eew - 弱引用


pa - 定义一个 assign 的 property
par - 定义一个 assign, readonly 的 property
pc - 定义一个 copy 的 property
pcr - 定义一个 copy, readonly 的 property
ps - 定义一个 strong 的property
psr - 定义一个 strong, readonly 的property
pw - 定义一个 weak 的property
pwr - 定义一个 weak, readonly 的property
pb - 定义一个 block 的property
pdelegate - 定义一个delegate的property
pstring - 定义一个 String 的property
pimageView  - 定义一个 UIImageView 的property
pview - 定义一个 UIView 的property
plabel - 定义一个 UILabel 的property
pbutton  - 定义一个 UIButton 的property
pmodelcopy - 模型的copy 协议
ptypeSelf - 枚举类型
pblocktypedef - typedef block


propertySwizzleAssign - 用 swizzle 的方式定义一个 assign 的property
propertySwizzleCopy - 用 swizzle 的方式定义一个 copy 的property
propertySwizzleStrong - 用 swizzle 的方式定义一个 strong 的property
propertySwizzleWeak - 用 swizzle 的方式定义一个 weak 的property
paddChildViewController 添加子控制器
premoveFromParentViewController - 从父控制器上移除
ptap - 单击手势
paddtarget - UIControl Add Target


pprotocal - 定义 代理方法
ppmark - mark 注释
pmark - mark 备注
pifndef - 校验宏
plog - 输出日志
plogCallStackSymbols - 打印堆栈信息
pcornerRadius - 给控件设置圆角
pdebug - 判断是否是DEBUG模式
pdelegateSelector - delegate 判断是否定义指定的代码方法
pdeprecated - 弃用 属性或方法   放在后面  有使用会警告

ptabscrollNever - UITableView Scroll Never 防止出现上下空隙
ptabdelegate - UITableView 必须实现的代理
ptabcellreuse  - cell 复用
ptabinitWithStyleForCell - UITableViewCell的默认初始化方法
ptabdelele - tableview 删除相关代理
ptabcellForRowAtIndexPath  - cellForRowAtIndexPath 
ptabdidSelectRowAtIndexPath - didSelectRowAtIndexPath:
ptabheightForRowAtIndexPath - heightForRowAtIndexPath:
ptabnumberOfRowsInSection - numberOfRowsInSection:
ptabnumberOfSectionsInTableView - numberOfSectionsInTableView:


pcoldelegate - UICollectionViewDelegate
pcolcellForItemAtIndexPath  - cellForItemAtIndexPath:
pcoldidSelectItemAtIndexPath - didSelectItemAtIndexPath:
pcolnumberOfItemsInSection - numberOfItemsInSection
pcolnumberOfSectionsInCollectionView - numberOfSectionsInCollectionView:
pcolsizeForItemAtIndexPath - sizeForItemAtIndexPath:



fnv - 定义一个返回值为 void 的方法
fnv: - 定义一个返回值为 void 且带参数的方法
fnblock - 定义一个返回值类型为 block 的方法
fnv_handleEvent - 定义一个用于 UIControl 事件回调的方法
fnv_longPress - 定义一个用于 UILongPressGestureRecognizer 的回调方法（你就不用每次都去拼写那个很长的手势名字了）
fnv_pan - 定义一个用于 UIPanGestureRecognizer 的回调方法
fnv_tap - 定义一个用于 UITapGestureRecognizer 的回调方法
fnvload_once - load dispatch once
fnvsharedInstance - sharedInstance 单例
fnvviewDidLoad - viewDidLoad
fnvviewWillAppear - viewWillAppear:
fnvviewDidAppear - viewDidAppear:
fnvviewDidLayoutSubviews - viewDidLayoutSubviews:
fnvviewWillDisappear - viewWillDisappear:
fnvviewDidDisappear - viewDidDisappear:
fnvupdateViewConstraints - UIViewController 更新布局约束
fnvupdateConstraints - UIView 更新布局约束
fnvlayoutSubviews - layoutSubviews:
fnvloadView - loadView


ggetHeight     - CGRectGetHeight
ggetMinX         - CGRectGetMinX
ggetMinY      - CGRectGetMinY
ggetWidth     - CGRectGetWidth
ssetFrame   - set Frame
ssButtonImage - set UIButton Image
ssButtonTitle - set UIButton Title
ssButtonTitleColor - set UIButton Title Color


GCD-after   - afterGCD在指定几秒之后主线程执行
GCD-main    - mainGCD在主线程异步执行
GCD-global  - globalGCD在子线程异步执行
GCD-group   - groupGCD 多任务 -不能异步
GCD-group   - groupGCD 多任务 -能异步
GCD-wait    - waitGCD 等待执行

qq - 懒加载
qq_view - 懒加载-View
qq_imageview - 懒加载-ImageView
qq_label - 懒加载-Label
qq_button_title - 懒加载-Button-Title
qq_button_image - 懒加载-Button-Image
qq_button_title_image - 懒加载-Button-Title-Image


tmb_hud   -  MBHud 提示
tmj_replacekey - MJ 属性关键字转换
tmj_array - MJ 数组映射
tmj_keyvalue  - MJ 字典转模型
tmj_keyvaluearray - MJ 字典数组 转 模型数组
tmj_allowedNames - 只有这个数组中的属性名才允许进行字典和模型的转换
tmj_ignoredNames - 这个数组中的属性名将会被忽略：不进行字典和模型的转换

trac_combine - RAC Combine
trac_kvo - RAC KVO Observe
trac_button - RAC-按钮事件
trac_textfield - RAC-输入框监听值变化
trac_timer_main  - RAC-定时器-主线程
trac_timer_name - RAC-定时器-子线程
trac_selector - RAC-监听方法
trac_protocal - RAC-监听协议
trac_notification - RAC-通知

tms_makeConstraints - MS makeConstraints
tms_updateConstraints - MS updateConstraints
tms_remakeConstraints - MS remakeConstraints
tms_make_edges - MS make edges
tms_make_tlr - MS make top left right
tms_make_tlrb - MS make top left right bottom
tms_make_tlrh - MS make top left right height
tms_make_tlwh - MS make top left width height
tms_make_tls - MS make top left size
tms_make_ly - MS make left centerY
tms_make_ry - MS make right centerY
tms_make_tx - MS make top centerX
tms_make_bx - MS make bottom centerX



osif - iOS 系统版本的判断
timeConsuming - 耗时计算
externRefInH - 在 *.h 文件里声明一个 extern const 的指针
externRefInM - 在 *.m 文件里为一个 extern const 的指针赋值
externValueInH - 在 *.h 文件里声明一个 extern const 的值变量
externValueInM - 在 *.m 文件里为一个 extern const 的变量赋值
static reference - 定义一个 static 的指针
static - 定义一个 static 的值变量
sizeThatFits - 为当前 view 创建 sizeThatFits: 方法
blockvar - 定义一个作为局部变量的 block
blockParameterInFunction - 声明一个用于 C 函数参数的 block
blockParameterInMethod - 声明一个用于 OC 方法参数的 block







