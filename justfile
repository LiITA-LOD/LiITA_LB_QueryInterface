default:
  @just --choose

gui-serve:
    #!/usr/bin/env sh
    cd ./src/lila-dashboard-gui/
    yarn start

gui-build:
    #!/usr/bin/env sh
    cd ./src/lila-dashboard-gui/
    yarn build

web-serve:
    #!/usr/bin/env sh
    cd src/
    mvn org.apache.tomcat.maven:tomcat7-maven-plugin:2.2:run

web-build:
    #!/usr/bin/env sh
    cd src/
    mvn clean package

