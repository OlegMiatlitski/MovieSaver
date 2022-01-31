import UIKit
import WebKit

final class DetailedInfoAboutTheMovie: UIViewController {
    
    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    
    private let detailedScrollView = UIScrollView()
    private let detailedView = UIView()
    var movieDetailedImage = UIImageView()
    let whiteBackgroundView = UIView()
    let movieDetailedNameLabel = UILabel()
    var detailedRatingAndReleasingDateLabel = UILabel()
    let detailedDescriptionTextView = UILabel()
    var youTubeTrailerLinkWKWebView = WKWebView()
    var youTubeLink: String = ""
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        addSubviews()
        addConstraints()
        setupUI()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.hidesBarsOnSwipe = true
    }
  
    // MARK: - Setups
    
    func addSubviews() {
        view.addSubview(detailedScrollView)
        detailedScrollView.addSubview(detailedView)
        detailedView.addSubview(movieDetailedImage)
        detailedView.addSubview(whiteBackgroundView)
        detailedView.addSubview(movieDetailedNameLabel)
        detailedView.addSubview(detailedRatingAndReleasingDateLabel)
        detailedView.addSubview(detailedDescriptionTextView)
        detailedView.addSubview(youTubeTrailerLinkWKWebView)
    }
    
    //    keyboard
        
        
    
    func addConstraints() {
        
        detailedScrollView.translatesAutoresizingMaskIntoConstraints = false
        detailedScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        detailedScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        detailedScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        detailedScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

        detailedView.translatesAutoresizingMaskIntoConstraints = false
        detailedView.topAnchor.constraint(equalTo: detailedScrollView.topAnchor, constant: 0).isActive = true
        detailedView.leadingAnchor.constraint(equalTo: detailedScrollView.leadingAnchor, constant: 0).isActive = true
        detailedView.trailingAnchor.constraint(equalTo: detailedScrollView.trailingAnchor, constant: 0).isActive = true
        detailedView.bottomAnchor.constraint(equalTo: detailedScrollView.bottomAnchor, constant: 0).isActive = true
        detailedView.widthAnchor.constraint(equalTo: detailedScrollView.widthAnchor, multiplier: 1.0).isActive = true

        
        movieDetailedImage.translatesAutoresizingMaskIntoConstraints = false
        movieDetailedImage.topAnchor.constraint(equalTo: detailedView.topAnchor, constant: 0).isActive = true
        movieDetailedImage.leadingAnchor.constraint(equalTo: detailedView.leadingAnchor, constant: 0).isActive = true
        movieDetailedImage.trailingAnchor.constraint(equalTo: detailedView.trailingAnchor, constant: 0).isActive = true
        movieDetailedImage.heightAnchor.constraint(equalToConstant: 336).isActive = true
        
        whiteBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        whiteBackgroundView.topAnchor.constraint(equalTo: movieDetailedImage.bottomAnchor, constant: -29).isActive = true
        whiteBackgroundView.leadingAnchor.constraint(equalTo: detailedView.leadingAnchor, constant: 0).isActive = true
        whiteBackgroundView.trailingAnchor.constraint(equalTo: detailedView.trailingAnchor, constant: 0).isActive = true
        whiteBackgroundView.bottomAnchor.constraint(equalTo: detailedView.bottomAnchor, constant: 0).isActive = true
        
        movieDetailedNameLabel.translatesAutoresizingMaskIntoConstraints = false
        movieDetailedNameLabel.topAnchor.constraint(equalTo: whiteBackgroundView.topAnchor, constant: 29).isActive = true
        movieDetailedNameLabel.leadingAnchor.constraint(equalTo: detailedView.leadingAnchor, constant: 18).isActive = true
        movieDetailedNameLabel.trailingAnchor.constraint(equalTo: detailedView.trailingAnchor, constant: -18).isActive = true
        movieDetailedNameLabel.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        detailedRatingAndReleasingDateLabel.translatesAutoresizingMaskIntoConstraints = false
        detailedRatingAndReleasingDateLabel.topAnchor.constraint(equalTo: movieDetailedNameLabel.bottomAnchor, constant: 14).isActive = true
        detailedRatingAndReleasingDateLabel.leadingAnchor.constraint(equalTo: detailedView.leadingAnchor, constant: 18).isActive = true
        detailedRatingAndReleasingDateLabel.trailingAnchor.constraint(equalTo: detailedView.trailingAnchor, constant: -18).isActive = true
        detailedRatingAndReleasingDateLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        detailedDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        detailedDescriptionTextView.topAnchor.constraint(equalTo: detailedRatingAndReleasingDateLabel.bottomAnchor, constant: 19).isActive = true
        detailedDescriptionTextView.leadingAnchor.constraint(equalTo: detailedView.leadingAnchor, constant: 18).isActive = true
        detailedDescriptionTextView.trailingAnchor.constraint(equalTo: detailedView.trailingAnchor, constant: -18).isActive = true
        detailedDescriptionTextView.heightAnchor.constraint(equalToConstant: 138).isActive = true
        
        youTubeTrailerLinkWKWebView.translatesAutoresizingMaskIntoConstraints = false
        youTubeTrailerLinkWKWebView.topAnchor.constraint(equalTo: detailedDescriptionTextView.bottomAnchor, constant: 24).isActive = true
        youTubeTrailerLinkWKWebView.bottomAnchor.constraint(equalTo: detailedView.bottomAnchor, constant: -52).isActive = true
        youTubeTrailerLinkWKWebView.leadingAnchor.constraint(equalTo: detailedView.leadingAnchor, constant: 18).isActive = true
        youTubeTrailerLinkWKWebView.trailingAnchor.constraint(equalTo: detailedView.trailingAnchor, constant: -18).isActive = true
        youTubeTrailerLinkWKWebView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    
    func setupUI() {
        
        whiteBackgroundView.layer.cornerRadius = 15
        whiteBackgroundView.layer.masksToBounds = true
        whiteBackgroundView.backgroundColor = .white
        
        movieDetailedNameLabel.backgroundColor = .clear
        movieDetailedNameLabel.textColor = .black
        movieDetailedNameLabel.textAlignment = .left
        movieDetailedNameLabel.numberOfLines = 0
        movieDetailedNameLabel.font = .manrope(ofSize: 24, weight: .bold)
        movieDetailedNameLabel.adjustsFontSizeToFitWidth = true
        
        
        detailedRatingAndReleasingDateLabel.backgroundColor = .clear
        detailedRatingAndReleasingDateLabel.textColor = .black
        detailedRatingAndReleasingDateLabel.textAlignment = .left
        
        detailedDescriptionTextView.backgroundColor = .clear
        detailedDescriptionTextView.numberOfLines = 0
        detailedDescriptionTextView.textColor = .black
        detailedDescriptionTextView.textAlignment = .left
        detailedDescriptionTextView.font = .manrope(ofSize: 14, weight: .regular)
        
        youTubeTrailerLinkWKWebView.layer.borderWidth = 0.5
        let url = URL(string: youTubeLink)
        let request = URLRequest(url: url!)
        youTubeTrailerLinkWKWebView.load(request)
        
    }
    // MARK: - Helpers
    
}


