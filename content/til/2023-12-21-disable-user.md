+++
title = "Disable User in GNOME Login Screen"
+++

After digging around in [AccountManager]'s source code for a bit
I figured that the easiest way to hide/disable a user in the login screen
is to change the shell to `/sbin/nologin`:

```sh
sudo chsh -s /sbin/nologin USERNAME
```


[AccountManager]: https://gitlab.freedesktop.org/accountsservice/accountsservice/-/blob/42aa71ac99bebe552c26dc03239b88c02fbe37c0/src/user-classify.c#L117
