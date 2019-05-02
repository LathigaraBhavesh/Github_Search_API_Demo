//
//  WebViewVC.swift
//  Github_Search_API_Demo
//
//  Created by Bhavesh Lathigara on 01/05/19.
//  Copyright © 2019 Bhavesh Lathigara. All rights reserved.
//

import UIKit

class WebViewVC: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webViewProject: UIWebView!
    var strUrl = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool)
    {
        self.webViewProject.loadRequest(NSURLRequest(url: NSURL(string: strUrl)! as URL) as URLRequest)
    }
    func webViewDidStartLoad(_ webView: UIWebView)
    {
        Util.showLoading(message: "", inView: self.view, title: "Loading....")
    }
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        Util.hideLoading()
    }
}
