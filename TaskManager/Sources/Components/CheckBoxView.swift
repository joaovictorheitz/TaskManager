//
//  CheckBoxView.swift
//  TaskManager
//
//  Created by João Victor de Souza Guedes on 08/07/24.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        let borderColor = Color(cgColor: CGColor(red: 232, green: 232, blue: 232, alpha: 1))
        
        ZStack {
            Rectangle()
                .frame(width: 21, height: 21)
                .clipShape(.buttonBorder)
                .foregroundStyle(isChecked ? .black : borderColor)
                .overlay {
                    Rectangle()
                        .frame(width: 20, height: 20)
                        .clipShape(.buttonBorder)
                        .foregroundStyle(isChecked ? .black : .clear)
                }
            
            TaskManagerAsset.Assets.checkImage.swiftUIImage
                .resizable()
                .frame(width: 13.99, height: 10)
                .foregroundStyle(.yellow)
        }
    }
}

#Preview {
    ZStack {
        VStack {
//            CheckBoxView(isChecked: true)
//            CheckBoxView(isChecked: false)
        }
    }
    .frame(width: 100, height: 100)
    .background(.blue)
}
