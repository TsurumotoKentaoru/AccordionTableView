//
//  ViewController.swift
//  AccordionTableView
//
//  Created by 鶴本賢太朗 on 2019/03/06.
//  Copyright © 2019 Kentarou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let datas: [SectionData] = SectionData.getSampleData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let xib = UINib(nibName: "HeaderView", bundle: nil)
        self.tableView.register(xib, forHeaderFooterViewReuseIdentifier: "HeaderView")
        self.tableView.tableFooterView = UIView()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        let sectionData = self.datas[section]
        header.sectionLabel.text = sectionData.name
        header.delegate = self
        header.tag = section
        return header
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.datas.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.datas[section]
        if section.isOpen {
            let rowCount = section.rowDatas.count
            return rowCount
        }
        else {
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let rowData = self.datas[indexPath.section].rowDatas[indexPath.row]
        cell.textLabel?.text = rowData.content
        cell.tag = indexPath.row
        return cell
    }
}

extension ViewController: HeaderViewDelegate {
    func didTap(header: HeaderView) {
        let section = self.datas[header.tag]
        section.isOpen = !section.isOpen
        self.tableView.reloadSections(IndexSet(integer: header.tag), with: .automatic)
    }
}
