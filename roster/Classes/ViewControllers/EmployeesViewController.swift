import UIKit

class EmployeesViewController: UITableViewController {
    var viewModel: EmployeeListViewModel = EmployeeListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        TBTeamClient().fetchAllEmployeesWithCompletion { employees, error in
            self.viewModel = EmployeeListViewModel(employees: employees as [TBEmployee])
            self.tableView.reloadData()
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfEmployees
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EmployeeCell", forIndexPath: indexPath) as EmployeeCell

        if let cellViewModel = viewModel.employeeViewModelForIndexPath(indexPath) {
            cell.configureWithViewModel(cellViewModel)
        }

        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as EmployeeDetailViewController
        destination.viewModel = viewModel.employeeViewModelForIndexPath(tableView.indexPathForSelectedRow()!)
    }
}
