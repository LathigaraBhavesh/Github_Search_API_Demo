//
//  BLLoading.swift
//  AFP
//
//  Created by Bhavesh Lathigara on 29/11/18.
//  Copyright © 2018 Bhavesh Lathigara. All rights reserved.
//

import UIKit

class BLLoading: UIViewController {

    @IBOutlet weak var viewLoading: UIView!
    @IBOutlet weak var loadingAI: UIActivityIndicatorView!
    @IBOutlet weak var lblLoading: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLoading.layer.cornerRadius = 15.0
        // Do any additional setup after loading the view.
    }
    
    func showLoading(strLoadingTitle: String, inView: UIView)
    {
        self.view.removeFromSuperview()
        inView.addSubview(self.view)        
        loadingAI.startAnimating()
        lblLoading.text = strLoadingTitle;
    }
    
    func hideLoading()
    {
        loadingAI.stopAnimating()
        self.view.removeFromSuperview()
    }
}
