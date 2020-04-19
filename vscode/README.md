To update extensions list:

```
$ code --list-extensions | xargs -L 1 echo code --install-extension > extensions.sh
```
