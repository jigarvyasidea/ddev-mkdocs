setup() {
  set -eu -o pipefail
  export DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )/.."
  export TESTDIR=~/tmp/test-mkdocs
  mkdir -p $TESTDIR
  export PROJNAME=test-mkdocs
  export DDEV_NON_INTERACTIVE=true
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1 || true
  cd "${TESTDIR}"
  ddev config --project-name=${PROJNAME}
  ddev get metadrop/ddev-aljibe
  ddev start -y >/dev/null
  ddev aljibe-assistant --auto
}

health_checks() {
  echo "Checking mkdocs health" >&3
  ddev exec wget http://mkdocs:8000 -q -O - | grep Welcome | grep -m1 "Welcome to Mkdocs"
}

check_build_mkdocs() {
  echo "Checking mkdocs build" >&3
  ddev mkdocs build
}

t() {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1
  [ "${TESTDIR}" != "" ] && rm -rf ${TESTDIR}
}

@test "Install from folder" {
  set -eu -o pipefail
  cd ${TESTDIR}
  echo "# ddev get ${DIR} with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev get ${DIR}
  echo "Installed add-on from directory, restarting ddev" >&3
  ddev restart
  echo "Testing mkdocs" >&3
  health_checks
  check_build_mkdocs
}