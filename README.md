# Qizil Yarim Oy Mobile Application

This is the official mobile application for the "Qizil Yarim Oy" (Red Crescent) organization, built with Flutter. The application provides a platform for users to engage with courses, track their progress, and interact with the community.

## Features

- **User Authentication**: Secure login and registration system.
- **Course Catalog**: Browse and enroll in various courses.
- **Interactive Learning**: View course modules, lessons, and materials.
- **Video Player**: In-app video player for lesson content.
- **Community Feed (Lenta)**: A news feed for updates and articles.
- **Leaderboard**: Track user rankings and achievements.
- **User Profile**: Manage personal information and track course progress.
- **Notifications**: Receive important updates and reminders.
- **Multi-language Support**: Available in English, Russian, and Uzbek (Cyrillic and Latin).

## Project Structure

The project follows a clean, feature-driven architecture to promote scalability and maintainability.

```
.
├── android/
├── assets/
│   ├── fonts/
│   ├── icons/
│   ├── images/
│   └── translations/
├── build/
├── ios/
├── lib/
│   ├── application.dart
│   ├── main.dart
│   ├── config/
│   ├── core/
│   └── features/
│       ├── auth/
│       ├── course/
│       ├── home/
│       ├── leaderboard/
│       ├── lenta/
│       └── profile/
├── test/
├── web/
├── pubspec.yaml
└── README.md
```

### Directory Explanations

- **`android/` & `ios/`**: These directories contain the platform-specific project files for Android and iOS. Configuration for app icons, permissions, and build settings are managed here.

- **`assets/`**: Contains all the static assets used in the application.
  - `fonts/`: Custom fonts like 'Inter' are stored here.
  - `icons/`: SVG icons for UI elements.
  - `images/`: PNG and other image files.
  - `translations/`: JSON files for localization.

- **`lib/`**: The heart of the Flutter project, containing all the Dart code.
  - `main.dart`: The entry point of the application. It initializes the app and sets up dependency injection and localization.
  - `application.dart`: The root widget of the application, which sets up the main theme, router, and BLoC providers.
  - **`config/`**: Contains global application configuration.
    - `app_router.dart`: Defines all the navigation routes using `go_router`.
    - `app_colors.dart`, `text_styles.dart`: Defines the visual theme of the app.
    - `assets.dart`: Auto-generated file for easy access to asset paths.
    - `locales.dart`: Configuration for `easy_localization`.
  - **`core/`**: Holds shared code and utilities used across multiple features.
    - `di/`: Dependency injection setup using `get_it`.
    - `error/`: Custom failure and exception handling classes.
    - `network/`: Network client (`Dio`) and connectivity checker.
    - `database/`: Local database setup using `Isar`.
  - **`features/`**: The code is organized into feature-specific modules. Each feature folder typically contains:
    - `data/`: Repositories, data sources (API, local DB), and data models.
    - `domain/`: Business logic, entities, and use cases.
    - `presentation/`: UI layer, including screens, widgets, and BLoCs (State Management).

- **`test/`**: Contains unit and widget tests for the application.

- **`pubspec.yaml`**: The project's configuration file. It lists dependencies, assets, fonts, and other metadata.

### Blocs (State Management)

The application uses the `flutter_bloc` package to manage state. Each BLoC is responsible for handling a specific feature's business logic and UI state.

- **`AuthBloc`**: Manages user authentication. It handles login events, checks if a user is already signed in, and emits states like `Authenticated` or `Unauthenticated`.
- **`CourseBloc`**: Handles the state for the course feature. It is responsible for fetching lists of courses, course details, and managing user enrollment.
- **`HomeBloc`**: Manages the state for the main home screen. It fetches data required for the dashboard, such as notifications and user progress summaries.
- **`LeaderBloc`**: Manages the state for the leaderboard. It fetches and paginates the list of top users, handling loading states and tracking if the end of the list has been reached.
- **`NewsBloc`**: Manages the state for the community feed (Lenta). It fetches news articles, handles pagination, and processes user interactions like likes and comments.
- **`ProfileBloc`**: Handles the state for the user profile screen. It fetches and updates user information, as well as lists of the user's enrolled and completed courses.

### Models (Data Structures)

Models define the data structure for the application. They are used to parse data from API responses and represent objects within the app.

- **`UserModel`**: Represents the authenticated user. It holds all user-specific data returned from the API upon login, including personal details and access tokens.
- **`CourseModel`**: Represents a single course available in the app. It contains information like the course title, description, image, and enrollment status.
- **`LessonModel`**: Represents a single lesson within a course. It holds the lesson's title, content (like a video URL), and completion status.
- **`ModuleModel`**: Represents a module, which is a collection of lessons within a course. It structures the course content into logical sections.
- **`TaskModel`**: Represents a task or assignment associated with a lesson. It can include descriptions and downloadable files.
- **`NotificationModel`**: Represents a single notification message. It holds the notification's title, body, and read status.
- **`LeaderboardModel`**: Represents a single entry on the leaderboard, containing a user's name, avatar, and their productivity score.
- **`NewsModel`**: Represents a single article or post in the community feed. It includes the title, content, image, and engagement metrics like likes and comments.
- **`CommentModel`**: Represents a comment on a news post. It supports nested replies, allowing for threaded conversations.
- **`ProfileModel`**: Represents the data displayed on a user's profile page, aggregating information like their name, join date, and course statistics.
- **`MyCourseModel`**: Represents a course that a user is enrolled in. It specifically tracks the user's progress, such as the number of completed lessons.
- **`GuidelineModel`**: Represents a piece of instructional content or a guideline. It is used for displaying help articles or tutorials within the app.


## Getting Started

Follow these instructions to get the project up and running on your local machine.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.7.2 or higher)
- A code editor like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).

### Installation & Running

1.  **Clone the repository:**
    ```sh
    git clone <repository-url>
    cd qizilyarimoy
    ```

2.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

3.  **Run the code generator:**
    This project uses code generation for assets and other models. Run the following command to generate the necessary files:
    ```sh
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the application:**
    ```sh
    flutter run
    ```

## Key Dependencies

This project utilizes a modern stack of Flutter packages:

- **State Management**: `flutter_bloc` for predictable state management.
- **Navigation**: `go_router` for a declarative, URL-based routing solution.
- **Dependency Injection**: `get_it` for service locator-based DI.
- **Networking**: `dio` for powerful and flexible HTTP requests.
- **Local Storage**: `isar` for fast, full-text searchable, and easy-to-use database.
- **Localization**: `easy_localization` for internationalization.
- **UI Helpers**: `flutter_svg`, `cached_network_image`, `shimmer` for rich UI.
- **Video**: `video_player` and `chewie` for video playback.

For a full list, see the `pubspec.yaml` file.

## Contribution Guide

Contributions are welcome! If you'd like to contribute, please follow these steps:

1.  Fork the repository.
2.  Create a new branch (`git checkout -b feature/your-feature-name`).
3.  Make your changes and commit them (`git commit -m 'Add some feature'`).
4.  Push to the branch (`git push origin feature/your-feature-name`).
5.  Open a pull request.

Please ensure your code follows the existing style and that you've tested your changes.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
