//
//  ComposeView.swift
//  SwiftUIMemo
//
//  Created by 송진학 on 6/28/24.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    
    var memo: Memo? = nil
    
    @Environment(\.dismiss) var dismiss
    
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content) // content에 바로 binding 가능
                    .padding()
                    .onAppear{
                        if let memo = memo {
                            content = memo.content
                        }
                    }
                
            }
            .navigationTitle(memo != nil ? "메모편집" : "새 메모")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        if let memo = memo {
                            store.update(memo: memo, content: content)
                        } else {
                            store.insert(memo: content)
                        }
                        
                        dismiss()
                    } label: {
                        Text("저장")
                    }
                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore())
    }
}
