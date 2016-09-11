//
//  DiemCaoContrller.h
//  BT
//
//  Created by GMORunsystem on 9/5/16.
//  Copyright © 2016 GMORunsystem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinhVien.h"

@interface DiemCaoContrller : UIViewController
@property (nonatomic,weak) IBOutlet UIButton *btnVan;
@property (nonatomic, strong) NSMutableArray<SinhVien*> *mangSV;
@property (weak, nonatomic) IBOutlet UILabel *lblHeader;
@property (weak, nonatomic) IBOutlet UILabel *lblHoVaTen;
@property (weak, nonatomic) IBOutlet UILabel *lblDiem;

@end
