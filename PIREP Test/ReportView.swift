//
//  ReportView.swift
//  PIREP Test
//
//  Created by Baldur Briem on 06/06/2020.
//  Copyright © 2020 Baldur Briem. All rights reserved.
//

import SwiftUI

struct ReportView: View {
    let report: Pirep
    var body: some View {
        VStack {
            Text(report.Header).font(.largeTitle).padding()
            ForEach(report.ReportList, id: \.self) {
                Text($0).padding()
            }
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(report: Pirep(data: "UACN10 CYQT 192128 YZ WG UA /OV YSP 090025 /TM 2120 /FL050 /TP BE99 /SK 020BKN040 110OVC /TA -14 /WV 030045 /TB MDT CAT 060-080 /IC LGT RIME 020-040 /RM LGT FZRA INC"))
    }
}
