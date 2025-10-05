//
//  ViewController.swift
//  font
//
//  Created by Thanapong Yamkamol on 29/9/2568 BE.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITabBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "data", for:indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = artist[indexPath.row]
        content.textProperties.color = .systemRed
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRow indexPath: IndexPath) {
        imgMusical.image=UIImage.init(named: artist[indexPath.row])
    }
    

    @IBOutlet weak var imgMusical: UIImageView!
    
    let artist:[String] = ["backstreetboys.jpg","britney.jpg","carpenters.jpg","europe.jpg","lobo.png","maroon5.jpg","metalica.jpeg","mltr.png","westlife.jpg","whitney.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

