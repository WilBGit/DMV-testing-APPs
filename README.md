# DMV Test App

A multilingual SwiftUI practice app that helps learners prepare for a DMV knowledge test through short, repeatable quizzes. It is built around focused study sessions, visible progress, review of missed questions, and language support for a broad learner audience.

## Core experience

- Choose a quiz category from a simple home flow.
- Answer questions one at a time with immediate, low-friction navigation.
- Track progress across practice sessions.
- Review results and revisit questions that need more work.
- Change the app language without changing the study model.
- Keep the experience lightweight and usable offline from bundled question resources.

## Included languages

The repository includes localized resources for:

- English
- Arabic
- Spanish
- French
- Korean
- Russian
- Vietnamese
- Simplified Chinese

## Project structure

- `ContentView.swift` and `Views/` — the main navigation, home, category, quiz, results, review, and settings screens.
- `Models/Question.swift` and `Models/QuestionBank.swift` — question and category data structures.
- `Models/ProgressTracker.swift` — study progress and result tracking.
- `ViewModels/QuizViewModel.swift` — quiz state and answer flow.
- `ViewModels/LanguageManager.swift` — language selection and localization behavior.
- `Resources/` — localized strings for the supported languages.
- `DMVTestApp.xcodeproj/` — the native Xcode project.

## Getting started

1. Open `DMVTestApp.xcodeproj` in Xcode.
2. Select an iPhone simulator or connected test device.
3. Build and run.
4. Exercise each category, result, review, settings, and language path.
5. Run the unit and UI test targets before distributing a build.

No API key or external account is required for the bundled practice experience.

## Product boundary

This is a study aid, not legal or official DMV guidance. Learners should use the current official handbook and local DMV materials for final preparation. Question content, localization, accessibility, and state-specific coverage should be reviewed before a public release.

## Project status

The core SwiftUI practice flow and multilingual resource structure are present. Production readiness still requires a content audit, accessibility pass, device testing, localization review, privacy review, and a release checklist for the target jurisdiction.
