#VIM Config
*This is a placeholder README*

To use my vim config run the following commands

NOTE: You need [Exuberant cTags](http://ctags.sourceforge.net/) installed for full functionality.

<pre>git clone https://github.com/kd8zev/dotfiles.git && cd ./dotfiles && git checkout -b origin/dev && git pull origin dev && git submodule init && git submodule update && mv ~/.vimrc ~/.vimrc.bak && mv ~/.vim ~/.vim.bak && cp ./vim/vimrc ~/.vimrc && cp -rf ./vim/vim ~/.vim </pre>

I use the [Solarized](http://ethanschoonover.com/solarized) theme for my terminals. If you want it to work for your stuff you need to set up solarized colors on your terminal or it will look really bad. Also, you could just comment out any lines containing the word "solarized" in your vimrc/

