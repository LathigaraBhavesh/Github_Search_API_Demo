//
//  ContributorVC.swift
//  Github_Search_API_Demo
//
//  Created by Bhavesh Lathigara on 01/05/19.
//  Copyright © 2019 Bhavesh Lathigara. All rights reserved.
//

import UIKit

class ContributorVC: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    @IBOutlet weak var imgViewContributor: UIImageView!
    @IBOutlet weak var tblRepoList: UITableView!
    
    var objContributor = Contributors()
    
    var arrRepos = NSMutableArray()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool)
    {
        self.setAndGetData()
    }
    func setAndGetData()
    {
        self.imgViewContributor.sd_setImage(with: URL(string: objContributor.avatar_url), placeholderImage: UIImage(named: "avatar.png"))
        self.fetchRepos()
    }
    func fetchRepos()
    {
        // API Call for getting Repositories of any contributor, repos_url we will get from contributors_url API response
        
        Util.makeCall(appendUrl: objContributor.repos_url, params: nil, loadingTitle: "Getting...", httpmethod: .get, isAppendBaseUrl: false) { (value, error) in
            
            if error == nil
            {
                if let object = value as? NSArray
                {
                    self.arrRepos.removeAllObjects()
                    for dictItem in object as [AnyObject]
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
                        self.arrRepos.add(objRepository)
                    }
                    self.tblRepoList.reloadData()
                }
            }
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
        return self.arrRepos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellRepoList", for: indexPath) as! CellRepoList
        let objRepository = self.arrRepos.object(at: indexPath.row) as! Repository
        cell.setData(objRepository: objRepository)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let objRepositoryDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "RepositoryDetailsVC") as! RepositoryDetailsVC
        let objRepository = self.arrRepos.object(at: indexPath.row) as! Repository
        objRepositoryDetailsVC.objRepository = objRepository
        self.navigationController?.pushViewController(objRepositoryDetailsVC, animated: true)
    }
}
