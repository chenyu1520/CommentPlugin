//
//  CommentPlugin.h
//  CommentPlugin
//
//  Created by ChenYu on 16/3/17.
//  Copyright © 2016年 ChenYu. All rights reserved.
//

#import <AppKit/AppKit.h>

@class CommentPlugin;

static CommentPlugin *sharedPlugin;

@interface CommentPlugin : NSObject

+ (instancetype)sharedPlugin;
- (id)initWithBundle:(NSBundle *)plugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end