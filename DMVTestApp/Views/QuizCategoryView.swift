import SwiftUI

struct QuizCategoryView: View {
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        List {
            ForEach(QuestionCategory.allCases) { category in
                NavigationLink {
                    QuizView(
                        category: category,
                        questionCount: QuestionBank.shared.questionCount(for: category)
                    )
                    .environmentObject(languageManager)
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: category.iconName)
                            .font(.title2)
                            .foregroundStyle(.blue)
                            .frame(width: 40)

                        VStack(alignment: .leading) {
                            Text(category.localizedName(languageManager))
                                .font(.body.bold())
                            Text("\(QuestionBank.shared.questionCount(for: category)) \(languageManager.localizedString("questions"))")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .navigationTitle(languageManager.localizedString("select_category"))
    }
}
