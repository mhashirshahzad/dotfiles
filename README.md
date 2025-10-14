# DOTFILES
These are mostly taken from others and edited to match my preferences.


### Sudo 
1. To get sudo feedback, do
```sudo visudo```
2. then add this to any line
```Defaults pwfeedback```


### SSH Keygen

1. Generate an ssh-key 
```ssh-keygen -t ed25519 -C "bongopoyo@proton.me"```
2. Start the agent
```eval "$(ssh-agent -s)"```
3. Add the key
```ssh-add ~/.ssh/id_ed25519```
4. Copy public key
```cat ~/.ssh/id_ed25519.pub```
