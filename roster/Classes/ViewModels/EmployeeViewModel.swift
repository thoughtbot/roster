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
        return displayWebsiteForURL(employee.personalWebsiteURL)
    }

    var twitterHandle: String {
        return handleForUsername(employee.twitterUsername)
    }

    var githubHandle: String {
        return handleForUsername(employee.githubUsername)
    }

    var hireDate: String {
        return Formatters.hireStringFromDate(employee.startDate)
    }

    var avatarURL: NSURL {
        return employee.gravatarURL
    }
}

private extension EmployeeViewModel {
    func handleForUsername(name: String?) -> String {
        let handle = usernameFormat <^> name
        return handle ?? ""
    }

    func displayWebsiteForURL(url: NSURL?) -> String {
        let websiteString = websiteFormat <^> url?.host <*> url?.path
        return websiteString ?? ""
    }
}

private func websiteFormat(host: String)(path: String) -> String {
    return "\(host)\(path)"
}

private func usernameFormat(name: String) -> String {
    return "@\(name)"
}
