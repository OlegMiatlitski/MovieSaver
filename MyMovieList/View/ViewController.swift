import UIKit

final class ViewController: UIViewController {

    // MARK: - Properties
    // MARK: Public
    // MARK: Private

    private var tableView = UITableView()
    private var myMovie: [Movies] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Movie List"
        navigationController?.navigationBar.prefersLargeTitles = true
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewMovieAction))
        plusButton.tintColor = .systemBlue
        navigationItem.rightBarButtonItem = plusButton

        view.addSubview(tableView)
        setupMoviesTableView()
        addConstraints()
        setupUI()
    }

    // MARK: - Setups

    private func setupMoviesTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        self.tableView.register(TableViewCellMyMovieList.self, forCellReuseIdentifier: "TableViewCellMyMovieList")
    }

    private func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }

    // MARK: - Setups

    func setupUI() {

        view.backgroundColor = AppColor.viewControllerBackgroundColor
        tableView.backgroundColor = AppColor.viewControllerBackgroundColor
    }

    // MARK: - Helpers

    @objc func addNewMovieAction(sender: UIButton!) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let addNewVC = storyboard.instantiateViewController(
            withIdentifier: "AddNewViewController") as? AddNewViewController {
        addNewVC.delegateMovie = self
        navigationController?.pushViewController(addNewVC, animated: true)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myMovie.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vcDetailed = storyboard?.instantiateViewController(
            withIdentifier: "DetailedInfoAboutTheMovie"
        ) as? DetailedInfoAboutTheMovie {
            self.navigationController?.pushViewController(vcDetailed, animated: true)
            vcDetailed.set(movie: myMovie[indexPath.row])

        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(TableViewCellMyMovieList.self, forCellReuseIdentifier: "TableViewCellMyMovieList")
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: "TableViewCellMyMovieList", for: indexPath
        ) as? TableViewCellMyMovieList {
            cell.movieImage.image = myMovie[indexPath.row].imageMovie
            cell.movieNameLabel.text = myMovie[indexPath.row].movieName
            cell.movieRatingLabel.attributedText = ratingMovieInfo(indexPath)
            cell.releasingDateLabel.text = myMovie[indexPath.row].releaseDate
            cell.descriptionTextLabel.text = myMovie[indexPath.row].description
            cell.youTubelinkLabel.text = myMovie[indexPath.row].youtubeLink
            return cell
        }
        return UITableViewCell()
    }

    private func ratingMovieInfo(_ indexPath: IndexPath) -> NSMutableAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.manrope(ofSize: 18, weight: .bold)]
        let secondAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(
                red: 0.592,
                green: 0.592,
                blue: 0.592,
                alpha: 1
            ),
            NSAttributedString.Key.font: UIFont.manrope(ofSize: 18, weight: .light)]
        let firstString = NSMutableAttributedString(
            string: "\(myMovie[indexPath.row].movieRating)", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "/10", attributes: secondAttributes)
        firstString.append(secondString)
        return firstString
    }
}

// MARK: - TransferDataBetweenVCDelegats

extension ViewController: TransferMovieBetweenVCDelegats {
    func transferMovie(_ movie: Movies) {
        myMovie.insert(movie, at: 0)
        tableView.reloadData()
    }
}
