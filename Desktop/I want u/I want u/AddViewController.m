//
//  AddViewController.m
//  I want u
//
//  Created by 321 on 2017/9/22.
//  Copyright © 2017年 matahu. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()
@property(nonatomic, strong) UIButton *backBtn;
@end

@implementation AddViewController

- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_backBtn setTitle:@"back" forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

- (void)frame {
    self.backBtn.frame = CGRectMake(0, 20, 60, 40);
}

- (void)setup {
    [self.view addSubview:self.backBtn];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self frame];
    [self setup];
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
