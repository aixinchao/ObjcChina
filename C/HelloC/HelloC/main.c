//
//  main.c
//  HelloC
//
//  Created by Taskmall on 16/8/1.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#include <stdio.h>
#include "print.h"

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    printHello();
    int x,y,m;
    printf("Please input x and y\n");
    scanf("%d%d",&x,&y);
    m = x * y;
    printf("%d * %d = %d\n",x,y,m);
    return 0;
}
