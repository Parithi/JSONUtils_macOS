//
//  ViewController.swift
//  JSONUtils
//
//  Created by Eyes on 2019-12-17.
//  Copyright © 2019 Parithi Network. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var codeTextView: NSTextView!
    @IBOutlet weak var actionButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeTextView.font = NSFont(name: "Monaco", size: 14)
    }
    
    @IBAction func actionClicked(_ sender: Any) {
        guard codeTextView.string.count > 0 else { return }
        
        let string = codeTextView.string
        
        codeTextView.string = getConvertedString(string: string)
        
    }
    
    func getConvertedString(string : String) -> String {
        let unquotedString = string.replacingOccurrences(of: "\\", with: "")
        return unquotedString.withoutDoubleQuotes()
    }
    
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window?.title = "JSON Utils"
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension String {
    func withoutDoubleQuotes() -> String {
        if self.hasPrefix("\""), self.hasSuffix("\""), self.count > 1 {
            return String(self.dropFirst().dropLast())
        }
        return self
    }
}
