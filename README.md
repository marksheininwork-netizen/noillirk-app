# Noillirk

A mobile-first, seven-question general trivia game. Players choose a topic or mix all topics, answer each question before the 20-second timer ends, and track their personal record.

## Features

- Seven-question rounds with a 20-second timer per question.
- Geography, Language, History, Science, Nature, Arts & Books, Technology, or mixed rounds.
- Clear answer feedback and short explanations.
- Optional local nickname, personal best, rounds played, and category records.
- No math questions and no account or remote data collection.
- Support, terms, and privacy pages.

## Web app

GitHub Pages publishes the app from the repository root. Open index.html locally or use the published app URL. No build step or paid API is required.

## iOS wrapper

The SwiftUI target loads the HTTPS web game. To archive for the App Store, use Xcode on a Mac, select the correct Apple Developer team, and sign with the app's distribution profile. A GitHub Actions test IPA is unsigned and cannot be submitted.

The wrapper still needs a real-device review and App Store minimum-functionality assessment before submission.
