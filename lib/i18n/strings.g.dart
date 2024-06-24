/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 78 (39 per locale)
///
/// Built on 2024-06-24 at 13:28 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ru(languageCode: 'ru', build: _StringsRu.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get language => 'English';
	String get home_title => 'Homepage';
	String get open_search => 'Go to search';
	String get open_collection => 'Go to collection';
	String get collection => 'Collection';
	String get open_button => 'Go';
	String get search => 'Search';
	String get information => 'Information';
	late final _StringsAlertTitleLogoutEn alert_title_logout = _StringsAlertTitleLogoutEn._(_root);
	late final _StringsLoginEn login = _StringsLoginEn._(_root);
	late final _StringsSignUpEn sign_up = _StringsSignUpEn._(_root);
	late final _StringsSignUpAlertEn sign_up_alert = _StringsSignUpAlertEn._(_root);
	late final _StringsLogInAlertsEn log_in_alerts = _StringsLogInAlertsEn._(_root);
}

// Path: alert_title_logout
class _StringsAlertTitleLogoutEn {
	_StringsAlertTitleLogoutEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Are you sure you want to log out?';
	String get action_yes => 'Yes';
	String get action_no => 'No';
}

// Path: login
class _StringsLoginEn {
	_StringsLoginEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Log in';
	String get email => 'email';
	String get password => 'Password';
	String get no_account => 'No account? Then, ';
	String get log_in => 'Log in';
	String get sign_up => 'Sign Up';
}

// Path: sign_up
class _StringsSignUpEn {
	_StringsSignUpEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Sign Up';
	String get name => 'Name';
	String get email => 'Email';
	String get password => 'Password';
	String get confirm_pass => 'Confirm Password';
	String get sign_up => 'Sign Up';
}

// Path: sign_up_alert
class _StringsSignUpAlertEn {
	_StringsSignUpAlertEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get fill_fields => 'Please fill in all fields';
	String get weak_pass => 'Weak password, minimum 6 characters';
	String get pass_not_match => 'Passwords do not match';
	String get signing_in => 'Signing up';
	String get please_wait => 'Please wait';
	String get success => 'Success';
	String get failed_err => 'Error';
	String get email_already_in_use_err => 'Email already in use';
	String get weak_pass_err => 'Password is too weak';
	String get went_wrong_err => 'Something went wrong';
}

// Path: log_in_alerts
class _StringsLogInAlertsEn {
	_StringsLogInAlertsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get fill_fields => 'Please fill in all fields';
	String get loggin_in => 'Logging in';
	String get please_wait => 'Please wait';
	String get user_not_found => 'User not found';
	String get wrong_pass => 'Incorrect password';
	String get went_wrong => 'Something went wrong...';
}

// Path: <root>
class _StringsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsRu _root = this; // ignore: unused_field

	// Translations
	@override String get language => 'Русский';
	@override String get home_title => 'Главная страница';
	@override String get open_search => 'Перейти к поиску';
	@override String get open_collection => 'Перейти в коллекцию';
	@override String get collection => 'Коллекция';
	@override String get open_button => 'Перейти';
	@override String get search => 'Поиск';
	@override String get information => 'Информация';
	@override late final _StringsAlertTitleLogoutRu alert_title_logout = _StringsAlertTitleLogoutRu._(_root);
	@override late final _StringsLoginRu login = _StringsLoginRu._(_root);
	@override late final _StringsSignUpRu sign_up = _StringsSignUpRu._(_root);
	@override late final _StringsSignUpAlertRu sign_up_alert = _StringsSignUpAlertRu._(_root);
	@override late final _StringsLogInAlertsRu log_in_alerts = _StringsLogInAlertsRu._(_root);
}

// Path: alert_title_logout
class _StringsAlertTitleLogoutRu implements _StringsAlertTitleLogoutEn {
	_StringsAlertTitleLogoutRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Вы уверены, что хотите выйти из аккаунта?';
	@override String get action_yes => 'Да';
	@override String get action_no => 'Нет';
}

// Path: login
class _StringsLoginRu implements _StringsLoginEn {
	_StringsLoginRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Вход';
	@override String get email => 'email';
	@override String get password => 'Пароль';
	@override String get no_account => 'Нет аккаунта? Тогда, ';
	@override String get log_in => 'Войти';
	@override String get sign_up => 'Зарегистрируйтесь';
}

// Path: sign_up
class _StringsSignUpRu implements _StringsSignUpEn {
	_StringsSignUpRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Регистрация';
	@override String get name => 'Имя';
	@override String get email => 'email';
	@override String get password => 'Пароль';
	@override String get confirm_pass => 'Подтвердить пароль';
	@override String get sign_up => 'Зарегистрироваться';
}

// Path: sign_up_alert
class _StringsSignUpAlertRu implements _StringsSignUpAlertEn {
	_StringsSignUpAlertRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get fill_fields => 'Пожалуйста, заполните все поля';
	@override String get weak_pass => 'Слабый пароль, 6 символов минимум';
	@override String get pass_not_match => 'Пароли не совпадают';
	@override String get signing_in => 'Идет регистрация';
	@override String get please_wait => 'Пожалуйста подождите';
	@override String get success => 'Успешно';
	@override String get failed_err => 'Ошибка';
	@override String get email_already_in_use_err => 'Почта уже используется';
	@override String get weak_pass_err => 'Пароль слишком слабый';
	@override String get went_wrong_err => 'Что-то пошло не так';
}

// Path: log_in_alerts
class _StringsLogInAlertsRu implements _StringsLogInAlertsEn {
	_StringsLogInAlertsRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get fill_fields => 'Пожалуйста, заполните все поля';
	@override String get loggin_in => 'Входим в аккаунт';
	@override String get please_wait => 'Пожалуйста подождите';
	@override String get user_not_found => 'Пользователь не найден';
	@override String get wrong_pass => 'Неверный пароль';
	@override String get went_wrong => 'Что-то пошло не так...';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'language': return 'English';
			case 'home_title': return 'Homepage';
			case 'open_search': return 'Go to search';
			case 'open_collection': return 'Go to collection';
			case 'collection': return 'Collection';
			case 'open_button': return 'Go';
			case 'search': return 'Search';
			case 'information': return 'Information';
			case 'alert_title_logout.title': return 'Are you sure you want to log out?';
			case 'alert_title_logout.action_yes': return 'Yes';
			case 'alert_title_logout.action_no': return 'No';
			case 'login.title': return 'Log in';
			case 'login.email': return 'email';
			case 'login.password': return 'Password';
			case 'login.no_account': return 'No account? Then, ';
			case 'login.log_in': return 'Log in';
			case 'login.sign_up': return 'Sign Up';
			case 'sign_up.title': return 'Sign Up';
			case 'sign_up.name': return 'Name';
			case 'sign_up.email': return 'Email';
			case 'sign_up.password': return 'Password';
			case 'sign_up.confirm_pass': return 'Confirm Password';
			case 'sign_up.sign_up': return 'Sign Up';
			case 'sign_up_alert.fill_fields': return 'Please fill in all fields';
			case 'sign_up_alert.weak_pass': return 'Weak password, minimum 6 characters';
			case 'sign_up_alert.pass_not_match': return 'Passwords do not match';
			case 'sign_up_alert.signing_in': return 'Signing up';
			case 'sign_up_alert.please_wait': return 'Please wait';
			case 'sign_up_alert.success': return 'Success';
			case 'sign_up_alert.failed_err': return 'Error';
			case 'sign_up_alert.email_already_in_use_err': return 'Email already in use';
			case 'sign_up_alert.weak_pass_err': return 'Password is too weak';
			case 'sign_up_alert.went_wrong_err': return 'Something went wrong';
			case 'log_in_alerts.fill_fields': return 'Please fill in all fields';
			case 'log_in_alerts.loggin_in': return 'Logging in';
			case 'log_in_alerts.please_wait': return 'Please wait';
			case 'log_in_alerts.user_not_found': return 'User not found';
			case 'log_in_alerts.wrong_pass': return 'Incorrect password';
			case 'log_in_alerts.went_wrong': return 'Something went wrong...';
			default: return null;
		}
	}
}

extension on _StringsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'language': return 'Русский';
			case 'home_title': return 'Главная страница';
			case 'open_search': return 'Перейти к поиску';
			case 'open_collection': return 'Перейти в коллекцию';
			case 'collection': return 'Коллекция';
			case 'open_button': return 'Перейти';
			case 'search': return 'Поиск';
			case 'information': return 'Информация';
			case 'alert_title_logout.title': return 'Вы уверены, что хотите выйти из аккаунта?';
			case 'alert_title_logout.action_yes': return 'Да';
			case 'alert_title_logout.action_no': return 'Нет';
			case 'login.title': return 'Вход';
			case 'login.email': return 'email';
			case 'login.password': return 'Пароль';
			case 'login.no_account': return 'Нет аккаунта? Тогда, ';
			case 'login.log_in': return 'Войти';
			case 'login.sign_up': return 'Зарегистрируйтесь';
			case 'sign_up.title': return 'Регистрация';
			case 'sign_up.name': return 'Имя';
			case 'sign_up.email': return 'email';
			case 'sign_up.password': return 'Пароль';
			case 'sign_up.confirm_pass': return 'Подтвердить пароль';
			case 'sign_up.sign_up': return 'Зарегистрироваться';
			case 'sign_up_alert.fill_fields': return 'Пожалуйста, заполните все поля';
			case 'sign_up_alert.weak_pass': return 'Слабый пароль, 6 символов минимум';
			case 'sign_up_alert.pass_not_match': return 'Пароли не совпадают';
			case 'sign_up_alert.signing_in': return 'Идет регистрация';
			case 'sign_up_alert.please_wait': return 'Пожалуйста подождите';
			case 'sign_up_alert.success': return 'Успешно';
			case 'sign_up_alert.failed_err': return 'Ошибка';
			case 'sign_up_alert.email_already_in_use_err': return 'Почта уже используется';
			case 'sign_up_alert.weak_pass_err': return 'Пароль слишком слабый';
			case 'sign_up_alert.went_wrong_err': return 'Что-то пошло не так';
			case 'log_in_alerts.fill_fields': return 'Пожалуйста, заполните все поля';
			case 'log_in_alerts.loggin_in': return 'Входим в аккаунт';
			case 'log_in_alerts.please_wait': return 'Пожалуйста подождите';
			case 'log_in_alerts.user_not_found': return 'Пользователь не найден';
			case 'log_in_alerts.wrong_pass': return 'Неверный пароль';
			case 'log_in_alerts.went_wrong': return 'Что-то пошло не так...';
			default: return null;
		}
	}
}
