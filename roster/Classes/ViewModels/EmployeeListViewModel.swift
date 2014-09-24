public struct EmployeeListViewModel {
    let employees: [TBEmployee]

    public init(employees: [TBEmployee] = []) {
        self.employees = employees
    }
}

public extension EmployeeListViewModel {
    var numberOfEmployees: Int {
        return employees.count
    }

    func employeeViewModelForIndexPath(indexPath: NSIndexPath) -> EmployeeViewModel? {
        let index = indexPath.item
        if index < numberOfEmployees {
            return EmployeeViewModel(employee: employees[indexPath.row])
        } else {
            return .None
        }
    }
}
