//
//  DetailView.swift
//  CoreDataInitMVVM
//
//  Created by Daniel Watson on 14/02/2021.
//

import SwiftUI
import CoreData

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var pm
    var obj: DataEntity
    @State var name = ""
    var body: some View {
            VStack {
                TextField("name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Image(systemName: "pencil")
                    .onTapGesture {
                        upDate()
                        pm.wrappedValue.dismiss()
                }
            }
            .navigationTitle("Detail view")
            .navigationBarBackButtonHidden(true)
        }
    func upDate() {
        obj.setValue(name, forKey: "value")
        try? moc.save()
    }
}

