import UIKit

protocol TransferNameBetweenVCDelegats: AnyObject {
    func transferName(_ text: String)
}

final class MovieNameViewController: UIViewController{
    
    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    
    private let movieNameLabel = UILabel()
    private let nameTextField = UITextField()
    private let saveNameButton = UIButton()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        setupUI()
        
    }
    
    // MARK: - Setups
    
    func addSubviews() {
        view.addSubview(movieNameLabel)
        view.addSubview(nameTextField)
        view.addSubview(saveNameButton)
    }
    
    func addConstraints() {
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        movieNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88).isActive = true
        movieNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -88).isActive = true
        movieNameLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 42).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        saveNameButton.translatesAutoresizingMaskIntoConstraints = false
        saveNameButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 42).isActive = true
        saveNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        saveNameButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
        saveNameButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }
    
    func setupUI() {
        
        movieNameLabel.backgroundColor = .clear
        movieNameLabel.textColor = .black
        movieNameLabel.textAlignment = .center
        movieNameLabel.text = "Movie name"
        movieNameLabel.font =  .manrope(ofSize: 24, weight: .medium)
        
        nameTextField.layer.cornerRadius = 5
        nameTextField.layer.borderWidth = 0.3
        nameTextField.placeholder = " Name"
        nameTextField.textAlignment = .center
        nameTextField.font = UIFont(name: "SFProText-Regular", size: 17)
        
        saveNameButton.setTitle("Save", for: .normal)
        saveNameButton.setTitleColor(UIColor.systemBlue, for: .normal)
        saveNameButton.addTarget(self, action: #selector(saveName), for: .touchUpInside)
        
    }
    // MARK: - Helpers
    
    weak var delegateName: TransferNameBetweenVCDelegats?
    
    @objc private func saveName() -> UIAlertController{
        let alert = UIAlertController(title: "Error" , message: "Enter movie name", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        
        let enteredMovieName = nameTextField.text!
        if enteredMovieName.isEmpty {
            present(alert,animated: true,completion: nil)
            nameTextField.layer.borderColor = UIColor.red.cgColor
            nameTextField.layer.borderWidth = 3
            return  alert
        } else {
            delegateName?.transferName(enteredMovieName)
            navigationController?.popViewController(animated: true)
            return alert
        }
    }
}


