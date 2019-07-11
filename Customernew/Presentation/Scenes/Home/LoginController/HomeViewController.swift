//
//  HomeViewController.swift
//  Customernew
//
//  Created by Jordan Capa on 7/10/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit
import FirebaseDatabase


class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol!
    
    @IBOutlet weak var tableView: UITableView!
    
    var customers = [Customer]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var ref: DatabaseReference = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = HomeConfigurator.sharedInstance.configure(self)
        self.initView()
    }
    
    func initView(){
        
        self.tableView.register(UINib(nibName: "CustomerTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomerTableViewCell")
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = "Creación de Cliente"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(self.addButtonPressed))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "logout", style: .plain, target: self, action: #selector(self.closeButtonPressed))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ref.child("customers").observe(.value) { snapshot in
            var customers = [Customer]()
            for placeSnapshot in snapshot.children {
                let customer = Customer(snapshot: placeSnapshot as! DataSnapshot)
                customers.append(customer)
            }
            self.customers = customers
        }
    }
    
    @objc func addButtonPressed(){
        print("addButtonPressed")
//        self.router?.routeToNewPlace()
        self.presenter.goToNewCustomer()
        
    }
    
    @objc func closeButtonPressed(){
        print("closeButtonPressed")
        AuthManager.sharedInstance.login(value: false)
        self.presenter.logoutUser()
    }

}

extension HomeViewController: HomeViewProtocol{
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerTableViewCell", for: indexPath) as! CustomerTableViewCell
        cell.loadData(customer: self.customers[indexPath.row])
        return cell
    }
}


extension HomeViewController: NewCustomerViewControllerDelegate{
    func newCustomer(customer: Customer) {
        self.presenter.newCustomer(customer: customer)
    }
}

