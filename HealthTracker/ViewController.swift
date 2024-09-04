//
//  ViewController.swift
//  HealthTracker
//
//  Created by Raeva Desai on 8/17/24.
//

import UIKit

import SwiftUI



class ViewController: UIViewController {



    override func viewDidLoad() {

        super.viewDidLoad()



        // Create an instance of GoalSelectionView

        let goalSelectionView = GoalSelectionView()



        // Wrap the SwiftUI view in a UIHostingController

        let hostingController = UIHostingController(rootView: goalSelectionView)



        // Add the hosting controller as a child view controller

        addChild(hostingController)

        hostingController.view.frame = view.bounds

        view.addSubview(hostingController.view)

        hostingController.didMove(toParent: self)

    }

}

