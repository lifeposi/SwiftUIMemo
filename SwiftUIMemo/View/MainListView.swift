//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by 송진학 on 6/28/24.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: MemoStore // 하나의 데이터를 여러 view에서 이용하고 싶을 때 사용
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.list) { memo in
                    NavigationLink {
                        DetailView(memo: memo)
                    } label: {
                        MemoCell(memo: memo)
                    }
                }
                .onDelete(perform: store.delete)
                }
                .listStyle(.plain)
                .navigationTitle("내 메모")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button {
                            
                        } label: {
                            Image(systemName: "trash")
                        }
                        .foregroundColor(.red)
                        
                        Button {
                            showComposer = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                
                }
                .sheet(isPresented: $showComposer) {
                    ComposeView()
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    MainListView()
        .environmentObject(MemoStore())
}


