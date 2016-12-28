
//
//  LabelGradientView.m
//  注水动画
//
//  Created by chuanglong02 on 16/12/28.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "LabelGradientView.h"
@interface LabelGradientView()
@property(nonatomic,strong)UILabel *forelLabel;
@property(nonatomic,strong)UILabel *backLabel;
@property(nonatomic,strong)CAGradientLayer *maskLayer;
@end
@implementation LabelGradientView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIFont *font=[UIFont systemFontOfSize:25];
        self.backLabel =[[UILabel alloc]initWithFrame:self.bounds];
        self.backLabel.textAlignment = NSTextAlignmentCenter;
        self.backLabel.textColor =[UIColor redColor];
        [self addSubview:self.backLabel];
        self.backLabel.font = font;
        self.forelLabel =[[UILabel alloc]initWithFrame:self.bounds];
        self.forelLabel.textAlignment = NSTextAlignmentCenter;
         self.forelLabel.font = font;
        [self addSubview:self.forelLabel];
        self.forelLabel.textColor =[UIColor whiteColor];
       
        self.forelLabel.layer.mask = self.maskLayer;
        
    }
    return self;
}
-(CAGradientLayer *)maskLayer
{
    if (!_maskLayer) {
        _maskLayer =[CAGradientLayer layer];
        _maskLayer.frame = self.bounds;
}
    return _maskLayer;
}
-(void)setText:(NSString *)text
{
    _text =text;
    self.forelLabel.text = text;
    self.backLabel.text = text;
}
-(void)setType:(GradientType)type
{
    _type = type;
    switch (type) {
        case fadeOne:
            self.maskLayer.colors = @[(id)[UIColor clearColor],(id)[UIColor redColor].CGColor,(id)[UIColor blackColor].CGColor,(id)[UIColor clearColor].CGColor];
            self.maskLayer.locations = @[@(0.01),@(0.1),@(0.9),@(0.99)];
            [self fadeString:(self.bounds.size.width)];
            break;
        case fadeTwo:
             self.maskLayer.colors = @[(id)[UIColor clearColor].CGColor,(id)[UIColor redColor].CGColor,(id)[UIColor clearColor].CGColor];
             self.maskLayer.locations = @[@(0.25),@(0.5),@(0.75)];
             self.maskLayer.startPoint = CGPointMake(0, 0);
             self.maskLayer.endPoint = CGPointMake(1, 0);
           
             self.maskLayer.position = CGPointMake(-self.bounds.size.width/2.0, self.bounds.size.height/2.0);
            [self iphoneFade:(self.bounds.size.width+self.bounds.size.width/2.0)];
            break;
        default:
            break;
    }
}

-(void)fadeString:(CGFloat) toValue
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"transform.translation.x";
    basicAnimation.fromValue = @(0);
    basicAnimation.toValue = @(toValue);
    basicAnimation.duration = 2;
    basicAnimation.repeatCount = HUGE;
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.fillMode = kCAFillModeForwards;
    [self.maskLayer addAnimation:basicAnimation forKey:nil];

}
-(void)iphoneFade:(CGFloat) toValue
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"transform.translation.x";
    basicAnimation.fromValue = @(0);
    basicAnimation.toValue = @(toValue);
    basicAnimation.duration = 2;
    basicAnimation.repeatCount = HUGE;
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.fillMode = kCAFillModeForwards;
    [self.maskLayer addAnimation:basicAnimation forKey:nil];
}
@end
