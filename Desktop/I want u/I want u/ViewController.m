//
//  ViewController.m
//  I want u
//
//  Created by 321 on 2017/9/20.
//  Copyright © 2017年 matahu. All rights reserved.
//

#import "ViewController.h"
#import "AddViewController.h"
@interface ViewController ()
@property (nonatomic, strong)UILabel *showLabel;
@property (nonatomic, strong)UIButton *changeBtn;
@property (nonatomic, strong) UIButton *addBtn;

@property (nonatomic, strong)NSArray *arr;
@property (nonatomic, weak) NSTimer *timer;

@property (nonatomic, strong) UITextField *minTextField;
@property (nonatomic, strong) UITextField *maxTextField;
@end

@implementation ViewController

- (UILabel *)showLabel {
    if (!_showLabel) {
        _showLabel = [UILabel new];
        _showLabel.backgroundColor = [UIColor greenColor];
        _showLabel.textAlignment = NSTextAlignmentCenter;
        _showLabel.font = [UIFont systemFontOfSize:22];
    }
    return _showLabel;
}

- (UIButton *)changeBtn {
    if (!_changeBtn) {
        _changeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_changeBtn setTitle:@"start" forState:UIControlStateNormal];
        [_changeBtn addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeBtn;
}

- (UITextField *)minTextField {
    if (!_minTextField) {
        _minTextField = [UITextField new];
        _minTextField.placeholder= @"min";
        _minTextField.borderStyle = UITextBorderStyleLine;
    }
    return _minTextField;
}

- (UITextField *)maxTextField {
    if (!_maxTextField) {
        _maxTextField = [UITextField new];
        _maxTextField.placeholder= @"max";
        _maxTextField.borderStyle = UITextBorderStyleLine;
    }
    return _maxTextField;
}

- (UIButton *)addBtn {
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_addBtn setTitle:@"add" forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBtn;
}

- (void)setup {
    [self.view addSubview:self.addBtn];
    [self.view addSubview:self.minTextField];
    [self.view addSubview:self.maxTextField];
    [self.view addSubview:self.showLabel];
    [self.view addSubview:self.changeBtn];
}

- (void)frame {
    CGFloat margin = 60;
    
    self.addBtn.frame = CGRectMake(self.view.frame.size.width - 60, 50, 60, 30);
    self.minTextField.frame = CGRectMake(margin, 150, (self.view.frame.size.width - margin *3) / 2, 30);
    
    self.maxTextField.frame = CGRectMake(CGRectGetMaxX(self.minTextField.frame) + margin, 150, (self.view.frame.size.width - margin *3) / 2, 30);
    
    self.showLabel.frame = CGRectMake((self.view.frame.size.width - 150) / 2, CGRectGetMaxY(self.minTextField.frame) + 50, 150, 40);
    self.changeBtn.frame = CGRectMake((self.view.frame.size.width - 60) / 2 , CGRectGetMaxY(self.showLabel.frame) + 50, 60, 50);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setup];
    [self frame];
    
    self.arr = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10"];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(show)  userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer setFireDate:[NSDate distantFuture]];
}

- (void)change {
    if (self.minTextField.text.length > 0 && self.maxTextField.text.length > 0) {
        if (self.maxTextField.text.integerValue <= self.minTextField.text.integerValue) {
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"error for max min" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"ok"
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:nil];
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:NO completion:nil];
            return;
        }
    }else {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"input max min" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"ok"
                                                               style:UIAlertActionStyleCancel
                                                             handler:nil];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:NO completion:nil];
        return;
    }

    if ([self.changeBtn.titleLabel.text isEqualToString:@"start"]) {
        [self.timer setFireDate:[NSDate date]];
        [self.changeBtn setTitle:@"stop" forState:UIControlStateNormal];
    }else if ([self.changeBtn.titleLabel.text isEqualToString:@"stop"]) {
        [self.timer setFireDate:[NSDate distantFuture]];
        [self.changeBtn setTitle:@"start" forState:UIControlStateNormal];
    }
}

- (void)show {
    NSInteger index = self.minTextField.text.integerValue + arc4random() % (self.maxTextField.text.integerValue - self.minTextField.text.integerValue + 1);
    self.showLabel.text = [NSString stringWithFormat:@"%ld", index];
}

- (void)add {
    AddViewController *addvc = [[AddViewController alloc] init];
    [self presentViewController:addvc animated:YES completion:nil];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
