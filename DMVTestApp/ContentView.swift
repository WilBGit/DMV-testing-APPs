import SwiftUI

struct ContentView: View {
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label(languageManager.localizedString("tab_home"), systemImage: "house.fill")
                }

            SettingsView()
                .tabItem {
                    Label(languageManager.localizedString("tab_settings"), systemImage: "gearshape.fill")
                }
        }
        .tint(.blue)
    }
}
