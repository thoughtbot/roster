import UIKit

class EmployeesViewController: UITableViewController {
    var viewModel: EmployeesViewModel = EmployeesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        TBTeamClient().fetchAllEmployeesWithCompletion { employees, _ in
            self.viewModel = EmployeesViewModel(employees: employees as [TBEmployee])
            self.tableView.reloadData()
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfEmployees
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EmployeeCell", forIndexPath: indexPath) as EmployeeCell

        if let cellViewModel = viewModel.employeeCellViewModelForIndexPath(indexPath) {
            cell.configureWithViewModel(cellViewModel)
        }

        return cell
    }
}
