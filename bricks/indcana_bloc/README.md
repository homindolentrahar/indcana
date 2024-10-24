# indcana_bloc

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

Generate BLoC template with both Bloc and Cubit style. Support pagination and state immutability

## Getting Started 🚀

### Instalation

Add these code inside your `mason.yaml` file.

> If you're using [`indcana_core`](https://github.com/homindolentrahar/indcana/tree/master/bricks/indcana_core), then you don't have to do this since it's included out-of-the-box

```yaml
# Register bricks which can be consumed via the Mason CLI.
# Run "mason get" to install all registered bricks.
# To learn more, visit https://docs.brickhub.dev.
bricks:
  # Bricks can be imported via version constraint from a registry.
  # Uncomment the following line to import the "hello" brick from BrickHub.
  # hello: 0.1.0+1
  # Bricks can also be imported via remote git url.
  # Uncomment the following lines to import the "widget" brick from git.
  indcana_bloc:
    git:
      url: https://github.com/homindolentrahar/indcana
      path: bricks/indcana_bloc
```
### Usage

Run this command to create a new BLoC 

```shell
mason make indcana_bloc
```

You'll see generated BLoC class, complete with event and state. Happy coding! Happy coding! 🥳🎉

## References 📕

- [Official Mason's Github][1]
- [Official Mason Documentation][2]

[1]: https://github.com/felangel/mason
[2]: https://docs.brickhub.dev

