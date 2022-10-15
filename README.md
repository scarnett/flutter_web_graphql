## About

This is a simple CRUD application built with Flutter for maintaining users. This project uses a [Hasura](https://www.hasura.io/) GraphQL API to interact with a PostgreSQL database that's hosted on [Heroku](https://www.heroku.com/).

<img src="docs/images/screen.png" width="300" />

---

## Setup

In order to run this application you need to install [Flutter](https://www.flutter.dev/).

## Environment Configuration

You will need to create `lib/env_config.dart` with the following:

```dart
class EnvConfig {
  static const String GRAPHQL_URL = '<your_hasura_graphql_url>';
  static const String HASURA_ADMIN_SECRET = '<your_hasura_admin_secret>';
}
```

## Run

```bash
flutter run
```

## Build
```bash
flutter build apk # android apk
flutter build appbundle # android app bundle
flutter build ios # ios application bundle
flutter build ipa # ios archive bundle
flutter build web # web
```

## PostgreSQL (Database)

The PostgreSQL database contains only a single schema with one table - `users`.

`users`

| Field      | Type | Optional | PK  |
| -----------|------|----------|-----|
| id         | int  | NO       | YES |
| first_name | text | NO       | NO  |
| last_name  | text | NO       | NO  |
| email      | text | NO       | NO  |

## Credits
Created by [@scarnett](https://github.com/scarnett/)

## License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)  
Copyright &copy; 2021 Scott Carnett. Licensed under the MIT License (MIT)
