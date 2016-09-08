export JAVA_OPTS="-Xms1024M -Xmx2048M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxMetaspaceSize=512M -Dsbt.override.build.repos=true"
export JAVA_HOME=$(/usr/libexec/java_home)
export SCALA_HOME=~/other/scala-2.11.6
export PATH="/opt/local/bin:/opt/local/sbin:$HOME/bin:$SCALA_HOME/bin:$HOME/.local/bin:$HOME/Library/Haskell/bin:$HOME/.cabal/bin:$PATH"
