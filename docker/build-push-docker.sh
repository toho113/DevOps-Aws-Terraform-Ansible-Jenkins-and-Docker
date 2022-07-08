#! /bin/bash

echo "Number of Argurments: $#"
if [ $# -ne 1 ];
then
	echo "Usage: build-push-docker [repository name]"
else
	echo "$ sudo docker build . -t $1"
	sudo docker build . -t $1

	echo "$ sudo docker push $1"
	sudo docker push $1
fi
