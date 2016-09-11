//
//  DiemCaoContrller.m
//  BT
//
//  Created by GMORunsystem on 9/5/16.
//  Copyright © 2016 GMORunsystem. All rights reserved.
//

#import "DiemCaoContrller.h"


@implementation DiemCaoContrller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.btnVan.tag=1;
    
}

- (IBAction)btnDiemCao:(id)sender {
    [self getSinhVien:sender];
}

-(IBAction)getMaxStudent:(UIButton *)sender
{
    if([sender tag]==1)
    {
        
    }
}

- (void)getSinhVien:(id)sender {
    SinhVien *sv = [[SinhVien alloc]init];
    float diem = 0;
    for (int i = 0; i < [self.mangSV count]; i++) {
        if ([[sender titleLabel].text isEqualToString:@"Văn"]) {
            self.lblHeader.text = @"Điểm Cao Môn Văn";
            if (diem < self.mangSV[i].van) {
                diem = self.mangSV[i].van;
                sv = self.mangSV[i];
            }
            
        }
        else if ([[sender titleLabel].text isEqualToString:@"Toán"]) {
            self.lblHeader.text = @"Điểm Cao Môn Toán";
            if (diem < self.mangSV[i].toan) {
                diem = self.mangSV[i].toan;
                sv = self.mangSV[i];
            }
        }
        else if ([[sender titleLabel].text isEqualToString:@"Lý"]) {
            self.lblHeader.text = @"Điểm Cao Môn Lý";
            if (diem < self.mangSV[i].ly) {
                diem = self.mangSV[i].ly;
                sv = self.mangSV[i];
            }
        }
        else if ([[sender titleLabel].text isEqualToString:@"Sử"]) {
            self.lblHeader.text = @"Điểm Cao Môn Sử";
            if (diem < self.mangSV[i].su) {
                diem = self.mangSV[i].su;
                sv = self.mangSV[i];
            }
        }
    }
    self.lblDiem.text = [NSString stringWithFormat:@"%.2f", diem];
    self.lblHoVaTen.text = sv.hoVaTen;
}
@end
