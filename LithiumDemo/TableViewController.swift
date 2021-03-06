//
//  TableViewController.swift
//  LithiumDemo
//
//  Created by Lab kumar on 08/11/16.
//  Copyright © 2016 Lab kumar. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class TableViewController: UITableViewController {
    
    var bookList: [Book]? {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .None
        
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookList?.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! TableViewCell

        // Configure the cell...
        let data = bookList?[indexPath.row]
        
        cell.nameLabel.text = data?.name
        cell.authorsLabel.text = data?.authorsName()
        cell.isbnLabel.text = data?.isbn
        cell.realeasedLabel.text = data?.releasedDate()
        cell.countryLabel.text = data?.country
        cell.headerLabel.text = data?.firstLetter()
        
        cell.selectionStyle = .None
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 280.0
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
    
    
    func getData () {
        showIndicator()
        BaseRequestor().makeGETRequestWithparameters("http://www.anapioficeandfire.com/api/books", success: { [weak self] (result) in
            
            self?.hideIndicator()
            var books: [Book]?
            books <-- (result as? [AnyObject])
            
            self?.bookList = books
        }) { (error) in
            //
        }
    }
    
    func showIndicator () {
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        
        let height: CGFloat = 50
        view.frame = CGRectMake(0, 0, tableView.bounds.width, height)
        
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        indicator.center = view.center
        indicator.startAnimating()
        view.addSubview(indicator)
        
        tableView.tableFooterView = view
    }
    
    func hideIndicator () {
        tableView.tableFooterView = UIView()
    }

}
