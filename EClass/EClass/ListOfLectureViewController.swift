//
//  ListOfLectureViewController.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 11..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class ListOfLectureViewController: UIViewController, UITabBarDelegate, UITableViewDelegate, UITableViewDataSource {


    var selectTabBar:Bool = true
    @IBOutlet weak var wishList: UITabBarItem!
    @IBOutlet weak var takeLectureList: UITabBarItem!
    @IBOutlet weak var tabBarOutlet: UITabBar!

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if item == takeLectureList
        {
            selectTabBar = true
        }else
        {
            selectTabBar = false
        }
        tv.reloadData()
    }
    
    @IBOutlet weak var tv: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectTabBar
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListOfLectureTableViewCell
            return cell
        }else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListOfLectureTableViewCell
            return cell
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarOutlet.delegate = self
//        tabBarOutlet.selectedItem = takeLectureList

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tv.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
