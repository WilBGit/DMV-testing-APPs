import Foundation

struct Question: Identifiable, Codable {
    let id: String
    let category: QuestionCategory
    let answers: [String]
    let correctAnswerIndex: Int
    let explanation: String

    // Localized content keyed by language code
    let localizedText: [String: String]
    let localizedAnswers: [String: [String]]
    let localizedExplanation: [String: String]

    func text(for language: String) -> String {
        localizedText[language] ?? localizedText["en"] ?? ""
    }

    func answers(for language: String) -> [String] {
        localizedAnswers[language] ?? localizedAnswers["en"] ?? answers
    }

    func explanation(for language: String) -> String {
        localizedExplanation[language] ?? localizedExplanation["en"] ?? explanation
    }
}

enum QuestionCategory: String, Codable, CaseIterable, Identifiable {
    case roadSigns = "road_signs"
    case trafficLaws = "traffic_laws"
    case safetyRules = "safety_rules"
    case rightOfWay = "right_of_way"
    case parking = "parking"
    case alcohol = "alcohol"
    case general = "general"

    var id: String { rawValue }

    var iconName: String {
        switch self {
        case .roadSigns: return "signpost.right.fill"
        case .trafficLaws: return "book.fill"
        case .safetyRules: return "shield.checkered"
        case .rightOfWay: return "arrow.triangle.merge"
        case .parking: return "p.square.fill"
        case .alcohol: return "exclamationmark.triangle.fill"
        case .general: return "questionmark.circle.fill"
        }
    }

    func localizedName(_ languageManager: LanguageManager) -> String {
        languageManager.localizedString("category_\(rawValue)")
    }
}

struct QuizResult: Identifiable {
    let id = UUID()
    let category: QuestionCategory?
    let totalQuestions: Int
    let correctAnswers: Int
    let date: Date
    let answeredQuestions: [AnsweredQuestion]

    var percentage: Double {
        guard totalQuestions > 0 else { return 0 }
        return Double(correctAnswers) / Double(totalQuestions) * 100
    }

    var passed: Bool {
        percentage >= 80.0
    }
}

struct AnsweredQuestion: Identifiable {
    let id = UUID()
    let question: Question
    let selectedAnswerIndex: Int
    let isCorrect: Bool
}
