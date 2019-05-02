//
//  CellRepoList.swift
//  Github_Search_API_Demo
//
//  Created by Bhavesh Lathigara on 01/05/19.
//  Copyright © 2019 Bhavesh Lathigara. All rights reserved.
//

import UIKit

class CellRepoList: UITableViewCell {

    @IBOutlet weak var lblRepoName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(objRepository: Repository)
    {
        self.lblRepoName.text = objRepository.name
    }
}
