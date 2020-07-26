# NEOVIM

## Installing Chocolatey

https://chocolatey.org/install

	Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

https://chocolatey.org/search?q=neovim
	
## Install plugin-manager vim-plug

To install vim-plug on Windows, open a PowerShell terminal (not Windows CMD), and execute the following command:

	md ~\AppData\Local\nvim\autoload
	$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	(New-Object Net.WebClient).DownloadFile(
	  $uri,
	  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
		"~\AppData\Local\nvim\autoload\plug.vim"
	  )
	)

In Neovim config file, use the following settings for vim-plug:

	call plug#begin('~/AppData/Local/nvim/plugged')

	Plug 'dikiaap/minimalist'
	
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	call plug#end()

	set t_Co=256
	syntax on
	colorscheme minimalist

When we run command :PlugInstall, all the plugins will be installed under ~/AppData/Local/nvim/plugged. We can also change this directory to where we want.