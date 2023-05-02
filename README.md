#  Feelings Journal Template
Part of the C4 Coding Path.

## Activity Description
* You're going to be making an app where users can track how they are feeling at a given moment.
* Clone this repository, and checkout the main branch. The project organization is provided for you.
* You'll complete the prioritized user stories below (start at the top). If you don't know how to complete a user story, there are hints inside the card.

## Guiding Resources
Swift Data Modeling
https://medium.com/@jlwarfield/constructing-a-swift-data-model-for-dummies-5b79fbd22a2a

SwiftUI Picker
https://developer.apple.com/documentation/swiftui/picker

SwiftUI Sheet
https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-new-view-using-sheets

SwiftUI EnvironmentObject
https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-environmentobject-to-share-data-between-views

SwiftUI ForEach Loop
https://developer.apple.com/documentation/swiftui/foreach

Swift Computed Properties
https://docs.swift.org/swift-book/LanguageGuide/Properties.html

Writing Data to Documents Directory
https://www.hackingwithswift.com/books/ios-swiftui/writing-data-to-the-documents-directory

## Tasks
### As a user, I want to be able to add an entry to my journal, so I can track my current feeling.
**Acceptance Criteria:**
* ContentView has a plus button in the trailing part of the navigation bar.
* Tapping the plus button displays AddEntryView as a sheet.
* Users can use a picker on AddEntryView to select a Feeling.
* AddEntryView has an add button.
* Tapping "add" adds a new Entry to the user's list of entries, and closes the sheet.


**Step 1: Entry Model Properties**
Hint:
* In order to store entries that are useful for our user, we need to let our Entry model store a Date and Feeling.
Solution:
* Checkout the entryModelProperties branch.

**Step 2: Picking a Feeling in AddEntryView**
Hint:
* In order for our user to add an entry, we need to have a way for our user to pick a Feeling in our AddEntryView.
* To list all feelings, we can conform Feeling to the CaseIterable protocol OR we can just list all of the feelings as picker options.
Solution:
* Checkout the addEntryView branch.

**Step 3: Presenting a Sheet**
Hint:
* We can show our AddEntryView, when our user presses a ToolbarItem plus button (implement this in the feelingsToolbarItem computed property), by showing a sheet.
Solution:
* Checkout the showAddEntrySheet branch.

**Step 4: Connecting our View Model**
Hint:
* In our app file, make an instance of ViewModel as a @StateObject, and modify our ContentView with .enviromentObject(viewModel) to inject our view model into the environment.
* Now, other views can access our viewModel with an @EnvironmentObject property.
Solution:
* Checkout the connectViewModel branch.

**Step 5: Calling our addEntry() function**
Hint:
* In AddEntryView, when the user is done selecting a Feeling, call addEntry(for feeling: Feeling) and dismiss the sheet.
* In the addEntry function of our ViewModel, append a new entry to the entries array, storing the current date.
Solution:
* Checkout the callAddEntry branch.


### As a user, I want to see a list of my past entries with relevant emojis, so I can remember what I was feeling.
**Acceptance Criteria:**
* ContentView shows a list of the users' entries, with the associated feeling, date, and emoji.
* The Feeling enum has a computed property that returns an emoji for each Feeling.


Step 1: List Entries in ContentView
Hint:
* For each entry in our entries array, show the user a list item with that entry's feeling and date.
Solution:
* Checkout the listEntries branch.

Step 2: Add Emojis to Feeling
Hint:
* In our Feeling enum, add a computed property that returns an emoji corresponding with each Feeling.
* Then, update our UI to show these emojis in our list of past entries.
Solution:
* Checkout the feelingsEmoji branch.


### As a user, I would like my entries to persist when I close the app, so that this journal will be useful over time.
**Acceptance Criteria:**
* When a user adds a new entry, entries are saved to the app's documents directory.
* When the app is opened, entries are loaded from the app's documents directory.


Step 1: Save Entries
* Conform Entry and Feeling to the Codable protocol.
* Save entries to the app's documents directory:
```Swift
do {
 let url = try archiveURL()
 print("Saving entries to \(url)")

 let encoder = PropertyListEncoder()

 let data = try encoder.encode(entries)
 try data.write(to: url)
 print("Saved all of the entries")
} catch let encodingError {
 print("Could not save any of the entries: \(encodingError)")
}
```
* In our addEntry function, call the save() function to save.
Solution: Checkout the saveEntries branch.

Step 2: Load Entries
* Load entries from the app's documents directory:
```Swift
do {
    let url = try archiveURL()
    let data = try Data(contentsOf: url)
    let unarchiver = PropertyListDecoder()
    let loadedEntries = try unarchiver.decode([Entry].self, from: data)
    entries = loadedEntries
} catch CocoaError.fileReadNoSuchFile {
    //ignore error
} catch let decodingError {
    print("Could not read saved entries: \(decodingError)")
}
```
* Add an initializer to our ViewModel that loads the entries.
Solution: Checkout the loadEntries branch.


### Extra 1: As a user, I would like the list of my past feelings to have the most recent feelings on top, so I'm not living in the past.
**Acceptance Criteria:**
* ContentView's list of entries shows the most recent feelings at the top.


### Extra 2: As a user, I would like to be able to delete entries, in case I make a mistake.
**Acceptance Criteria:**
* When user swipes left on a row in ContentView, a destructive swipe action is shown with a trash icon.
* When user taps the swipe action delete button, the ViewModel removes the selected entry from the entries array.
* When an entry is removed from the entries array, the ViewModel saves the data to the app's documents directory.


### Extra 3: As a user, I would like to be able to view and update entries, in case I make a mistake.
**Acceptance Criteria:**
* Rows in ContentView are links to an entry detail view.
* In the entry detail view, users can view the date and emoji of the entry, and use a picker to change the mood.


### Extra 4: As a user, I would like to see a Swift Chart of my feelings for the past week, so I can discern trends.


### Extra 5 (Design Time): How would you make this app more personalized or differentiated? What specific feelings or other features would you include?
