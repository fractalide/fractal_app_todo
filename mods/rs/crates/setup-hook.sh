addSQLitePath () {
    addToSearchPath SQLITE $1/lib
}

envHooks+=(addSQLitePath)
