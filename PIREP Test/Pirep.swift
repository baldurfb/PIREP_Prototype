//
//  PIREP.swift
//  PIREP Test
//
//  Created by Baldur Briem on 01/06/2020.
//  Copyright © 2020 Baldur Briem. All rights reserved.
//

import Foundation

struct Pirep {
    public let RawPirep: String
    public let Reports: Dictionary<String, String>
    public let Header: String
    public let ReportList: [String]

    init(data: String) {
        self.RawPirep = data
        self.Reports = Pirep.DecodeReport(data: data)
        self.Header = Pirep.DecodeHeader(data: data)
        self.ReportList = Pirep.MakeReportList(reports: self.Reports)

        //let testData = "UACN10 CYQT 192128 YZ WG UA /OV YSP 090025 /TM 2120 /FL050 /TP BE99 /SK 020BKN040 110OVC /TA -14 /WV 030045 /TB MDT CAT 060-080 /IC LGT RIME 020-040 /RM LGT FZRA INC"
    }
    
    private static func DecodeReport(data: String) -> Dictionary<String, String> {
        let range = NSRange(location: 0, length: data.utf16.count)
        let reportRegex = try! NSRegularExpression(pattern: "\\/([A-Z]{2})([ A-Za-z0-9-]+)")

        let reportMatches = reportRegex.matches(in: data, options: [], range: range)
        var results: Dictionary<String, String> = [:]

        for match in reportMatches {
            let matchGroups = match.groups(testedString: data)
            results[matchGroups[1]] = matchGroups[2].trimmingCharacters(in: .whitespacesAndNewlines)
        }

        return results
    }

    private static func DecodeHeader(data: String) -> String {
        if let matchRange = data.range(of: "^.+?\\/", options: .regularExpression) {
            return String(data[matchRange].dropLast(2))
        }
        else {
            return ""
        }
    }
    
    private static func MakeReportList(reports: Dictionary<String, String>) -> [String] {
        var reportList = [String]()
        for item in reports {
            reportList.append("/\(item.key) \(item.value)")
        }
        return reportList
    }
}
