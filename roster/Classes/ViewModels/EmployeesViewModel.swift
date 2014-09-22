public struct EmployeesViewModel {
    let employees: [TBEmployee]

    public init(employees: [TBEmployee] = []) {
        self.employees = employees
    }
}

public extension EmployeesViewModel {
    var numberOfEmployees: Int {
        return employees.count
    }

    func employeeCellViewModelForIndexPath(indexPath: NSIndexPath) -> EmployeeCellViewModel? {
        let index = indexPath.item
        if index < numberOfEmployees {
            return EmployeeCellViewModel(employee: employees[indexPath.row])
        } else {
            return .None
        }
    }
}
