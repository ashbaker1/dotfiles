export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH=${HOME}/go/bin:$PATH
export PATH=/Applications/XAMPP/bin:$PATH
export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# git
alias gitbranchcontains-simple="echo -e \"\e[1;31m>>>git branch --contains \$branchCommitHere \e[0m\n\";\
		git branch --contains ";
alias gitbranchcontains-reflog="echo -e \"\e[1;31m>>>git reflog show --all --date=iso | grep \$branchCommitHere \e[0m\n\";\
		git reflog show --all --date=iso | grep ";

alias gl="echo -e \"\e[1;31m>>>git log --oneline --decorate --graph \e[0m\n\";\
       	git log --oneline --decorate --graph ";

alias gs="echo -e \"\e[1;31m>>>git status -s \e[0m\n\";\
       	git status -s ";

alias glog="echo -e \"\e[1;31m>>> git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --\e[0m\n\";\
	git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -- ";

alias glga="echo -e \"\e[1;31m>>>git log --graph --oneline --all --decorate\e[0m\n\";\
	git log --graph --oneline --all --decorate ";

alias cg='cd $(git rev-parse --show-toplevel)' #goto root dir


#ls

if [[ -e "$DOTFILESDIR/ls/ls_colors" ]]; then
    export LS_COLORS="$(cat "$DOTFILESDIR/ls/ls_colors")"
else
    if [[ -e "$DOTFILESDIR/ls/dir_colors" ]]; then
        DIRCOLORS=$XDG_CONFIG_HOME/dir_colors
    fi

    if [[ $OSTYPE =~ darwin ]] || [[ $OSTYPE =~ freebsd ]]; then
        if (( $+commands[gdircolors] )); then
            eval "$(gdircolors -b ${=DIRCOLORS:+-b "$DIRCOLORS"})"
        fi
    fi
    if (( $+commands[dircolors] )); then
        eval "$(dircolors -b ${=DIRCOLORS:+-b "$DIRCOLORS"})"
    fi
fi

if (( $+commands[exa] )); then
    alias exa='exa --colour-scale'
    alias ls=exa
    alias la='ls -a'
    alias lr='ll -s modified'
    alias lrc='lr -s created'
elif [[ $OSTYPE =~ darwin ]] || [[ $OSTYPE =~ freebsd ]]; then
    if (( $+commands[gls] )); then
        alias ls='gls --color=auto -h'
    else
        alias ls='ls -G -h'
        if [[ -e "$DOTFILESDIR/ls/bsd_colors" ]]; then
            export LSCOLORS="$(cat $DOTFILESDIR/ls/bsd_colors)"
        fi
    fi
    alias la='ls -A'
    alias lr='ll -tr'
    alias lrc='lr -U'
else
    alias ls='ls --color=auto -h'
    alias la='ls -A'
    alias lr='ll -tr'
    alias lrc='lr -c'
fi

alias ll='ls -l'
alias l='ls -1'

export LS_COLORS="ln=0;38;5;212:bd=0;38;5;117;48;5;238:*~=0;38;5;231:no=0:cd=0;38;5;212;48;5;238:so=0;38;5;235;48;5;212:ex=1;38;5;84:fi=0:pi=0;38;5;235;48;5;117:di=0;38;5;117:mi=0;38;5;235;48;5;203:or=0;38;5;235;48;5;203:*.p=0;38;5;84:*.t=0;38;5;84:*.a=1;38;5;212:*.d=0;38;5;84:*.h=0;38;5;84:*.z=4;38;5;212:*.m=0;38;5;84:*.o=0;38;5;231:*.c=0;38;5;84:*.r=0;38;5;84:*.vb=0;38;5;84:*.nb=0;38;5;84:*.as=0;38;5;84:*.sh=0;38;5;84:*.py=0;38;5;84:*.pl=0;38;5;84:*.ps=0;38;5;228:*.cr=0;38;5;84:*.lo=0;38;5;231:*.ui=0;38;5;61:*.rb=0;38;5;84:*.pp=0;38;5;84:*.ml=0;38;5;84:*.bz=4;38;5;212:*.cp=0;38;5;84:*.md=0;38;5;212:*.di=0;38;5;84:*.7z=4;38;5;212:*.rs=0;38;5;84:*.hi=0;38;5;231:*.xz=4;38;5;212:*css=0;38;5;84:*.ex=0;38;5;84:*.kt=0;38;5;84:*.gz=4;38;5;212:*.js=0;38;5;84:*.bc=0;38;5;231:*.gv=0;38;5;84:*.la=0;38;5;231:*.hs=0;38;5;84:*.go=0;38;5;84:*.td=0;38;5;84:*.cc=0;38;5;84:*.el=0;38;5;84:*.fs=0;38;5;84:*.pm=0;38;5;84:*.ko=1;38;5;212:*.so=1;38;5;212:*.hh=0;38;5;84:*.rm=0;38;5;215:*.cs=0;38;5;84:*.jl=0;38;5;84:*.ts=0;38;5;84:*.mn=0;38;5;84:*.ll=0;38;5;84:*.dot=0;38;5;84:*.pgm=0;38;5;215:*.cfg=0;38;5;61:*.pro=0;38;5;61:*.sty=0;38;5;231:*.dox=0;38;5;61:*.ilg=0;38;5;231:*.elm=0;38;5;84:*.fnt=0;38;5;215:*.tar=4;38;5;212:*.h++=0;38;5;84:*.rtf=0;38;5;228:*.img=4;38;5;212:*.bsh=0;38;5;84:*.com=1;38;5;212:*.csv=0;38;5;212:*.asa=0;38;5;84:*.apk=4;38;5;212:*.swf=0;38;5;215:*.c++=0;38;5;84:*.kts=0;38;5;84:*.pdf=0;38;5;228:*.flv=0;38;5;215:*.git=0;38;5;231:*.nix=0;38;5;61:*.ico=0;38;5;215:*.tbz=4;38;5;212:*.bak=0;38;5;231:*.sbt=0;38;5;84:*.mir=0;38;5;84:*.htc=0;38;5;84:*.dpr=0;38;5;84:*.ps1=0;38;5;84:*.out=0;38;5;231:*.fsx=0;38;5;84:*.odp=0;38;5;228:*.vim=0;38;5;84:*.kex=0;38;5;228:*.sql=0;38;5;84:*.htm=0;38;5;212:*.lua=0;38;5;84:*.inc=0;38;5;84:*.dll=1;38;5;212:*.pid=0;38;5;231:*.wav=0;38;5;215:*.bcf=0;38;5;231:*.pyc=0;38;5;231:*.csx=0;38;5;84:*.mov=0;38;5;215:*.ttf=0;38;5;215:*.ics=0;38;5;228:*.xml=0;38;5;212:*.tex=0;38;5;84:*.awk=0;38;5;84:*.pkg=4;38;5;212:*.tml=0;38;5;61:*.odt=0;38;5;228:*.idx=0;38;5;231:*.rar=4;38;5;212:*.jpg=0;38;5;215:*.avi=0;38;5;215:*.pod=0;38;5;84:*.zsh=0;38;5;84:*.sxw=0;38;5;228:*.tcl=0;38;5;84:*.swp=0;38;5;231:*.mli=0;38;5;84:*.php=0;38;5;84:*.ltx=0;38;5;84:*.vcd=4;38;5;212:*.vob=0;38;5;215:*.svg=0;38;5;215:*.exe=1;38;5;212:*.ipp=0;38;5;84:*.exs=0;38;5;84:*.xlr=0;38;5;228:*.hxx=0;38;5;84:*.yml=0;38;5;61:*.pbm=0;38;5;215:*.bst=0;38;5;61:*.rst=0;38;5;212:*.mkv=0;38;5;215:*hgrc=0;38;5;61:*.wma=0;38;5;215:*.mp4=0;38;5;215:*.aux=0;38;5;231:*.ini=0;38;5;61:*.wmv=0;38;5;215:*.mid=0;38;5;215:*.dmg=4;38;5;212:*.tmp=0;38;5;231:*.epp=0;38;5;84:*.gvy=0;38;5;84:*.tsx=0;38;5;84:*.bin=4;38;5;212:*.pps=0;38;5;228:*.fon=0;38;5;215:*.log=0;38;5;231:*.cgi=0;38;5;84:*.ind=0;38;5;231:*.bag=4;38;5;212:*.mp3=0;38;5;215:*.fls=0;38;5;231:*.inl=0;38;5;84:*.doc=0;38;5;228:*.xmp=0;38;5;61:*.ppm=0;38;5;215:*.toc=0;38;5;231:*.sxi=0;38;5;228:*.txt=0;38;5;212:*.rpm=4;38;5;212:*.tgz=4;38;5;212:*.blg=0;38;5;231:*.bbl=0;38;5;231:*.arj=4;38;5;212:*.zip=4;38;5;212:*.erl=0;38;5;84:*.jar=4;38;5;212:*.bib=0;38;5;61:*.ppt=0;38;5;228:*.bz2=4;38;5;212:*.hpp=0;38;5;84:*.xls=0;38;5;228:*.ogg=0;38;5;215:*.cpp=0;38;5;84:*.m4v=0;38;5;215:*.aif=0;38;5;215:*TODO=1:*.def=0;38;5;84:*.bat=1;38;5;212:*.cxx=0;38;5;84:*.mpg=0;38;5;215:*.gif=0;38;5;215:*.bmp=0;38;5;215:*.xcf=0;38;5;215:*.ods=0;38;5;228:*.iso=4;38;5;212:*.png=0;38;5;215:*.fsi=0;38;5;84:*.otf=0;38;5;215:*.tif=0;38;5;215:*.pas=0;38;5;84:*.clj=0;38;5;84:*.deb=4;38;5;212:*.mpeg=0;38;5;215:*.html=0;38;5;212:*.purs=0;38;5;84:*.fish=0;38;5;84:*.xlsx=0;38;5;228:*.bash=0;38;5;84:*.h264=0;38;5;215:*.flac=0;38;5;215:*.psm1=0;38;5;84:*.lisp=0;38;5;84:*.less=0;38;5;84:*.dart=0;38;5;84:*.docx=0;38;5;228:*.json=0;38;5;61:*.pptx=0;38;5;228:*.rlib=0;38;5;231:*.hgrc=0;38;5;61:*.jpeg=0;38;5;215:*.lock=0;38;5;231:*.conf=0;38;5;61:*.make=0;38;5;61:*.java=0;38;5;84:*.toml=0;38;5;61:*.tbz2=4;38;5;212:*.yaml=0;38;5;61:*.epub=0;38;5;228:*.diff=0;38;5;84:*.orig=0;38;5;231:*.psd1=0;38;5;84:*.mdown=0;38;5;212:*.toast=4;38;5;212:*shadow=0;38;5;61:*.patch=0;38;5;84:*.swift=0;38;5;84:*.class=0;38;5;231:*passwd=0;38;5;61:*.dyn_o=0;38;5;231:*.ipynb=0;38;5;84:*.xhtml=0;38;5;212:*.cache=0;38;5;231:*.scala=0;38;5;84:*.cabal=0;38;5;84:*.cmake=0;38;5;61:*.shtml=0;38;5;212:*README=0;38;5;228:*tox.ini=0;38;5;61:*INSTALL=0;38;5;228:*.groovy=0;38;5;84:*Pipfile=0;38;5;61:*.config=0;38;5;61:*COPYING=0;38;5;183:*.ignore=0;38;5;61:*.gradle=0;38;5;84:*.dyn_hi=0;38;5;231:*TODO.md=1:*.flake8=0;38;5;61:*.matlab=0;38;5;84:*LICENSE=0;38;5;183:*setup.py=0;38;5;61:*TODO.txt=1:*Makefile=0;38;5;61:*.desktop=0;38;5;61:*Doxyfile=0;38;5;61:*.gemspec=0;38;5;61:*.markdown=0;38;5;212:*setup.cfg=0;38;5;61:*README.md=0;38;5;228:*.kdevelop=0;38;5;61:*.DS_Store=0;38;5;231:*configure=0;38;5;61:*.fdignore=0;38;5;61:*.rgignore=0;38;5;61:*COPYRIGHT=0;38;5;183:*.cmake.in=0;38;5;61:*INSTALL.md=0;38;5;228:*SConstruct=0;38;5;61:*CODEOWNERS=0;38;5;61:*.localized=0;38;5;231:*.gitconfig=0;38;5;61:*.gitignore=0;38;5;61:*SConscript=0;38;5;61:*README.txt=0;38;5;228:*Dockerfile=0;38;5;61:*.scons_opt=0;38;5;231:*Makefile.am=0;38;5;61:*MANIFEST.in=0;38;5;61:*.travis.yml=0;38;5;228:*Makefile.in=0;38;5;231:*poetry.lock=0;38;5;61:*.synctex.gz=0;38;5;231:*LICENSE-MIT=0;38;5;183:*.gitmodules=0;38;5;61:*Pipfile.lock=0;38;5;61:*CONTRIBUTORS=0;38;5;228:*appveyor.yml=0;38;5;228:*configure.ac=0;38;5;61:*.fdb_latexmk=0;38;5;231:*.applescript=0;38;5;84:*.clang-format=0;38;5;61:*CMakeLists.txt=0;38;5;61:*.gitattributes=0;38;5;61:*pyproject.toml=0;38;5;61:*INSTALL.md.txt=0;38;5;228:*CMakeCache.txt=0;38;5;231:*LICENSE-APACHE=0;38;5;183:*CONTRIBUTORS.md=0;38;5;228:*.sconsign.dblite=0;38;5;231:*CONTRIBUTORS.txt=0;38;5;228:*requirements.txt=0;38;5;61:*package-lock.json=0;38;5;231:*.CFUserTextEncoding=0;38;5;231:*requirements-dev.txt=0;38;5;61"

