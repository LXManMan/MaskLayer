//
//  LabelGradientView.h
//  注水动画
//
//  Created by chuanglong02 on 16/12/28.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, GradientType) {
    
    //以下是枚举成员
    
    fadeOne = 0,
    
    fadeTwo = 1,
    
    
    
};
@interface LabelGradientView : UIView
@property (nonatomic,strong) NSString *text;

@property(nonatomic,assign)GradientType type;

@end
