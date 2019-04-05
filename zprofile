export JAVA_OPTS="-Xms1024M -Xmx2048M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxMetaspaceSize=512M -Dsbt.override.build.repos=true"
export JAVA_HOME=$(/usr/libexec/java_home)
export SCALA_HOME=~/other/scala-2.11.6
export PENTAHO_JAVA_HOME=$JAVA_HOME
export SPARK_HOME=~/tvision/spark
export PYTHONPATH=$SPARK_HOME/python
export PATH="/opt/local/bin:/opt/local/sbin:$HOME/bin:$SCALA_HOME/bin:$HOME/.local/bin:$HOME/Library/Haskell/bin:$HOME/.cabal/bin:$SPARK_HOME/bin:$PATH"

# Setting PATH for Python 3.6
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
