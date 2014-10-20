//
//  ViewController.h
//  MRogers_calc
//
//  Created by Max Rogers on 10/17/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *debug_output;
@property IBOutlet UIButton *convert_btn;
@property IBOutlet UITextField *num1_field;
@property IBOutlet UITextField *num2_field;
@property IBOutlet UIPickerView *base1_view;
@property IBOutlet UIPickerView *base2_view;
@end

