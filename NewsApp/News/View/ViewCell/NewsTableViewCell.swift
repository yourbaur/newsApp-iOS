//
//  NewsViewCell.swift
//  NewsApp
//
//  Created by Admin on 1/30/21.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    
    var link = String()
    var defaultImageLink = "https://cdn.cnn.com/cnnnext/dam/assets/170515101540-01-john-cornyn-file-super-tease.jpg"
    
    //MARK: - Properties
    
    lazy var backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.backgroundColor = UIColor.white.cgColor

        return view
    }()
    var publicationImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "f79ea7241a2cecd10c3892cecdef04bf")
        image.isUserInteractionEnabled = false
        
        return image
    }()
    let shareButton: ShareButton = {
        let button = ShareButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "share_minor 1"), for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .mainColor
        
        
        return button
    }()
    

    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 16)
        title.numberOfLines = 1
        title.text = "Название новости"
        
        return title
    }()
    

    lazy var dateLabel: UILabel = {
        let date = UILabel()
        date.numberOfLines = 0
        date.font = .systemFont(ofSize: 13)
        date.textColor = UIColor(red: 0.17, green: 0.18, blue: 0.2, alpha: 0.8)
        date.text = "12.12.12"
        
        return date
    }()
    
    lazy var authorLabel: UILabel = {
        let author = UILabel()
        author.numberOfLines = 1
        author.font = .systemFont(ofSize: 13)
        author.textColor = UIColor(red: 0.17, green: 0.18, blue: 0.2, alpha: 0.8)
        author.text = "BBC"
        
        return author
    }()
    
 

    //MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        setupView()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(_ article: Articles) {
        self.authorLabel.text = article.author
        self.dateLabel.text = (article.publishedAt ?? "").toDate()
        self.titleLabel.text = article.title
        shareButton.link = article.url ?? link
        
        
        let image = String((article.urlToImage ?? defaultImageLink))
        let url = URL(string: image)
        
        self.publicationImage.kf.setImage(with: url!)
    }
 
    
    
    //MARK: - Setup function
    private func setupView() -> Void {
        contentView.isUserInteractionEnabled = false
        
        addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.top.equalTo(7.5)
            make.bottom.equalTo(-7.5)
            make.left.equalTo(15)
            make.right.equalTo(-15)
        }
        backView.addSubview(titleLabel)
        backView.addSubview(publicationImage)
        
        
        publicationImage.snp.makeConstraints {(make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.height.equalTo(100)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(publicationImage.snp.right).offset(5)
            make.width.equalTo(140)
        }
        
        backView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { (make) in
            make.left.equalTo(publicationImage.snp.right).offset(5)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        backView.addSubview(authorLabel)
        authorLabel.snp.makeConstraints { (make) in
            make.left.equalTo(publicationImage.snp.right).offset(5)
            make.top.equalTo(dateLabel.snp.bottom).offset(5)
            make.width.equalTo(140)
        }
        
        backView.addSubview(shareButton)
        shareButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15)
            make.top.equalTo(authorLabel.snp.bottom).offset(5)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
    }
    
    
  
}

