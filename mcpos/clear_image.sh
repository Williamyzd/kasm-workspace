docker images | egrep 'web|<none>' | awk '{print $3}' | xargs docker rmi

