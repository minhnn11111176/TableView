//
//  DetailViewController.h
//  BT
//
//  Created by GMORunsystem on 9/8/16.
//  Copyright © 2016 GMORunsystem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinhVien.h"

@protocol DetailViewControllerDelegate <NSObject>

- (void)deleteObjectAtIndex:(NSIndexPath*)index;
- (void)deleteObject:(SinhVien*)sv;

@end
@interface DetailViewController : UIViewController<UIGestureRecognizerDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblHovaTen;
@property (weak, nonatomic) IBOutlet UILabel *lblNgaySinh;
@property (weak, nonatomic) IBOutlet UILabel *lblDiemVan;
@property (weak, nonatomic) IBOutlet UILabel *lblDiemToan;
@property (weak, nonatomic) IBOutlet UILabel *lblDiemLy;
@property (weak, nonatomic) IBOutlet UILabel *lblDiemSu;
@property (nonatomic, strong) SinhVien *sv;
@property (nonatomic) NSIndexPath *index;
@property (nonatomic, strong) id<DetailViewControllerDelegate>delegate;
@end
