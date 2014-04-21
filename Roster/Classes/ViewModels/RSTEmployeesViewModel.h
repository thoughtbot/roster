//
//  RSTEmployeesViewModel.h
//  Roster
//
//  Created by Gordon Fontenot on 4/21/14.
//  Copyright (c) 2014 thoughtbot. All rights reserved.
//

@class TBEmployee;

@interface RSTEmployeesViewModel : NSObject

- (NSInteger)numberOfEmployees;
- (TBEmployee *)employeeAtIndexPath:(NSIndexPath *)indexPath;
- (void)refreshEmployeesWithCompletion:(void (^)(void))completionBlock;

@end
