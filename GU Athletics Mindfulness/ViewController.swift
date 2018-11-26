//
//  ViewController.swift
//  GU Athletics Mindfulness
//
//  Created by Emma Delucchi on 11/26/18.
//  Copyright © 2018 Emma Delucchi. All rights reserved.
//

import UIKit
import WebKit

class ViewController:  UIViewController, WKUIDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let webView = WKWebView()
        let htmlPathOptional = Bundle.main.path(forResource: "chart", ofType: "html")
        if let htmlPath = htmlPathOptional{
            print(htmlPath)
            let htmlUrl = URL(fileURLWithPath: htmlPath, isDirectory: false)
            webView.loadFileURL(htmlUrl, allowingReadAccessTo: htmlUrl)
            view = webView
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // To dispose of any resouces that can be recreated
    }


}

