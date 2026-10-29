# Contributing

Thank you for helping improve Notes App. Contributions from beginners and
experienced Flutter developers are equally welcome.

## Before you start

1. Search existing issues and pull requests to avoid duplicate work.
2. Open an issue for a large feature or architectural change before coding.
3. Follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## Local workflow

1. Fork the repository and create a branch from `main`:

   ```bash
   git checkout -b fix/short-description
   ```

2. Install packages with `flutter pub get`.
3. Make one focused change and avoid unrelated rewrites.
4. Add or update tests when behavior changes.
5. Run the project checks:

   ```bash
   dart format .
   flutter analyze
   flutter test
   ```

6. Commit with a short, descriptive message and open a pull request.

## Code guidelines

- Follow `analysis_options.yaml`.
- Prefer small widgets and descriptive names.
- Keep business and persistence logic out of presentation widgets where
  practical.
- Explain decisions that may be unfamiliar to junior contributors.
- Never commit secrets, IDE-local settings, or build output.

If `NoteModel` changes, regenerate and commit its Hive adapter:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Pull requests

A good pull request includes a clear description, a linked issue when one
exists, relevant tests, and screenshots for visible UI changes. Maintainers may
request changes; reviews are part of collaboration, not a judgment of the
contributor.
