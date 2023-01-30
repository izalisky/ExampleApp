//
//  MoviesListController.swift
//  TestApp
//
//  Created by Ihor Zaliskyj on 21.11.2022.
//

import UIKit

class MoviesListController: UITableViewController {
    var viewModel : MoviesListDelegate!
    let indicator = UIActivityIndicatorView(style: .medium)
    
    init() {
        super.init(style: .plain)
        viewModel = MoviesListViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        configureTable()
        setupSearchBar()
        refresh()
        setupNavigationBarItem()
    }
    
    func configureTable(){
        tableView.register(MoviewPreviewCell.self, forCellReuseIdentifier: MoviewPreviewCell.identifier)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        setupRefreshControl()
    }
    
    func setupNavigationBarItem(){
        let button = UIButton(type: .infoDark)
        button.addTarget(self, action: #selector(showInfoController), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func showInfoController(){
        let controller = CharacterInTitleController(titles: viewModel.allMoviesTitles)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Pull to refresh methods
    
    func setupRefreshControl(){
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: Strings.pullToRefreshTitle.localized)
        refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    @objc func refresh() {
        showLoading()
        viewModel?.loadMoviesList{ [weak self] error in
            self?.endRefresh()
            guard let error = error else { return }
            self?.showAlert(title: Strings.errorTitle.localized, message: error.localizedDescription)
        }
    }
    
    func showLoading(){
        guard let nc = navigationController else { return }
        indicator.center = nc.view.center
        indicator.color = .black
        nc.view.addSubview(indicator)
        indicator.startAnimating()
    }
    
    @objc func endRefresh(){
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
        guard indicator.superview != nil else { return }
        indicator.stopAnimating()
        indicator.removeFromSuperview()
    }
}

// MARK: - Table view data source

extension MoviesListController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviewPreviewCell.identifier, for: indexPath) as? MoviewPreviewCell
        cell?.movie = viewModel?.movie(for: indexPath.row)
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = MovieDetailsController(movie: viewModel.movie(for: indexPath.row))
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension MoviesListController: UISearchResultsUpdating {
    
    // MARK: - search methods
    
    func setupSearchBar(){
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Strings.searchBarPlaceholder.localized
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        viewModel?.filterMovies(searchController.searchBar.text ?? "")
        tableView.reloadData()
    }
}
