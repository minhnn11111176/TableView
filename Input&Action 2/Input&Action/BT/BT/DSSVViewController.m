//
//  DSSVViewController.m
//  BT
//
//  Created by GMORunsystem on 9/5/16.
//  Copyright © 2016 GMORunsystem. All rights reserved.
//

#import "DSSVViewController.h"
#import "SinhVien.h"

@implementation DSSVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.index = 0;
    SinhVien *sv = (SinhVien*)[self.mangSV objectAtIndex:self.index];
    [self setSinhVien:sv];
}

- (IBAction)btnFirstSinhVien:(id)sender {
    self.index = 0;
    SinhVien *sv = (SinhVien*)[self.mangSV objectAtIndex:self.index];
    [self setSinhVien:sv];
}
- (IBAction)btnPreviousSinhVien:(id)sender {
    if (self.index > 0) {
        self.index -= 1;
        SinhVien *sv = (SinhVien*)[self.mangSV objectAtIndex:self.index];
        [self setSinhVien:sv];
    }
}
- (IBAction)btnNextSinhVien:(id)sender {
    if (self.index < ([self.mangSV count] - 1)) {
        self.index += 1;
        SinhVien *sv = (SinhVien*)[self.mangSV objectAtIndex:self.index];
        [self setSinhVien:sv];
    }
}
- (IBAction)btnLastSinhVien:(id)sender {
    self.index = [self.mangSV count] - 1;
    SinhVien *sv = (SinhVien*)[self.mangSV objectAtIndex:self.index];
    [self setSinhVien:sv];
}

- (void)setSinhVien:(SinhVien*) sv {
    self.lblHoVaTen.text = sv.hoVaTen;
    self.lblSinhNhat.text = sv.NTNS;
    self.lblDiemVan.text = [NSString stringWithFormat:@"%.2f", sv.van];
    self.lblDiemToan.text = [NSString stringWithFormat:@"%.2f", sv.toan];
    self.lblDiemLy.text = [NSString stringWithFormat:@"%.2f", sv.ly];
    self.lblDiemSu.text = [NSString stringWithFormat:@"%.2f", sv.su];
}

- (IBAction)btnDeleteSinhVien:(id)sender {

    SinhVien *sv = (SinhVien*)[self.mangSV objectAtIndex:self.index];
    UIAlertView *alertDelete = [[UIAlertView alloc]initWithTitle:@"Message Delete" message:[NSString stringWithFormat:@"Bạn có muốn xoá %@", sv.hoVaTen] delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
       [alertDelete show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1){
        NSUInteger index = self.index;
        if ([self.mangSV count] > 1) {
            if (self.index == ([self.mangSV count] -1)) {
                self.index -= 1;
                [self.mangSV removeObjectAtIndex:index];
            }else if (self.index > 0 && (self.index < ([self.mangSV count] -1))){
                self.index -= 1;
                [self.mangSV removeObjectAtIndex:index];
            }else if (self.index == 0) {
                self.index = 0;
                [self.mangSV removeObjectAtIndex:index];
            }
            [self setSinhVien:[self.mangSV objectAtIndex:self.index]];
        } else if ([self.mangSV count] == 1){
            [self.mangSV removeObjectAtIndex:self.index];
            [self setSinhVien:nil];
        }
    }
}
@end
