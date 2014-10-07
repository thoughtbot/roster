import roster

class EmployeeViewModelSpec: QuickSpec {
    override func spec() {
        describe("displayName") {
            it("returns the full name of the employee") {
                let employee = TBEmployee.fixture()
                let viewModel = EmployeeViewModel(employee: employee)

                expect(viewModel.displayName).to(equal("Jimmy McNulty"))
            }
        }

        describe("role") {
            it("returns the display version of the employee's role") {
                let employee = TBEmployee.fixture()
                let viewModel = EmployeeViewModel(employee: employee)

                expect(viewModel.role).to(equal("iOS Developer"))
            }
        }

        describe("officeName") {
            it("returns the employee's office") {
                let employee = TBEmployee.fixture()
                let viewModel = EmployeeViewModel(employee: employee)

                expect(viewModel.officeName).to(equal("Baltimore"))
            }
        }

        describe("avatarURL") {
            it("returns the URL of the user's avatar") {
                let employee = TBEmployee.fixture()
                let viewModel = EmployeeViewModel(employee: employee)

                expect(viewModel.avatarURL).to(equal(employee.gravatarURL))
            }
        }

        describe("email") {
            it("returns the employee's email address") {
                let employee = TBEmployee.fixture()
                let viewModel = EmployeeViewModel(employee: employee)

                expect(viewModel.email).to(equal(employee.emailAddress))
            }
        }

        describe("phoneNumber") {
            it("returns the employee's phone number") {
                let employee = TBEmployee.fixture()
                let viewModel = EmployeeViewModel(employee: employee)

                expect(viewModel.phoneNumber).to(equal(employee.phoneNumber))
            }
        }

        describe("website") {
            it("returns the employee's personal website") {
                let employee = TBEmployee.fixture()
                let viewModel = EmployeeViewModel(employee: employee)

                expect(viewModel.website).to(equal("en.wikipedia.org/wiki/Jimmy_McNulty"))
            }

            context("when the url is nil") {
                it("returns an empty string") {
                    var employee = TBEmployee.fixture()
                    employee.personalWebsiteURL = .None
                    let viewModel = EmployeeViewModel(employee: employee)

                    expect (viewModel.website).to(equal(""))
                }
            }
        }

        describe("twitterHandle") {
            it("returns the employee's formatted Twitter handle") {
                let employee = TBEmployee.fixture()
                let viewModel = EmployeeViewModel(employee: employee)

                expect(viewModel.twitterHandle).to(equal("@McNultweet"))
            }

            context("when the employee doesn't have a Twitter handle") {
                it("returns an empty string") {
                    var employee = TBEmployee.fixture()
                    employee.twitterUsername = .None
                    let viewModel = EmployeeViewModel(employee: employee)

                    expect(viewModel.twitterHandle).to(equal(""))
                }
            }
        }

        describe("githubHandle") {
            it("returns the employee's formatted GitHub handle") {
                let employee = TBEmployee.fixture()
                let viewModel = EmployeeViewModel(employee: employee)

                expect(viewModel.githubHandle).to(equal("@McNulty"))
            }

            context("when the employee doesn't have a GitHub handle") {
                it("returns an empty string") {
                    var employee = TBEmployee.fixture()
                    employee.githubUsername = .None
                    let viewModel = EmployeeViewModel(employee: employee)

                    expect(viewModel.githubHandle).to(equal(""))
                }
            }
        }

        describe("hireDate") {
            it("returns the employee's hire date") {
                let employee = TBEmployee.fixture()
                let viewModel = EmployeeViewModel(employee: employee)

                expect(viewModel.hireDate).to(equal("Hire Date: 12/31/69"))
            }

            context("when the employee's hire date is nil") {
                it("returns an empty string") {
                    var employee = TBEmployee.fixture()
                    employee.startDate = .None
                    let viewModel = EmployeeViewModel(employee: employee)

                    expect(viewModel.hireDate).to(equal(""))
                }
            }
        }
    }
}
