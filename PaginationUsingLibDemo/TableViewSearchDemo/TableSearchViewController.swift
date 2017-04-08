//
//  ViewController.swift
//  TableViewSearchDemo
//
//  Created by Administrator on 07/04/17.
//  Copyright © 2017 Zerones. All rights reserved.
//

import UIKit

class TableSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchTableview: UITableView!
    
    var marrCountryList = [String]()
    var marrFilteredCountryList = [String]()
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableview.delegate = self
        searchTableview.dataSource = self
        marrCountryList = ["USA", "Bahamas", "Brazil", "Canada", "Republic of China", "Cuba", "Egypt", "Fiji", "France", "Germany", "Iceland", "India", "Indonesia", "Jamaica", "Kenya", "Madagascar", "Mexico", "Nepal", "Oman", "Pakistan", "Poland", "Singapore", "Somalia", "Switzerland", "Turkey", "UAE", "Vatican City"]
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            searchTableview.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 49))
        searchBar.delegate = self

        self.searchTableview.tableHeaderView = searchBar
        self.searchTableview.reloadData()
        
    }

    func updateSearchResults(for searchController: UISearchController) {
        print("===>> \(searchController)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK:- Table View methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marrCountryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! SearchTableViewCell
        cell.cellItemLabel.text = "\(marrCountryList[indexPath.row])"
        return cell
    }
    
    //MARK:- Utils Methods
    func filterTableViewForEnterText(searchText: String) {
        
        //let searchPredicate = NSPredicate(format: "SELF.name CONTAINS[c] %@", searchText)
        //let array = (self.marrCountryList as NSArray).filtered(using: searchPredicate)
        //self.marrFilteredCountryList = array as! [String]

        let dataArr = self.marrCountryList.filter { (object) -> Bool in
            if object.contains(searchText)
            {
                return true
            }
            return false
        }
        
        self.marrFilteredCountryList = dataArr
        self.searchTableview.reloadData()
    }
    
    //Mark:- Search bar Methods
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        <#code#>
//    }
}

