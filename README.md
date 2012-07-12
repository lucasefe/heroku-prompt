# heroku-prompt

This plugins adds a command to the heroku cli, so you can run other command
always with the same global options.

This is really helpful when you have multiple applications on the same
project/folder. 


Let's say you have app1-prod and app1-stag. 

Now you can say: 

    heroku prompt --app app1-stag

This will open a new prompt where you can enter any heroku command and be sure 
that all will be runned on the app1-stag application context. 

## Installation

    heroku plugins:install https://github.com/lucasefe/heroku-prompt.git


### Author

Hey, Lucas Florio here... Follow me on twitter as @lucasefe. 

