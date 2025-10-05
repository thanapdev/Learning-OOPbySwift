//
//  TBVC1.swift
//  tableviewcontrollers_demo1
//
//  Created by Thanapong Yamkamol on 29/9/2568 BE.
//

import UIKit

class TBVC1: UITableViewController {

    let movies: [(title: String, ct: String)] = [
        ("Inception", "tt1375666"),
        ("The Dark Knight", "tt0468569"),
        ("Interstellar", "tt0816692"),
        ("Avengers: Endgame", "tt4154796"),
        ("Titanic", "tt0120338"),
        ("The Matrix", "tt0133093"),
        ("Joker", "tt7286456"),
        ("Frozen II", "tt4520988"),
        ("Spider-Man: No Way Home", "tt10872600"),
        ("Avatar", "tt0499549")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Promote Movies"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celldata", for: indexPath)
                var content = cell.defaultContentConfiguration()
                content.text = movies[indexPath.row].title
                content.textProperties.color = .brown
        content.textProperties.font = UIFont(name: "Lulu", size: 20)! // ฟอนต์ติดตั้งเอง
                cell.contentConfiguration = content
                return cell
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passdata",
           let vc = segue.destination as? ViewController {
            
            // Get the selected row from the tableView
            if let indexPath = tableView.indexPathForSelectedRow {
                vc.movieTitle = movies[indexPath.row].title
                vc.movieURL = movies[indexPath.row].ct
                
                print("✅ Sending to ViewController:")
                print("Title: \(vc.movieTitle)")
                print("URL: \(vc.movieURL)")
            }
        }
    }

}
