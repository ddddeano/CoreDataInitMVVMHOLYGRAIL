//
//  RowView.swift
//  CoreDataInitMVVM
//
//  Created by Daniel Watson on 14/02/2021.
//

import SwiftUI
import CoreData

struct RowView: View {
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var obj: DataEntity
    var body: some View {
        Text(obj.value ?? "")
    }
}
