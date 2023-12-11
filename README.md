# SwiftUItility

## Environments Example
```swift
struct ContentView: View {
    
    @Environment(\.safeAreaInsets) var safeAreaInsets
    @Environment(\.spinner) var spinner
    @Environment(\.toast) var toast
    @Environment(\.alert) var alert
    
    var body: some View {
        // SafeAreaInsets
        Text("SafeAreaInsets")
            .padding(safeAreaInsets)
        
        // Spinner
        Button("Start Spinner") {
            spinner.start()
        }
        Button("Stop Spinner") {
            spinner.stop()
        }
        
        // Toast
        Button("Show Toast") {
            toast.show("Hello World")
        }
        
        // Alert
        Button("Show Alert") {
            let parameter = AlertParameter(
                message: "Warning",
                buttons: [
                    .init(title: "cancel", style: .cancel),
                    .init(title: "default", style: .default)
                ]
            )
            alert.show(parameter)
        }
    }
}
```

## TextField Sync Example
```swift
struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @State var text = ""
    @FocusState var isFocused
    
    var body: some View {
        
        TextField("Placeholder", text: $text)
            .sync($viewModel.isFocused, with: $isFocused)
    }
}

class ContentViewModel: ObservableObject {
    
    @Published var isFocused = false
}
```


