//
//  UnitPickerWithButton.swift
//
//  Created on 06/03/2020.
//  Copyright © 2020 WildAid. All rights reserved.
//

import SwiftUI

struct UnitPickerWithButton: View {
    typealias UnitSpecification = CatchViewModel.UnitSpecification

    var selectButtonTitle: String = "Select"
    var selectButtonClicked: ((UnitSpecification) -> Void)?
    @State private var unit = UnitSpecification.allCases.first ?? .notSelected
    var options = UnitSpecification.allCases

    private enum Dimensions {
        static let buttonHeight: CGFloat = 54.0
    }

    var body: some View {
        VStack {
            RectangleButton(title: selectButtonTitle, action: { self.selectButtonClicked?(self.unit) })
            Picker("", selection: textBinding) {
                ForEach(options.map {$0.rawValue}) { option in
                    Text(LocalizedStringKey(option))
                }
            }
                .labelsHidden()
        }
    }

    private var textBinding: Binding<String> {
        Binding<String>(
            get: { self.unit.rawValue},
            set: { self.unit = UnitSpecification(rawValue: $0) ?? .notSelected }
        )
    }

}

struct UnitPickerWithButton_Previews: PreviewProvider {
    static var previews: some View {
        UnitPickerWithButton()
    }
}
