//
//  ViewController.m
//  ShareDemo
//
//  Created by DullDong on 15/12/2.
//  Copyright © 2015年 DullDong. All rights reserved.
//

#import "ViewController.h"
#import "ShareTools.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the vie
        
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width*0.5-40, self.view.frame.size.height*0.5-100,120, 20)];
    [self.button setTitle:@"分享按钮" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button sizeToFit];
    [self.button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
   }


- (void)buttonClicked:(UIButton *)button
{
    
    [[ShareTools shareToolsInstance] showShareView:self isFollow:NO andString:@"chifan a "];
    
}

@end
