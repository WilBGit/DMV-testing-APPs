import Foundation

class ProgressTracker: ObservableObject {
    @Published var completedQuizzes: [QuizResult] = []
    @Published var questionsAnswered: Int = 0
    @Published var correctAnswers: Int = 0

    private let defaults = UserDefaults.standard

    init() {
        questionsAnswered = defaults.integer(forKey: "questionsAnswered")
        correctAnswers = defaults.integer(forKey: "correctAnswers")
    }

    func recordResult(_ result: QuizResult) {
        completedQuizzes.append(result)
        questionsAnswered += result.totalQuestions
        correctAnswers += result.correctAnswers
        defaults.set(questionsAnswered, forKey: "questionsAnswered")
        defaults.set(correctAnswers, forKey: "correctAnswers")
    }

    var overallAccuracy: Double {
        guard questionsAnswered > 0 else { return 0 }
        return Double(correctAnswers) / Double(questionsAnswered) * 100
    }

    func resetProgress() {
        completedQuizzes = []
        questionsAnswered = 0
        correctAnswers = 0
        defaults.set(0, forKey: "questionsAnswered")
        defaults.set(0, forKey: "correctAnswers")
    }
}
