import UIKit

final class YourRatingViewController: UIViewController, UIPickerViewDelegate {

    // MARK: - Properties

    weak var delegateRating: TransferDataBetweenVCDelegats?

    // MARK: Public
    // MARK: Private

    private let yourRatingLabel = UILabel()
    private let ratingPickerView = UIPickerView()
    private let saveRatingButton = UIButton()
    private var selectedRating: String = "10.0"
    private var arrayOfMarks: [Double] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        setupUI()
        arrayOfMarks = fillArray()
        self.ratingPickerView.dataSource = self
        self.ratingPickerView.delegate = self

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Setups

    func addSubviews() {
        view.addSubview(yourRatingLabel)
        view.addSubview(ratingPickerView)
        view.addSubview(saveRatingButton)
    }

    func addConstraints() {
        yourRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        yourRatingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        yourRatingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88).isActive = true
        yourRatingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -88).isActive = true

        yourRatingLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        ratingPickerView.translatesAutoresizingMaskIntoConstraints = false
        ratingPickerView.topAnchor.constraint(equalTo: yourRatingLabel.bottomAnchor, constant: 32).isActive = true
        ratingPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 1).isActive = true
        ratingPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1).isActive = true
        ratingPickerView.heightAnchor.constraint(equalToConstant: 131).isActive = true

        saveRatingButton.translatesAutoresizingMaskIntoConstraints = false
        saveRatingButton.topAnchor.constraint(equalTo: ratingPickerView.bottomAnchor, constant: 32).isActive = true
        saveRatingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        saveRatingButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
        saveRatingButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    func setupUI() {

        view.backgroundColor = AppColor.viewControllerBackgroundColor

        yourRatingLabel.backgroundColor = .clear
        yourRatingLabel.textColor = AppColor.textColor
        yourRatingLabel.textAlignment = .center
        yourRatingLabel.text = "Your Rating"
        yourRatingLabel.font =  .manrope(ofSize: 24, weight: .medium)

        saveRatingButton.setTitle("Save", for: .normal)
        saveRatingButton.setTitleColor(UIColor.systemBlue, for: .normal)
        saveRatingButton.addTarget(self, action: #selector(saveRating), for: .touchUpInside)

        ratingPickerView.tintColor = .systemBlue
        ratingPickerView.backgroundColor = .clear

    }

    private func fillArray() -> [Double] {
        return Array(stride(from: 0.0, to: 10.1, by: 0.1)).reversed()
    }

    // MARK: - Helpers

    @objc private func saveRating() {
            delegateRating?.transferRating(selectedRating)
            navigationController?.popViewController(animated: true)
    }
}

extension YourRatingViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayOfMarks.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%.1f", arrayOfMarks[row])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRating = String(arrayOfMarks[row])
    }
}
