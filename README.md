# NotPaid - SwiftUI

## Client did not pay?

Add opacity to any SwiftUI View and decrease it every day until their app completely fades away. Set a due date and customize the number of days you offer them until the app is fully vanished.

## Requirements

Requires iOS 13.0+

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. 

Once you have your Swift package set up, adding NotPaid as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/vfrascello/not-paid-ios.git")
]
```

### Manually

If you prefer not to use any of the Swift pacakage manager, you can simply copy `NotPaid.swift` into your project.

## Usage

1. Import the package. 
```
import NotPaid
```

2. Create a `NotPaidSettings` object, passing in a `dueDate` and a `deadline` (default is 60 days) in your `App` file or root `View`. 

```
let settings = NotPaidSettings(dueDate: yourDueDate, deadline: yourDeadline)
```
where yourDueDate is a `Date` object and `yourDeadline` is an `Int` representing the number of days after due date until zero opacity.

3. Use the `.environmentObject(_ object:)` modifier to apply your settings to the environment. 

```
var body: some Scene {
    WindowGroup {
        ContentView().environmentObject(settings)
    }
}
```

4. Apply `NotPaid` using `.notPaid()` on any `View`.  `NotPaid` will modify the `opacity` to the appropriate level. 

```
VStack{
    Text("Hello, world!")
    Image(systemName: "person.fill").frame(width: 100, height: 100, alignment: .center)
}
.notPaid()
```
 
## Acknowledgements 

Based on the original Javascript implementation by [@kleampa](https://github.com/kleampa/not-paid).

A Wordpress plugin is also available [here](https://github.com/SurfEdge/not-paid-wp).

There's also an Android version available [here](https://github.com/theapache64/faded).

There's also an Windows Forms version available [here](https://github.com/g-otn/winforms-not-paid).

Flutter version available [here](https://github.com/krishnakumarcn/faded).

## Author

Inspired from twitter (@riklomas) Made by Vincent Frascello ([@vfrascello](https://github.com/vfrascello)), USA
