//
//  PickerTableViewCell.swift
//  DatePicker
//
//  Created by Hoan Tran on 5/19/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import UIKit

class PickerTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    var observingCount: Int = 0

    static let FRAME_KEY_PATH = "frame"
    
    class var expandedHeight: CGFloat { get { return 200 } }
    class var defaultHeight:  CGFloat { get { return 44  } }
    
    func hideDatePickerIfNeeded() {
        datePicker.isHidden = ( frame.size.height < PickerTableViewCell.expandedHeight )
    }
    
    func observeChanges() {
        print("Adding: \(self)")
        if self.observingCount < 1 {
            addObserver(self, forKeyPath: PickerTableViewCell.FRAME_KEY_PATH, options: .new, context: nil)
        }
        self.observingCount += 1
        hideDatePickerIfNeeded()
    }
    
    func ignoreChanges() {
        print("Removing: \(self)")
        if self.observingCount > 0 {
            removeObserver(self, forKeyPath: PickerTableViewCell.FRAME_KEY_PATH)
            self.observingCount -= 1
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print(keyPath ?? "")
        if keyPath == PickerTableViewCell.FRAME_KEY_PATH {
            hideDatePickerIfNeeded()
        }
    }
}
