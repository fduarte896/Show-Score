//
//  PersonDetailView.swift
//  Show Score
//
//  Created by Felipe Duarte on 27/01/25.
//

import SwiftUI

struct PersonDetailView: View {
    var person : PersonModel
    var body: some View {
        Text(person.name).font(.title)
        Image(uiImage: person.viewImage)
            .resizable()
            .scaledToFit()
            .frame(height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        Text(person.knownForDepartment).font(.callout)
    }
}

#Preview {
    PersonDetailView(person: .personSample)
}
