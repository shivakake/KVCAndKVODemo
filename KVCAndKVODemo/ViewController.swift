//
//  ViewController.swift
//  KVCAndKVODemo
//
//  Created by Kumaran on 30/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Normal way of accessing the property of a class
        let shiva = Person(aName: "Shiva")
        print(shiva.name ?? "")
        
        //KVC
        if let shiva1 = shiva.value(forKey: "name"){
            print(shiva1)
        }
        let shiva2 = shiva.setValue("Kumaran", forKey: "name")
        print(shiva2)
        
        //KVO
        
       let obj = shiva.observe(\.name, options: [.old, .new]) { (person, value) in
            print("Old Name:",value.oldValue)
            print("New Name:",value.newValue)
        }
        shiva.name = "PGK"
        shiva.setValue("PGK", forKey: "name")
    }
    
    
}

class Person: NSObject {
    @objc dynamic var name: String?
    var country: String = "India"
    init(aName: String?) {
        name = aName
    }
}
