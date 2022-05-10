jira-core-recompile () {
    mvn package -f jira-components/jira-core -DskipTests -DskipITs
}

jira-core-reload-class () {
    local class="$1"
    cp jira-components/jira-core/target/classes/$class jira-components/jira-webapp/target/jira/WEB-INF/classes/$class
}
