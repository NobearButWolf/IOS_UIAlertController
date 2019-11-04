//
//  ViewController.swift
//  UIAlertController
//
//  Created by student on 2019/10/30.
//  Copyright © 2019 吴谭波. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    var v: UIView!
    var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        title = "Alert"
        self.view.backgroundColor = UIColor.white

        label = UILabel(frame: CGRect(x: 0, y: 300, width: self.view.bounds.width, height: 70))
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        self.view.addSubview(label)

        v = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        v.backgroundColor = UIColor.cyan
        self.view.addSubview(v)

        let rightBtn = UIBarButtonItem(title: "Alert", style: .plain, target: self, action: #selector(alertLogin))
        self.navigationItem.rightBarButtonItem = rightBtn

        let leftBtn = UIBarButtonItem(title: "Action", style: .plain, target: self, action: #selector(actionSheet))
        self.navigationItem.leftBarButtonItem = leftBtn

    }

    @objc func alertLogin() {
        let alert = UIAlertController(title: "填写信息", message: nil, preferredStyle: .alert)

        alert.addTextField { (tf) in
            tf.placeholder = "用户名"
        }
        alert.addTextField { (tf) in
            tf.placeholder = "密码"
        }

        let OKBtn = UIAlertAction(title: "确定", style: .default) { _ in
            let username = alert.textFields![0].text ?? ""
            let password = alert.textFields![1].text ?? ""
            let string = "用户名: \(username)\n密码: \(password)"
            self.label.text = string
        }
        let cancelBtn = UIAlertAction(title: "取消", style: .cancel, handler: nil)

        alert.addAction(OKBtn)
        alert.addAction(cancelBtn)

        self.present(alert, animated: true, completion: nil)
    }

    @objc func actionSheet() {
        let action = UIAlertController(title: "选择颜色", message: nil, preferredStyle: .actionSheet)

        let redBtn = UIAlertAction(title: "红色", style: .default) { (_) in
            self.v.backgroundColor = UIColor.red
        }
        let greenBtn = UIAlertAction(title: "绿色", style: .default) { (_) in
            self.v.backgroundColor = UIColor.green
        }
        let blueBtn = UIAlertAction(title: "蓝色", style: .default) { (_) in
            self.v.backgroundColor = UIColor.blue
        }
        let yellowBtn = UIAlertAction(title: "黄色", style: .default) { (_) in
            self.v.backgroundColor = UIColor.yellow
        }
        let blackBtn = UIAlertAction(title: "黑色", style: .default) { (_) in
            self.v.backgroundColor = UIColor.black
        }
        let grayBtn = UIAlertAction(title: "灰色", style: .default) { (_) in
            self.v.backgroundColor = UIColor.gray
        }
        let cancelBtn = UIAlertAction(title: "取消", style: .cancel, handler: nil)

        action.addAction(redBtn)
        action.addAction(greenBtn)
        action.addAction(blueBtn)
        action.addAction(yellowBtn)
        action.addAction(blackBtn)
        action.addAction(grayBtn)
        action.addAction(cancelBtn)

        self.present(action, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


