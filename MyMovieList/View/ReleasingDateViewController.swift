import UIKit

protocol TransferDateBetweenVCDelegats: AnyObject {
    func transferDate(_ text: String)
}

final class ReleasingDateViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    
    var data: [String] = []
    weak var delegateDate: TransferDateBetweenVCDelegats?
    private let releasingDateLabel = UILabel()
    private let datePicker = UIDatePicker()
    private let saveRealisingDateButton = UIButton()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addConstraints()
        setupUI()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
    }
    
    // MARK: - Setups
    
    func addSubviews() {
        
        view.addSubview(releasingDateLabel)
        view.addSubview(datePicker)
        view.addSubview(saveRealisingDateButton)
    }
    
    func addConstraints() {
        releasingDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releasingDateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        releasingDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88).isActive = true
        releasingDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -88).isActive = true
        releasingDateLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.topAnchor.constraint(equalTo: releasingDateLabel.bottomAnchor, constant: 32).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 194).isActive = true
        
        saveRealisingDateButton.translatesAutoresizingMaskIntoConstraints = false
        saveRealisingDateButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 32).isActive = true
        saveRealisingDateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        saveRealisingDateButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
        saveRealisingDateButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }
    
    func setupUI() {
        
        releasingDateLabel.backgroundColor = .clear
        releasingDateLabel.textColor = .black
        releasingDateLabel.textAlignment = .center
        releasingDateLabel.text = "Release date"
        releasingDateLabel.font =  .manrope(ofSize: 24, weight: .medium)
        
        saveRealisingDateButton.setTitle("Save", for: .normal)
        saveRealisingDateButton.setTitleColor(UIColor.systemBlue, for: .normal)
        saveRealisingDateButton.addTarget(self, action: #selector(saveDate), for: .touchUpInside)
        
    }
    // MARK: - Helpers
    
    @objc func saveDate(sender: UIButton!) {
        
        let dateAnswer = DateFormatter()
        dateAnswer.dateFormat = "yyyy"
        let releasingDate: String = dateAnswer.string(from: datePicker.date)
        delegateDate?.transferDate(releasingDate)
        navigationController?.popViewController(animated: true)
    }
}
