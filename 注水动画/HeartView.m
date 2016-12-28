//
//  HeartView.m
//  注水动画
//
//  Created by chuanglong02 on 16/12/28.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "HeartView.h"
@interface HeartView()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIImageView *imageViewone;
@property(nonatomic,strong)CAShapeLayer *maskLayer;
@end
@implementation HeartView
 -(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self) {
        
        self.imageViewone =[[UIImageView alloc]initWithFrame:self.bounds];
        self.imageViewone.center = self.center;
        self.imageViewone.image =[UIImage imageNamed:@"心2"];
       
        [self addSubview:self.imageViewone];
        
        self.imageView =[[UIImageView alloc]initWithFrame:self.bounds];
        self.imageView.center = self.center;
        self.imageView.image =[UIImage imageNamed:@"心"];
        [self addSubview:self.imageView];
        
        self.maskLayer =[CAShapeLayer layer];
        self.maskLayer.frame = self.imageView.bounds;
        CGPoint center  =  CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        UIBezierPath *path =[UIBezierPath bezierPathWithArcCenter:center radius:100 startAngle:0 endAngle:2 *M_PI clockwise:YES];
        self.maskLayer.path = path.CGPath;
        self.imageView.layer.mask =  self.maskLayer;
        self.maskLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height * 1.5);
    }
    return self;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CABasicAnimation *animation =[CABasicAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 2;
    animation.repeatCount = HUGE;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.bounds.size.width/2, self.bounds.size.height * 1.5)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)];
    [self.maskLayer addAnimation:animation forKey:nil];
    self.maskLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height * 1.5);
}
@end
