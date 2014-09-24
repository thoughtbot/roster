import roster

class EmployeeViewModelSpec: QuickSpec {
    override func spec() {
        describe("employeeName") {
            it("returns the full name of the employee") {
                let employee = TBEmployee.fixture()
                let viewModel = EmployeeViewModel(employee: employee)

                expect(viewModel.employeeName).to(equal("Jimmy McNulty"))
            }
        }

        describe("employeeRole") {
            it("returns the display version of the employee's role") {
                let employee = TBEmployee.fixture()
                let viewModel = EmployeeViewModel(employee: employee)

                expect(viewModel.employeeRole).to(equal("iOS Developer"))
            }
        }

        describe("employeeOffice") {
            it("returns the employee's office") {
                let employee = TBEmployee.fixture()
                let viewModel = EmployeeViewModel(employee: employee)

                expect(viewModel.employeeOffice).to(equal("Baltimore"))
            }
        }

        describe("employeeAvatarURL") {
            it("returns the URL of the user's avatar") {
                let employee = TBEmployee.fixture()
                let viewModel = EmployeeViewModel(employee: employee)

                expect(viewModel.employeeAvatarURL).to(equal(employee.gravatarURL))
            }
        }
    }
}
