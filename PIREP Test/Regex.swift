//
//  File.swift
//  PIREP Test
//
//  Created by Baldur Briem on 02/06/2020.
//  Copyright © 2020 Baldur Briem. All rights reserved.
//

import Foundation

extension NSTextCheckingResult {
    func groups(testedString:String) -> [String] {
        var groups = [String]()
        for i in  0 ..< self.numberOfRanges
        {
            let group = String(testedString[Range(self.range(at: i), in: testedString)!])
            groups.append(group)
        }
        return groups
    }
}
