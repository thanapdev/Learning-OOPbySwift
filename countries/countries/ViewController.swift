//
//  ViewController.swift
//  countries
//
//  Created by Thanapong Yamkamol on 22/9/2568 BE.
//

import UIKit
import WebKit


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,WKUIDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityInCountry.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityInCountry[row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryAll.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "data", for: indexPath)
        cell.textLabel?.text = countryAll[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        showAlert(row: indexPath.row)
    }
    
    var country:Dictionary = [String:[String]]()
    var countryAll:Array = [String]()
    var citiesAll:Array = [String]()
    var cityInCountry: [String] = []
    
    @IBOutlet weak var wkview: WKWebView!
    @IBOutlet weak var pickerCities: UIPickerView!
    
    func loadPlist() {
        
        let url = Bundle.main.url(forResource: "cities_all", withExtension: "plist")!
        let testData = try! Data(contentsOf: url)
        let myPlist = try! PropertyListSerialization.propertyList(from: testData, options: [], format: nil)
        print(myPlist)
        country = myPlist as! Dictionary
        
        for (k,v) in Array(country).sorted(by: {$0.0 < $1.0}){
            countryAll.append(k)
            for s in v{
                citiesAll.append(s)
            }
        }
        
        print(countryAll)
        print(country["Thailand"]!)
    }
    
    func loadweb(ct:String){
        pickerCities.isHidden = true
        wkview.isHidden = false
        
        if ct != ""{
            guard let myURL = URL(string:"http://flagpedia.net/\(ct)")
            else {
                print("Error to load website")
                return
            }
            let myRequest = URLRequest(url: myURL)
            wkview.load(myRequest)
        }else{
            guard let myURL = URL(string:"http://flagpedia.net/index") else{
                print("Error to load website")
                return
            }
            let myRequest = URLRequest(url: myURL)
            wkview.load(myRequest)
        }
    }
    
    func showAlert(row:Int){
        let alert = UIAlertController(title: "Title", message: "Please select an option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "view flag: \(countryAll[row])", style: .default, handler:{(UIAlertAction) in self.loadweb(ct: self.countryAll[row])}))
        
        alert.addAction(UIAlertAction(title: "view cities\(countryAll[row])", style: .default, handler:{(UIAlertAction) in
            self.cityInCountry = self.country[self.countryAll[row]] ?? []
            self.loadPickerCityInCountry()
        }))
        
        alert.addAction(UIAlertAction(title: "deldete", style: .destructive, handler:{(UIAlertAction) in print("user click delete button")}))
        
        alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler:{(UIAlertAction) in print("user click dismiss button")}))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        
        
    }
    
    func loadPickerCityInCountry() {
        pickerCities.isHidden = false
        wkview.isHidden = true
        pickerCities.reloadAllComponents()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadPlist()
    }


}

