//
//  ContentView.swift
//  CoreDataInitMVVM
//
//  Created by Daniel Watson on 14/02/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: DataEntity.entity(), sortDescriptors: [])
    var datas: FetchedResults<DataEntity>
    @State var showSheet = false
    var body: some View {
        NavigationView {
            List {
                ForEach(datas, id: \.objectID) { obj in
                    NavigationLink(destination: DetailView(obj: obj)) {
                        RowView(obj: obj)
                    }
                }.onDelete(perform: delete)
            }
            .listStyle(InsetListStyle())
            .padding()
            .sheet(isPresented: $showSheet, content: {
                AddNewSheet()
            })
            .navigationBarItems(
                leading: Text("Core Data")
                    .font(.largeTitle),
                trailing: Image(systemName: "plus")
                    .onTapGesture {
                        showSheet = true
            })
        }
    }
    func delete(indexSet: IndexSet) {
        for index in indexSet {
            let obj = datas[index]
            moc.delete(obj)
            try? moc.save()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
