//
//  SinhVien.h
//  BT
//
//  Created by GMORunsystem on 9/5/16.
//  Copyright © 2016 GMORunsystem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SinhVien : NSObject

@property (strong, nonatomic) NSString* maSo;
@property (strong, nonatomic) NSString* hoVaTen;

@property float toan;
@property float ly;
@property float su;
@property float van;
@property float dtb;
@property (strong, nonatomic) NSString* xepLoai;

@property (strong) NSString* gioiTinh;
@property (strong) NSString* NTNS;


- (id)initWithHoVaTen:(NSString*)hoVaTen ntns:(NSString*)ntns van:(float)van toan:(float)toan ly:(float)ly su:(float)su;
- (float)diemTrungBinhSV;
- (void)xepLoaiSV;


//- (void)createSV;

- (SinhVien*)SVCoDTBCaoNhat:(NSMutableArray<SinhVien*>*)mangSV;


- (void)tangDiem:(NSMutableArray<SinhVien*>*)students;
@end
