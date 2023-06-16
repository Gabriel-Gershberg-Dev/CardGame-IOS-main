//
//  ViewControllerScore.swift
//  Game
//
//  Created by gabi on 16/06/2023.
//

import UIKit

class ViewControllerScore: UIViewController {
    @IBOutlet weak var scoreTextView: UITextView!
    @IBOutlet weak var backToMenu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreTextView.text = UserDefaults.standard.string(forKey: "WinnerString")

    }
    


}
