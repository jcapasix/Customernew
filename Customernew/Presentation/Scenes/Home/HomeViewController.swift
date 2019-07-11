//
//  HomeViewController.swift
//  Customernew
//
//  Created by Jordan Capa on 7/10/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var customers = [Customer]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }
    
    func initView(){
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = "Creación de Cliente"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(self.addButtonPressed))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "logout", style: .plain, target: self, action: #selector(self.closeButtonPressed))
    }
    
    @objc func addButtonPressed(){
        print("addButtonPressed")
//        self.router?.routeToNewPlace()
    }
    
    @objc func closeButtonPressed(){
        print("closeButtonPressed")
//        self.presenter?.logoutUser()
    }

}

// MARK: - Table view data source
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.customers.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeTableViewCell", for: indexPath) as! PlaceTableViewCell
//        cell.place = self.places[indexPath.row]
        return cell
    }
}

