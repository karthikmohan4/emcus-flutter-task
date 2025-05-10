## Emcus Task

## APK
[Download](app-arm64-v8a-release.apk)


## Demonstration link
  https://drive.google.com/file/d/1aqbM50mzsTF3CqperoK1Q6JK0xWYlgDd/view?usp=sharing


## ✅ Prerequisites

Make sure the following are installed on your system:

- Flutter SDK `3.29.0` 
- Firebase CLI → `npm install -g firebase-tools`
- Git
- Android Studio or VS Code

---

## 📦 1. Clone the Repository

```bash
git clone https://github.com/karthikmohan4/emcus-flutter-task.git
 
```
---

## 🔧 2. Install Dependencies

```bash
flutter pub get
```
---

## 🔥 3. Firebase Integration

### Step 1: Login to Firebase CLI

```bash
firebase login
```

### Step 2: Initialize Firebase in the project

```bash
firebase init
```

- Choose your Firebase project or create a new one.
- Enable Firebase Hosting and Flutter project support.
- This will generate a `firebase.json` file.

### Step 3: Add Firebase SDK to Flutter

- Add dependencies in `pubspec.yaml`:  
  ```yaml
  firebase_core: ^latest
  firebase_auth: ^latest
  cloud_firestore: ^latest
  ```
---

## ▶️ 4. Run the App

```bash
flutter run
```
---

## 🧑‍💻 Usage

### 🔐 Register
- Fill in the required fields: name, company name, email, password, confirm password etc.
- Tap **Register** to create your account.
- On success, you are navigated to the **Home Screen**.
- Field Validation

### 🔓 Login
- Enter registered email and password.
- Use the **"Remember Me"** checkbox to save session.
- Tap **Login** to access the app.
- Field Validation

### 🚪 Logout
- Accessible from any screen via the app’s menu icon.
- Tap **Logout** to securely end your session.

---

## Packages used

```
State Management :  flutter_bloc 
Local Storage  : flutter_secure_storage
Firebase  : firebase_core
Authentication  : firebase_auth
Database  : cloud_firestore
Nav bar  : persistent_bottom_nav_bar
Navigation/routing  : go_router
Font  : google_fonts
Testing responsiveness  : device_preview
```

---

