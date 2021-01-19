# ziphttpd.unix

unix 系 OS に ziphttpd をインストールするためのユーティリティです。  

## zh_download.sh [インストール先]  

指定のインストール先に ziphttpd をインストールします。  
実行には Git と Go が必要です。  

## {ziphttpd|selector}.sh {start|stop|restart|status}  

ziphttpd と selector の起動／終了を管理します。  
controller.sh のシンボリックリンクとしてインストール先に作られます。

## controller.sh  

ziphttpd.sh と selector.sh の実体です。  

## install_go.sh  

Go をインストールするユーティリティです。  
