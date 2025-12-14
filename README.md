# Quiz App (Interview Prep)

A **mini interview-preparation mobile app** built with **Flutter**, following **MVVM architecture**, **BLoC state management**, and **GetIt dependency injection**.  

The app allows users to view interview questions, submit answers, store attempts locally, and view history. It also includes **daily local notifications**.

---

## Features

### 1. Authentication & Onboarding
- Dummy login screen with **random 32-digit hexadecimal token** generation.  
- Token stored securely using **Flutter Secure Storage**.  
- Splash screen with a **creative banner** for onboarding.  

### 2. Home Screen
- Displays **interview questions** (hardcoded JSON or local Hive DB).  
- Pagination: **10 questions per page** with **Next/Previous buttons** and page indicator.  
- Custom **AppBar** with branding.  
- Clicking a question navigates to **Question Detail / Submit Answer screen**.

### 3. Question Detail / Submit Answer Screen
- Shows question text, **tags** (role, difficulty).  
- Users can type and submit answers.  
- Answers stored in **Hive** database with **submission timestamp**.  
- **Basic scoring logic** implemented to rate answers 1–5 (keyword match or length-based).  

### 4. Attempts History Screen
- Displays all submitted answers with **score and submission time**.  
- Accessible from **Home screen** via a **Floating Action Button**.  

### 5. Notifications
- Uses **Flutter Local Notifications**.  
- Triggers **daily reminder at 9:00 AM** for “Daily Interview Question”.  

---

## Technical Details

### Architecture
- **MVVM (Model-View-ViewModel)** pattern applied.  
- Clean separation of **Data / Domain / Presentation layers**.  
- **BLoC** for state management.  
- **GetIt** for dependency injection.  

### Data Persistence
- **Hive** for storing submitted answers and local questions.  
- **Flutter Secure Storage** for storing auth token.  

### Packages / Libraries
- `flutter_bloc` – State management  
- `get_it` – Dependency injection  
- `hive` + `hive_flutter` – Local storage  
- `flutter_secure_storage` – Secure token storage  
- `flutter_local_notifications` – Local notifications  
- `dio` – API calls (if needed in future)  
- `flutter_animate` – UI animations  
- `timezone` – For local notifications timing  
- `equatable` – For clean BLoC state comparisons  
- `intl` – Timestamp formatting  

---

## Folder Structure

