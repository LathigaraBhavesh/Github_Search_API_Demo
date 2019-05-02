//
//  CellContributors.swift
//  Github_Search_API_Demo
//
//  Created by Bhavesh Lathigara on 01/05/19.
//  Copyright © 2019 Bhavesh Lathigara. All rights reserved.
//

import UIKit

class CellContributors: UICollectionViewCell
{
    @IBOutlet weak var imgViewContributor: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    func setData(objContributor: Contributors)
    {
        self.imgViewContributor.sd_setImage(with: URL(string: objContributor.avatar_url), placeholderImage: UIImage(named: "avatar.png"))
        self.lblName.text = objContributor.login
    }
}
