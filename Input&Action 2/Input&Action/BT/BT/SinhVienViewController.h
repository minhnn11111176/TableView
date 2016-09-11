//
//  ViewController.h
//  BT
//
//  Created by GMORunsystem on 9/5/16.
//  Copyright © 2016 GMORunsystem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSSVTableViewController.h"

@interface SinhVienViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate, DSSVTableViewControllerDelegate> {
    NSMutableArray *mangSV;
}
@end

