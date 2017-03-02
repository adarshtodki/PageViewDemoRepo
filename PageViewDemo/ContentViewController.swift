//
//  ContentViewController.swift
//  PageViewDemo
//
//  Created by Adarsh on 19/10/16.
//  Copyright © 2016 Adarsh. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    var dataObject : String!
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        webView.loadHTMLString(dataObject, baseURL: URL(string: ""))
    }

}
