//
//  DetailViewController.m
//  BT
//
//  Created by GMORunsystem on 9/8/16.
//  Copyright © 2016 GMORunsystem. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lblHovaTen.text = self.sv.hoVaTen;
    self.lblNgaySinh.text = self.sv.NTNS;
    self.lblDiemVan.text = [NSString stringWithFormat:@"%.1f",self.sv.van];
    self.lblDiemToan.text = [NSString stringWithFormat:@"%.1f",self.sv.toan];
    self.lblDiemLy.text = [NSString stringWithFormat:@"%.1f",self.sv.ly];
    self.lblDiemSu.text = [NSString stringWithFormat:@"%.1f",self.sv.su];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    NSLog(@"SWIPE!");
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Delete Student" message:@"Do You Have Delete ?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [alertView show];
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        //[self.delegate deleteObjectAtIndex:self.index];
        [self.delegate deleteObject:self.sv];
        [self.navigationController popViewControllerAnimated:YES];
        NSLog(@"rrrrrrrrrrrrrrrrrr");
    }
}
@end
	