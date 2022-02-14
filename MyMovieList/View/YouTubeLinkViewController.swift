import UIKit

final class YouTubeLinkViewController: UIViewController {

    // MARK: - Properties

    weak var delegateLink: TransferDataBetweenVCDelegats?

    // MARK: Public
    // MARK: Private

    private let youTubeLinkLabel = UILabel()
    private let linkTextField = UITextField()
    private let saveLinkButton = UIButton()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        setupUI()

    }

    // MARK: - Setups

    func addSubviews() {
        view.addSubview(youTubeLinkLabel)
        view.addSubview(linkTextField)
        view.addSubview(saveLinkButton)
    }

    func addConstraints() {
        youTubeLinkLabel.translatesAutoresizingMaskIntoConstraints = false
        youTubeLinkLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        youTubeLinkLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88).isActive = true
        youTubeLinkLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -88).isActive = true
        youTubeLinkLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true

        linkTextField.translatesAutoresizingMaskIntoConstraints = false
        linkTextField.topAnchor.constraint(equalTo: youTubeLinkLabel.bottomAnchor, constant: 32).isActive = true
        linkTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        linkTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        linkTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true

        saveLinkButton.translatesAutoresizingMaskIntoConstraints = false
        saveLinkButton.topAnchor.constraint(equalTo: linkTextField.bottomAnchor, constant: 32).isActive = true
        saveLinkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        saveLinkButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
        saveLinkButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    func setupUI() {

        view.backgroundColor = AppColor.viewControllerBackgroundColor

        youTubeLinkLabel.backgroundColor = .clear
        youTubeLinkLabel.textColor = AppColor.textColor
        youTubeLinkLabel.textAlignment = .center
        youTubeLinkLabel.text = "YouTube Link"
        youTubeLinkLabel.font =  .manrope(ofSize: 24, weight: .medium)
        youTubeLinkLabel.adjustsFontSizeToFitWidth = true
        youTubeLinkLabel.minimumScaleFactor = 0.5

        linkTextField.layer.cornerRadius = 5
        linkTextField.layer.borderWidth = 0.3
        linkTextField.placeholder = "http://"
        linkTextField.textAlignment = .left

        saveLinkButton.setTitle("Save", for: .normal)
        saveLinkButton.setTitleColor(UIColor.systemBlue, for: .normal)
        saveLinkButton.addTarget(self, action: #selector(saveLink), for: .touchUpInside)

    }
    // MARK: - Helpers

    @objc private func saveLink() {

        delegateLink?.transferLink("http://" + linkTextField.text!)
            navigationController?.popViewController(animated: true)
    }
}
