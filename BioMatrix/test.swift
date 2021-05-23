//File test.swift in Project BioMatrix: Created by Eesha Jain on 5/22/21

import SwiftUI

struct test: View {
    var body: some View {
        VStack {
            ForEach(LocalStorage.questionsValue) { question in
                Text("Question")
            }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
