<p align="center">
  <img src="http://i.imgur.com/XZFkFei.png" alt="NxEnabled"/>
</p>

[![Build Status](https://travis-ci.org/Otbivnoe/NxEnabled.svg?branch=master)](https://travis-ci.org/Otbivnoe/NxEnabled)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](#carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/NxEnabled.svg)](#cocoapods) 
![Swift 3.0.x](https://img.shields.io/badge/Swift-3.0.x-orange.svg) 
![platforms](https://img.shields.io/badge/platforms-iOS-lightgrey.svg) 

## What is NxEnabled?

It's a fairly common case, when the `enabled` state of button depends on some textable elements such as TextView, TextField. So this library allows the simplest way to achive this purpose with only few lines of code.

## Getting started :rocket:

Typical login screen with short, beautiful validation code:

```swift
loginButton.isEnabled(by: usernameTextField, passwordTextField) { texts in
    texts[0].characters.count > 5 && texts[1].characters.count > 5
}
```

you can also combine together `UITextView` with `UITextField`'s:

```swift
signUpButton.isEnabled(by: firstnameTextField, lastnameTextField, bioTextView) { texts in
    return /* validation value */
}
```

*So there is also oportunity to add not UI element:*


* Implement `Textable` protocol
  
* Be a successor from `NSObject`
  
* Not forget about `dynamic` label for property
  
* Done.
  
```swift
class Object: NSObject, Textable {
    dynamic var value: String?
    var textKey: String {
        return "value"
    }
}
```

### NOTE:
**One important case is that you should clear button's bag. It removes all observers from textable elements. Usually it needs to do in `deinit` method.**

```swift
deinit {
    signUpButton.clearBag()
}
```

### **Now library allows to add textable elements up to six. :clap:**


## Installation :fire:

#### CocoaPods

To integrate NxEnabled, simply add the following line to your `Podfile`:

```ruby
pod "NxEnabled"
```

#### Carthage

To integrate NxEnabled into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "Otbivnoe/NxEnabled"
```

Run `carthage update` to build the framework and drag the built `NxEnabled.framework` into your Xcode project.

## Author :muscle:

Nikita Ermolenko, gnod94@gmail.com

## License :exclamation:

NxEnabled is available under the MIT license. See the LICENSE file for more info.
