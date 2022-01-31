import UIKit

final class TableViewCellMyMovieList: UITableViewCell {
    
    // MARK: - Properties
    // MARK: Public
    
    // MARK: Private
    
    var movieView = UIView()
    var movieImage = UIImageView()
    var movieNameLabel = UILabel()
    var movieRatingLabel = UILabel()
    let whiteView = UIView()
    let releasingDateLabel = UILabel()
    let descriptionTextLabel = UILabel()
    let youTubelinkLabel = UILabel()
    
    // MARK: - Lifecycle
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraint()
        setupUI()
        addShadow()
    
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups

    
    private func addSubviews() {
        contentView.addSubview(movieView)
        contentView.addSubview(movieImage)
        contentView.addSubview(movieNameLabel)
        contentView.addSubview(movieRatingLabel)
        contentView.addSubview(whiteView)
    }
    
    private func setupConstraint() {
        movieView.translatesAutoresizingMaskIntoConstraints = false
        movieView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        movieView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        movieView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        movieView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        movieView.heightAnchor.constraint(equalToConstant: 212).isActive = true
        
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        movieImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        movieImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -155).isActive = true
        
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        whiteView.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: -15).isActive = true
        whiteView.trailingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 0).isActive = true
        
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.topAnchor.constraint(equalTo: movieView.topAnchor, constant: 34).isActive = true
        movieNameLabel.heightAnchor.constraint(equalToConstant: 59).isActive = true
        movieNameLabel.leadingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: 15).isActive = true
        movieNameLabel.trailingAnchor.constraint(equalTo: movieView.trailingAnchor, constant: -15).isActive = true
        
        movieRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        movieRatingLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 30).isActive = true
        movieRatingLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        movieRatingLabel.leadingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: 15).isActive = true
        movieRatingLabel.trailingAnchor.constraint(equalTo: movieView.trailingAnchor, constant: -15).isActive = true
        
    }
    
    private func setupUI() {
        
        contentView.backgroundColor = .systemGray5

        movieImage.layer.cornerRadius = 15
        movieImage.layer.masksToBounds = true
        movieImage.contentMode = .scaleAspectFill
        
        whiteView.backgroundColor = .white
        
        movieView.backgroundColor = .white
        movieView.layer.cornerRadius = 15
        movieView.layer.masksToBounds = true
        movieView.layer.shadowColor = UIColor.black.cgColor
        movieView.layer.shadowOpacity = 0.5
        movieView.layer.shadowRadius = 1
        
        movieNameLabel.backgroundColor = .clear
        movieNameLabel.textColor = .black
        movieNameLabel.textAlignment = .center
        movieNameLabel.numberOfLines = 0
        movieNameLabel.font = .manrope(ofSize: 18, weight: .medium)
        movieNameLabel.adjustsFontSizeToFitWidth = true

        
        movieRatingLabel.backgroundColor = .clear
        movieRatingLabel.textColor = .black
        movieRatingLabel.textAlignment = .center
        //        backgroundLabel.font = .systemFont(ofSize: 30, weight: .heavy)
        
    }
    
    func addShadow() {
        movieView.layer.shadowOpacity = 1
        movieView.layer.shadowRadius = 16
        movieView.layer.shadowOffset = CGSize(width: 0, height: 0)
        movieView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
    }
    
    // MARK: - Helpers

}


