import SwiftUI

struct HomeView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @StateObject private var progressTracker = ProgressTracker()
    @State private var showFullTest = false
    @State private var showCategoryView = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    VStack(spacing: 8) {
                        Image(systemName: "car.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(.blue)

                        Text(languageManager.localizedString("app_title"))
                            .font(.title.bold())
                            .multilineTextAlignment(.center)

                        Text(languageManager.localizedString("welcome_message"))
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding(.top, 20)

                    // Full Practice Test Button
                    NavigationLink {
                        QuizView(category: nil, questionCount: 46)
                            .environmentObject(languageManager)
                    } label: {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(languageManager.localizedString("start_full_test"))
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(languageManager.localizedString("full_test_description"))
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.8))
                            }
                            Spacer()
                            Image(systemName: "play.circle.fill")
                                .font(.title)
                                .foregroundStyle(.white)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(LinearGradient(
                                    colors: [.blue, .blue.opacity(0.8)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ))
                        )
                    }
                    .padding(.horizontal)

                    // Study by Category
                    VStack(alignment: .leading, spacing: 12) {
                        Text(languageManager.localizedString("study_by_category"))
                            .font(.title3.bold())
                            .padding(.horizontal)

                        Text(languageManager.localizedString("category_description"))
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .padding(.horizontal)

                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 12) {
                            ForEach(QuestionCategory.allCases) { category in
                                NavigationLink {
                                    QuizView(
                                        category: category,
                                        questionCount: QuestionBank.shared.questionCount(for: category)
                                    )
                                    .environmentObject(languageManager)
                                } label: {
                                    CategoryCard(
                                        category: category,
                                        questionCount: QuestionBank.shared.questionCount(for: category)
                                    )
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Progress Stats
                    if progressTracker.questionsAnswered > 0 {
                        VStack(alignment: .leading, spacing: 12) {
                            Text(languageManager.localizedString("stats_title"))
                                .font(.title3.bold())
                                .padding(.horizontal)

                            HStack(spacing: 16) {
                                StatCard(
                                    title: languageManager.localizedString("total_questions"),
                                    value: "\(progressTracker.questionsAnswered)",
                                    icon: "list.number",
                                    color: .blue
                                )
                                StatCard(
                                    title: languageManager.localizedString("overall_accuracy"),
                                    value: String(format: "%.0f%%", progressTracker.overallAccuracy),
                                    icon: "target",
                                    color: progressTracker.overallAccuracy >= 80 ? .green : .orange
                                )
                            }
                            .padding(.horizontal)
                        }
                    }

                    Spacer(minLength: 20)
                }
            }
            .environment(\.layoutDirection, languageManager.layoutDirection)
        }
    }
}

struct CategoryCard: View {
    @EnvironmentObject var languageManager: LanguageManager
    let category: QuestionCategory
    let questionCount: Int

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: category.iconName)
                .font(.title2)
                .foregroundStyle(.blue)

            Text(category.localizedName(languageManager))
                .font(.caption.bold())
                .foregroundStyle(.primary)
                .multilineTextAlignment(.center)
                .lineLimit(2)

            Text("\(questionCount) \(languageManager.localizedString("questions"))")
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, minHeight: 100)
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemGray6))
        )
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)
            Text(value)
                .font(.title2.bold())
                .foregroundStyle(color)
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemGray6))
        )
    }
}
