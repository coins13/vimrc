vimrc
=====

なんこれ
-
ぼくのかんがえたさいきょうのvimrc(未完)｡setのあたりをもう少し綺麗にしたいです｡

導入
-
neo-hogehogeを使っているしまずはneobundleでも入れませんか｡
`$ mkdir -p ~/.vim/bundle`
`$ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim`

neocompleteを使っているのでvimは+luaでビルドしてほしいなっ｡※機室のはluaが入っていない｡
初回はまず :NeoBundleInstall! してください｡

イカれたぷらがいん達
==
[vim-over]: https://github.com/osyo-manga/vim-over "vim-over"
-
置換などをリアルタイムで見られる(?)｡

[neocomplete]: https://github.com/Shougo/neocomplete.vim "neocomplete"
-
補完機能がすごくなる｡

[eregex]: https://github.com/othree/eregex.vim "eregex"
-
正規表現の強化

[nerdcommenter]: https://github.com/scrooloose/nerdcommenter "nerdcommenter"
-
コメントアウトのトグルなど
