clean:
	flutter clean
	flutter pub get

release_android:
	flutter build apk --split-per-abi

release_ios:
	flutter build ios --release