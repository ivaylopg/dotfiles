## Aliases



ALIAS | EXPANSION
:--- | :---
**Navigation** |  |
**`..`** | `cd ..`
**`..`** | `cd ..`
**`cd..`** | `cd ..`
**`...`** | `cd ../..`
**`....`** | `cd ../../..`
**`.....`** | `cd ../../../..`
**`..2`** | `cd ../..`
**`..3`** | `cd ../../..`
**`..4`** | `cd ../../../..`
**`~`** | `cd ~`
**`cdd`** | `cd ~/Desktop`
################ | ################
**`l`** | `ls`
**`lsa`** | `ls -a`
**`la`** | `List ALL files (colorized() in long format, show permissions in octal)`
**`lsd`** | `List ONLY directories`
################ | ################
**Git (Shell Aliases)** | (See .gitconfig for more)
**`g`** (no args) | `git status`
**`g`** (with args) | `git [args]`
**`gs`** | `git status`
**`ga`** | `git add`
**`gp`** | `git push`
**`gpl`** | `git pull`
**`go`** | Open repo github/bitbucket page in browser (`git-open`)
**`groot`** | `cd` to root of git repo
**`gr`** | `git grep`
------ | ------
**Git (.gitconfig Aliases)** |   |
**`undo`** | `reset HEAD~1` (ie - unstage)
**`last`** | `log -1 HEAD` (view last comit)
**`s`** | `status`
**`cma`** | `commit -a -m` (add all modified files and commit with message)
**`cm`** | `commit -m` (commit with message)
**`ca`** | `commit -a` (add all modified files and commit)
**`difflast`** | `diff HEAD^..HEAD` (view changes made in last commit)
**`cpbranch`** | "!`f() { git archive $1 | tar -xC $2; }; f"` (copy branch $1 into $2 without performing a local checout)
**`p`** | `push`
**`pl`** | `pull`
**`df`** | `diff --color --color-words --abbrev` (view unstaged changes)
**`lg`** | `log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --` (view log)
**`co`** | `checkout`
**`master`** | `!git checkout master && git pull` (switch to master branch)
**`gr`** | `grep`
**`sync`** | `! git stash && git pull --rebase && git push && git stash pop` (sync remote without having to merge)
**`amend`** | `git commit --amend`
**`discard`** | ! git reset HEAD --hard && git clean -fd (delete all changes since last commit)
################ | ################
**Shortcuts/Helpers** |  |
**`v`** | `vim`
**`c`** | `clear`
**`nn`** | `nano`
**`e`** | `exit`
**`path`** | `echo -e ${PATH//:/\\n}`
**`db`** | `open ~/Dropbox`
**`o`** (no args) | open finder window to cwd
**`o`** (with args) | `open -a "Finder" .`
**`x`** | `chmod +x`
**`fs`** | show size of file
################ | ################
**Network Stuff** |  |
**`ip`** | Prints extrnal IP address
**`ips`** | Prints local IP address(es)
**`flushdns`** | Clear the DNS cache
**`post`**  | `curl -X POST -d`
**`s3`**  | `aws --profile s3admin s3`
################ | ################
**Programs** |  |
**`mou`** | 'open -a "Mou" [args]`
**`mdn`** | 'open -a "MacDown" [args]`
**`vimr`** | 'open -a "VimR" [args]`
**`st`** (args) | `subl [args/file(s)]`
**`st`** (no args) | if there is a `.sublime-project` in cwd, it opens. Otherwise a new ST window opens
################ | ################
**Finder/OS** |  |
**`cleanup`** | (recursively delete .DS_Store files)
**`lock`** | lock screen
**`emptytrash`** | empty all trashes (system, user, and voume)
**`hidedesktop`** | hide all desktop icons
**`showdesktop`** | unhide desktop icons
**`update`** | list software with updates available from App Store
**`upgrade`** | download and install available updates
**`viewloginitems`** | List all login-items
**`iphone`** | Open iOS Simulator
**`stfu`** | Mute system volume
**`pumpitup`** | Set system volume to maximum
################ | ################
**Homebrew** |  |
**`brew-up`** | Upgrade, update, and cleanup homebrew
################ | ################
**Just For Fun** |  |
**`?`** | Clear the screen and cowsay a fortune
**`dunnet`** | launch dunnet in current directory
**`adventure`** | launch Colossal Cave adventure

