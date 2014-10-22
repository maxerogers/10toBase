//
//  ViewController.m
//  MRogers_calc
//
//  Created by Max Rogers on 10/17/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *_picker_Data;
    int input1_value;
    int input2_value;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _picker_Data = @[@"2",@"3",@"8",@"10",@"12",@"16"];

    self.base1_view.dataSource = self;
    self.base1_view.delegate = self;
    self.base2_view.dataSource = self;
    self.base2_view.delegate = self;
    
    [_num2_field setEnabled:false];
    [self.base1_view selectRow:3 inComponent:0 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _picker_Data.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _picker_Data[row];
}

- (NSString*)convertBase:(long int) number_to_convert base:(int)base
{
    char base_digits[16] =
    {'0', '1', '2', '3', '4', '5', '6', '7',
        '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
    int converted_number[64];
    int index=0;
    
    /* convert to the indicated base */
    while (number_to_convert != 0)
    {
        converted_number[index] = number_to_convert % base;
        number_to_convert = number_to_convert / base;
        ++index;
    }
    
    /* now print the result in reverse order */
    --index;  /* back up to last entry in the array */
    
    //char str[index];
    NSMutableString *result=[[NSMutableString alloc]init];
    int i,j;
    for(  j=0, i=index; i>=0; j++,i--) /* go backward through array */
    {
        [result appendFormat:@"%c",base_digits[converted_number[i]]];
    }
    return result;
}


- (IBAction)convert:(id)sender {
    
    input1_value = [_num1_field.text intValue];
    input2_value = [_num2_field.text intValue];
    
    int base1 = [[_picker_Data objectAtIndex:[_base1_view selectedRowInComponent:0]] intValue];
    NSString *converted_number = [self convertBase: input1_value base: base1];
    _num2_field.text =converted_number;
    NSLog(@"%@", converted_number);
}
@end
