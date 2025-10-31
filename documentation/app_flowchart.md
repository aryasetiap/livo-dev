# App Flowchart

flowchart TD
    Start[Start App] --> Splash[Splash Screen]
    Splash --> AuthCheck{Is User Authenticated?}
    AuthCheck -->|Yes| Home[Home Screen]
    AuthCheck -->|No| Login[Login Screen]
    Login -->|Login Successful| Home
    Login -->|Forgot Password| Forgot[Password Recovery Screen]
    Home --> FeatureList[Feature List Screen]
    FeatureList --> Detail[Item Detail Screen]
    Home --> Settings[Settings Screen]
    Settings -->|Save Changes| Home
    Home --> Logout[Logout]
    Logout --> Login

---
**Document Details**
- **Project ID**: ef377119-e2e3-4fbb-a932-546decd9944a
- **Document ID**: 01a4b8cd-6933-4716-a5cf-87f7f5a33230
- **Type**: custom
- **Custom Type**: app_flowchart
- **Status**: completed
- **Generated On**: 2025-10-31T16:41:05.338Z
- **Last Updated**: N/A
