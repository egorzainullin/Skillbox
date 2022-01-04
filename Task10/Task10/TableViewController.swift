//
//  TableViewController.swift
//  Task10
//
//  Created by Егор Зайнуллин on 02.01.2022.
//

import UIKit

struct Setting {
    var name: String
    var slider: Bool?
    var hint: String?
    var imageSource: String
}

func generateTable() -> [[Setting]] {
    return [[Setting(name: "Авиарежим", slider: true, hint: nil, imageSource: "avia")],
            [Setting(name: "Уведомления", slider: nil, hint: nil, imageSource: "notifications")]]
}

let settings = generateTable()

class TableViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell") as! TableSliderViewCell
        cell.nameLabel.text = ""
        if section == 0 {
            let settingsString = "Настройки"
            cell.nameLabel.text = settingsString
        }
        // Не получается на всю ширину экрана сделать
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = settings[indexPath.section][indexPath.row]
        if let hint = setting.hint {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LinkAndHintCell") as! TableLinkAndHintViewCell
            cell.nameLabel.text = setting.name
            cell.hintLabel.text = hint
            cell.imageImageView.image = UIImage(named: setting.imageSource)
            return cell
        }
        else if let isSliderOn = setting.slider {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SliderCell") as! TableSliderViewCell
            cell.nameLabel.text = setting.name
            cell.sliderSwitch.isOn = isSliderOn
            cell.imageImageView.image = UIImage(named: setting.imageSource)
            return cell
            //
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LinkCell") as! TableLinkViewCell
            cell.nameLabel.text = setting.name
            cell.imageImageView.image = UIImage(named: setting.imageSource)
            return cell
        }
    }
}


