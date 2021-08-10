//
//  ViewController.swift
//  IOSExpandedTableView
//
//  Created by Ripin Li on 09/08/21.
//  Copyright © 2021 Herlian Zhang. All rights reserved.
//

import UIKit

struct MyModel {
    let title: String
    let item: [String]
    var isExpanded: Bool = false
}

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(UINib(nibName: "SectionTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "default cell")
    
        return tableView
    }()
    
    private var data = [MyModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = [
            MyModel(title: "Section 1", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 2", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 3", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 4", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 5", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 6", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 7", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 8", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 9", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 10", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 11", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 12", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 13", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 14", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 15", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 16", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 17", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 18", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 19", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 20", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 21", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 22", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 23", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 24", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 25", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 26", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 27", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 28", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 29", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 30", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 31", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 32", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 33", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 34", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 35", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 36", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 37", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 38", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 39", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 40", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 41", item: [1, 2, 3].compactMap { "item \($0)" }),
            MyModel(title: "Section 42", item: [1, 2, 3].compactMap { "item \($0)" }),
        ]
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tmp = data[section]
        return tmp.isExpanded ? tmp.item.count + 1 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tmp = data[indexPath.section]
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SectionTableViewCell
            
            cell.myLabel.text = tmp.title
            
            let angle: CGFloat = !data[indexPath.section].isExpanded ? (180.0 * .pi) / 180.0 : 0
            
            cell.myIcon.transform = CGAffineTransform(rotationAngle: angle)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "default cell", for: indexPath)
            
            cell.textLabel?.text = tmp.item[indexPath.row - 1]
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            let cell = tableView.cellForRow(at: indexPath) as! SectionTableViewCell
            
            let state = data[indexPath.section].isExpanded
            
            data[indexPath.section].isExpanded = !state
            
            cell.myIcon.rotate(shouldRotate: state)
            
            let indexPaths = (1...data[indexPath.section].item.count).map {
                IndexPath(row: $0, section: indexPath.section)
            }
            if state {
                tableView.deleteRows(at: indexPaths, with: .none)
            } else {
                tableView.insertRows(at: indexPaths, with: .none)
            }
            
        } else {
            print("Masuk pak eko \(data[indexPath.section].item[indexPath.row - 1])")
        }
    }
}

extension UIView{
    func rotate(shouldRotate: Bool) {
        let angle: CGFloat = shouldRotate ? (180.0 * .pi) / 180.0 : 0
        UIView.animate(withDuration: 0.5) {
            self.transform = CGAffineTransform(rotationAngle: angle)
        }
    }
}
