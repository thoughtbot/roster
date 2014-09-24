import UIKit

class EmployeeCell: UITableViewCell {
    @IBOutlet weak var employeeNameLabel: UILabel!
    @IBOutlet weak var employeeRoleLabel: UILabel!
    @IBOutlet weak var employeeOfficeLabel: UILabel!
    @IBOutlet weak var employeeAvatarView: AsyncLoadingImageView!

    func configureWithViewModel(viewModel: EmployeeViewModel) {
        employeeNameLabel.text = viewModel.employeeName
        employeeRoleLabel.text = viewModel.employeeRole
        employeeOfficeLabel.text = viewModel.employeeOffice
        employeeAvatarView.setImageWithURL(viewModel.employeeAvatarURL)
    }
}
