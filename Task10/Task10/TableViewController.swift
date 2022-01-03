//
//  TableViewController.swift
//  Task10
//
//  Created by Егор Зайнуллин on 02.01.2022.
//

import UIKit


struct Meetup{
    var date = ""
    var names: [String] = []
}

class MeetupFabric{
    static func meetups() -> [Meetup]{
        return [
            Meetup(date: "Сегодня", names: ["Nikita", "Anton", "Andrey"]),
            Meetup(date: "Вчера", names: ["Nikita", "Andrey"]),
            Meetup(date: "10.07.18", names: ["Nikita", "Anton"])
        ]
    }
}

class TableViewController: UIViewController {
    var meetups = MeetupFabric.meetups()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return meetups.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetups[section].names.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return meetups[section].date
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell") as! TableSliderViewCell
        cell.nameLabel.text = "Hey"
        print("hey")
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableSliderCell") as! TableSliderViewCell
        let name = meetups[indexPath.section].names[indexPath.row]
        cell.nameLabel.text = name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(names[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
