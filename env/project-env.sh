export MIHOST=$(hostname -s)
export PROJECTNAME=IUCN-GET-assembly-models
export PROJECTDIR=proyectos/IUCN-GET

case $MIHOST in
terra)
  export SCRIPTDIR=$HOME/$PROJECTDIR/$PROJECTNAME
  ;;
roraima)
  export SCRIPTDIR=$HOME/$PROJECTDIR/$PROJECTNAME
  ;;
esac

export WORKDIR=$SCRIPTDIR/sandbox/
  
mkdir -p $WORKDIR

grep -A4 psqlaws $HOME/.database.ini | tail -n +2 > ${WORKDIR}/tmpfile
while IFS="=" read -r key value; do
  case "$key" in
    "host") export DBHOST="$value" ;;
    "port") export DBPORT="$value" ;;
    "database") export DBNAME="$value" ;;
    "user") export DBUSER="$value" ;;
  esac
done < ${WORKDIR}/tmpfile
rm ${WORKDIR}/tmpfile

