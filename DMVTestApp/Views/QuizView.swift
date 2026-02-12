import SwiftUI

struct QuizView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @StateObject private var viewModel: QuizViewModel
    @StateObject private var progressTracker = ProgressTracker()
    @Environment(\.dismiss) private var dismiss

    init(category: QuestionCategory?, questionCount: Int) {
        _viewModel = StateObject(wrappedValue: QuizViewModel(
            category: category,
            questionCount: questionCount
        ))
    }

    var body: some View {
        Group {
            if viewModel.quizComplete, let result = viewModel.result {
                ResultsView(result: result, onTryAgain: {
                    viewModel.loadQuestions()
                }, onGoHome: {
                    dismiss()
                })
                .environmentObject(languageManager)
            } else if let question = viewModel.currentQuestion {
                questionView(question)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.loadQuestions()
        }
        .environment(\.layoutDirection, languageManager.layoutDirection)
    }

    @ViewBuilder
    private func questionView(_ question: Question) -> some View {
        VStack(spacing: 0) {
            // Progress bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color(.systemGray5))
                        .frame(height: 4)

                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: geometry.size.width * viewModel.progressPercentage, height: 4)
                        .animation(.easeInOut, value: viewModel.progressPercentage)
                }
            }
            .frame(height: 4)

            ScrollView {
                VStack(spacing: 20) {
                    // Question counter
                    HStack {
                        Text("\(languageManager.localizedString("question")) \(viewModel.currentQuestionIndex + 1) \(languageManager.localizedString("of")) \(viewModel.questions.count)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("\(viewModel.correctAnswerCount)/\(viewModel.answeredQuestions.count)")
                            .font(.subheadline.bold())
                            .foregroundStyle(.green)
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)

                    // Question text
                    Text(question.text(for: languageManager.currentLanguage))
                        .font(.title3.bold())
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)

                    // Answer options
                    VStack(spacing: 12) {
                        let answers = question.answers(for: languageManager.currentLanguage)
                        ForEach(answers.indices, id: \.self) { index in
                            AnswerButton(
                                text: answers[index],
                                index: index,
                                isSelected: viewModel.selectedAnswerIndex == index,
                                isCorrect: index == question.correctAnswerIndex,
                                hasSubmitted: viewModel.hasSubmitted,
                                action: {
                                    viewModel.selectAnswer(index)
                                }
                            )
                        }
                    }
                    .padding(.horizontal)

                    // Explanation (shown after submission)
                    if viewModel.hasSubmitted {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image(systemName: viewModel.selectedAnswerIndex == question.correctAnswerIndex ? "checkmark.circle.fill" : "xmark.circle.fill")
                                    .foregroundStyle(viewModel.selectedAnswerIndex == question.correctAnswerIndex ? .green : .red)
                                Text(viewModel.selectedAnswerIndex == question.correctAnswerIndex
                                     ? languageManager.localizedString("correct")
                                     : languageManager.localizedString("incorrect"))
                                    .font(.headline)
                                    .foregroundStyle(viewModel.selectedAnswerIndex == question.correctAnswerIndex ? .green : .red)
                            }

                            Text(question.explanation(for: languageManager.currentLanguage))
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.systemGray6))
                        )
                        .padding(.horizontal)
                    }

                    Spacer(minLength: 80)
                }
            }

            // Bottom button
            VStack {
                if !viewModel.hasSubmitted {
                    Button(action: {
                        withAnimation {
                            viewModel.submitAnswer()
                        }
                    }) {
                        Text(languageManager.localizedString("submit"))
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(viewModel.selectedAnswerIndex != nil ? Color.blue : Color.gray)
                            )
                    }
                    .disabled(viewModel.selectedAnswerIndex == nil)
                } else {
                    Button(action: {
                        withAnimation {
                            viewModel.nextQuestion()
                        }
                    }) {
                        Text(viewModel.currentQuestionIndex + 1 < viewModel.questions.count
                             ? languageManager.localizedString("next")
                             : languageManager.localizedString("finish"))
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.blue)
                            )
                    }
                }
            }
            .padding()
            .background(Color(.systemBackground))
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AnswerButton: View {
    let text: String
    let index: Int
    let isSelected: Bool
    let isCorrect: Bool
    let hasSubmitted: Bool
    let action: () -> Void

    private var backgroundColor: Color {
        if hasSubmitted {
            if isCorrect {
                return .green.opacity(0.15)
            } else if isSelected {
                return .red.opacity(0.15)
            }
        } else if isSelected {
            return .blue.opacity(0.15)
        }
        return Color(.systemGray6)
    }

    private var borderColor: Color {
        if hasSubmitted {
            if isCorrect {
                return .green
            } else if isSelected {
                return .red
            }
        } else if isSelected {
            return .blue
        }
        return .clear
    }

    var body: some View {
        Button(action: action) {
            HStack {
                Text(["A", "B", "C", "D"][index])
                    .font(.headline)
                    .foregroundStyle(isSelected ? .blue : .secondary)
                    .frame(width: 32, height: 32)
                    .background(Circle().fill(Color(.systemBackground)))

                Text(text)
                    .font(.body)
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.leading)

                Spacer()

                if hasSubmitted {
                    if isCorrect {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                    } else if isSelected {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.red)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(backgroundColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(borderColor, lineWidth: 2)
                    )
            )
        }
        .disabled(hasSubmitted)
    }
}
