//
//  ViewController.swift
//  kohm
//
//  Created by Thanapong Yamkamol on 15/9/2568 BE.
//

import UIKit

class ViewController: UIViewController {

    var colorCode:[UIColor] = [UIColor.black,UIColor.brown,UIColor.red,UIColor.orange,UIColor.yellow,UIColor.green,UIColor.blue,UIColor.gray,UIColor.magenta,UIColor.white]
    var numCode:[Int] = [3,2,1]
    
    @IBOutlet weak var text_results: UITextView!
    @IBOutlet weak var vw3: UIView!
    @IBOutlet weak var vw2: UIView!
    @IBOutlet weak var vw1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnOhmRnd(_ sender: Any) {
        var result:Int = 0
        var resultExtra:String = ""
        
        for i in 0...2{
            numCode[i] = (Int.random(in: 0..<10))
        }
        
        vw1.backgroundColor = colorCode[numCode[0]]
        vw2.backgroundColor = colorCode[numCode[1]]
        vw3.backgroundColor = colorCode[numCode[2]]
        
        result = ohmCalculate(n1: numCode[0], n2: numCode[1], n3: numCode[2])
        resultExtra = convertOhm(rs: result)
        if result != 0{
            text_results.text = "\(result) Ω"
        }else{
            text_results.text = "error"
        }
        text_results.text!+="\n"
        text_results.text!+=resultExtra
    }
    
    func ohmCalculate(n1:Int,n2:Int,n3:Int) -> Int{
        if n1==0 {
            return 0
        }
        else if n3==0{
            return Int(String(n1)+String(n2))!
        }
        else if n3==1{
            return Int(String(n1)+String(n2))!*10
        }
        else if n3==2{
            return Int(String(n1)+String(n2))!*100
        }
        else if n3==3{
            return Int(String(n1)+String(n2))!*1000
        }
        else if n3==4{
            return Int(String(n1)+String(n2))!*10000
        }
        else if n3==5{
            return Int(String(n1)+String(n2))!*100000
        }
        else if n3==6{
            return Int(String(n1)+String(n2))!*1000000
        }
        else if n3==7{
            return Int(String(n1)+String(n2))!*10000000
        }
        else{
            return 0
        }
    }
    
    func convertOhm(rs:Int) -> String{
            var r=Float(rs)
            if rs/1000000 > 0{
                return (r/1000000).description+" Mega Ohm"
            }
            else if rs/1000 > 0{
                return (r/1000).description+" Kilo Ohm"
            }
            else{
                return ""
            }
        }
}

