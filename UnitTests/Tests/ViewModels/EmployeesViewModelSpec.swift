import roster

class EmployeesViewModelSpec: QuickSpec {
    override func spec() {
        describe("numberOfEmployees") {
            it("returns the number of employees it knows about") {
                let employees = [TBEmployee.fixture()!, TBEmployee.fixture()!, TBEmployee.fixture()!]
                let viewModel = EmployeesViewModel(employees: employees)

                expect(viewModel.numberOfEmployees).to(equal(3))
            }
        }

        describe("employeeCellViewModelForIndexPath:") {
            it("returns an employee cell view model with the proper employee") {
                let employee = TBEmployee.fixture()!
                let employees = [TBEmployee(), employee]
                let viewModel = EmployeesViewModel(employees: employees)

                let indexPath = NSIndexPath(forItem: 1, inSection: 0)
                let passedEmployee = viewModel.employeeCellViewModelForIndexPath(indexPath)?.employee

                expect(passedEmployee).to(equal(employee))
            }

            context("when the index path is outside the bounds of the contained employees") {
                it("returns .None") {
                    let viewModel = EmployeesViewModel()
                    let indexPath = NSIndexPath(forItem: 0, inSection: 0)

                    let cellViewModel = viewModel.employeeCellViewModelForIndexPath(indexPath)

                    expect(cellViewModel).to(beNil())
                }
            }
        }
    }
}
