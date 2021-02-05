//
//  ScrollViewController.swift
//  NewsApp
//
//  Created by Admin on 1/30/21.
//

import Foundation
import UIKit
import SnapKit

class ScrollViewController: UIViewController {
    
    //MARK: - Properties
    lazy var scrollView = UIScrollView()
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    //MARK: - Start functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = .mainColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
    }
    
    //MARK: - Setup functions
    func setupScrollView() {
        view.backgroundColor = .white
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.keyboardDismissMode = .onDrag
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalTo(view)
        }
    }
    @objc func tapBack() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - functions
    func addToScrollView(_ views: [UIView]) -> Void {
        for view in views {
            scrollView.addSubview(view)
        }
    }
}
