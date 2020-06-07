//
//  ContentView.swift
//  PIREP Test
//
//  Created by Baldur Briem on 01/06/2020.
//  Copyright © 2020 Baldur Briem. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var data: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter PIREP", text: $data)
                        .padding()
                HStack {
                    Spacer()
                    NavigationLink(destination: ReportView(report: Pirep(data: data))) {
                        Text("Send PIREP").padding()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
