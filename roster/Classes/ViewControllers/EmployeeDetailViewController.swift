import UIKit

class EmployeeDetailViewController: UITableViewController {
    @IBOutlet weak var employeeAvatarView: AsyncLoadingImageView!
    @IBOutlet weak var employeeNameLabel: UILabel!
    @IBOutlet weak var employeeRoleLabel: UILabel!
    @IBOutlet weak var employeeOfficeLabel: UILabel!

    @IBOutlet weak var employeeEmailLabel: UILabel!
    @IBOutlet weak var employeePhoneNumberLabel: UILabel!
    @IBOutlet weak var employeeWebsiteLabel: UILabel!
    @IBOutlet weak var employeeTwitterLabel: UILabel!
    @IBOutlet weak var employeeGitHubLabel: UILabel!

    @IBOutlet weak var employeeHireDateLabel: UILabel!

    var viewModel: EmployeeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.avatarURL >>- employeeAvatarView.setImageWithURL

        employeeNameLabel.text = viewModel?.displayName
        employeeRoleLabel.text = viewModel?.role
        employeeOfficeLabel.text = viewModel?.officeName
        employeeEmailLabel.text = viewModel?.email
        employeePhoneNumberLabel.text = viewModel?.phoneNumber
        employeeWebsiteLabel.text = viewModel?.website
        employeeTwitterLabel.text = viewModel?.twitterHandle
        employeeGitHubLabel.text = viewModel?.githubHandle

        employeeHireDateLabel.text = viewModel?.hireDate
    }
}
