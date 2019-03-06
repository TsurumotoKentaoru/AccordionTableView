//
//  HeaderView.swift
//  AccordionTableView
//
//  Created by 鶴本賢太朗 on 2019/03/06.
//  Copyright © 2019 Kentarou. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate: class {
    func didTap(header: HeaderView)
}

class HeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var sectionLabel: UILabel!
    internal weak var delegate: HeaderViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let backgroundview = UIView()
        backgroundview.backgroundColor = UIColor.lightGray
        self.backgroundView = backgroundview
    }
    @IBAction func didTap(_ sender: Any) {
        self.delegate?.didTap(header: self)
    }
}
