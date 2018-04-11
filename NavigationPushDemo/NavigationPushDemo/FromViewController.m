//
//  FromViewController.m
//  NavigationPushDemo
//
//  Created by yrc on 2018/4/11.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "FromViewController.h"
#import "ToViewController.h"

@interface FromViewController ()

@end

@implementation FromViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"FromVC";
    
    
    self.imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"WechatIMG424.jpeg"]];
    self.imgView.frame = CGRectMake(0, 0, 150, 120);
    self.imgView.center = self.view.center;
    [self.view addSubview:self.imgView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ToViewController *TVC = [[ToViewController alloc]init];
    self.navigationController.delegate = TVC;
    [self.navigationController pushViewController:TVC animated:YES];
}


@end
