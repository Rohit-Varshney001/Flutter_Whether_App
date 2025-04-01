
# Flutter Weather App

A simple Flutter weather app that displays real-time weather information based on user input, using data from a weather API. The app includes various features like search functionality, favorite cities, dark mode, and animations.

## Features
- **Real-Time Weather Data:** Fetches current weather data including temperature, humidity, and conditions.
- **Search Bar:** Users can search for any city to view its weather.
- **State Management:** Utilizes Provider for state management.
- **Additional Features:**
  - Dark Mode
  - Caching for improved performance
  - Favorite cities feature
  - Smooth animations for UI transitions
  
## Setup Instructions

### Prerequisites
- Flutter installed on your machine. You can follow the official [Flutter installation guide](https://flutter.dev/docs/get-started/install).
- An active API key for the weather service you're using (e.g., OpenWeatherMap).

### Steps to Run the App

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/weather-app.git
   ```

2. **Navigate to the project directory:**
   ```bash
   cd weather-app
   ```

3. **Install the dependencies:**
   ```bash
   flutter pub get
   ```

4. **Add your API key:**
   - Open `lib/services/weather_api_service.dart` and `lib/services/image_service.dart` 
   - Add your API key in the relevant places.

5. **Run the app:**
   ```bash
   flutter run
   ```

The app should now be running on your emulator or physical device.

## Approach

This app fetches weather data from an external weather API. Upon launching, it allows users to search for any city, displaying real-time data like temperature, humidity, and weather conditions. 

**State Management:**
- I used Provider to manage the app's state. The app is designed to be responsive and efficient, updating the UI when new data is fetched.

**UI/UX:**
- I focused on keeping the user interface clean and intuitive. Smooth animations enhance the user experience, making the app feel more responsive.
- The app supports dark mode for better usability in low-light conditions.

**Caching:**
- Weather data is cached for a short period to minimize API calls and improve performance.

## Additional Features
- **Dark Mode:** The app supports dark mode for a more comfortable viewing experience at night.

## Contributing
If you would like to contribute to this project, feel free to fork the repository and submit a pull request with your changes.
