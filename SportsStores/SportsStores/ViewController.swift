//
//  ViewController.swift
//  SportsStores
//
//  Created by libo on 2017/4/5.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

var handler =  {
    (p: Product) in
    print("Chang: \(p.name) \(p.stockLevel) in stock")
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totalStockLabel: UILabel!
    let productStore = ProductDataStore()
    
//    var logger = Logger<Product>(callBack: handler)
    /*
    var products = [
        Product(name:"Kayak", description:"A boat for one person",category:"Watersports", price:275.0, stockLevel:10),
        Product(name:"Lifejacket", description:"Protective and fashionable",category:"Watersports", price:48.95, stockLevel:14),
        Product(name:"Soccer Ball", description:"FIFA-approved size and weight",category:"Soccer", price:19.5, stockLevel:32),
        Product(name:"Corner Flags", description:"Give your playing field a professional touch", category:"Soccer", price:34.95, stockLevel:1),
        Product(name:"Stadium", description:"Flat-packed 35,000-seat stadium",category:"Soccer", price:79500.0, stockLevel:4),
        Product(name:"Thinking Cap", description:"Improve your brain efficiency by 75%", category:"Chess", price:16.0, stockLevel:8),
        Product(name:"Unsteady Chair", description:"Secretly give your opponent a disadvantage", category: "Chess", price: 29.95, stockLevel:3),
        Product(name:"Human Chess Board", description:"A fun game for the family", category:"Chess", price:75.0, stockLevel:2),
        Product(name:"Bling-Bling King", description:"Gold-plated, diamond-studded King", category:"Chess", price:1200.0, stockLevel:4)
    ]
 */
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStockTotal()
        
        productStore.callBack = {
            (p: Product) in
            for cell in self.tableView.visibleCells {
                if let temp = cell as? ProductTableCell {
                    if temp.product?.name == p.name {
                        temp.stockSteper.value = Double(p.stockLevel)
                        temp.stockField.text = String(p.stockLevel)
                    }
                }
            }
            self.displayStockTotal()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stockLevelChanged(_ sender: Any) {
        if var currentCell = sender as? UIView {
            while true {
                currentCell = currentCell.superview!
                if let cell = currentCell as? ProductTableCell {
                    //round 1
                    /*
                    if let id = cell.productId {
                        var newStockLevel: Int?
                        
                        if let steper = sender as? UIStepper {
                            newStockLevel = Int(steper.value)
                        } else if let textfield = sender as? UITextField {
                            if let newValue = Int(textfield.text!) {
                                newStockLevel = newValue
                            }
                        }
                        
                        if let level = newStockLevel {
                            products[id].4 = level
                            cell.stockSteper.value = Double(level)
                            cell.stockField.text = String(level)
                            
                        }
                    }
                    break
                     */
                    
                    //round2
                    if let product = cell.product {
                        if let steper = sender as? UIStepper {
                            product.stockLevel = Int(steper.value)
                        } else if let textfield = sender as? UITextField {
                            if let newValue = Int(textfield.text!) {
                                product.stockLevel = newValue
                            }
                        }
                        
                        cell.stockSteper.value = Double(product.stockLevel)
                        cell.stockField.text = String(product.stockLevel)
                        productLogger.logItem(item: product)
                    }
                    break
                }
            }
            displayStockTotal()
        }
        
    }

    func displayStockTotal() {
        
        /* round 1
        let stockTotal = products.reduce(0) { (total, product) -> Int in
            return total + product.4
        }
        totalStockLabel.text = "\(stockTotal) products in stock"
        */
        
        // round 2
        /*
        let stockTotal = products.reduce(0) { (total, product) -> Int in
            return total + product.stockLevel
        }
        totalStockLabel.text = "\(stockTotal) products in stock"
        */
        
        // round 3
        let finalTotal:(Int, Double) = productStore.products.reduce((0, 0.0)) { (total, product) -> (Int, Double) in
            return (
                total.0 + product.stockLevel,
                total.1 + product.stockValue
            )
            
        }
        totalStockLabel.text = "\(finalTotal.0) Products in Stock. " + "Total Value: \(Utils.currencyStringFromNumber(NSNumber(value: finalTotal.1)))";
    }

    
    
}

// MARK:- UITableViewDelegate
extension ViewController {
    
    
}


// MARK:- UITableViewDataSource
extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productStore.products.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = productStore.products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductTableCell
        cell.nameLabel.text = product.name
//        cell.productId = indexPath.row
        cell.product = product
        cell.descriptionLabel.text = product.descript
        cell.stockSteper.value = Double(product.stockLevel)
        cell.stockField.text = String(product.stockLevel)
        return cell
    }
    
}

