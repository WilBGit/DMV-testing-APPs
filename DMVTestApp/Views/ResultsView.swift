import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var languageManager: LanguageManager
    let result: QuizResult
    let onTryAgain: () -> Void
    let onGoHome: () -> Void
    @State private var showReview = false

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Spacer(minLength: 20)

                // Result icon
                ZStack {
                    Circle()
                        .fill(result.passed ? Color.green.opacity(0.15) : Color.red.opacity(0.15))
                        .frame(width: 120, height: 120)

                    Image(systemName: result.passed ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(result.passed ? .green : .red)
                }

                // Pass/Fail text
                Text(result.passed
                     ? languageManager.localizedString("passed")
                     : languageManager.localizedString("failed"))
                    .font(.title.bold())
                    .foregroundStyle(result.passed ? .green : .red)

                // Score
                VStack(spacing: 8) {
                    Text(languageManager.localizedString("score"))
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    Text(String(format: "%.0f%%", result.percentage))
                        .font(.system(size: 48, weight: .bold))

                    Text("\(result.correctAnswers) / \(result.totalQuestions)")
                        .font(.title3)
                        .foregroundStyle(.secondary)

                    Text(languageManager.localizedString("passing_score"))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemGray6))
                )
                .padding(.horizontal)

                // Score breakdown bar
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: geometry.size.width * (result.percentage / 100))
                        Rectangle()
                            .fill(Color.red.opacity(0.3))
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                .frame(height: 8)
                .padding(.horizontal)

                // Action buttons
                VStack(spacing: 12) {
                    Button(action: { showReview = true }) {
                        HStack {
                            Image(systemName: "doc.text.magnifyingglass")
                            Text(languageManager.localizedString("review_answers"))
                        }
                        .font(.headline)
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                    }

                    Button(action: onTryAgain) {
                        HStack {
                            Image(systemName: "arrow.counterclockwise")
                            Text(languageManager.localizedString("try_again"))
                        }
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(Color.blue)
                        )
                    }

                    Button(action: onGoHome) {
                        HStack {
                            Image(systemName: "house.fill")
                            Text(languageManager.localizedString("go_home"))
                        }
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
                }
                .padding(.horizontal)

                Spacer(minLength: 20)
            }
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showReview) {
            ReviewView(answeredQuestions: result.answeredQuestions)
                .environmentObject(languageManager)
        }
    }
}
