//
//  DSSVTableViewController.m
//  BT
//
//  Created by GMORunsystem on 9/8/16.
//  Copyright © 2016 GMORunsystem. All rights reserved.
//

#import "DSSVTableViewController.h"
#import "SinhVienTableViewCell.h"
#import "DetailViewController.h"
#import "SinhVien.h"

@interface DSSVTableViewController()
@property (nonatomic) NSInteger subject;
@end
@implementation DSSVTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.mangSV count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SinhVienTableViewCell *svCell = [tableView dequeueReusableCellWithIdentifier:@"SVCELL"];
    if (svCell == nil) {
        svCell = [SinhVienTableViewCell new];
    }
    [self setContentCell:svCell indexForCell:indexPath subject:self.subject];
    return svCell;
}

- (IBAction)btnSort:(id)sender {
    UIButton *btn = (UIButton*)sender;
    if (btn.tag == 10) {
        self.subject = 10;
        self.mangSV = [[self sortWithDescriptor:@"toan"] mutableCopy];
        
    }else if (btn.tag == 11) {
        self.subject = 11;
        self.mangSV = [[self sortWithDescriptor:@"van"] mutableCopy];
    }else if (btn.tag == 12) {
        self.subject = 12;
        self.mangSV = [[self sortWithDescriptor:@"ly"] mutableCopy];
    }else if (btn.tag == 13){
        self.subject = 13;
        self.mangSV = [[self sortWithDescriptor:@"su"] mutableCopy];
    }
    [self.tableView reloadData];
}

- (NSArray*)sortWithDescriptor:(NSString*)key {
    NSArray *sortedArray;
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:NO selector:@selector(compare:)];
    sortedArray = [self.mangSV sortedArrayUsingDescriptors:@[descriptor]];
    return sortedArray;
}

- (void)setContentCell:(SinhVienTableViewCell*)svCell indexForCell:(NSIndexPath*)indexPath subject:(NSInteger)subject{
    SinhVien *sv = (SinhVien*)[self.mangSV objectAtIndex:indexPath.row];
    svCell.lblHovaTen.text = sv.hoVaTen;
    if (subject == 10) {
        svCell.lblDiem.text = [NSString stringWithFormat:@"Toán: %.1f", sv.toan];
    } else if (subject == 11) {
        svCell.lblDiem.text = [NSString stringWithFormat:@"Văn: %.1f", sv.van];
    } else if (subject == 12) {
        svCell.lblDiem.text = [NSString stringWithFormat:@"Lý: %.1f", sv.ly];
    } else if (subject == 13) {
        svCell.lblDiem.text = [NSString stringWithFormat:@"Sử: %.1f", sv.su];
    } else {
        svCell.lblDiem.text = [NSString stringWithFormat:@"Trung bình: %.1f", [sv diemTrungBinhSV]];
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DETAILSV"]) {
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        self.detail = segue.destinationViewController;
        self.detail.index = index;
        self.detail.sv = [self.mangSV objectAtIndex:index.row];
        self.detail.delegate = self;
    }
}

//- (void)deleteObjectAtIndex:(NSIndexPath *)index {
//    [self.mangSV removeObjectAtIndex:index.row];
//    [self.tableView reloadData];
//}

- (void)deleteObject:(SinhVien *)sv {
    [self.mangSV removeObject:sv];
    [self.tableView reloadData];
    [self.delegate deleteObject:sv];
}
@end
