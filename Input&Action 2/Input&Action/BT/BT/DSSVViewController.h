//
//  DSSVViewController.h
//  BT
//
//  Created by GMORunsystem on 9/5/16.
//  Copyright © 2016 GMORunsystem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSSVViewController : UIViewController<UIAlertViewDelegate>
@property (nonatomic, strong) NSMutableArray *mangSV;
@property (nonatomic) NSUInteger index;

@property (weak, nonatomic) IBOutlet UILabel *lblHoVaTen;
@property (weak, nonatomic) IBOutlet UILabel *lblSinhNhat;
@property (weak, nonatomic) IBOutlet UILabel *lblDiemVan;
@property (weak, nonatomic) IBOutlet UILabel *lblDiemToan;
@property (weak, nonatomic) IBOutlet UILabel *lblDiemLy;
@property (weak, nonatomic) IBOutlet UILabel *lblDiemSu;

@end
