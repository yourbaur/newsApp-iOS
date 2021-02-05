//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Admin on 1/30/21.
//

import Foundation
import UIKit

class NewsViewController: UIViewController {
    //MARK: - Properties
    var arrayOfArticles: [Articles] = []
    var viewModel = NewsViewModel()
    var valuesViewModel = NewsValuesViewModel()
    
    lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.register(NewsHeaderView.self, forHeaderFooterViewReuseIdentifier: "headerViewId")
        tableview.register(NewsTableViewCell.self, forCellReuseIdentifier: "newsCell")
        
        return tableview
    }()
    
    //MARK: - Lifycycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getNews()
        bind()
        
        setupView()
    }
    
    
    private func setupView() -> Void {
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(70)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(0)
        }
    }
    
    private func getNews() {
        valuesViewModel.setCountry(country: "us")
        let parameters: Parameters = valuesViewModel.getNews()
        
        guard !parameters.isEmpty else { self.showErrorMessage(messageType: .none, valuesViewModel.errorMessage); return }
        
        viewModel.getNews(parameters: parameters)
    }
    
    
    private func bind() {
        viewModel.news.observe(on: self) { (news) in
            if news != nil {
                self.arrayOfArticles = news?.articles ?? [Articles]()
                self.tableView.reloadData()
            }
        }
        
        viewModel.loading.observe(on: self) { (loading) in
            if loading {
                LoaderView.show()
            }
            else {
                LoaderView.hide()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Latest news"
        
      
        navigationController?.navigationBar.barTintColor = .mainColor
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    @objc
    func shareLink(sender:ShareButton) {
        let items = [URL(string:sender.link)]
        self.present(UIActivityViewController(activityItems: items, applicationActivities: nil),animated: true)
    }

  
}

//MARK: - TableView Delegate
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
            cell.setupData(self.arrayOfArticles[indexPath.row])
            
            cell.shareButton.addTarget(self, action: #selector(shareLink(sender:)), for: .touchUpInside)
    
            
            return cell
    }
    
  
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerViewId") as! NewsHeaderView
        
        headerView.contentView.backgroundColor = .white
        headerView.backgroundColor = .clear
        
        headerView.titleLabel.font = .systemFont(ofSize: 20)
        headerView.titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
        }
        
        let headerTile = "USA News"
        
        
        headerView.titleLabel.text = headerTile
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.navigationController?.pushViewController(
            DetailPageViewController(article: self.arrayOfArticles[indexPath.row]), animated: true)
    }
}


