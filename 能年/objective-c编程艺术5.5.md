##Objective-C编程艺术
###条件语句
条件语句体应该总是被大括号包围。尽管有时候你可以不使用大括号，但是这样做会带来问题隐患。
######推荐：
if (!error) {

	return success;
	
}
######不推荐：
if (!error) 

	return success;
	
和

if (!error) return success;
###尤达表达式
不要使用尤达表达式。
######推荐：
if ([myValue isEqual:@520]) { ...
######不推荐：
if ([@520 isEqual:myValue]) { ...
###nil和BOOL检查
######推荐：
if (someObject) { ...

if (![someObject boolValue]) { ...

if (!someObject) { ...
######不推荐：
if (someObject == YES) { ...

if (myRawValue == YES) { ...

if ([someObject boolValue] == NO) { ...
###黄金大道
在使用条件语句编程时，大妈的左边距应该是一条“黄金”或者“快乐的大道”。也就是说，不要嵌套if语句。使用多个return可以避免增加循环的复杂度，并提高代码的可读性。因为方法的重要部分没有嵌套在分支里面，并且你可以很清楚的找到相关的代码。
######推荐：
\- (void)someMethod {

	if (![someOther boolValue]) {
		return;		
	}
	//Do something important
}
######不推荐：
\- (void)someMethod {
	
	if ([someOther boolValue]) {
		//Do something important
	}
	
}
###三元运算符(三目运算符)
######推荐：
result = a > b ? x : y;
######不推荐：
result = a > b ? x = c > d ? c : d : y;
当三元运算符的第二个参数返回和条件语句中已经检查的对象一样的时候，下面的表达方式更灵巧：
######推荐：
result = object ? : [self createObject];
######不推荐：
result = object ? object : [self createObject];
###枚举类型
当使用enum的时候，建议使用新的固定的基础类类型定义，因为它有更强大的类型检查和代码补全。SDK现在有一个宏来鼓励和促进使用固定类型定义 - NS_ENUM()
######例子：
typedef NS_ENUM (NSUInteger,ZOCMachineState) {

	ZOCMachineStateNone,
	ZOCMachineStateIdle,
	ZOCMachineStateRunning,
	ZOCMachineStatePaused
};
###命名
####通用的约定
尽可能遵守Apple的命名约定，尤其是和内存管理规则（NARC）相关的地方。推荐使用长的，描述性的方法和变量名。
######推荐：
UIButton * settingsButton；
######不推荐：
UIButton * setBut；
###常量
常量应该以驼峰法命名，并以相关类名作为前缀。
######推荐：
static const NSTimeInterval ZOCSignInViewControllerFadeOutAnimationDuration = 0.4;
######不推荐：
static const NSTimeInterval fadeOutTime = 0.4;

常量应该用static声明为静态常量，而不要用#define，除非它明确的作为一个宏来使用。
######推荐：
static NSString * const ZOCCacheControllerDidClearCacheNotification = @"ZOCCacheControllerDidClearCacheNotification";

static const CGFloat ZOCImageThumbnailHeight = 50.0f;
######不推荐：
\#define CompanyName @"Apple Inc."

\#define magicNumber 42

常量应该在头文件(.h)中以这样的形式暴露给外部：

extern NSString *const ZOCCacheControllerDidClearCacheNotification;

并在实现文件（.m）中为它赋值。
###类
####类名
类名应该以三个大写字母作为前缀（双字母前缀为Apple的类预留）。尽管这个规范看起来有些古怪，但是这样做可以减少Objective-C没有命名空间所带来的问题。
###Initializer和dealloc
推荐的代码组织方式是将dealloc方法放在实现文件的最前面（直接在@synthesize以及@dynamic之后），init应该跟在dealloc方法后面。

如果有多个初始化方法， 指定初始化方法 (designated initializer) 应该放在最前面，间接初始化方法 (secondary initializer) 跟在后面，这样更有逻辑性。如今有了 ARC，dealloc 方法几乎不需要实现，不过把 init 和 dealloc 放在一起可以从视觉上强调它们是一对的。通常，在 init 方法中做的事情需要在 dealloc 方法中撤销。

init方法应该是这样的结构：

\- (instancetype)init {
	
	self = [super init];	//call the designated initializer
	if (self) {
		//custom initialization
	}
	return self;

}

为什么设置 self 为 [super init] 的返回值，以及中间发生了什么呢？这是一个十分有趣的话题。

我们退一步讲：我们常常写 [[NSObject alloc] init] 这样的代码，从而淡化了 alloc 和 init 的区别。Objective-C 的这个特性叫做 两步创建 。

这意味着申请分配内存和初始化被分离成两步，alloc 和 init。

* alloc 负责创建对象，这个过程包括分配足够的内存来保存对象，写入 isa 指针，初始化引用计数，以及重置所有实例变量。
* init 负责初始化对象，这意味着使对象处于可用状态。这通常意味着为对象的实例变量赋予合理有用的值。

alloc 方法将返回一个有效的未初始化的对象实例。每一个对这个实例发送的消息会被转换成一次 objc_msgSend() 函数的调用，形参 self 的实参是 alloc 返回的指针；这样 self 在所有方法的作用域内都能够被访问。

按照惯例，为了完成两步创建，新创建的实例第一个被调用的方法将是 init 方法。注意，NSObject 在实现 init 时，只是简单的返回了 self。

关于 init 的约定还有一个重要部分：这个方法可以（并且应该）通过返回 nil 来告诉调用者，初始化失败了；初始化可能会因为各种原因失败，比如一个输入的格式错误了，或者另一个需要的对象初始化失败了。 这样我们就能理解为什么总是需要调用 self = [super init]。如果你的父类说初始化自己的时候失败了，那么你必须假定你正处于一个不稳定的状态，因此在你的实现里不要继续你自己的初始化并且也返回 nil。如果不这样做，你可能会操作一个不可用的对象，它的行为是不可预测的，最终可能会导致你的程序崩溃。

init 方法在被调用的时候可以通过重新给 self 重新赋值来返回另一个实例，而非调用的那个实例。例如类簇，还有一些 Cocoa 类为相等的（不可变的）对象返回同一个实例。
####Designated和Secondary初始化方法
Objective-C 有指定初始化方法(designated initializer)和间接(secondary initializer)初始化方法的观念。 designated 初始化方法是提供所有的参数，secondary 初始化方法是一个或多个，并且提供一个或者更多的默认参数来调用 designated 初始化的初始化方法。

@implementation ZOCEvent

\- (instancetype)initWithTitle:(NSString *)title date:(NSDate *)date location:(CLLocation *)location {

	self = [super init];
	if (self) {
		_title = title;
		_date = date;
		_location = location;
	}
}

\- (instatncetype)initWithTitle:(NSString *)title date:(NSDate *)date {

	return [self initWithTitle:title date:date location:nil];
	
}

\- (instancetype)initWithTitle:(NSString *)title {
	
	return [self initWithTitle:title date:[NSDate date] location:nil];
	
}

initWithTitle:date:location: 就是 designated 初始化方法，另外的两个是 secondary 初始化方法。因为它们仅仅是调用类实现的 designated 初始化方法