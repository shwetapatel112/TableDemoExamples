//
//  ViewController.swift
//  TableViewSearchDemo
//
//  Created by Administrator on 07/04/17.
//  Copyright © 2017 Zerones. All rights reserved.
//

import UIKit

class TableSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var searchTableview: UITableView!
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    var marrCountryList = [String]()
    var imageArray = ["myImage1", "myImage2" ,"myImage3" ,"myImage4"]
    var marrFilteredCountryList = [String]()
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableview.delegate = self
        searchTableview.dataSource = self
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        searchTableview.tableHeaderView = imageCollectionView
        marrCountryList = ["USA", "Bahamas", "Brazil", "Canada", "Republic of China", "Cuba", "Egypt", "Fiji", "France", "Germany", "Iceland", "India", "Indonesia", "Jamaica", "Kenya", "Madagascar", "Mexico", "Nepal", "Oman", "Pakistan", "Poland", "Singapore", "Somalia", "Switzerland", "Turkey", "UAE", "Vatican City"]
        
//        self.resultSearchController = ({
//            let controller = UISearchController(searchResultsController: nil)
//            controller.searchResultsUpdater = self
//            controller.dimsBackgroundDuringPresentation = false
//            controller.searchBar.sizeToFit()
//            
//            searchTableview.tableHeaderView = controller.searchBar
//            
//            return controller
//        })()
        self.searchTableview.reloadData()
        
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
        
        
        //let indexPath = IndexPath(row: 0, section: 0)
        //imageCollectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.left, animated: true)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! SearchTableViewCell
        cell.cellItemLabel.text = "\(marrCountryList[indexPath.row])"
        return cell
    }
    
    //MARK:- Utils Methods
    func filterTableViewForEnterText(searchText: String) {
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchText)
        let array = (self.marrCountryList as NSArray).filtered(using: searchPredicate)
        self.marrFilteredCountryList = array as! [String]
        self.searchTableview.reloadData()
    }
    
    //Mark:- Collection view Methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        cell.myImageView.image = UIImage(named: imageArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 160)
    }
    
}

