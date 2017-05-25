//
//  TableViewController.swift
//  DatePicker
//
//  Created by Hoan Tran on 5/19/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var selectedIndexPath: IndexPath?
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! PickerTableViewCell
        cell.titleLabel.text = "initial"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let prevIndexPath = self.selectedIndexPath
        
        if indexPath == self.selectedIndexPath {
            self.selectedIndexPath = nil
        } else {
            self.selectedIndexPath = indexPath
        }
        
        var indexPathArray: Array<IndexPath> = []
        
        if let current = self.selectedIndexPath {
            indexPathArray.append(current)
        }
        if let prev = prevIndexPath {
            indexPathArray.append(prev)
        }
        
        if indexPathArray.count > 0 {
            tableView.reloadRows(at: indexPathArray, with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        ( cell as! PickerTableViewCell).observeChanges()
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        ( cell as! PickerTableViewCell).ignoreChanges()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == self.selectedIndexPath {
            return PickerTableViewCell.expandedHeight
        } else {
            return PickerTableViewCell.defaultHeight
        }
    }
    
    
    
}

