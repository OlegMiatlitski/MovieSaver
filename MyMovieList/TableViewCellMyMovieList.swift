import UIKit

final class TableViewCellMyMovieList: UITableViewCell {

    // MARK: - Properties
    // MARK: Public

    // MARK: Private

     let backgroundLabel = UILabel()
    let flagLabel = UILabel()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraint()
        setupUI()
    }
//custom iniciatizar=tor
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    private func addSubviews() {
        contentView.addSubview(backgroundLabel)
        backgroundLabel.addSubview(flagLabel)
    }

    private func setupConstraint() {
        backgroundLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        backgroundLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        backgroundLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        backgroundLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        backgroundLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        flagLabel.translatesAutoresizingMaskIntoConstraints = false
        flagLabel.topAnchor.constraint(equalTo: backgroundLabel.topAnchor, constant: 10).isActive = true
        flagLabel.bottomAnchor.constraint(equalTo: backgroundLabel.bottomAnchor, constant: -10).isActive = true
        flagLabel.leadingAnchor.constraint(equalTo: backgroundLabel.leadingAnchor, constant: 10).isActive = true
        flagLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        flagLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupUI() {
        backgroundLabel.backgroundColor = .systemGray
        backgroundLabel.layer.cornerRadius = 40
        backgroundLabel.layer.masksToBounds = true
        backgroundLabel.textColor = .white
        backgroundLabel.font = .systemFont(ofSize: 30, weight: .heavy)
        backgroundLabel.textAlignment = .center
        
        flagLabel.layer.cornerRadius = 30
        flagLabel.layer.masksToBounds = true
        flagLabel.textAlignment = .center
        flagLabel.font = .systemFont(ofSize: 50, weight: .heavy)
    }
}

