VER=$1

if test $VER = "6.08.04"
then

  SOFT_DIR=/gpfs/fs03/t2k/beam/work/rtam/software
  source ${SOFT_DIR}/CMT/setup.sh
  export v_nd280Policy=v2r21
  source ${SOFT_DIR}/nd280Policy/${v_nd280Policy}/cmt/setup.sh
  echo "set nd280Policy : ${v_nd280Policy}"
  export v_EXTERN=v3r1
  source ${SOFT_DIR}/EXTERN/${v_EXTERN}/cmt/setup.sh
  echo "set EXTERN : ${v_EXTERN}"
  export v_testBase=v1r5
  source ${SOFT_DIR}/testBase/${v_testBase}/cmt/setup.sh
  echo "set testBase : ${v_testBase}"
  export v_MYSQL=v5r051a
  source ${SOFT_DIR}/MYSQL/${v_MYSQL}/cmt/setup.sh
  echo "set MYSQL : ${v_MYSQL}"
  export v_GSL=v1r15p0n00
  source ${SOFT_DIR}/GSL/${v_GSL}/cmt/setup.sh
  echo "set GSL : ${v_GSL}"
  export v_ROOT=6.08.04
  source ${SOFT_DIR}/ROOT/${v_ROOT}/build/bin/thisroot.sh
  echo "set ROOT : ${v_ROOT}"
  export v_CLHEP=v2r0p3
  source ${SOFT_DIR}/CLHEP/${v_CLHEP}/cmt/setup.sh
  echo "set CLHEP : ${v_CLHEP}"
  export v_GEANT=4.10.03.p01
  source ${SOFT_DIR}/GEANT/4.10.03.01/geant4.10.03.p01-build/geant4make.sh 
  echo "set GENAT : ${v_GEANT}"

elif test $VER = "5.24.00"
then
  VERSION_ROOT=v5r24p00n02
  export ND280ROOT=${BASESOFT_DIR1}/ROOT/${VERSION_ROOT}
  eval "source $ND280ROOT/cmt/setup.sh"
  echo "ROOT  Version : ${VERSION_ROOT} : PATH=${ND280ROOT}"

else
  echo "Put numbers for ROOT version"
  echo "Currently the following versions are available"
  echo " - 6.08.04"
  echo " - 5.24.00"
fi
