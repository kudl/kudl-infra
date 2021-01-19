## Inkjet printer automatic printing

Infinite inkjet printers have problems that are not often used, clogging or filling of ink tubes.
To fix this, register the scheduler using shell deployment.

## Getting Started
On the MacBook, you can run the script at login through the `defaults` command.
When the MacBook boots up, you can print the infinite inkjet printer every `3 days`
However, the power of the `printer must be turned on`

Register the `mac-auto-printing.sh` file to be executed when you log in through the `defaults` command.

```
chmod +x ./mac-auto-printing.sh
defaults write com.apple.loginwindow LoginHook ./mac-auto-printing.sh
```

Printer auto print execution cycle is set to 3 days, and if you want to change the execution cycle, change the `-3d` part in `offset_date=$(date -v -3d +%Y%m%d)` Just do it.
