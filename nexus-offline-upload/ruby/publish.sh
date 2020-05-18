if [ "$#" -ne 2 ]; then
    echo "ID, PASSWORD warning"
    exit 2
fi

SCRIPT_PATH=$(dirname $(realpath $0))
NEXUS_HOSTS="http://<nexus domain>/service/rest/v1/components?repository=<repository host group>"
USER_NAME=$1
PASSWORD=$2

for entry in "$SCRIPT_PATH"/data/*
do
  curl -X POST -u $USER_NAME:$PASSWORD "$NEXUS_HOSTS" -H "accept: application/json" -H "Content-Type: multipart/form-data" -F "rubygems.asset=@$entry"
  echo ${entry##*/}
done
