//
//  DSSVTableViewController.h
//  BT
//
//  Created by GMORunsystem on 9/8/16.
//  Copyright © 2016 GMORunsystem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@protocol DSSVTableViewControllerDelegate <NSObject>

- (void)deleteObject:(SinhVien*)sv;

@end
@interface DSSVTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, DetailViewControllerDelegate>
@property (strong, nonatomic) NSMutableArray *mangSV;
@property (strong, nonatomic) NSMutableArray *sortedArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) DetailViewController *detail;
@property (strong, nonatomic) id<DSSVTableViewControllerDelegate>delegate;

@end
	