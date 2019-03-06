//
//  Data.swift
//  AccordionTableView
//
//  Created by 鶴本賢太朗 on 2019/03/06.
//  Copyright © 2019 Kentarou. All rights reserved.
//

import UIKit

class SectionData {
    internal var name: String = ""
    internal var rowDatas: [RowData] = []
    internal var isOpen: Bool = true
    
    static func getSampleData() -> [SectionData] {
        var sections: [SectionData] = []
        for i in 0 ..< 10 {
            let section = SectionData()
            section.name = "\(i)" + "番目のsection"
            for j in 0 ..< 5 {
                let row = RowData()
                row.content = "\(j)" + "番目のRow"
                section.rowDatas.append(row)
            }
            sections.append(section)
        }
        return sections
    }
}

class RowData {
    internal var content: String = ""
}
