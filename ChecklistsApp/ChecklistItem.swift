//
//  ChecklistItem.swift
//  ChecklistsApp
//
//  Created by Test on 26/03/2019.
//  Copyright © 2019 Peanch. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
