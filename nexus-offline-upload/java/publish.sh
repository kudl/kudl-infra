if [ "$#" -ne 2 ]; then
    echo "ID, PASSWORD warning"
    exit 2
fi

SCRIPT_PATH=$(dirname $(realpath $0))
NEXUS_HOSTS="http://<nexus domain>/service/rest/v1/components?repository=<repository host group>"
MAVEN_REPOSITORY="maven-repository.txt"
USER_NAME=$1
PASSWORD=$2

while IFS=: read -r group_id artifact_id version filename
do
  [ -z "$group_id" ] && continue

  curl -X POST -u $USER_NAME:$PASSWORD "$NEXUS_HOSTS" -H "accept: application/json" -H "Content-Type: multipart/form-data"\
    -F "maven2.groupId=$group_id" -F "maven2.artifactId=$artifact_id" -F "maven2.version=$version" -F "maven2.generate-pom=false"\
   -F "maven2.packaging=$group_id" -F "maven2.asset1=@$SCRIPT_PATH/data/$filename" -F "maven2.asset1.extension=${filename##*.}"

  echo $filename
done < "$SCRIPT_PATH/$MAVEN_REPOSITORY"
