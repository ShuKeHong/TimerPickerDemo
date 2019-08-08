//
//  ViewController.m
//  TimerPickerDemo
//
//  Created by ShuKe on 2019/8/8.
//  Copyright © 2019 Da魔王_舒克. All rights reserved.
//

#import "ViewController.h"
#import "ShuKeTimerPickerView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController () <ShuKeTimerPickerViewDelegate>

@property (nonatomic, strong) UIButton *timeBtn;
@property (nonatomic, strong) ShuKeTimerPickerView *pickerView;
@property (nonatomic, copy) NSString *timeStr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customDataSource];
    [self createUI];
}

- (void)customDataSource
{
    _timeStr = [self getNowDate:@"yyyy-MM-dd"];
}

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.timeBtn];
}


#pragma mark - Click
// 选择时间
- (void)startTimeClick
{
    [_pickerView remove];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormat dateFromString:_timeStr];
    
    _pickerView = [[ShuKeTimerPickerView alloc] initDatePickWithDate:date datePickerMode:UIDatePickerModeDate isHaveNavControler:NO toolbarTitle:@"选择时间"];
    [_pickerView setDatePickerDateFormat:@"yyyy-MM-dd"];
    _pickerView.delegate = self;
    [_pickerView show];
}


#pragma mark - Logic
// 获取当前手机时间
- (NSString *)getNowDate:(NSString*)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate *datenow = [NSDate date];
    return [formatter stringFromDate:datenow];
}


#pragma mark - ShuKeTimerPickerView Delegate
- (void)toobarDonBtnHaveClick:(ShuKeTimerPickerView *)pickView resultString:(NSString *)resultString atIndexof:(NSInteger)indexRow
{
    NSLog(@" ==== delegate => toobarDonBtnHaveClick 【%@】", resultString);
    _timeStr = resultString;
    [_timeBtn setTitle:_timeStr forState:UIControlStateNormal];
}

- (void)toobarCancelBtn {
    NSLog(@" ==== delegate => toobarCancelBtn");
}


#pragma mark - Getter And Setter
- (UIButton *)timeBtn
{
    if (_timeBtn) return _timeBtn;
    _timeBtn = [[UIButton alloc]initWithFrame:CGRectMake((ScreenWidth-200)/2.0, 200, 200, 100)];
    [_timeBtn setTitle:_timeStr forState:UIControlStateNormal];
    _timeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:22];
    _timeBtn.backgroundColor = [UIColor redColor];
    [_timeBtn addTarget:self action:@selector(startTimeClick) forControlEvents:UIControlEventTouchUpInside];
    return _timeBtn;
}


@end
