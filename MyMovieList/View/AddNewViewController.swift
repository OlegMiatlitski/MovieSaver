import UIKit

protocol TransferMovieBetweenVCDelegats: AnyObject {
    func transferMovie(_ movie: Movies)
}
protocol TransferDataBetweenVCDelegats: AnyObject {
    func transferName(_ name: String)
    func transferDate(_ date: String)
    func transferRating(_ text: String)
    func transferLink(_ link: String)
}

final class AddNewViewController: UIViewController {

    // MARK: - Properties

    weak var delegateMovie: TransferMovieBetweenVCDelegats?

    // MARK: Public
    // MARK: Private

    private let imageView = UIView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private var avatarImageView = UIImageView()
    private let imagePicker = UIImagePickerController()
    private let movieNameLabel = UILabel()
    private let yourRatingLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let youtubeLinkLabel = UILabel()
    private let changeNameButton = UIButton()
    private let changeRatingButton = UIButton()
    private let changeReleasingDateButton = UIButton()
    private let changeYoutubeLinkButton = UIButton()
    private var nameOfSelectedMovieLabel = UILabel()
    private var selectedReleasingDateLabel = UILabel()
    private var selectedRatingLabel = UILabel()
    private var selectedYoutubeLink = UILabel()
    private let descriptionLabel = UILabel()
    private let descriptionTextView = UITextView()
    private var basicVerticalStackView = UIStackView()
    private var horizontalOneStackView = UIStackView()
    private var horizontalTwoStackView = UIStackView()
    private var firstVerticalStackView = UIStackView()
    private var secondVerticalStackView = UIStackView()
    private var thirdVerticalStackView = UIStackView()
    private var fourthVerticalStackView = UIStackView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add new"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = AppColor.viewControllerBackgroundColor
        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveMovieAction))
        navigationItem.rightBarButtonItem = saveButton
        addSubviews()
        setupImagePicker()
        addStackView()
        setupViewConstrains()
        setupStackConstrains()
        setupStack()
        setupUI()
        setupButton()
        keyboardForDescriptionTextView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
    }
    // MARK: - Setups
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        imageView.addSubview(avatarImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(descriptionTextView)
    }

    func setupImagePicker() {
        imagePicker.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnImage(_ :)))
        avatarImageView.addGestureRecognizer(tapGesture)
        avatarImageView.isUserInteractionEnabled = true
    }
    private func addStackView() {
        firstVerticalStackView = UIStackView(arrangedSubviews: [
            movieNameLabel,
            nameOfSelectedMovieLabel,
            changeNameButton])
        secondVerticalStackView = UIStackView(arrangedSubviews: [
            yourRatingLabel,
            selectedRatingLabel,
            changeRatingButton
        ])
        thirdVerticalStackView = UIStackView(arrangedSubviews: [
            releaseDateLabel,
            selectedReleasingDateLabel,
            changeReleasingDateButton
        ])
        fourthVerticalStackView = UIStackView(arrangedSubviews: [
            youtubeLinkLabel,
            selectedYoutubeLink,
            changeYoutubeLinkButton
        ])
        horizontalOneStackView = UIStackView(arrangedSubviews: [
            firstVerticalStackView,
            secondVerticalStackView
        ])
        horizontalTwoStackView = UIStackView(arrangedSubviews: [
            thirdVerticalStackView,
            fourthVerticalStackView
        ])
        basicVerticalStackView = UIStackView(arrangedSubviews: [
            horizontalOneStackView,
            horizontalTwoStackView
        ])
        contentView.addSubview(basicVerticalStackView)
    }

    private func keyboardForDescriptionTextView() {
        self.scrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillShow(notification:)),
            name: UIResponder.keyboardWillShowNotification, object: nil
        )
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification, object: nil
        )
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    private func setupViewConstrains() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1.0).isActive = true

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27).isActive = true
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true

        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27).isActive = true
        avatarImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(
            equalTo: basicVerticalStackView.bottomAnchor,
            constant: 36
        ).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 311).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true

        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 11).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -47).isActive = true

        descriptionTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 145).isActive = true
        descriptionTextView.widthAnchor.constraint(equalToConstant: 311).isActive = true
        descriptionTextView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true

    }
    private func setupStackConstrains() {
        basicVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        basicVerticalStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32).isActive = true
        basicVerticalStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        basicVerticalStackView.heightAnchor.constraint(equalToConstant: 198).isActive = true
        basicVerticalStackView.widthAnchor.constraint(equalToConstant: 295).isActive = true

    }
    private func setupStack() {
        basicVerticalStackView.axis = .vertical
        basicVerticalStackView.distribution = .fillEqually
        basicVerticalStackView.spacing = 10

        horizontalOneStackView.axis = .horizontal
        horizontalOneStackView.distribution = .fillEqually
        horizontalOneStackView.spacing = 10

        horizontalTwoStackView.axis = .horizontal
        horizontalTwoStackView.distribution = .fillEqually
        horizontalTwoStackView.spacing = 10

        firstVerticalStackView.axis = .vertical
        firstVerticalStackView.distribution = .fillEqually
        firstVerticalStackView.spacing = 5

        secondVerticalStackView.axis = .vertical
        secondVerticalStackView.distribution = .fillEqually
        secondVerticalStackView.spacing = 5

        thirdVerticalStackView.axis = .vertical
        thirdVerticalStackView.distribution = .fillEqually
        thirdVerticalStackView.spacing = 5

        fourthVerticalStackView.axis = .vertical
        fourthVerticalStackView.distribution = .fillEqually
        fourthVerticalStackView.spacing = 5

    }

    private func setupUI() {

        view.backgroundColor = AppColor.viewControllerBackgroundColor
        imageView.backgroundColor = .clear
        avatarImageView.image = UIImage(named: "defaultImage")

        let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConstraint.priority = UILayoutPriority(rawValue: 100)
        heightConstraint.isActive = true

        movieNameLabel.text = "Name"
        movieNameLabel.textAlignment = .center
        movieNameLabel.font = .manrope(ofSize: 18, weight: .medium)
        movieNameLabel.textColor = AppColor.textColor

        yourRatingLabel.text = "Your Rating"
        yourRatingLabel.font = .manrope(ofSize: 18, weight: .medium)
        yourRatingLabel.textAlignment = .center
        yourRatingLabel.textColor = AppColor.textColor

        releaseDateLabel.text = "Release Date"
        releaseDateLabel.font = .manrope(ofSize: 18, weight: .medium)
        releaseDateLabel.textAlignment = .center
        releaseDateLabel.textColor = AppColor.textColor

        youtubeLinkLabel.text = "YouTube Link"
        youtubeLinkLabel.font = .manrope(ofSize: 18, weight: .medium)
        youtubeLinkLabel.textAlignment = .center
        youtubeLinkLabel.textColor = AppColor.textColor

        changeNameButton.setTitle("Change", for: .normal)
        changeNameButton.setTitleColor(.systemBlue, for: .normal)
        changeRatingButton.setTitle("Change", for: .normal)
        changeRatingButton.setTitleColor(.systemBlue, for: .normal)
        changeReleasingDateButton.setTitle("Change", for: .normal)
        changeReleasingDateButton.setTitleColor(.systemBlue, for: .normal)
        changeYoutubeLinkButton.setTitle("Change", for: .normal)
        changeYoutubeLinkButton.setTitleColor(.systemBlue, for: .normal)

        nameOfSelectedMovieLabel.text = "-"
        nameOfSelectedMovieLabel.textColor = AppColor.textColor
        nameOfSelectedMovieLabel.font = .manrope(ofSize: 18, weight: .medium)
        nameOfSelectedMovieLabel.textAlignment = .center
        nameOfSelectedMovieLabel.adjustsFontSizeToFitWidth = true
        nameOfSelectedMovieLabel.minimumScaleFactor = 0.5

        selectedRatingLabel.text = "-"
        selectedRatingLabel.textColor = AppColor.textColor
        selectedRatingLabel.font = .manrope(ofSize: 18, weight: .medium)
        selectedRatingLabel.textAlignment = .center
        selectedRatingLabel.adjustsFontSizeToFitWidth = true
        selectedRatingLabel.minimumScaleFactor = 0.5

        selectedReleasingDateLabel.text = "-"
        selectedReleasingDateLabel.textColor = AppColor.textColor
        selectedReleasingDateLabel.font = .manrope(ofSize: 18, weight: .medium)
        selectedReleasingDateLabel.textAlignment = .center
        selectedReleasingDateLabel.adjustsFontSizeToFitWidth = true
        selectedReleasingDateLabel.minimumScaleFactor = 0.5

        selectedYoutubeLink.text = "-"
        selectedYoutubeLink.textColor = AppColor.textColor
        selectedYoutubeLink.font = .manrope(ofSize: 18, weight: .medium)
        selectedYoutubeLink.textAlignment = .center
        selectedYoutubeLink.adjustsFontSizeToFitWidth = true
        selectedYoutubeLink.minimumScaleFactor = 0.5

        descriptionLabel.text = "Description"
        descriptionLabel.font = .manrope(ofSize: 18, weight: .medium)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = AppColor.textColor

        descriptionTextView.font =  .manrope(ofSize: 14, weight: .regular)
        descriptionTextView.backgroundColor = .white
        descriptionTextView.textColor = .black
        descriptionTextView.layer.borderWidth = 0.5
    }

    private func setupButton() {
        changeRatingButton.addTarget(self, action: #selector(changeRating), for: .touchUpInside)
        changeNameButton.addTarget(self, action: #selector(changeName), for: .touchUpInside)
        changeReleasingDateButton.addTarget(self, action: #selector(changeDate), for: .touchUpInside)
        changeYoutubeLinkButton.addTarget(self, action: #selector(changeLink), for: .touchUpInside)
    }

    // MARK: - Helpers

    @objc func tapOnImage(_ sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "Photo", message: nil, preferredStyle: .actionSheet)
        let actionPhoto = UIAlertAction(title: "Gallery", style: .default) { (_ alert) in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { (_ alert) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actionPhoto)
        alert.addAction(actionCamera)
        alert.addAction(actionCancel)
        present(alert, animated: true, completion: nil)
    }

    @objc private func hideKeyboard() {
        self.view.endEditing(true)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            self.scrollView.frame.origin.y -= keyboardHeight
        }
    }

    @objc private func keyboardWillHide() {
        self.scrollView.frame.origin.y = 0
    }
    @objc func changeName(sender: UIButton!) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let nameVC = storyboard.instantiateViewController(
            withIdentifier: "MovieNameViewController"
        ) as? MovieNameViewController {
            nameVC.delegateName = self
            navigationController?.pushViewController(nameVC, animated: true)
        }
    }
    @objc func changeDate(sender: UIButton!) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let dateVC = storyboard.instantiateViewController(
            withIdentifier: "ReleasingDateViewController"
        ) as? ReleasingDateViewController {
            dateVC.delegateDate = self
            navigationController?.pushViewController(dateVC, animated: true)
        }
    }
    @objc func changeRating(sender: UIButton!) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let ratingVC = storyboard.instantiateViewController(
            withIdentifier: "YourRatingViewController"
        ) as? YourRatingViewController {
            ratingVC.delegateRating = self
            navigationController?.pushViewController(ratingVC, animated: true)
        }
    }
    @objc func changeLink(sender: UIButton!) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let linkVC = storyboard.instantiateViewController(
            withIdentifier: "YouTubeLinkViewController"
        ) as? YouTubeLinkViewController {
            linkVC.delegateLink = self
            navigationController?.pushViewController(linkVC, animated: true)
        }
    }
    @objc func saveMovieAction(sender: UIButton!) {
        let movieInfo = Movies(
            movieName: nameOfSelectedMovieLabel.text!,
            movieRating: selectedRatingLabel.text!,
            releaseDate: selectedReleasingDateLabel.text!,
            youtubeLink: selectedYoutubeLink.text!,
            imageMovie: avatarImageView.image!,
            description: descriptionTextView.text!
        )
        delegateMovie?.transferMovie(movieInfo)
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - TransferDataBetweenVCDelegats

extension AddNewViewController: TransferDataBetweenVCDelegats {
    func transferName(_ text: String) {
        nameOfSelectedMovieLabel.text = text
    }
    func transferDate(_ text: String) {
        selectedReleasingDateLabel.text = text
    }
    func transferRating(_ text: String) {
        selectedRatingLabel.text = String(text)
    }
    func transferLink(_ text: String) {
        selectedYoutubeLink.text = text
    }
}

extension AddNewViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    private func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    private func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(
                title: "Warning",
                message: "You don't have permission to access gallery.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.originalImage] as? UIImage {
            avatarImageView.image = image
        }
        if let image = info[.editedImage] as? UIImage {
            avatarImageView.image = image
        }
    }
}
