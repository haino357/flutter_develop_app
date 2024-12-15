.PHONY: setup
setup:
	flutter clean
	flutter pub get

.PHONY: vercheck
ver:
	flutter --version

.PHONY: doctor
doctor:
	flutter doctor