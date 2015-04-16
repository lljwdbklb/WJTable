//
//  WJLabel.m
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/10.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "WJLabel.h"

@interface WJLabel ()
@property (copy, nonatomic) UIColor *defultColor;
@property (copy, nonatomic) UIColor *defultTextColor;

@property (strong, nonatomic)UILongPressGestureRecognizer *longPress;
@end

@implementation WJLabel



+ (NSDictionary *)emotions {
    static NSDictionary *emotions;
    if (!emotions) {
        emotions = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"emotions" ofType:@"plist"]];
    }
    return emotions;
}

+ (NSArray *)emotionsKeys {
    return self.emotions.allKeys;
}


- (void)setText:(NSString *)text {
    [super setText:text];
    NSMutableAttributedString *textS = [[NSMutableAttributedString alloc] init];
//    NSMutableAttributedString *textAtt = [[NSMutableAttributedString alloc]init];
//    NSTextAttachment *att = [[NSTextAttachment alloc]init];
////    att.
//
//    self.attributedText = textAtt;
    
    NSRange rangeT = NSMakeRange(0, text.length);//正文截取
    NSRange rangeS;
    
    while((rangeS = [text rangeOfRegex:@"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]" inRange:rangeT]).length) {
        NSString *str = [text substringWithRange:rangeS];
        [textS appendAttributedString:[[NSAttributedString alloc]initWithString:[text substringWithRange:NSMakeRange(rangeT.location, rangeS.location + rangeS.length)]]];//添加到正文
        //判断是否有图片
        if ([[[self class] emotionsKeys] containsObject:str]) {
            NSTextAttachment *text = [[NSTextAttachment alloc]init];
//            NSString *[[[self class] emotions]objectForKey:str];
        }

    }
    self.attributedText = textS;
}



#pragma mark setup
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

//基础设置
- (void)setup {
    self.selectTextColor = [UIColor whiteColor];
    self.selectColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    self.touchSelect = YES;
}


#pragma mark - 菜单
- (void)setTouchSelect:(BOOL)touchSelect {
    _touchSelect = touchSelect;
    if (touchSelect) {
        if (!self.longPress) {
            UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longRecognizer:)];
            longPress.minimumPressDuration = 1;
            self.longPress = longPress;
        }
        [self addGestureRecognizer:self.longPress];
    } else {
        if (self.longPress) {
            [self removeGestureRecognizer:self.longPress];
        }
    }
}

- (void)longRecognizer:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        UIMenuController *menu = [UIMenuController sharedMenuController];
        UIMenuItem *item1 = [[UIMenuItem alloc]initWithTitle:@"复制" action:@selector(copyed:)];
        //    UIMenuItem *item2 = [[UIMenuItem alloc]initWithTitle:@"打开地图" action:@selector(openMap:)];
        [menu setMenuItems:[NSArray arrayWithObjects:item1, nil]];
        
        CGRect frame= [self convertRect:self.frame fromView:self];
        
//        CGRect inset = CGRectInset(frame, 0.4, 4.0);
        [menu setTargetRect:frame inView:self.superview];
        NSLog(@"%@",self.superview);
        [menu setMenuVisible:YES animated:YES];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(menuHide:) name:UIMenuControllerDidHideMenuNotification object:nil];
    }
}

- (void)menuHide:(NSNotification *)notification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIMenuControllerDidHideMenuNotification object:nil];
    [self resignFirstResponder];
}

- (BOOL)becomeFirstResponder {
    self.defultColor = self.backgroundColor;
    self.backgroundColor = self.selectColor;
    self.defultTextColor = self.textColor;
    self.textColor = self.selectTextColor;
    return [super becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}


- (BOOL) resignFirstResponder {
    self.backgroundColor = self.defultColor;
    self.textColor = self.defultTextColor;
    return [super resignFirstResponder];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return (action == @selector(copyed:));
}

- (void)copyed:(id)sender {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:self.text];
}

@end
