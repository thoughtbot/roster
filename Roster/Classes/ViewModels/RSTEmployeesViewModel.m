//
//  RSTEmployeesViewModel.m
//  Roster
//
//  Created by Gordon Fontenot on 4/21/14.
//  Copyright (c) 2014 thoughtbot. All rights reserved.
//

#import <TBDirectory/TBTeamClient.h>
#import "RSTEmployeesViewModel.h"

@interface RSTEmployeesViewModel ()

@property (nonatomic) NSArray *employees;

@end

@implementation RSTEmployeesViewModel

- (void)refreshEmployeesWithCompletion:(void (^)(void))completionBlock
{
    [[TBTeamClient new] fetchAllEmployeesWithCompletion:^(NSArray *employees, NSError *error) {
        NSArray *descriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"fullName" ascending:YES]];
        self.employees = [employees sortedArrayUsingDescriptors:descriptors];

        if (completionBlock) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:completionBlock];
        }
    }];
}

- (NSInteger)numberOfEmployees
{
    return (NSInteger)[self.employees count];
}

- (TBEmployee *)employeeAtIndexPath:(NSIndexPath *)indexPath
{
    if ((NSUInteger)indexPath.row >= self.employees.count) {
        return nil;
    }

    return [self.employees objectAtIndex:(NSUInteger)indexPath.row];
}

- (NSArray *)employees
{
    if (_employees) return _employees;

    _employees = @[];

    return _employees;
}

@end
