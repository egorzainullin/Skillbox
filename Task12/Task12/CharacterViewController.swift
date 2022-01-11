//
//  CharacterViewController.swift
//  Task12
//
//  Created by Егор Зайнуллин on 09.01.2022.
//

import UIKit

class CharacterViewController: UIViewController {

    var character: Character?
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var raceLabel: UILabel!
    
    @IBOutlet weak var planetLabel: UILabel!
    
    @IBOutlet weak var episodesList: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
