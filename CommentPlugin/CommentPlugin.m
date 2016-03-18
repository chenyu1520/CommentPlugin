//
//  CommentPlugin.m
//  CommentPlugin
//
//  Created by ChenYu on 16/3/17.
//  Copyright © 2016年 ChenYu. All rights reserved.
//

#import "CommentPlugin.h"

#import "CYPrivateHeader.h"

@interface CommentPlugin()

@property (nonatomic, strong, readwrite) NSBundle *bundle;

@property (nonatomic, copy) NSString *lastStr;
@end

@implementation CommentPlugin

+ (instancetype)sharedPlugin
{
    return sharedPlugin;
}

- (id)initWithBundle:(NSBundle *)plugin
{
    if (self = [super init]) {
        // reference to plugin's bundle, for resource access
        self.bundle = plugin;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didApplicationFinishLaunchingNotification:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
        
    }
    return self;
}

- (void)didApplicationFinishLaunchingNotification:(NSNotification*)noti
{
    //removeObserver
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSApplicationDidFinishLaunchingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationLog:)
                                                 name:NSTextViewDidChangeSelectionNotification
                                               object:nil];
    
}

#pragma mark - 系统所有的通知
- (void)notificationLog:(NSNotification *)notify
{
    
    if ([[notify object] isKindOfClass:[NSTextView class]]) {
        NSTextView* textView = (NSTextView *)[notify object];
        
        _lastStr = textView.string;
        
        //CYPrivateHeader.h 中存储了匹配的字符串，不做限制会将要匹配的字符串也替换掉，第二次运行插件就不起作用了。运行起来后做实验不要在 CYPrivateHeader.h 文件和 当前文件中做，因为这两个文件中包含 CYPrivateHeader.h 字符串，会直接被 return。敲击完两个顿号后直接打注释，就会立刻替换。
        NSRange cannotReplaceFileRange = [_lastStr rangeOfString:@"CYPrivateHeader.h"];
        if (cannotReplaceFileRange.length > 0) {
            return;
        }
        
        NSRange range = [_lastStr rangeOfString:REPLACESTRING];
        
        if (range.length > 0) {
            [textView replaceCharactersInRange:range withString:@"//"];
        }
    }
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
