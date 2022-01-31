import UIKit

protocol TransferLinkBetweenVCDelegats: AnyObject {
    func transferLink(_ text: String)
}

final class YouTubeLinkViewController: UIViewController {
    
    // MARK: - Properties
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
        
        youTubeLinkLabel.backgroundColor = .clear
        youTubeLinkLabel.textColor = .black
        youTubeLinkLabel.textAlignment = .center
        youTubeLinkLabel.text = "YouTube Link"
        youTubeLinkLabel.font =  .manrope(ofSize: 24, weight: .medium)
        
        linkTextField.layer.cornerRadius = 5
        linkTextField.layer.borderWidth = 0.3
        linkTextField.placeholder = " YouTube Link"
        linkTextField.textAlignment = .center
        
        saveLinkButton.setTitle("Save", for: .normal)
        saveLinkButton.setTitleColor(UIColor.systemBlue, for: .normal)
        saveLinkButton.addTarget(self, action: #selector(saveLink), for: .touchUpInside)
        
    }
    // MARK: - Helpers
    
    weak var delegateLink: TransferLinkBetweenVCDelegats?
    
    @objc private func saveLink() -> UIAlertController{
        let alert = UIAlertController(title: "Error" , message: "Enter YouTube Link", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        
        let enteredLink = linkTextField.text!
        if enteredLink.contains("//") {
            delegateLink?.transferLink(enteredLink)
            navigationController?.popViewController(animated: true)
            return alert
            
        } else {
            present(alert,animated: true,completion: nil)
            linkTextField.layer.borderColor = UIColor.red.cgColor
            linkTextField.layer.borderWidth = 3
            return  alert
            
        }
    }
}


