# Ivaylo's dotfiles

* This is a constantly evolving repo of my user defaults, but you are more than welcome to use it. 

* I work on OS X 99% of the time, but most of the config files should work on Linux.
 
* I forked [Paul Irish](https://github.com/paulirish/dotfiles), but he recommends forking [Mathias](https://github.com/mathiasbynens/dotfiles/) or [Alrra](https://github.com/alrra/dotfiles/).
 

## Setup
#### installing & using

* fork this to your own account
* clone *that* repo
* read and run parts of `setup-a-new-machine.sh`
* read and run `symlink-setup.sh`


## *My* favorite parts.

### [`.aliases`](https://github.com/ivaylopg/dotfiles/blob/master/.aliases)

The aliases are cherry-picked from a few different sources and I'm pretty happy with where they ended up. There are a few nice git aliases in the `.gitconfig` too.

### [`.zshrc`](https://github.com/paulirish/dotfiles/blob/master/.zshrc)

I'm totally into `zsh`, but `oh-my-zsh` felt too wierd and opinionated, and added a lot of aliases I didn't like. I set my shell up using `antigen`, but when I realized that it was still checking-out oh-my-zsh I got grumpy.

I now have it set up so that I can just copy libs or plug-ins that I like from oh-my-zsh into the `dotfiles/zshConfig` folder. Sure, I lose git tracking for those libs, but I think I'm OK with that. Oh-my-zsh theme files still work. Just put them in `dotfiles/zshThemes`.



### Sensible OS X defaults

I think this is awesome. I wish I knew about this when I first got this computer. I've commented it out very aggresively so I can un-comment as needed.

I also found this [link](http://azchipka.thechipkahouse.com/2014/09/14/commands-make-yosemite-suck-less/10496/), which offers consise explanations for what some of the more obscure options actually do.


### Syntax highlighting for these files

If you edit this stuff, install [Dotfiles Syntax Highlighting](https://github.com/mattbanks/dotfiles-syntax-highlighting-st2) via [Package Control](http://wbond.net/sublime_packages/package_control)
