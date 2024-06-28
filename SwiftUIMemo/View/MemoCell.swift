//
//  MemoCell.swift
//  SwiftUIMemo
//
//  Created by 송진학 on 6/28/24.
//

import SwiftUI

struct MemoCell: View {
    @ObservedObject var memo: Memo
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1)
                
            
            Text(memo.insertDate, style: .date)
                .font(.callout)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

#Preview {
    MemoCell(memo: Memo(content: "Test"))
}
