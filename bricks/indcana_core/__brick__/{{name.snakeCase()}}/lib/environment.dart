enum EnvFlavor {
  dev(
    title: "DEV",
    appName: "{{name.titleCase()}} Dev",
  ),
  staging(
    title: "STAGING",
    appName: "{{name.titleCase()}} Staging",
  ),
  prod(
    title: "PROD",
    appName: "{{name.titleCase()}} Prod",
  );

  final String title;
  final String appName;

  const EnvFlavor({
    required this.title,
    required this.appName,
  });
}

class Environment {
  static EnvFlavor _flavor = EnvFlavor.dev;

  static EnvFlavor get flavor => _flavor;

  static void setFlavor(EnvFlavor value) => _flavor = value;

  static String get appName => _flavor.name;

  /// Change [appBaseUrl] with your actual base url for API Integration
  static String get appBaseUrl {
    switch (_flavor) {
      case EnvFlavor.dev:
        return "https://dev.baseurl.com/api/v1";
      case EnvFlavor.staging:
        return "https://staging.baseurl.com/api/v1";
      case EnvFlavor.prod:
        return "https://baseurl.com/api/v1";
      default:
        return "https://dev.baseurl.com/api/v1";
    }
  }
}
