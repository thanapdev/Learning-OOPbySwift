//
//  ViewController.swift
//  demo_MixedColor
//
//  Created by Thanapong Yamkamol on 8/9/2568 BE.
//

import UIKit

class ViewController: UIViewController {

    var red:Float = 0
    var green:Float = 0
    var blue:Float = 0
    
    @IBOutlet weak var lb_red: UILabel!
    
    @IBOutlet weak var vw_red: UIView!
    
    @IBOutlet weak var lb_green: UILabel!
    
    @IBOutlet weak var vw_green: UIView!
    
    @IBOutlet weak var lb_blue: UILabel!
    
    @IBOutlet weak var vw_blue: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func slider_red(_ sender: Any) {
        
        var sl: UISlider = sender as! UISlider
        lb_red.text=sl.value.description
        red = sl.value
        vw_red.backgroundColor=UIColor.init(red: CGFloat(sl.value/255), green: 0, blue: 0, alpha: 1)
        self.view.backgroundColor=UIColor.init(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
    }
    
    @IBAction func slider_green(_ sender: Any) {
        var sl: UISlider = sender as! UISlider
        
    lb_green.text=sl.value.description
        green = sl.value
        vw_green.backgroundColor=UIColor.init(red: 0, green: CGFloat(sl.value/255), blue: 0, alpha: 1)
        self.view.backgroundColor=UIColor.init(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
    }
    @IBAction func slider_blue(_ sender: Any) {
        var sl: UISlider = sender as! UISlider
        lb_blue.text=sl.value.description
        blue = sl.value
        vw_blue.backgroundColor=UIColor.init(red: 0, green: 0, blue: CGFloat(sl.value/255), alpha: 1)
        self.view.backgroundColor=UIColor.init(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
    }
    
}

