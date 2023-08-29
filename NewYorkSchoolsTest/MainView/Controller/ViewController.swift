//
//  ViewController.swift
//  NewYorkSchoolsTest
//
//  Created by Brandon Suarez on 5/18/23.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    // TableView
    let tableView = UITableView()
    
    // Variables and Constants
    var schoolsData: [School] = []
    var satResultsData: [SatResult] = []
    
    // Animation View
    var animationView = LottieAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.backGround
        setUpTableView()
        fetchHighSchoolsData()
        fetchSatResultsData()
    }
}
