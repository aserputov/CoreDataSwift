//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by Anatoliy Serputov on 2021-12-05.
//
import UIKit

class ViewController: UIViewController {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func addEmployee() {
        let e1 = Employee(context: self.context)
        e1.name = "Anatoliy S"
        e1.dateHired = "01.01.2022"
        do{
            try self.context.save()
            
        }catch{
            print("Not ok")
        }
        
    }

    @IBAction func GoEmp(_ sender: Any) {
        addEmployee()
    }
    
}

