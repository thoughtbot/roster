#import <TBDirectory/TBTeamStubbing.h>
#import <TBDirectory/TBEmployee.h>
#import "RSTEmployeesViewModel.h"

SpecBegin(RSTEmployeesViewModel)

describe(@"RSTEmployeesViewModel", ^{
    describe(@"-refreshEmployeesWithCompletion:", ^{
        it(@"fetches employees from the server and triggers a callback block", ^{
            [TBTeamStubbing stubRequestForAllEmployees];
            RSTEmployeesViewModel *viewModel = [RSTEmployeesViewModel new];
            __block BOOL blockDidFire = NO;
            
            [viewModel refreshEmployeesWithCompletion:^{
                blockDidFire = YES;
            }];
            
            expect(blockDidFire).will.beTruthy();
        });

        it(@"updates the number of employees", ^{
            [TBTeamStubbing stubRequestForAllEmployees];
            RSTEmployeesViewModel *viewModel = [RSTEmployeesViewModel new];

            expect([viewModel numberOfEmployees]).to.equal(0);

            [viewModel refreshEmployeesWithCompletion:nil];

            expect([viewModel numberOfEmployees]).will.equal(2);
        });
    });

    describe(@"-employeeAtIndexPath:", ^{
        context(@"when the view model has users", ^{
            it(@"returns the user at the provided index", ^{
                [TBTeamStubbing stubRequestForAllEmployees];
                RSTEmployeesViewModel *viewModel = [RSTEmployeesViewModel new];
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
                __block TBEmployee *employee;

                [viewModel refreshEmployeesWithCompletion:^{
                    employee = [viewModel employeeAtIndexPath:indexPath];
                }];

                expect(employee).willNot.beNil();
                expect(employee).will.beKindOf([TBEmployee class]);
            });
        });

        context(@"when the view model has no users", ^{
            it(@"returns nil", ^{
                RSTEmployeesViewModel *viewModel = [RSTEmployeesViewModel new];
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];

                __block id employee;

                expect(^{
                    employee = [viewModel employeeAtIndexPath:indexPath];
                }).notTo.raise(@"NSRangeException");

                expect(employee).to.beNil();
            });
        });
    });
});

SpecEnd
