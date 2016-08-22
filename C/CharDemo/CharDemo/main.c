//
//  main.c
//  CharDemo
//
//  Created by Taskmall on 16/8/1.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    
    char ch,nch;
    int count;
    int k;
    printf("Please input a string with a # in the end.\n");
    scanf("%c",&ch);
    while (ch != '#') {
        if (ch >= '0' && ch <= '9') {
            count = ch  - '0' + 1;
            scanf("%c",&nch);
            for (k = 0; k < count; k++) {
                printf("%c",nch);
            }
        } else {
            printf("%c",ch);
        }
        printf(" ");
        scanf("%c",&ch);
    }
    
    printf("#\n");
    return 0;
}
