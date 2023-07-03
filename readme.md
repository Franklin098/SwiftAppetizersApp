# Appetizers App

iOS app build using SwiftUI and the Model View ViewModel (MVVM) architecture.

- Handle API Requests (Success, Error, Loading states)
- Animations
- Dark Mode
- Tab Navigation
- Navigation Links
- Image Caching

## Technical Notes

In previous versions the App Delegate was the entry point to the program.

In newer iOS versions we have an App entry point. It is marked with the `@main` attribute. and it is a struct that conforms to the `App` protocol.

```swift
import SwiftUI

@main
struct SwiftAppetizersApp: App {
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
        }
    }
}


```

The App protocol represents a Scene that contains the content of the app. Remember that a Scene is a type of component that has multiple screens to display.

Usually the Body of a View returns a View. In this case the body of the App returns a Scene.

We have ViewBuilders and SceneBuilders.

Inside of our body we have a WindowGroup. Imagine we open multiple windows of our app, then every window will be initialized with the component that we defined in the WindowGroup.
