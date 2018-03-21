# SSH config module

Arrange ssh configs to subfolders. Base config store at `_base` file.

## Commands

1.  `build.sh` concat modules to ssh config file.
2.  `create.sh` create new module structue.

## Config module

Each module has a `config` file which contain ssh config.

Store ssh identity files in `<module folder>/keys` folder and use absolute path of those keys in `config` file.

## Skip module

If you need to temp skip modules from build process then can create a `skip` file inside of that module.

```
module/
├── keys/
│   └── id_ed25519
├── config
└── skip
```
