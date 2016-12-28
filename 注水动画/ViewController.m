//
//  ViewController.m
//  注水动画
//
//  Created by chuanglong02 on 16/12/28.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "ViewController.h"
#import "HeartView.h"
#import "LabelGradientView.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor =[UIColor blackColor];
    HeartView *heartView =[[HeartView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    heartView.center = self.view.center;
    [self.view addSubview:heartView];
    
    LabelGradientView *fadeStringView = [[LabelGradientView alloc] initWithFrame:CGRectMake(50, 60, 300, 40)];
    fadeStringView.text = @"情开一朵，爱难临摹";
    fadeStringView.type = fadeOne;
    [self.view addSubview:fadeStringView];
    
    
    LabelGradientView *iphone = [[LabelGradientView alloc] initWithFrame:CGRectMake(50, 110, 300, 40)];
    iphone.text = @"他大舅他二舅都是他舅";
    iphone.type = fadeTwo;
    [self.view addSubview:iphone];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
