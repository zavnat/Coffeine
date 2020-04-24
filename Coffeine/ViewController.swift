//
//  ViewController.swift
//  Coffeine
//
//  Created by admin on 22.04.2020.
//  Copyright © 2020 Natali. All rights reserved.
//

import UIKit
import RealmSwift



class ViewController: UIViewController {
    
    let realm = try! Realm()
    
    var results: Results<Data>!
    
    let coffeine = 70
    var coffeineLimit = 400
    var cupsOfCoffee = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var cupsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        updateView()
       
        
    }

    
    
    @IBAction func addButton(_ sender: UIButton) {
        
        
        
        if coffeineLimit >= coffeine {

            let data = Data()
           
            saveData(toDatabase: data)
            updateView()
           
        }
    }
  
    
    func saveData (toDatabase data: Data) {
        do {
            try realm.write {
                realm.add(data)
                
            }
        }catch {
            print("Error saving data object")
        }
        
    }
    
    
    func loadData (){
        
        results = realm.objects(Data.self)
        

        
        
    }
    
    func updateView() {
        let today = Date()
        let nowDate = Calendar.current.dateComponents([.day, .month, .year], from: today)
     
        coffeineLimit = 400
        cupsOfCoffee = 0
        
        for item in results {
            let time = item.time
            let dateFromBase = Calendar.current.dateComponents([.day, .month, .year], from: time)
          
            
            if dateFromBase.day == nowDate.day {
                coffeineLimit -= item.gramPerCup
                cupsOfCoffee += 1
                print("today \(item)")
                
            }
            else {
              
            }
            
        }
        label.text = String (coffeineLimit)
        cupsLabel.text = String (cupsOfCoffee)
        
    }
    
    
    
    
   
    
    
    
}

