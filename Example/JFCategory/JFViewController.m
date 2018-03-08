//
//  JFViewController.m
//  JFCategory
//
//  Created by git on 03/03/2018.
//  Copyright (c) 2018 git. All rights reserved.
//

#import "JFViewController.h"
#import "JFTableViewCell.h"

@interface JFViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation JFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UINib *nib = [UINib nibWithNibName:@"JFTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"JFTableViewCell"];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JFTableViewCell" forIndexPath:indexPath];
    [cell updateCell];
    return cell;
}

@end
