//
//  NewsHeaderView.swift
//  NewsApp
//
//  Created by Admin on 1/30/21.
//

import Foundation
import UIKit

class NewsHeaderView: UITableViewHeaderFooterView {

    //MARK: - Properties
    var actionEvent = {()->() in}
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = #colorLiteral(red: 0.5058823529, green: 0.5490196078, blue: 0.6, alpha: 1)
        title.text = "News"
        title.font = .systemFont(ofSize: 7)
        
        return title
    }()
    
    //MARK: Initialization
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        tintColor = .clear
        backgroundView?.backgroundColor = .clear
        backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Setup functions
    private func setupViews() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
        
    }
    
 
}
