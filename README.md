# SoberTask

### Steps to Run the App

#### 1. Clone the repository into your computer
```bash
git clone https://github.com/RedDragonJ/SoberTask.git

or

git clone git@github.com:RedDragonJ/SoberTask.git
```


#### 2. Navigate to the folder and open in Xcode

Open SoberTask.xcodeproj in Xcode.
Ensure you are using the latest version of Xcode compatible with iOS 17 or above.

#### 3. Build and Run

Select the desired simulator or connected device.
Press `Cmd + R` or click Run in Xcode to build and launch the app.

#### 4. Testing

Run unit tests by selecting Product > Test in Xcode or pressing `Cmd + U`.

### Focus Areas

- **Core Functionality**: Prioritized building a solid foundation for the app by implementing reliable task management features, including adding, updating, and filtering tasks with a clean and efficient architecture.

- **Basic UI with Smooth User Experience**: Designed a simple yet intuitive user interface, ensuring seamless navigation and interaction to deliver a polished experience for the MVP while leaving room for future UI enhancements.

- **Reusable Custom Components**: Developed reusable custom views, such as text fields and buttons, to maintain a consistent style across the app while simplifying future development and ensuring scalability.

- **Dependency Injection for Scalability**: Introduced dependency injection for key components like the model context and view models, making the app modular, testable, and ready for future feature expansions.

### Trade-offs and Decisions

- **Preview Handling**: Proper SwiftUI preview handling was not fully implemented to save time and focus on core functionality.

- **Error Granularity**: Centralized error handling and detailed logging were not implemented, opting instead for a simplified approach to ensure the main features were completed and tested.

- **Light/Dark Mode**: Limited optimization for light and dark modes to prioritize the development of core features.

- **No API Integration**: As this is a simple task manager app, no API or networking was included in the MVP to save time and focus on core functionality. Additional features, such as user login, data synchronization, or remote storage, can be added based on future requirements.

### External Code and Dependencies
None: All implementations, including error handling and caching, are custom-built.
