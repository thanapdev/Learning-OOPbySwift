//
//  ViewController.swift
//  demo_ios_3
//
//  Created by Thanapong Yamkamol on 8/9/2568 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txt_weight: UITextField!
    
    
    @IBOutlet weak var txt_height: UITextField!
    
    @IBOutlet weak var text_BMI: UITextField!
    
    @IBOutlet weak var text_result: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orange
        
    }

    @IBAction func switch_darkMode(_ sender: Any) {
        var sw:UISwitch! = sender as! UISwitch
        if sw.isOn {
            self.view.backgroundColor = UIColor.black
        }else{
            self.view.backgroundColor = UIColor.orange
        }
    }
    @IBAction func btn_cal(_ sender: Any) {
        guard let weightText = txt_weight.text,
                     let heightText = txt_height.text,
                     let weight = Double(weightText),
                     let height = Double(heightText),
                     height > 0 else {
                   text_result.text = "⚠️ กรุณากรอกน้ำหนักและส่วนสูงเป็นตัวเลขที่ถูกต้อง"
                   text_BMI.text = ""
                   return
               }
               
               // คำนวณค่า BMI
               let bmi = weight / (height * height)
               text_BMI.text = String(format: "%.2f", bmi)  // แสดงทศนิยม 2 ตำแหน่ง
               
               // แสดงผลลัพธ์ตามช่วงค่า BMI
               if bmi >= 30 {
                   text_result.text = "Obesity"
               } else if bmi >= 25 {
                   text_result.text = "Overweight"
               } else if bmi >= 18.5 {
                   text_result.text = "Healthy"
               } else {
                   text_result.text = "Underweight"
               }
    
//        text_BMI.text = (Double(txt_weight.text!)! / rs).desciption
    }
    
     
}

