//
//  RootViewController.swift
//  RootVCTest
//
//  Created by Kunugi Masashi on 2019/07/02.
//  Copyright © 2019 Globis. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    static let SampleRestartNotification = Notification.Name("SampleRestartNotification")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("RootViewContorollerが呼ばれました！！")
        NotificationCenter.default.addObserver(self, selector: #selector(handleSoftwareResetNotification(_:)), name: RootViewController.SampleRestartNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        performSegue(withIdentifier: "RootToMain", sender: nil)
    }
    
    @objc func handleSoftwareResetNotification(_ notification: Notification) {
        let applicationDelegate = UIApplication.shared.delegate as! AppDelegate
        dismiss(animated: true) {
            self.performSegue(withIdentifier: "RootToMain", sender: nil)
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
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
