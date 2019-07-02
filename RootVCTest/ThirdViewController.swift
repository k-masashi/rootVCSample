//
//  ThirdViewController.swift
//  RootVCTest
//
//  Created by Kunugi Masashi on 2019/07/02.
//  Copyright © 2019 Globis. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapReset(_ sender: Any) {
        softwareReset()
    }
    
    @IBAction func tapShowDialog(_ sender: Any) {
        showResetAlertDialog()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.softwareReset()
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
    func showResetAlertDialog() {
        let alert: UIAlertController = UIAlertController(title: "リセットするようのダイアログです", message: "3秒後にリセットします", preferredStyle:  UIAlertController.Style.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            // Do Nothing
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
            (action: UIAlertAction!) -> Void in
            // Do Nothing
        })
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
    
    func softwareReset() {
        let notification = Notification(name: RootViewController.SampleRestartNotification)
        NotificationCenter.default.post(notification)
    }
}
