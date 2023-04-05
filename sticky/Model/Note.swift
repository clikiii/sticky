//
//  Note.swift
//  sticky
//
//  Created by wangyian on 28/3/2023.
//

import SwiftUI

struct Note: Identifiable {
    var id = UUID().uuidString
    var note: String
    var date: Date
    var cardColor: Color
}

// NOTE: for testing
func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}


var notes: [Note] = [
    Note(note:"tttt asdlgaga asdkfalga adglasfjgafhjglaskhg;ladsb\n\n tttt asdlgaga asdkfalga adglasfjgafhjglaskhg;ladsb\n\n wanfdadfasdf", date: getSampleDate(offset: 1), cardColor: Color("Blue")),
    Note(note:"ttttp", date: getSampleDate(offset: -3), cardColor: Color("Pink")),
    Note(note:"ttttg", date: getSampleDate(offset: -10), cardColor: Color("Green")),
    Note(note:"tttt asdlgaga asdkfalga adglasfjgafhjglaskhg;ladsb\n\n tttt asdlgaga asdkfalga adglasfjgafhjglaskhg;ladsb\n\n wanfdadfasdf", date: getSampleDate(offset: 1), cardColor: Color("Blue")),
    Note(note:"ttttp", date: getSampleDate(offset: -3), cardColor: Color("Pink")),
    Note(note:"ttttg", date: getSampleDate(offset: -10), cardColor: Color("Green")),
]
