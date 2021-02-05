//
//  DetailPageViewController.swift
//  NewsApp
//
//  Created by Admin on 1/30/21.
//

import Foundation
import UIKit

class DetailPageViewController: ScrollViewController {
    var article:Articles?
    var defaultImageLink = "https://cdn.cnn.com/cnnnext/dam/assets/170515101540-01-john-cornyn-file-super-tease.jpg"
    
    
    
    // MARK: - Init
    init(article:Articles?){
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата: 12.12.12"
        label.textColor = .lightGray
        label.font = UIFont(name: "AvenirNext-Regular", size: 16)
        return label
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Новость"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
        return label
    }()
    
    lazy var newsPhoto: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "f79ea7241a2cecd10c3892cecdef04bf")
        return image
    }()
  
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.text = "BBC"
        label.textColor = .lightGray
        label.font = UIFont(name: "AvenirNext-Regular", size: 22)
        return label
    }()
    lazy var descritionTitle: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.textColor = .black
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
        return label
    }()
    lazy var descriptionText: UILabel = {
        let label = UILabel()
        label.text = "Вырезка является самым нежным и самым ценным отрубом, её объём составляет всего 2% от общего объёма туши. В кулинарии вырезку жарят и запекают целиком или порционными кусочками. Именно из нее готовят филе миньон, шато бриан, турнедо, лангет, бефстроганов, карпаччо и тартар. Рекомендации по приготовлению: быстрое обжаривание на гриле в виде стейков, запекание целиком, подача в сыром виде (карпаччо или тар-тар). Вырезка не требует долгой тепловой обработки."
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.font = UIFont(name: "ArialHebrew", size: 16)
        return label
    }()
 
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        setupData()
    }
    
    private func setupData() {
        self.titleLabel.text = self.article?.title ?? ""
        self.descriptionText.text = self.article?.description ?? ""
        self.dateLabel.text = (self.article?.publishedAt ?? "").toDate()
        self.authorLabel.text = self.article?.source?.name ?? ""
        
        
        let image = String((self.article?.urlToImage ?? defaultImageLink))
        let url = URL(string: image)
        
        self.newsPhoto.kf.setImage(with: url!)
    }
  
    
    //    MARK: - Setup views
    private func setupViews() {
        
        scrollView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(16)
        }
        scrollView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        scrollView.addSubview(newsPhoto)
        
        newsPhoto.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.width/1.3)
        }
     
        scrollView.addSubview(authorLabel)
        authorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(newsPhoto.snp.bottom).offset(8)
            make.right.equalToSuperview().offset(-16)
        }
        scrollView.addSubview(descritionTitle)
        descritionTitle.snp.makeConstraints { (make) in
            make.top.equalTo(authorLabel.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(16)
        }
        scrollView.addSubview(descriptionText)
        descriptionText.snp.makeConstraints { (make) in
            make.top.equalTo(descritionTitle.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }

    }
}
