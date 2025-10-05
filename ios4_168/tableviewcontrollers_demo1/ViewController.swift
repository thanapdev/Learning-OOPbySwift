//
//  ViewController.swift
//  tableviewcontrollers_demo1
//
//  Created by Thanapong Yamkamol on 29/9/2568 BE.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    var movieTitle: String = ""
    var movieURL: String = ""
    
    @IBOutlet weak var wkView: WKWebView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func loadweb(ct: String) {
          if ct != "" {
              guard let myURL = URL(string: "https://www.imdb.com/title/\(ct)") else {
                  print("❌ Error creating URL for: \(ct)")
                  return
              }
              let myRequest = URLRequest(url: myURL)
              wkView.load(myRequest)
              print("✅ Loading URL: \(myURL)")
          } else {
              guard let myURL = URL(string: "https://www.imdb.com") else {
                  print("❌ Error loading IMDb homepage")
                  return
              }
              let myRequest = URLRequest(url: myURL)
              wkView.load(myRequest)
              print("⚠️ No movie code, loading IMDb homepage")
          }
      }
      
      override func viewDidLoad() {
          super.viewDidLoad()
          
          print("📥 ViewController viewDidLoad called")
          print("   movieTitle: '\(movieTitle)'")
          print("   movieURL: '\(movieURL)'")
          
          // แสดงชื่อหนัง + รหัส IMDb บน UILabel
          titleLabel.text = "Title: \(movieTitle)\nIMDb: \(movieURL)"
          
          // โหลดเว็บด้วยรหัส IMDb
          loadweb(ct: movieURL)
      }
  }
