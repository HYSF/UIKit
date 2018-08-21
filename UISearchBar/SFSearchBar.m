//
//  SFSearchBar.m
//  HCSample
//
//  Created by Heng on 2018/8/21.
//  Copyright © 2018年 云天. All rights reserved.
//

#import "SFSearchBar.h"

@interface SFSearchBar ()

@property (nonatomic, assign)BOOL isChangeFrame;

@end

@implementation SFSearchBar

#pragma mark - setter method
- (void)setContentInset:(UIEdgeInsets)contentInset {
    
    _contentInset.top = contentInset.top;
    _contentInset.bottom = contentInset.bottom;
    _contentInset.left = contentInset.left;
    _contentInset.right = contentInset.right;
    
    self.isChangeFrame = YES;
    [self layoutSubviews];
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    for (UIView *subView in self.subviews[0].subviews) {
        
        if ([subView isKindOfClass:[UIImageView class]]) {
            
            //移除UISearchBarBackground
            [subView removeFromSuperview];
        }
        if ([subView isKindOfClass:[UITextField class]]) {
            
            CGFloat height = self.bounds.size.height;
            CGFloat width = self.bounds.size.width;
            
            if (_isChangeFrame) {
                //说明contentInset已经被赋值
                // 根据contentInset改变UISearchBarTextField的布局
                subView.frame = CGRectMake(_contentInset.left, _contentInset.top, width - 2 * _contentInset.left, height - 2 * _contentInset.top);
            } else {
                
                // contentSet未被赋值
                // 设置UISearchBar中UISearchBarTextField的默认边距
                CGFloat top = (height - 28.0) / 2.0;
                CGFloat bottom = top;
                CGFloat left = 8.0;
                CGFloat right = left;
                _contentInset = UIEdgeInsetsMake(top, left, bottom, right);
            }
        }
    }
}

@end
