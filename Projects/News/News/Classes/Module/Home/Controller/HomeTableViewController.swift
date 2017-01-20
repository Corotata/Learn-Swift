//
//  HomeTableViewController.swift
//  News
//
//  Created by Corotata on 2017/1/20.
//  Copyright © 2017年 Corotata. All rights reserved.
//

import UIKit

//写这份代码的注意点有几点
//1.要注意Swift的代码风格，尽可能让主class保持简洁，采用extension将各种类型的代码分离开来，使得结构清晰
//2.使用setValuesForKeys(dict)，给模型赋值，并重写setValue(_ value: Any?, forUndefinedKey key: String)对于没有定义的属性的支持
//3.了解闭包的使用方式
//4.处理循环引用的方法，当在闭包情况下使用 [weak self]或者 [unowned self],两者的差别是weak解除引用时，会将值置为nil，所以引用时，self需要加？，即self?,而后者则不用，但必须保证使用其间不能为nil，否则会引发程序崩溃


let kHomeCellIdentifier = "HomeTableViewCell"

class HomeTableViewController: UITableViewController {
    
    lazy var newsArray : [News] = {
        let newArray = [News]()
        return newArray
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        loadData()
    }
    
}


// MARK: - Config UI

extension HomeTableViewController {
     fileprivate func setupNavigationBar() {
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "navigation_logo"))
    navigationController?.navigationBar.setBackgroundImage(UIImage(named:"reader_navigation_background"), for: .default)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"navigation_search"), style: .plain, target: self, action: #selector(searchBarButtonItemClick))
    }
    
    @objc fileprivate func searchBarButtonItemClick() {
        
    }
    
}



// MARK: - Table view data source
extension HomeTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kHomeCellIdentifier, for: indexPath) as! HomeTableViewCell
        cell.news = newsArray[indexPath.row]
        return cell
    }
}

// MARK: - LoadData
extension HomeTableViewController {
    fileprivate func loadData() {
        HTTPHelper.requestData(URLString:"http://c.m.163.com/nc/article/list/T1348649079062/0-100.html" , type: .GET, parameters: nil) {[unowned self] (response, error) in
            guard error == nil else {
                print(error as Any)
                return
            }
            guard let resultsDict = response as? [NSString : Any] else {
                return
            }
            guard let dataArray = resultsDict["T1348649079062"] as? [[String : Any]] else {
                return
            }
            
            for dict in dataArray {
                let news = News(dict)
                self.newsArray.append(news)
                print(news)
            }
            self.tableView .reloadData()
            
        }
    }
}

