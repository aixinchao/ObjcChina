//
//  Header.h
//  CoreDataDemo
//
//  Created by Taskmall on 16/4/21.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define SETNUM(string) [[NSUserDefaults standardUserDefaults] setObject:string forKey:@"num"];[[NSUserDefaults standardUserDefaults] synchronize]

#define GETNUM [[[NSUserDefaults standardUserDefaults] objectForKey:@"num"] integerValue]

#define NUM 1

#ifdef GETNUM
#define rel 1
#else
#define rel 2
#endif

#endif /* Header_h */
