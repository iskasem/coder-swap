//
//  ViewController.swift
//  coder-swag
//
//  Created by Islam Kasem on 18/05/2019.
//  Copyright © 2019 Islam Kasem. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController,UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var categoryTable : UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTable.dataSource = self
        categoryTable.delegate = self
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataService.instance.getCategories().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell")as? CategoryCell{
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateViews(category: category)
            return cell
        } else{
            return CategoryCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
        performSegue(withIdentifier: "ProductsVC", sender: category)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       assert(sender as?Category != nil)
        if let productCV = segue.destination as?ProductsVC {
            let brBtn = UIBarButtonItem()
            brBtn.title = ""
            navigationItem.backBarButtonItem = brBtn
            productCV.initProduct(category: sender as! Category)
            
        }
    }

}

