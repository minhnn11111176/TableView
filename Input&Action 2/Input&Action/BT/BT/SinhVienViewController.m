//
//  ViewController.m
//  BT
//
//  Created by GMORunsystem on 9/5/16.
//  Copyright © 2016 GMORunsystem. All rights reserved.
//

#import "SinhVienViewController.h"
#import "SinhVien.h"
#import "DSSVViewController.h"
#import "DiemCaoContrller.h"
#import "DSSVTableViewController.h"

@interface SinhVienViewController () {
    
}
@property (weak, nonatomic) IBOutlet UILabel *lblThemSinhVien;
@property (weak, nonatomic) IBOutlet UILabel *lblLuuThanhCong;
@property (weak, nonatomic) IBOutlet UITextField *txtTenDayDu;
@property (weak, nonatomic) IBOutlet UITextField *txtNgaySinh;
@property (weak, nonatomic) IBOutlet UITextField *txtDiemVan;
@property (weak, nonatomic) IBOutlet UITextField *txtDiemToan;
@property (weak, nonatomic) IBOutlet UITextField *txtDiemLy;
@property (weak, nonatomic) IBOutlet UITextField *txtDiemSu;

//
@property (strong) NSTimer *updateColor;
@property BOOL isSave;
@end

@implementation SinhVienViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ///
    mangSV = [NSMutableArray new];
    self.lblLuuThanhCong.hidden = YES;
    ///
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(datePickerField:) forControlEvents:UIControlEventValueChanged];
    self.txtNgaySinh.inputView = datePicker;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)luuSinhVien:(id)sender {
    
    [self checkFieldsSV];
    
}


- (void)setUI {
    self.txtTenDayDu.text = @"";
    self.txtNgaySinh.text = @"";
    self.txtDiemVan.text = @"";
    self.txtDiemToan.text = @"";
    self.txtDiemLy.text = @"";
    self.txtDiemSu.text = @"";
    self.lblLuuThanhCong.hidden = NO;
    if (self.lblLuuThanhCong.hidden == NO) {
        [NSTimer scheduledTimerWithTimeInterval:0.5
                                         target:self
                                       selector:@selector(hideLabelLuuThanhCong)
                                       userInfo:nil
                                        repeats:NO];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DSSV"]) {
        if ([mangSV count] == 0) {
            [self showMessageError:@"Message!" message:@"Danh Sách Rỗng!"];
        } else {
            //DSSVViewController *dssv = segue.destinationViewController;
            DSSVTableViewController *dssv = segue.destinationViewController;
            dssv.mangSV = mangSV;
            dssv.delegate = self;
        }
        
    }
    
    if ([segue.identifier isEqualToString:@"DIEMCAO"]) {
        if ([mangSV count] == 0) {
            [self showMessageError:@"Message!" message:@"Danh Sách Rỗng!"];
        } else {
            DiemCaoContrller *diemCao = segue.destinationViewController;
            diemCao.mangSV = mangSV;
        }
    }
}

- (void)hideLabelLuuThanhCong {
    self.lblLuuThanhCong.hidden = YES;
}

- (void)checkFieldsSV {
    SinhVien *luuSVMoi = [[SinhVien alloc]initWithHoVaTen:self.txtTenDayDu.text
                                                     ntns:self.txtNgaySinh.text
                                                      van:[self.txtDiemVan.text floatValue]
                                                     toan:[self.txtDiemToan.text floatValue]
                                                       ly:[self.txtDiemLy.text floatValue]
                                                       su:[self.txtDiemSu.text floatValue]];
    
    if ([self.txtTenDayDu.text isEqualToString:@""]|| ([self.txtTenDayDu.text length] < 4|| [self.txtTenDayDu.text length] > 100)) {
        [self showMessageError:@"Error Input" message:@"Vui lòng điền Họ và Tên chính xác ( >4 va < 10)"];
    } else if ([self.txtNgaySinh.text isEqualToString:@""]) {
        [self showMessageError:@"Error Input" message:@"Vui lòng điền Ngày Tháng Năm Sinh"];
    } else if ([self.txtDiemVan.text isEqualToString:@""]) {
        [self showMessageError:@"Error Input" message:@"Vui lòng điền chính xác"];
    } else if ([self.txtDiemToan.text isEqualToString:@""]) {
        [self showMessageError:@"Error Input" message:@"Vui lòng điền chính xác"];
    } else if ([self.txtDiemLy.text isEqualToString:@""]) {
        [self showMessageError:@"Error Input" message:@"Vui lòng điền chính xác"];
    } else if ([self.txtDiemSu.text isEqualToString:@""]||[self.txtDiemSu.text floatValue] < 0 || [self.txtDiemSu.text floatValue] > 10) {
        [self showMessageError:@"Error Input" message:@"Vui lòng điền chính xác"];
    } else {
        [mangSV addObject:luuSVMoi];
        [self setUI];
    }
}

- (void)showMessageError:(NSString*)title message:(NSString*)message {
    UIAlertView *messageError = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [messageError show];
}

- (void)changeColorLabelThemSinhVien {
    CGFloat redValue    = rand() / (float) RAND_MAX;
    CGFloat greenValue  = rand() / (float) RAND_MAX;
    CGFloat blueValue   = rand() / (float) RAND_MAX;
    [self.lblThemSinhVien setTextColor:[UIColor colorWithRed:redValue
                                                       green:greenValue
                                                        blue:blueValue
                                                       alpha:1.0]];
}

- (void)startTimer {
    self.updateColor = [NSTimer scheduledTimerWithTimeInterval:0.2
                                                        target:self
                                                      selector:@selector(changeColorLabelThemSinhVien)
                                                      userInfo:nil
                                                       repeats:YES];
}

- (void)stopTimer {
    [self.updateColor invalidate];
    self.updateColor = nil;
}

- (void)checkDigitOrString:(UITextField*)textField {
    if (textField.tag == 13||textField.tag == 14||textField.tag == 15||textField.tag == 16) {
        NSString *testString = [NSString string];
        NSScanner *scanner = [NSScanner scannerWithString:textField.text];
        NSCharacterSet *skips = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
        [scanner scanCharactersFromSet:skips intoString:&testString];
        
        float point = [testString floatValue];
        if ([textField.text length] != [testString length]) {
            [self showMessageError:@"Error Input" message:@"Only Number!"];
            textField.text = @"";
        } else if (point < 0 || point > 10) {
            [self showMessageError:@"Error Input" message:@"Number >= 0 or Number < 10!"];
            textField.text = @"";
        }
    }
}
#pragma mark - UITextFiledDelegate

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan: withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"textFieldShouldBeginEditing");
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"textFieldDidBeginEditing");
    [self stopTimer];
    [textField becomeFirstResponder];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldEndEditing");
    if ([textField.text length] != 0) {
        [self checkDigitOrString:textField];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"textFieldDidEndEditing");
    [self startTimer];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"textField:shouldChangeCharactersInRange:replacementString:");
    [self changeColorLabelThemSinhVien];
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    NSLog(@"textFieldShouldClear:");
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"textFieldShouldReturn:");
//    for (UIView *view in [self.view subviews]) {
//        if ([view isKindOfClass:[UITextField class]]) {
//            UITextField *textField = (UITextField*)view;
//            [textField resignFirstResponder];
//        }
//    }
    
    
    [textField resignFirstResponder];
    [self checkDigitOrString:textField];
    return YES;
}


#pragma mark - UIAlertViewDelegateDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - UIDatePicker

- (IBAction)datePickerField:(id)sender {
    UIDatePicker *picker = (UIDatePicker*)[sender inputView];
    [picker setMaximumDate:[NSDate date]];
    NSDateFormatter *formatDate = [[NSDateFormatter alloc] init];
    [formatDate setDateFormat:@"dd/MM/yyyy"];
    NSDate *eventDate = picker.date;
    
    NSString *dateString = [formatDate stringFromDate:eventDate];
    self.txtNgaySinh.text = dateString;
}

- (void)deleteObject:(SinhVien *)sv {
    [mangSV removeObject:sv];
    NSLog(@"deleted at SinhVienViewController");
}
@end
