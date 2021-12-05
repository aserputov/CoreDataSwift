//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by Anatoliy Serputov on 2021-12-05.
//
import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var hiredLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func addEmployee(name:String, dateHired:String) {
        let e1 = Employee(context: self.context)
        e1.name = "\(name)"
        e1.dateHired = "\(dateHired)"
        do{
            try self.context.save()
            
        }catch{
            print("Not ok")
        }
        
    }

    @IBAction func GoEmp(_ sender: Any) {
        let empName = nameLabel.text!
        let empDate = hiredLabel.text!
        addEmployee(name: empName, dateHired: empDate)
        nameLabel.text  = ""
        hiredLabel.text = ""
    }
    
    @IBAction func GetAllEmp(_ sender: Any) {
        let request:NSFetchRequest<Employee> = Employee.fetchRequest()
        
        do{
            let result:[Employee] = try self.context.fetch(request)
            print("\(result.count)")
        }catch{
            
        }
    }
}

