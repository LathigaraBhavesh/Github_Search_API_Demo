//
//  CellRepository.swift
//  Github_Search_API_Demo
//
//  Created by Bhavesh Lathigara on 01/05/19.
//  Copyright © 2019 Bhavesh Lathigara. All rights reserved.
//

import UIKit

class CellRepository: UITableViewCell {

    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var imgViewRepo: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblWatcherCount: UILabel!
    
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
        self.viewBG.layer.cornerRadius = 8.0;
        self.viewBG.layer.borderWidth = 1.0;
        self.viewBG.layer.borderColor = UIColor.darkGray.cgColor;
        
        self.imgViewRepo.sd_setImage(with: URL(string: objRepository.avatar_url), placeholderImage: UIImage(named: "avatar.png"))
        self.lblName.text = objRepository.name
        self.lblFullName.text = objRepository.full_name
        self.lblWatcherCount.text = "Watcher: \(objRepository.watchers_count)"
    }
}
