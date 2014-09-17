import UIKit

class EmployeeCell: UITableViewCell {
    @IBOutlet weak var employeeNameLabel: UILabel!
    @IBOutlet weak var employeeRoleLabel: UILabel!
    @IBOutlet weak var employeeOfficeLabel: UILabel!
    @IBOutlet weak var employeeAvatarView: AsyncLoadingImageView!

    func configureWithEmployee(employee: TBEmployee) {
        employeeNameLabel.text = employee.fullName
        employeeRoleLabel.text = employee.role.description
        employeeOfficeLabel.text = employee.office.description
        employeeAvatarView.setImageWithURL(employee.gravatarURL)
    }
}
