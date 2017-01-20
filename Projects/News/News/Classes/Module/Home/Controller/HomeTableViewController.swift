//
//  HomeTableViewController.swift
//  News
//
//  Created by Corotata on 2017/1/20.
//  Copyright © 2017年 Corotata. All rights reserved.
//

import UIKit


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
    
    func searchBarButtonItemClick() {
        
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
    func loadData() {
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

