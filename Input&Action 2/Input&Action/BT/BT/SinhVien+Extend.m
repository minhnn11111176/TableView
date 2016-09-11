//
//  SinhVien+Extend.m
//  BT
//
//  Created by GMORunsystem on 9/5/16.
//  Copyright © 2016 GMORunsystem. All rights reserved.
//

#import "SinhVien+Extend.h"

@implementation SinhVien (Extend)

- (SinhVien *)nuCoDTBCaoNhat:(NSMutableArray<SinhVien *> *)mangSV {
    SinhVien *std = [[SinhVien alloc] init];
    float diem = 0;
    for (int i = 0; i < [mangSV count]; i++) {
        if ([mangSV[i].gioiTinh isEqualToString:@"Nu"]) {
            if (diem < mangSV[i].dtb) {
                diem = mangSV[i].dtb;
                std = mangSV[i];
            }
        }
    }
    return std;
}

- (SinhVien *)namCoDiemToanCaoNhat:(NSMutableArray<SinhVien *> *)mangSV {
    SinhVien *std = [[SinhVien alloc] init];
    float diem = 0;
    for (int i = 0; i < [mangSV count]; i++) {
        if ([mangSV[i].gioiTinh isEqualToString:@"Nam"]) {
            if (diem < mangSV[i].toan) {
                diem = mangSV[i].toan;
                std = mangSV[i];
            }
        }
    }
    return std;
}
@end
