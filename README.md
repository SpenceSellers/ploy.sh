# ploy.sh

Git-based CI/CD so lightweight that it barely exists at all.

## How does it work?
You add your build server as a git remote repository on your projects. When you push your code up to the server, ploy.sh uses git post-receive hooks to run your build, test, and deploy scripts.

## Installing the ploy "build server" git repo on your server
You will need git installed on your build server.

    git clone https://github.com/SpenceSellers/ploy.sh.git
    ./ploy.sh/install.sh
    
## Configuring your project to build on ploy.sh

Create any or all of `ploy/build`, `ploy/test`, and `ploy/deploy` files in your repository. Those files will be executed in that order on your build server whenever you push changes. Feel free to make them bash files or any other type of executable you want.

## Deploying from your dev environment
    git remote add deploy ssh://user@my-server/ploy.sh
    git push deploy
    
You'll need SSH credentials to push to your build server.
    
## FAQ
### I only have one server. Can my build server and my application server be the same computer?
Sure.

### I have limited resources. How much memory and CPU does ploy.sh use when it's not being used?
None.

### Is ploy.sh docker compatible?
Yep. You do it by running docker commands in your build script.
