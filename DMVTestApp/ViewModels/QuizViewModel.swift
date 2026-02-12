import Foundation
import SwiftUI

class QuizViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var currentQuestionIndex: Int = 0
    @Published var selectedAnswerIndex: Int? = nil
    @Published var hasSubmitted: Bool = false
    @Published var answeredQuestions: [AnsweredQuestion] = []
    @Published var quizComplete: Bool = false
    @Published var result: QuizResult? = nil

    private let category: QuestionCategory?
    private let questionCount: Int

    init(category: QuestionCategory? = nil, questionCount: Int = 46) {
        self.category = category
        self.questionCount = questionCount
    }

    var currentQuestion: Question? {
        guard currentQuestionIndex < questions.count else { return nil }
        return questions[currentQuestionIndex]
    }

    var correctAnswerCount: Int {
        answeredQuestions.filter { $0.isCorrect }.count
    }

    var progressPercentage: Double {
        guard !questions.isEmpty else { return 0 }
        return Double(currentQuestionIndex + 1) / Double(questions.count)
    }

    func loadQuestions() {
        if let category = category {
            questions = Array(QuestionBank.shared.questions(for: category).shuffled().prefix(questionCount))
        } else {
            questions = Array(QuestionBank.shared.allQuestions.shuffled().prefix(questionCount))
        }
        currentQuestionIndex = 0
        selectedAnswerIndex = nil
        hasSubmitted = false
        answeredQuestions = []
        quizComplete = false
        result = nil
    }

    func selectAnswer(_ index: Int) {
        guard !hasSubmitted else { return }
        selectedAnswerIndex = index
    }

    func submitAnswer() {
        guard let selectedIndex = selectedAnswerIndex,
              let question = currentQuestion else { return }

        hasSubmitted = true
        let isCorrect = selectedIndex == question.correctAnswerIndex
        let answered = AnsweredQuestion(
            question: question,
            selectedAnswerIndex: selectedIndex,
            isCorrect: isCorrect
        )
        answeredQuestions.append(answered)
    }

    func nextQuestion() {
        if currentQuestionIndex + 1 < questions.count {
            currentQuestionIndex += 1
            selectedAnswerIndex = nil
            hasSubmitted = false
        } else {
            finishQuiz()
        }
    }

    func finishQuiz() {
        quizComplete = true
        result = QuizResult(
            category: category,
            totalQuestions: questions.count,
            correctAnswers: correctAnswerCount,
            date: Date(),
            answeredQuestions: answeredQuestions
        )
    }
}
