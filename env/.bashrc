# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

alias be='bundle exec'
alias bi='bundle install'
alias his='history'
alias mr='mysql -u root -p'
alias nwo='rvm use 1.9.3; rvm gemset use nwo'
alias r='rails s'
alias rg='rails g'
alias rgs='rails g scaffold'
alias rkdc='rake db:create'
alias rkdm='rake db:migrate'
alias rkdmr='rake db:migrate:reset'
alias rkdmt='rake db:migrate RAILS_ENV=test'
alias rkds='rake db:seed'
alias rkdst='rake db:seed RAILS_ENV=test'
alias rwo='rvm use 2.0; rvm gemset use two'

if [ ~/.bash-git-prompt/gitprompt.sh ]; then
  . ~/.bash-git-prompt/gitprompt.sh
fi

# Qt PATH
PATH=/usr/local/Trolltech/Qt-4.8.5/bin/:$PATH

# heroku PATH
PATH="/usr/local/heroku/bin:$PATH"

# shoes PATH
PATH="~/.shoes/buildshoes/dist:$PATH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
