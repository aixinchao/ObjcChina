//
//  ACMacros.h
//  UUChatTableViewDemo
//
//  Created by Taskmall on 16/4/5.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#ifndef ACMacros_h
#define ACMacros_h

//http://www.cocoachina.com/bbs/read.php?tid=299721

//沙盒路径
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]   //NSDocumentDirectory 程序中对面的Documents路径  NSHomeDirectory() 沙盒根路径
    //http://blog.csdn.net/xyz_lmn/article/details/8968213

//DEBUG LOG  http://blog.sina.com.cn/s/blog_7ed5aa990101ka2f.html
#ifdef DEBUG
#define DLog(s,...) NSLog(@"< %@:(%d) > %@",[[NSString stringWithUTF8String:__FILE__] lastPathComponent],__LINE__,[NSString stringWithFormat:(s),##__VA_ARGS__])  //__VA_ARGS__ 是一个可变参数的宏 宏前面加上##的作用在于 当可变参数的个数为0时 这里的##起到把前面多余的","去掉 否则会编译出错    __FILE__ 宏在预编译时会替换成当前的源文件名    __LINE__宏在预编译时会替换成当前的行号    __FUNCTION__宏在预编译时会替换成当前的函数名称
#else
#define DLog(s,...)
#endif

//DEBUG RELEASE
#if DEBUG
#define MCRelease(x)        [x release]
#else
#define MCRelease(x)        [x release],x = nil
#endif

#define NILRelease(x)       [x release],x = nil

#pragma mark -- Frame (宏 x, y, width, height)
//App Frame
#define Application_Frame       [[UIScreen mainScreen] applicationFrame]
//App Frame Height & Width
#define App_Frame_Height        [[UIScreen mainScreen] applicationFrame].size.height    //app显示的区域  不包含状态栏(高度20)
#define App_Frame_Width         [[UIScreen mainScreen] applicationFrame].size.width

//MainScreenHeight & Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width

//View 坐标(x,y)和高度(width,height)
#define X(v)                    (v).frame.origin.x
#define Y(v)                    (v).frame.origin.y
#define WIDTH(v)                (v).frame.size.width
#define HEIGHT(v)               (v).frame.size.height

#define MinX(v)                 CGRectGetMinX((v).frame)
#define MinY(v)                 CGRectGetMinY((v).frame)

#define MidX(v)                 CGRectGetMidX((v).frame)
#define MidY(v)                 CGRectGetMidY((v).frame)

#define MaxX(v)                 CGRectGetMaxX((v).frame)
#define MaxY(v)                 CGRectGetMaxY((v).frame)

#define RECT_CHANGE_x(v,x)          CGRectMake(x,Y(v),WIDTH(v),HEIGHT(v))
#define RECT_CHANGE_y(v,y)          CGRectMake(X(v),y,WIDTH(v),HEIGHT(v))
#define RECT_CHANGE_point(v,x,y)    CGRectMake(x,y,WIDTH(v),HEIGHT(v))
#define RECT_CHANGE_width(v,w)      CGRectMake(X(v),Y(v),w,HEIGHT(v))
#define RECT_CHANGE_height(v,h)     CGRectMake(X(v),Y(v),WIDTH(v),h)
#define RECT_CHANGE_size(v,w,h)     CGRectMake(X(v),Y(v),w,h)

//系统控件默认高度
#define kStatusBarHeight        (20.f)
#define kTopBarHeight           (44.f)
#define kBottomBarHeight        (49.f)
#define kCellDefaultHeight      (44.f)
#define kEnglishKeyboardHeight  (216.f)
#define kChineseKeyboardHeight  (252.f)

#pragma mark -- Funtion Method (宏 方法)
//PNG JPG 图片路径
#define PNGPATH(NAME)           [[NSBundle mainBundle] pathForResource:NAME ofType:@"png"]
#define JPGPATH(NAME)           [[NSBundle mainBundle] pathForResource:NAME ofType:@"jpg"]
#define PATH(NAME,EXT)          [[NSBundle mainBundle] pathForResource:(NAME) o fType:(EXT)]

//加载图片
#define PNGIMAGE(NAME)          [UIImage imageWithContentOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define JPGIMAGE(NAME)          [UIImage imageWithContentOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define IMAGE(NAME,EXT)         [UIImage imageWithContentOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:EXT]]

//字体大小 (常规/粗体)
#define BOLDSYSTEMFONT(FONTSIZE)    [UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)        [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME,FONTSIZE)         [UIFont fontWithName:(NAME) size:(FONTSIZE)]

//颜色（RGB）
#define RGBCOLOR(r,g,b)         [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1]
#define RGBACOLOR(r,g,b,a)      [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]

//number转String
#define IntTranslateStr(int_str)    [NSString stringWithFormat:@"%d",int_str]

//当前版本
#define FSystemVersion          [[[UIDevice currentDevice] systemVersion] floatValue]
#define DSystemVersion          [[[UIDevice currentDevice] systemVersion] doubleValue]
#define SSystemVersion          [[UIDevice currentDevice] systemVersion]

//当前语言
#define CURRENTLANGUAGE         [[NSLocale preferredLanguages] objectAtIndex:0]

#define isIOS8                  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#if TARGET_OS_IPHONE
/** iPhone Device */
#endif

#if TARGET_IPHONE_SIMULATOR
/** iPhone Simulator */
#endif

#if __has_feature(obc_arc)
/** Compiling with ARC */
#else
/** Compiling without ARC */
#endif

#pragma mark -- Constants (宏 常量)
//时间间隔
#define kHUDDuration            (1.f)
//一天的秒数
#define SecondsOfDay            (24.f * 60.f * 60.f)
//秒数
#define Seconds(Days)           (24.f * 60.f * 60.f * (Days))
//一天的毫秒数
#define MillisecondsOfDay       (24.f * 60.f * 60.f * 1000.f)
//毫秒数
#define Milliseconds(Days)      (24.f * 60.f * 60.f * 1000.f * (Days))



#endif /* ACMacros_h */
