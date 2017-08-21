//
//  ReviewShowTableViewController.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 14..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import SwiftyJSON
class ReviewShowTableViewController: UITableViewController {

    @IBOutlet var myTableView: UITableView!
    var detailData:JSON!
    override func viewDidLoad() {
        
        self.navigationItem.title = "리뷰목록"
        myTableView.estimatedRowHeight = 200
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.reloadData()
        myTableView.register(UINib.init(nibName: "ReviewShowTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewShowTableViewCell")
        print(detailData)
        
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return detailData["reviews"].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewShowTableViewCell", for: indexPath) as! ReviewShowTableViewCell
        
        let cellData = detailData["reviews"][indexPath.row]
        
        print("AAAAAAA")
        print(cellData["modify_date"].stringValue)
        print(cellData["content"].stringValue)
        print("BBBBBBB")
        
        var showDate = cellData["modify_date"].stringValue
        
        showDate.characters.removeLast(17)
        print(showDate)

        
        cell.reviewContents(showDate, cellData["content"].stringValue)
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
