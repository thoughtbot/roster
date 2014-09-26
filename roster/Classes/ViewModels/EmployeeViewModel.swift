public struct EmployeeViewModel {
    public let employee: TBEmployee

    public init(employee: TBEmployee) {
        self.employee = employee
    }
}

public extension EmployeeViewModel {
    var displayName: String {
        return employee.fullName
    }

    var role: String {
        return employee.role.description
    }

    var officeName: String {
        return employee.office.description
    }

    var email: String {
        return employee.emailAddress
    }

    var phoneNumber: String {
        return employee.phoneNumber
    }

    var website: String {
        let url = employee.personalWebsiteURL
        return "\(url.host)\(url.path)"
    }

    var twitterHandle: String {
        return "@\(employee.twitterUsername)"
    }

    var githubHandle: String {
        return "@\(employee.githubUsername)"
    }

    var hireDate: String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "'Hire Date:' M/d/yy"
        return formatter.stringFromDate(employee.startDate)
    }

    var avatarURL: NSURL {
        return employee.gravatarURL
    }
}
