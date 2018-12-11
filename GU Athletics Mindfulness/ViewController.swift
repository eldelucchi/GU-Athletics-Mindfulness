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
        let htmlPath = Bundle.main.path(forResource: "chart", ofType: "html")
        print(htmlPath!)
        let htmlUrl = URL(fileURLWithPath: htmlPath!, isDirectory: false)
        webView.loadFileURL(htmlUrl, allowingReadAccessTo: htmlUrl)
        view = webView
        
        //Test for Day class
        var day1 = Day(name: "Monday", hydration: 2, nutrition: 4, percievedStress: 3, fatigue: 3, sleepHours: 8)
        var day2 = Day(name: "Tuesday", hydration: 2, nutrition: 5, percievedStress: 5, fatigue: 3, sleepHours: 6)
        var day3 = Day(name: "Wednesday", hydration: 4, nutrition: 5, percievedStress: 1, fatigue: 4, sleepHours: 9)
        var days = DayCollection()
        days.appendDay(day1)
        days.appendDay(day2)
        days.appendDay(day3)
        var json = JSONSerializer(days)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // To dispose of any resouces that can be recreated
    }


}

