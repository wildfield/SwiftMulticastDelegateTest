Swift Multicast Delegate Test Project

If you want to use class itself, it is MulticastDelegate.swift.

*Usage:*

```swift

@obj protocol Delegate: class {
	func eventHappened()
}

class Model {
	let delegates = MulticastDelegate<Delegate>()
	func callDelegates() { delegates.call { $0.eventHappened() } }
}

class MyDelegate: Delegate {
	func eventHappened() {
		println("Event!")
	}
}

func test() {
	let myDelegate = MyDelegate()
	let model = Model()
	model.delegates.add(myDelegate)
	model.callDelegates()
}

```

*Notes:*

You need to declare protocols as @obj.
You are responsible for responds to selector checks.
Suggestions are welcome