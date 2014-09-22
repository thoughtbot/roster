public struct EmployeeCellViewModel {
    public let employee: TBEmployee

    public init(employee: TBEmployee) {
        self.employee = employee
    }
}

public extension EmployeeCellViewModel {
    var employeeName: String {
        return employee.fullName
    }

    var employeeRole: String {
        return employee.role.description
    }

    var employeeOffice: String {
        return employee.office.description
    }

    var employeeAvatarURL: NSURL {
        return employee.gravatarURL
    }
}
