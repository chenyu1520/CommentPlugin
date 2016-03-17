//
//  NSObject_Extension.m
//  CommentPlugin
//
//  Created by ChenYu on 16/3/17.
//  Copyright © 2016年 ChenYu. All rights reserved.
//


#import "NSObject_Extension.h"
#import "CommentPlugin.h"

@implementation NSObject (Xcode_Plugin_Template_Extension)

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[CommentPlugin alloc] initWithBundle:plugin];
        });
    }
}
@end
