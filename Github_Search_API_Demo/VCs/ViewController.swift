//
//  ViewController.swift
//  Github_Search_API_Demo
//
//  Created by Bhavesh Lathigara on 01/05/19.
//  Copyright © 2019 Bhavesh Lathigara. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {

    @IBOutlet weak var searchBarRepo: UISearchBar!
    @IBOutlet weak var tblRepo: UITableView!
    
    var arrRepository = NSMutableArray()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    // You can Filter Searched Repositories by Descending and Ascending
    @IBAction func btnFilterClick(_ sender: Any)
    {
        self.searchBarRepo.resignFirstResponder()
        
        if self.arrRepository.count > 0
        {
            let actionSheet = UIAlertController.init(title: "Filter", message: nil, preferredStyle: .actionSheet)
            actionSheet.addAction(UIAlertAction.init(title: "Watcher Count Descending", style: UIAlertAction.Style.default, handler: { (action) in
                
                // I am sorting "arrRepository" Descending order using watcher_count
                self.arrRepository = NSMutableArray(array: self.arrRepository.sorted(by: { ($0 as AnyObject).watchers_count > ($1 as AnyObject).watchers_count }))
                self.tblRepo.reloadData()
                
            }))
            actionSheet.addAction(UIAlertAction.init(title: "Watcher Count Ascending", style: UIAlertAction.Style.default, handler: { (action) in
                
                // I am sorting "arrRepository" Ascending order using watcher_count
                self.arrRepository = NSMutableArray(array: self.arrRepository.sorted(by: { ($0 as AnyObject).watchers_count < ($1 as AnyObject).watchers_count }))
                self.tblRepo.reloadData()
                
            }))
            actionSheet.addAction(UIAlertAction.init(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { (action) in
                
                
                
            }))
            //Present the controller
            self.present(actionSheet, animated: true, completion: nil)
        }
        else
        {
            Util.showAlert(message: "Please search repository")
        }
    }
    
    //MARK: -
    //MARK: Tableview Methods
    //MARK: -    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.arrRepository.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellRepository", for: indexPath) as! CellRepository
        let objRepository = self.arrRepository.object(at: indexPath.row) as! Repository
        cell.setData(objRepository: objRepository)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.searchBarRepo.resignFirstResponder()
        let objRepositoryDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "RepositoryDetailsVC") as! RepositoryDetailsVC
        let objRepository = self.arrRepository.object(at: indexPath.row) as! Repository
        objRepositoryDetailsVC.objRepository = objRepository
        self.navigationController?.pushViewController(objRepositoryDetailsVC, animated: true)
    }
    
    //MARK: -
    //MARK: SearchBar Methods
    //MARK: -
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        if Util.myTrim(str: self.searchBarRepo.text!) == ""
        {
            Util.showAlert(message: "Please provide the search keyword")
        }
        else
        {
            // API Call for getting repository by any keyword that end user will enter in SearchBar
            
            self.searchBarRepo.resignFirstResponder()
            Util.makeCall(appendUrl: "search/repositories?per_page=10&sort=&order=desc&page=1&q=\(Util.myTrim(str: searchBarRepo.text!))", params: nil, loadingTitle: "Searching...", httpmethod: .get, isAppendBaseUrl: true) { (value, error) in
                
                if error == nil
                {
                    if let object = value as? NSDictionary
                    {
                        self.arrRepository.removeAllObjects()
                        for dictItem in object.value(forKey: "items") as! [AnyObject]
                        {
                            let objRepository = Repository()
                            objRepository.name = "\(dictItem.object(forKey: "name") ?? "")"
                            objRepository.full_name = "\(dictItem.object(forKey: "full_name") ?? "")"
                            objRepository.watchers_count = dictItem.object(forKey: "watchers_count") as! Int
                            let dictOwnder = dictItem.object(forKey: "owner") as! NSDictionary
                            objRepository.avatar_url = "\(dictOwnder.object(forKey: "avatar_url") ?? "")"
                            objRepository.repos_url = "\(dictOwnder.object(forKey: "repos_url") ?? "")"
                            objRepository.html_url = "\(dictItem.object(forKey: "html_url") ?? "")"
                            objRepository.strdescription = "\(dictItem.object(forKey: "description") ?? "")"
                            objRepository.contributors_url = "\(dictItem.object(forKey: "contributors_url") ?? "")"
                            self.arrRepository.add(objRepository)
                        }
                        
                        // By Default I am sorting "arrRepository" Descending order using watcher_count
                        self.arrRepository = NSMutableArray(array: self.arrRepository.sorted(by: { ($0 as AnyObject).watchers_count > ($1 as AnyObject).watchers_count }))
                        self.tblRepo.reloadData()
                    }
                }
            }
        }
    }
}

