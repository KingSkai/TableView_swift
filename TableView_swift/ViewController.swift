//
//  ViewController.swift
//  TableView_swift
//
//  Created by 王凯 on 2016/12/13.
//  Copyright © 2016年 王凯. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let textStr : NSString = "12345\n12345\n12345\n12345\n12345\n12345\n12345\n12345\n12345\n12345\n"
    
    // 创建一个字典记录被点击的cell是否被展开
    var dict:Dictionary<String,String> = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
//        tableView.delegate = self
//        tableView.dataSource = self
        // 消除storyboard中的分割线
        tableView.tableFooterView = UIView()
        
        
        
        // tableview的默认高度
        tableView.estimatedRowHeight = 44.0
        // tableview自动计算高度
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // 使用tag值来获取Storyboard上的label
        let labels = cell.contentView.viewWithTag(1000) as! UILabel
        labels.text = textStr as String

        // 使用String()函数将indexPath.row转化为String类型
        if dict[String(indexPath.row)] == "0" {
            labels.numberOfLines = 0
        } else {
            labels.numberOfLines = 1
        }
        return cell
    }

    
    // 达到点击即可展开的效果,再点击即可回收
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        let label = cell!.contentView.viewWithTag(1000) as! UILabel
        if label.numberOfLines == 0 {
            label.numberOfLines = 1
            dict[String(indexPath.row)] = "1"
        } else {
            label.numberOfLines = 0
            dict[String(indexPath.row)] = "0"
        }
        tableView.reloadData()
    }
    
    // 以往的cell高度的计算方式
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        let atttribute = [NSFontAttributeName:UIFont.systemFont(ofSize: 17)]
//
//        return textStr.boundingRect(with:CGSize(width: 300.0, height: 0.0), options: .usesLineFragmentOrigin, attributes: atttribute, context: nil).size.height + 10
//        
//    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

