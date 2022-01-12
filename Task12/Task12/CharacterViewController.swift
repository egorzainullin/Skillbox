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
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let character = character {
            nameLabel.text = character.name
            raceLabel.text = character.species
            planetLabel.text = character.origin.name
            let url = URL(string: character.image)
            if let url = url {
                DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async { [self] in
                self.characterImageView.image = UIImage(data: data!)
                }
                }
            }
            for episodeLink in character.episode {
                Loader.loadEpisode(urlLink: episodeLink, completion: {episode in
                    let episodes = self.episodesList.text
                    if let episodes = episodes {
                        self.episodesList.text = episodes + "\n" + episode
                    }
                })
            }
        }
     
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
