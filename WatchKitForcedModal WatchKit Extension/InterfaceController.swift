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

    @IBOutlet weak var entryIndicator1: WKInterfaceGroup?
    @IBOutlet weak var entryIndicator2: WKInterfaceGroup?
    @IBOutlet weak var entryIndicator3: WKInterfaceGroup?
    @IBOutlet weak var entryIndicator4: WKInterfaceGroup?

    private var keyEntrySequence: [Int] = []

    override init() {
        super.init()
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        contentGroup?.setHidden(true)
        entryIndicator1?.setHidden(true)
        entryIndicator2?.setHidden(true)
        entryIndicator3?.setHidden(true)
        entryIndicator4?.setHidden(true)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    // MARK: - IBAction Methods (Passcode)

    @IBAction func didTap1() { addKeyEntry(1) }
    @IBAction func didTap2() { addKeyEntry(2) }
    @IBAction func didTap3() { addKeyEntry(3) }
    @IBAction func didTap4() { addKeyEntry(4) }
    @IBAction func didTap5() { addKeyEntry(5) }
    @IBAction func didTap6() { addKeyEntry(6) }
    @IBAction func didTap7() { addKeyEntry(7) }
    @IBAction func didTap8() { addKeyEntry(8) }
    @IBAction func didTap9() { addKeyEntry(9) }
    @IBAction func didTap0() { addKeyEntry(0) }

    @IBAction func didTapDelete() { removeKeyEntry() }

    // MARK: - IBAction Methods (Content)

    @IBAction func didTapLock() { lock() }

    // MARK: - Private

    private func addKeyEntry(entry: Int) {
        keyEntrySequence.append(entry)
        println("keyEntrySequence: \(keyEntrySequence)")
        updateEntryIndicators()
    }

    private func removeKeyEntry() {
        keyEntrySequence.removeLast()
        println("keyEntrySequence: \(keyEntrySequence)")
        updateEntryIndicators()
    }

    private func updateEntryIndicators() {
        switch keyEntrySequence.count {
        case 4:
            entryIndicator4?.setHidden(false)
            unlock()
        case 3:
            entryIndicator4?.setHidden(true)
            entryIndicator3?.setHidden(false)
        case 2:
            entryIndicator3?.setHidden(true)
            entryIndicator2?.setHidden(false)
        case 1:
            entryIndicator2?.setHidden(true)
            entryIndicator1?.setHidden(false)
        case 0:
            fallthrough
        default:
            entryIndicator1?.setHidden(true)
        }
    }

    private func unlock() {
        passcodeGroup?.setHidden(true)
        contentGroup?.setHidden(false)
        println("Unlocked")
    }

    private func lock() {
        passcodeGroup?.setHidden(false)
        contentGroup?.setHidden(true)
        println("Locked")

        // Reset the entry state
        keyEntrySequence = []
        entryIndicator1?.setHidden(true)
        entryIndicator2?.setHidden(true)
        entryIndicator3?.setHidden(true)
        entryIndicator4?.setHidden(true)
    }

}
