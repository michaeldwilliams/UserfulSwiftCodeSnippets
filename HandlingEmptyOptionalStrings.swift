/* Extension on Optional allowing user to declare an empty String as nil so we so we can use a simple gaurd statement to unwrap.
*/

extension Optional where Wrapped == String {
    var nilIfEmpty: String? {
        guard let strongSelf = self else {
            return nil
        }
        return strongSelf.isEmpty ? nil : strongSelf
    }
}


// Usage
guard let title = textField.text.nilIfEmpty else {
    // Alert: textField is empty!
    return
} // title String is now unwrapped, non-empty, and ready for use

// Use with higher order functions
let stuff = ["nate", "", nil, "loves", nil, "swift", ""]
let a = stuff.map { $0.nilIfEmpty }
print(a) // [Optional("nate"), nil, nil, Optional("loves"), nil, Optional("swift"), nil]
let b = stuff.flatMap { $0.nilIfEmpty }
print(b) // ["nate", "loves", "swift"]


/*
 Handling empty optional strings in Swift, Nathan Chan, https://medium.com/ios-os-x-development/handling-empty-optional-strings-in-swift-ba77ef627d74
 */
