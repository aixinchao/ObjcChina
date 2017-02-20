//
//  TMHeader.h
//  TestViewDemo
//
//  Created by Taskmall on 16/10/18.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#ifndef TMHeader_h
#define TMHeader_h

#define kWidth          [UIScreen mainScreen].bounds.size.width
#define kHeight         [UIScreen mainScreen].bounds.size.height

#ifdef DEBUG
#define TMHTTPURL NSUDGetObject(@"HttpURL")
#else
#define TMHTTPURL @"https://app.taskmall.cn/v2"
#endif

#define TM18Font (kWidth==320.f)?16.f:18.f
#define TM17Font (kWidth==320.f)?15.f:17.f
#define TM16Font (kWidth==320.f)?14.f:16.f
#define TM15Font (kWidth==320.f)?13.f:15.f
#define TM14Font (kWidth==320.f)?13.f:14.f

#define TMCONHTTPURL(U) [NSString stringWithFormat:@"%@/%@",TMHTTPURL,U]

#define Class(ClassName) NSClassFromString(@#ClassName)

#define NSUDSetObject(Object,Key) [[NSUserDefaults standardUserDefaults] setObject:Object forKey:Key];[[NSUserDefaults standardUserDefaults] synchronize]
#define NSUDGetObject(Key) [[NSUserDefaults standardUserDefaults] objectForKey:Key]

#define kBarColor [UIColor colorWithRed:60/255.0 green:178/255.0 blue:146/255.0 alpha:1]
//#666666 字体
#define kkTitleSixColor [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]
//#f8f8f8 BarBG
#define kkBarBGColor [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1]

#endif /* TMHeader_h */
