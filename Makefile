.PHONY: upgrade upgrade-major outdated dependencies dependencies-full build regen-logo

upgrade:
	dart pub upgrade

upgrade-major:
	dart pub upgrade --major-versions

outdated: 
	flutter pub get
	dart pub outdated

dependencies: upgrade
	dart pub deps

dependencies-full: upgrade
	dart pub outdated --dependency-overrides --dev-dependencies --prereleases --show-all --transitive

build: 
	flutter pub get
	dart run build_runner build --delete-conflicting-outputs --verbose

regen-logo: 
	flutter pub get
	flutter pub run flutter_launcher_icons:main

regen-splash: 
	flutter pub get
	dart run flutter_native_splash:remove
	dart run flutter_native_splash:create