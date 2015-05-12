//
//  InterfaceController.swift
//  WatchKitForcedModal WatchKit Extension
//
//  Created by Ben Chatelain on 5/12/15.
//  Copyright (c) 2015 Ben Chatelain. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var passcodeGroup: WKInterfaceGroup?
    @IBOutlet weak var contentGroup: WKInterfaceGroup?

    override init() {
        super.init()
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        contentGroup?.setHidden(true)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
