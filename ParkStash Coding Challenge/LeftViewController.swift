//
//  LeftViewController.swift
//  ParkStash Coding Challenge
//
//  Created by Shreyas Zagade on 3/21/18.
//  Copyright © 2018 Shreyas Zagade. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {

    @IBOutlet weak var profilePicHolderView: UIView!
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var greetingMessageLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var tableViewTextData = [
        ["Book a Spot", "List a Spot", "Past Bookings"],
        ["Payments","Promos","Wallet","My Profile","ratings"],
        ["Help","Legal","Logout"]
    ]
    
    var tableViewImageData = [
        ["book", "house", "pastbooking"],
        ["payments","promos","wallet","myProfile","ratings"],
        ["help","legal","logout"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        profilePicHolderView.layer.cornerRadius = profilePicHolderView.bounds.width / 2
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension LeftViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewTextData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewTextData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leftMenuTableCell") as! LeftMenuTableCell
        cell.itemImageView.image = UIImage(named: tableViewImageData[indexPath.section][indexPath.row])
        cell.itemTitleLabel.text = tableViewTextData[indexPath.section][indexPath.row]
        return cell
    }
}

extension LeftViewController :  UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableCell(withIdentifier: "leftMenuTableSection")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
