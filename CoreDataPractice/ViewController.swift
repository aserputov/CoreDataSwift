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
        
        
        request.predicate = NSPredicate(format: "name == %@", "Alex") // search Results
        
        do{
            let result:[Employee] = try self.context.fetch(request)
            print("\(result.count)")
            
            for employee in result{
                print("\(employee.name ?? "N/A")")
                print("\(employee.dateHired ?? "N/A")")
            }
            
        }catch{
            
        }
    }
    
    @IBAction func UpdateButton(_ sender: Any) {
        let request:NSFetchRequest<Employee> = Employee.fetchRequest()
        
        
        request.predicate = NSPredicate(format: "name == %@", "Alex") // search Results
        
        do{
            let result:[Employee] = try self.context.fetch(request)
            
            let alex = result.first!
            alex.name = "Abigail"
            
            
            try self.context.save()
            print("\(alex.name)")
            
        }catch{
            
        }
    }
    @IBAction func DeleteALL(_ sender: Any) {
        
    }
    
    
}

