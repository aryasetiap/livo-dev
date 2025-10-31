# Frontend Guidelines Document

# Frontend Guidelines for livo-dev

This document outlines how to set up and work on the frontend of the livo-dev project. It covers architecture, design principles, styling, components, state handling, navigation, performance, testing, and a final summary. It’s written in plain language so anyone can follow along—even without a deep technical background.

## 1. Frontend Architecture

**Overview:**
We base our frontend on React and TypeScript. React helps us build reusable pieces of UI called “components.” TypeScript adds type checking on top of JavaScript, catching many common mistakes as we code.

**Key tools and libraries:**
- React (v18+) for building user interfaces
- TypeScript for safer, self-documenting code
- Webpack or Vite as our build tool and asset bundler
- Babel for JavaScript transformation and compatibility
- ESLint and Prettier for consistent code style

**Scalability & Maintainability:**
- We organize code into clear folders (see Component Structure).
- We rely on small, focused components that can be tested and updated independently.
- TypeScript interfaces keep our data shapes clear as the project grows.

**Performance:**
- We split code into separate bundles so the initial download is smaller.
- We lazy-load less critical routes or components to speed up the first paint.
- We optimize images and other assets through the build process.

## 2. Design Principles

1. Usability: Make every screen straightforward and predictable. Buttons and links look and behave consistently.
2. Accessibility: Follow WCAG guidelines. Use semantic HTML (like `<button>` instead of clickable `<div>`), ensure good color contrast, and support keyboard navigation.
3. Responsiveness: Design for phones, tablets, and desktops. Components should adapt fluidly to different screen sizes.
4. Simplicity: Avoid clutter. Each page or component should focus on a single task or clear piece of information.
5. Feedback: Give visual cues (loading spinners, disabled buttons) to show progress or errors.

**Applying these principles:**
- Use clear labels on buttons and form fields.
- Provide `aria-` attributes where needed for screen readers.
- Test layout at mobile, tablet, and desktop breakpoints.

## 3. Styling and Theming

**Approach:**
We use a combination of CSS-in-JS (styled-components) and global utility classes (via a lightweight CSS framework). This lets us keep styles co-located with components and still share common utilities.

**Methodology:**
- styled-components for component-specific styling
- A small utility CSS file (e.g., for margins, text alignment) following a simplified BEM naming convention

**Pre-processors & Frameworks:**
- No SASS/LESS: styled-components handle nesting and variables.
- Tailwind CSS is optional, but we prefer custom utilities to keep the bundle small.

**Style Theme:** Modern flat design with subtle rounded corners and occasional glassmorphism on cards (slightly transparent background with blur).

**Color Palette:**
- Primary: #0055FF (rich blue)
- Secondary: #FF5500 (warm orange)
- Success: #28A745 (green)
- Error: #DC3545 (red)
- Background: #F8F9FA (light gray)
- Surface Card: rgba(255, 255, 255, 0.75)
- Text Primary: #212529 (dark gray)
- Text Secondary: #6C757D (medium gray)

**Fonts:**
- Primary font: Inter (sans-serif) for readability across devices
- Fallback: system-ui, Arial, sans-serif

## 4. Component Structure

**Folder layout:**
```
src/
  components/      # Reusable, self-contained UI pieces
    Button/
      Button.tsx
      Button.styles.ts
      Button.test.tsx
    Card/
      Card.tsx
      Card.styles.ts
      Card.test.tsx
  features/        # Big pieces of functionality (forms, dashboards)
  hooks/           # Custom React hooks
  pages/           # Top-level routes
  services/        # API calls and data services
  theme/           # Theme definitions and global styles
  utils/           # Shared helper functions
index.tsx
App.tsx
```

**Why components matter:**
- They keep code DRY (Don’t Repeat Yourself).
- Small pieces are easy to test and maintain.
- You can swap out or update one component without touching the rest.

## 5. State Management

**Approach:**
- For application-wide state (user session, settings), use Redux Toolkit.
- For local state within a component or single feature, use React’s built-in `useState` or `useReducer`.
- Create well-typed slices in Redux so actions and state shapes are explicit.

**Sharing state:**
- Components subscribe only to the slice of state they need.
- Use selectors to map state to props in a predictable way.
- Keep side effects (API calls) in middleware or thunks for clarity.

## 6. Routing and Navigation

**Library:** React Router v6.

**Structure:**
- `src/pages/` holds each page component (Home, About, Dashboard, etc.).
- In `App.tsx`, define the tree of `<Routes>` and `<Route>` components.
- Protect private routes (e.g., Dashboard) by wrapping them in an `<AuthGuard>` component that checks login status.

**Navigation:**
- A top navigation bar with links to main sections.
- Use `NavLink` for active link styling.
- Ensure deep linking works (you can copy/paste URLs and land on the right page).

## 7. Performance Optimization

1. **Code Splitting:**
   - Use `React.lazy` and `Suspense` to load less critical pages only when needed.
2. **Asset Optimization:**
   - Compress images (SVGs for icons, optimized PNG/JPEG for photos).
   - Serve modern formats (WebP) when possible.
3. **Caching:**
   - Leverage HTTP caching headers for static assets.
4. **Memoization:**
   - Use `React.memo` or `useMemo`/`useCallback` to avoid unnecessary re-renders for expensive components or calculations.
5. **Minification & Tree Shaking:**
   - Ensure the build tool removes unused code and compresses the final bundle.

## 8. Testing and Quality Assurance

**Unit Tests:**
- Jest + React Testing Library
- Test single components in isolation (render, props, user interactions)

**Integration Tests:**
- Verify how multiple components work together (form flows, data fetching)
- Mock API calls via MSW (Mock Service Worker)

**End-to-End (E2E) Tests:**
- Cypress for real-browser testing (filling forms, clicking buttons, navigation)

**Linting & Formatting:**
- ESLint for catching syntax and style issues
- Prettier for consistent code formatting
- Git hooks (via Husky) to run linting and tests before commits

**Continuous Integration (CI):**
- On every pull request, run linting, unit tests, and build verification
- Report any failures back in the PR for quick fixes

## 9. Conclusion and Summary

These guidelines set the stage for a clear, maintainable, and performant frontend in the livo-dev project. By using React with TypeScript, following simple design principles (usability, accessibility, responsiveness), and organizing code into reusable components, we keep the project approachable for new and experienced developers alike. Our styling approach ensures a consistent look and feel, while our testing and performance practices guarantee a reliable experience for end users.

As the project grows, stick to these principles and our folder structure, and you’ll find it easy to add features, onboard new team members, and maintain a high quality standard throughout. Happy coding!

---
**Document Details**
- **Project ID**: ef377119-e2e3-4fbb-a932-546decd9944a
- **Document ID**: 379300d0-ee59-4f03-ae5e-3274a6080c6b
- **Type**: custom
- **Custom Type**: frontend_guidelines_document
- **Status**: completed
- **Generated On**: 2025-10-31T16:42:23.762Z
- **Last Updated**: N/A
