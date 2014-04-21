//
//  RSTEmployeesViewController.m
//  Roster
//
//  Created by Gordon Fontenot on 4/11/14.
//  Copyright (c) 2014 thoughtbot. All rights reserved.
//

#import <TBDirectory/TBEmployee.h>
#import "RSTEmployeesViewController.h"
#import "RSTEmployeeCell.h"
#import "RSTEmployeesViewModel.h"

@interface RSTEmployeesViewController ()

@property (nonatomic) RSTEmployeesViewModel *viewModel;

@end

@implementation RSTEmployeesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.viewModel = [RSTEmployeesViewModel new];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.viewModel refreshEmployeesWithCompletion:^{
        [self.collectionView reloadData];
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.viewModel numberOfEmployees];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TBEmployee *employee = [self.viewModel employeeAtIndexPath:indexPath];
    RSTEmployeeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RSTEmployeeCell" forIndexPath:indexPath];
    [cell setEmployeeName:employee.fullName];
    return cell;
}

@end
