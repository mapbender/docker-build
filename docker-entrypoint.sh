#!/usr/bin/env bash

set -e

if [ "$1" = 'build' ]; then
  echo "Build artifacts for mapbender package"

  echo "Cloning mapbender repository from URL: $MAPBENDER_REPOSITORY"
  echo "Cloning from branch: $MAPBENDER_BRANCH"

  git clone $MAPBENDER_REPOSITORY -b $MAPBENDER_BRANCH /in

  cd /in

  ./bootstrap

  # PHING is not necessary anymore...
  # echo "version.build=${GIT_BRANCH//\//_}-${BUILD_NUMBER}" > local.properties
  # echo "opensuserpm.sign=yes" >> local.properties
  # echo "phing.project.name=mapbender3-starter-develop" >> local.properties
  # cp ../parameters.yml application/app/config/


  echo "Running additional provisioning"
  for f in /build-init.d/*; do
    case "$f" in
      *.sh)              echo "Running provisioning from $(basename $f)"; . "$f" ;;
      parameters.yml)    echo "Copy given parameters.yml"; cp $f /in/application/app/config ;;
    esac
    echo
  done

  if [ ! -f /in/application/app/config ]; then
      cp /in/application/app/config/parameters.yml.dist /in/application/app/config/parameters.yml
  fi

  cd /in/application

  PACKAGE_NAME=$MAPBENDER_NAME-$MAPBENDER_VERSION-$BUILD_NUMBER

  echo "Create artifact $PACKAGE_NAME.tar"
  tar cf /out/$PACKAGE_NAME.tar .
  echo "Create artifact $PACKAGE_NAME.tar.bz2"
  tar cjf /out/$PACKAGE_NAME.tar.bz2 .
  echo "Create artifact $PACKAGE_NAME.tar.gz"
  tar czf /out/$PACKAGE_NAME.tar.gz .
  echo "Create artifact $PACKAGE_NAME.zip"
  zip -r /out/$PACKAGE_NAME.zip . > /dev/null

  echo "Mapbender build done successful without errors..."

fi

exec "$@"