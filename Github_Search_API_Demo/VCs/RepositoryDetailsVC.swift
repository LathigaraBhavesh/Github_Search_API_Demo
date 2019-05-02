//
//  RepositoryDetailsVC.swift
//  Github_Search_API_Demo
//
//  Created by Bhavesh Lathigara on 01/05/19.
//  Copyright © 2019 Bhavesh Lathigara. All rights reserved.
//

import UIKit

class RepositoryDetailsVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate
{
    @IBOutlet weak var imgViewRepo: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var cvContributors: UICollectionView!
    @IBOutlet weak var lblContributors: UILabel!
    
    var objRepository = Repository()
    
    var arrContributors = NSMutableArray()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool)
    {
        self.setAndgetData()
    }
    func setAndgetData()
    {
        self.imgViewRepo.sd_setImage(with: URL(string: objRepository.avatar_url), placeholderImage: UIImage(named: "avatar.png"))
        self.lblName.text = self.objRepository.name
        self.lblDescription.text = self.objRepository.strdescription
        
        self.fetchContributors()
    }
    func fetchContributors()
    {
        // API Call for getting Contributors of any respository, contributors_url we will get from search repository API response
        
        Util.makeCall(appendUrl: objRepository.contributors_url, params: nil, loadingTitle: "Getting...", httpmethod: .get, isAppendBaseUrl: false) { (value, error) in
            
            if error == nil
            {
                self.arrContributors.removeAllObjects()
                if let object = value as? NSArray
                {
                    for dictItem in object as [AnyObject]
                    {
                        let objContributors = Contributors()
                        objContributors.login = "\(dictItem.object(forKey: "login") ?? "")"
                        objContributors.avatar_url = "\(dictItem.object(forKey: "avatar_url") ?? "")"
                        objContributors.repos_url = "\(dictItem.object(forKey: "repos_url") ?? "")"
                        
                        self.arrContributors.add(objContributors)
                    }
                    self.lblContributors.text = "\(self.arrContributors.count) Contributors:"
                    self.cvContributors.reloadData()
                }
            }
        }
    }
    
    @IBAction func btnProjectLickClick(_ sender: Any)
    {
        let objWebViewVC = self.storyboard?.instantiateViewController(withIdentifier: "WebViewVC") as! WebViewVC
        objWebViewVC.strUrl = self.objRepository.html_url
        self.navigationController?.pushViewController(objWebViewVC, animated: true)
    }
    
    //MARK: -
    //MARK: CollectionView Methods
    //MARK: -
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.arrContributors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellContributors", for: indexPath) as! CellContributors
        let objContributor = self.arrContributors.object(at: indexPath.row) as! Contributors
        cell.setData(objContributor: objContributor)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let objContributorVC = self.storyboard?.instantiateViewController(withIdentifier: "ContributorVC") as! ContributorVC
        let objContributor = self.arrContributors.object(at: indexPath.row) as! Contributors
        objContributorVC.objContributor = objContributor
        self.navigationController?.pushViewController(objContributorVC, animated: true)
    }
}
