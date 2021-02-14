//
//  AddNewSheet.swift
//  CoreDataInitMVVM
//
//  Created by Daniel Watson on 14/02/2021.
//

import SwiftUI
import CoreData

struct AddNewSheet: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var pm
    @State var name = ""
    var body: some View {
        VStack {
            TextField("Add New Todo", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Image(systemName: "plus")
                .onTapGesture {
                    save()
                    pm.wrappedValue.dismiss()
            }
        }
    }
    func save() {
        let entity = DataEntity(context: self.moc)
        entity.value = name
        try? self.moc.save()
    }
}
struct AddNewSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddNewSheet()
    }
}
