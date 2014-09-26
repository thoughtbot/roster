import UIKit

class EmployeeCell: UITableViewCell {
    @IBOutlet weak var employeeNameLabel: UILabel!
    @IBOutlet weak var employeeRoleLabel: UILabel!
    @IBOutlet weak var employeeOfficeLabel: UILabel!
    @IBOutlet weak var employeeAvatarView: AsyncLoadingImageView!

    func configureWithViewModel(viewModel: EmployeeViewModel) {
        employeeNameLabel.text = viewModel.displayName
        employeeRoleLabel.text = viewModel.role
        employeeOfficeLabel.text = viewModel.officeName
        employeeAvatarView.setImageWithURL(viewModel.avatarURL)
    }
}
