export JAVA_OPTS="-Xms1024M -Xmx2048M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxMetaspaceSize=512M -Dsbt.override.build.repos=true"
export JAVA_HOME=$(/usr/libexec/java_home)
export PENTAHO_JAVA_HOME=$JAVA_HOME
export SPARK_HOME=~/tvision/spark
export PYTHONPATH=$SPARK_HOME/python
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:$PATH"
export PATH="/opt/local/bin:$PATH"
export PATH="/opt/local/sbin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$$HOME/.cabal/bin:$PATH"
export PATH="$SPARK_HOME/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
