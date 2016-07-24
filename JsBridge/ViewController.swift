//
//  ViewController.swift
//  JsBridge
//
//  Created by Oka Yuya on 2016/07/23.
//  Copyright © 2016年 nnsnodnb. All rights reserved.
//

import UIKit

// MARK: - UIViewController
class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setup() {
        webView.delegate = self
        let url = NSURL(string: "https://nnsnodnb.moe/js-bridge/")
        if let request = url {
            let requestUrl = NSURLRequest(URL: request)
            webView.loadRequest(requestUrl)
        }
    }
    
    private func showAlert() {
        let alert: UIAlertController = UIAlertController(title: "成功！",
                                                         message: nil,
                                                         preferredStyle: .Alert)
        let okButton = UIAlertAction(title: "OK",
                                     style: .Default,
                                     handler: nil)
        
        alert.addAction(okButton)
        
        presentViewController(alert, animated: true, completion: nil)
    }
}

// MARK: - UIWebViewDelegate
extension ViewController: UIWebViewDelegate {

    func webView(webView: UIWebView,
                 shouldStartLoadWithRequest request: NSURLRequest,
                                            navigationType: UIWebViewNavigationType) -> Bool {

        if let scheme = request.URL?.scheme where scheme.hasPrefix("http") {
            return true
        }
        
        if let action = request.URL?.description,
            let query = request.URL?.query {
            
            let queryDicitionary = QueryParser.queryDictionary(query)
            
            if action.hasPrefix("app-callback://views") {
                if queryDicitionary["name"] == "success" {
                    print("Success")
                    print(queryDicitionary)
//                    showAlert()
                    let vc: SuccessViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SuccessViewController") as! SuccessViewController
                    self.presentViewController(vc, animated: true, completion: nil)
                }
            }
            return false
        }
        return false
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
}