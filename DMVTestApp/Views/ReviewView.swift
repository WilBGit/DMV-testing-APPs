import SwiftUI

struct ReviewView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.dismiss) private var dismiss
    let answeredQuestions: [AnsweredQuestion]

    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(answeredQuestions.enumerated()), id: \.element.id) { index, answered in
                    VStack(alignment: .leading, spacing: 12) {
                        // Question number and status
                        HStack {
                            Text("\(languageManager.localizedString("question")) \(index + 1)")
                                .font(.caption.bold())
                                .foregroundStyle(.secondary)
                            Spacer()
                            Image(systemName: answered.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundStyle(answered.isCorrect ? .green : .red)
                        }

                        // Question text
                        Text(answered.question.text(for: languageManager.currentLanguage))
                            .font(.body.bold())

                        let answers = answered.question.answers(for: languageManager.currentLanguage)

                        // User's answer
                        if !answered.isCorrect {
                            HStack(alignment: .top) {
                                Text(languageManager.localizedString("your_answer"))
                                    .font(.caption.bold())
                                    .foregroundStyle(.red)
                                Text(answers[answered.selectedAnswerIndex])
                                    .font(.caption)
                                    .foregroundStyle(.red)
                            }
                        }

                        // Correct answer
                        HStack(alignment: .top) {
                            Text(languageManager.localizedString("correct_answer"))
                                .font(.caption.bold())
                                .foregroundStyle(.green)
                            Text(answers[answered.question.correctAnswerIndex])
                                .font(.caption)
                                .foregroundStyle(.green)
                        }

                        // Explanation
                        Text(answered.question.explanation(for: languageManager.currentLanguage))
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle(languageManager.localizedString("review_answers"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .environment(\.layoutDirection, languageManager.layoutDirection)
    }
}
