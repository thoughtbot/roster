import UIKit

class EmployeesViewController: UITableViewController {
    var employees: [TBEmployee] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        TBTeamClient().fetchAllEmployeesWithCompletion { employees, _ in
            self.employees = employees as [TBEmployee]
            self.tableView.reloadData()
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EmployeeCell", forIndexPath: indexPath) as EmployeeCell
        cell.configureWithEmployee(employees[indexPath.row])
        return cell
    }
}
