//
//  ToDoTableViewCell.swift
//  Task14
//
//  Created by Егор Зайнуллин on 15.01.2022.
//

import UIKit

protocol ToDoViewCellProtocol {
    func isTrashButtonClicked(_ sender: ToDoTableViewCell)
}

class ToDoTableViewCell: UITableViewCell {
    
    var id = 0
    
    var text: String = ""
    {
        didSet { taskLabel.text = text }
    }
    
    var delegate: ToDoViewCellProtocol?
    
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBAction func trashButtonTouchUpInside(_ sender: Any) {
        delegate?.isTrashButtonClicked(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
