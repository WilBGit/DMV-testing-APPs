import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @StateObject private var progressTracker = ProgressTracker()
    @State private var showResetAlert = false

    var body: some View {
        NavigationStack {
            List {
                // Language Section
                Section {
                    ForEach(LanguageManager.supportedLanguages, id: \.code) { lang in
                        Button(action: {
                            withAnimation {
                                languageManager.currentLanguage = lang.code
                            }
                        }) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(lang.nativeName)
                                        .font(.body)
                                        .foregroundStyle(.primary)
                                    Text(lang.name)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                if languageManager.currentLanguage == lang.code {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(.blue)
                                }
                            }
                        }
                    }
                } header: {
                    Label(languageManager.localizedString("select_language"), systemImage: "globe")
                }

                // Progress Section
                Section {
                    HStack {
                        Text(languageManager.localizedString("total_questions"))
                        Spacer()
                        Text("\(progressTracker.questionsAnswered)")
                            .foregroundStyle(.secondary)
                    }
                    HStack {
                        Text(languageManager.localizedString("overall_accuracy"))
                        Spacer()
                        Text(String(format: "%.1f%%", progressTracker.overallAccuracy))
                            .foregroundStyle(.secondary)
                    }
                } header: {
                    Label(languageManager.localizedString("progress"), systemImage: "chart.bar.fill")
                }

                // Reset Section
                Section {
                    Button(role: .destructive) {
                        showResetAlert = true
                    } label: {
                        HStack {
                            Image(systemName: "trash")
                            Text(languageManager.localizedString("reset_progress"))
                        }
                    }
                }
            }
            .navigationTitle(languageManager.localizedString("settings"))
            .alert(languageManager.localizedString("reset_progress"), isPresented: $showResetAlert) {
                Button(languageManager.localizedString("cancel"), role: .cancel) { }
                Button(languageManager.localizedString("reset"), role: .destructive) {
                    progressTracker.resetProgress()
                }
            } message: {
                Text(languageManager.localizedString("reset_confirm"))
            }
        }
        .environment(\.layoutDirection, languageManager.layoutDirection)
    }
}
