//
//  ViewController.swift
//  CFBadgeDemo
//
//  Created by Apple on 2017/9/7.
//  Copyright © 2017年 cf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    //private vars
     fileprivate let dataArray: [[String : String]] = Array.init(repeating: ["title" : "你好", "content" : "福建咖喱饭哈哈离开韩国可拉和鼓励扩大火锅见风使舵离开赶紧离开的时间过来看"], count: 66)
    fileprivate var itemIsSelected: Bool = false
    fileprivate lazy var messageItem: UIBarButtonItem = {
        let item = UIBarButtonItem(image: #imageLiteral(resourceName: "消息").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(respondsToMessageItem))
        return item
    }()
    fileprivate lazy var locationItem: UIBarButtonItem = {
        let item = UIBarButtonItem(image: #imageLiteral(resourceName: "mycity_normal").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(respondsToMessageItem))
        return item
    }()
    
    
    //life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        navigationItem.rightBarButtonItem = messageItem
        navigationItem.leftBarButtonItem = locationItem
        messageItem.showBadge(value: 20, offset: nil)
        locationItem.showBadge(value: 20, offset: nil)
        self.navigationController?.tabBarItem.showDot(offset: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //private funcs
    func respondsToMessageItem(item: UIBarButtonItem) {
        itemIsSelected = !itemIsSelected
        itemIsSelected ? item.showBadge(value: Int(arc4random_uniform(200)), offset: nil) : item.showDot(offset: nil)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as? OrderTableViewCell else { fatalError("no OrderTableViewCell") }
            cell.badges = (Int(arc4random_uniform(20)), Int(arc4random_uniform(6)), Int(arc4random_uniform(200)), Int(arc4random_uniform(60)))
            return cell;
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { fatalError("no CustomTableViewCell") }
        cell.imageV.image = UIImage.init(named: "IMG_00\(arc4random_uniform(6) + 1)")
        if indexPath.row % 5 == 0 {
            cell.imageV.showDot(offset: nil)
        } else {
            cell.imageV.showBadge(value: Int(arc4random_uniform(160)), offset: CGPoint(x: 0.5, y: 0.3))
        }
        cell.titleLb.text = dataArray[indexPath.row]["title"]
        cell.contentLb.text = dataArray[indexPath.row]["content"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell else { return }
        cell.imageV.hideBadge()
    }
}

