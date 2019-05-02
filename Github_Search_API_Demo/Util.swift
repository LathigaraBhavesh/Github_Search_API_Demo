//
//  Util.swift
//  Github
//
//  Created by Bhavesh Lathigara on 27/11/18.
//  Copyright © 2018 Bhavesh Lathigara. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

//MARK: Objects
let appDelegate = UIApplication.shared.delegate as! AppDelegate
let storyBoardObject = UIStoryboard(name: "Main", bundle: nil)
let blLoading = storyBoardObject.instantiateViewController(withIdentifier: "BLLoading") as! BLLoading

//MARK: Colors:
let colorLikeGrey = UIColor.init(red: 176.0/255.0, green: 176.0/255.0, blue: 176.0/255.0, alpha: 1.0)

//MARK: APIs
let BASEURL = "https://api.github.com/"
//https://developer.github.com/v3

//MARK: Class
class Util: NSObject {
    
    // Show BLLoading class to show loading the content
    static func showLoading(message:String, inView:UIView, title:String)
    {
        blLoading.showLoading(strLoadingTitle: title, inView: inView)
    }
    
    // Hide BLLoading
    static func hideLoading()
    {
        blLoading.hideLoading()
    }
    // Just native alert while you want to show
    static func showAlert(message:String)
    {
        DispatchQueue.main.async
        {
            let alertController = UIAlertController(title: "Search Repository", message: message, preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                print("User clicked OK")
            }
            alertController.addAction(OKAction)
            
            UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    // Show just label toast on screen
    static func showToast(message : String, view : UIView) {
        let toastLabel = UILabel(frame: CGRect(x: view.frame.size.width/2 - ((view.frame.size.width-40)/2), y: view.frame.size.height-100, width: view.frame.size.width-40, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        view.addSubview(toastLabel)
        UIView.animate(withDuration: 6.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    static func myTrim(str: String) -> String
    {
        return str.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    }
    
    //MARK:- HTTP Request Call
    static func makeCall(appendUrl: String, params: Any?, loadingTitle: String, httpmethod:HTTPMethod, isAppendBaseUrl: Bool, completionHandler: @escaping (Any?, Error?) -> ())
    {
        self.showLoading(message: "", inView: appDelegate.window!, title: loadingTitle)

        var url: URL!
        if isAppendBaseUrl
        {
            url = URL(string: ("\(BASEURL)\(appendUrl)"))!
        }
        else
        {
            url = URL(string: ("\(appendUrl)"))!
        }
        
        let headers = ["Accept":"application/vnd.github.v3+json"]
        Alamofire.request(url!, method: httpmethod, parameters: nil, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { (response) in
                
                self.hideLoading()
                
                switch response.result
                {
                    case .success(let value):
                        completionHandler(value as Any, nil)
                    case .failure(let error):
                        completionHandler(nil, error)
                        Util.showAlert(message: "Something went wrong please try again")
                }
        }
    }
}
// convert to dictionary
extension NSObject {
    
    // dictionary
    func toDictionary(from classType: NSObject.Type) -> [String: Any] {
        
        var propertiesCount : CUnsignedInt = 0
        let propertiesInAClass = class_copyPropertyList(classType, &propertiesCount)
        let propertiesDictionary : NSMutableDictionary = NSMutableDictionary()
        
        for i in 0 ..< Int(propertiesCount) {
            let property = propertiesInAClass?[i]
            let strKey = NSString(utf8String: property_getName(property!)) as String?
            if let key = strKey {
                propertiesDictionary.setValue(self.value(forKey: key), forKey: key)
            }
        }
        return propertiesDictionary as! [String : Any]
    }
}
