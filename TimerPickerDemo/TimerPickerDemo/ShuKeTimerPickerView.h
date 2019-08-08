//
//  ShuKeTimerPickerView.h
//  TimerPickerDemo
//
//  Created by ShuKe on 2019/8/8.
//  Copyright © 2019 Da魔王_舒克. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ShuKeTimerPickerView;

@protocol ShuKeTimerPickerViewDelegate <NSObject>

@optional
- (void)toobarDonBtnHaveClick:(ShuKeTimerPickerView *)pickView
                 resultString:(NSString *)resultString
                    atIndexof:(NSInteger)indexRow;
- (void)toobarCancelBtn;

@end

@interface ShuKeTimerPickerView : UIView

@property (nonatomic, weak) id <ShuKeTimerPickerViewDelegate> delegate;

/**
 *  通过时间创建一个DatePicker
 *
 *  @param defaulDate               默认选中时间
 *  @param isHaveNavControler       是否在NavControler之内
 *
 *  @return 带有toolbar的datePicker
 */
- (instancetype)initDatePickWithDate:(NSDate *)defaulDate
                      datePickerMode:(UIDatePickerMode)datePickerMode
                  isHaveNavControler:(BOOL)isHaveNavControler
                        toolbarTitle:(NSString *)title;

/**
 *   移除本控件
 */
- (void)remove;

/**
 *  显示本控件
 */
- (void)show;

/*
 * 设置日期格式
 */
- (void)setDatePickerDateFormat:(NSString *)dateString;

@end

NS_ASSUME_NONNULL_END
