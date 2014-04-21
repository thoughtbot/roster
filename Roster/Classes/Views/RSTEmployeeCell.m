//
//  RSTEmployeeCell.m
//  Roster
//
//  Created by Gordon Fontenot on 4/11/14.
//  Copyright (c) 2014 thoughtbot. All rights reserved.
//

#import "RSTEmployeeCell.h"

@interface RSTEmployeeCell ()

@property (nonatomic) IBOutlet UILabel *employeeNameLabel;

@end

@implementation RSTEmployeeCell

- (void)setEmployeeName:(NSString *)employeeName
{
    self.employeeNameLabel.text = employeeName;
    [self.employeeNameLabel sizeToFit];
}

@end
