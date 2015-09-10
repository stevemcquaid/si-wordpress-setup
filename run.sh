#!/bin/bash

jekyll build --source /Users/smcquaid/Dropbox/Code/Sensory_Interactive/SI-Code/si-static-responsive --destination /Users/smcquaid/Dropbox/Code/Sensory_Interactive/SI-Code/si-wordpress-setup/.render

docker build --rm -t smcquaid/webapp docker-nginx-php/.

CID=$(docker run -v /Users/smcquaid/Dropbox/Code/Sensory_Interactive/SI-Code/si-wordpress-setup/.render/:/var/www:rw -p 80:80 -d smcquaid/webapp /sbin/my_init --enable-insecure-key)

echo "$(docker logs $CID )"

docker ps

/usr/share/nginx/html/si-static-responsive

# open http://localhost:port


###################################

#!/bin/bash

docker build --rm -t smcquaid:sisite .

CID=$(docker run -d -v /Users/smcquaid/Dropbox/Code/Sensory_Interactive/SI-Code/si-static-responsive/:/usr/share/nginx/html/si-static-responsive/ -P smcquaid:sisite)

echo "$(docker logs $CID )"

docker ps

/usr/share/nginx/html/si-static-responsive

# open http://localhost:port


jekyll build --source /Users/smcquaid/Dropbox/Code/Sensory_Interactive/SI-Code/si-static-responsive --destination /Users/smcquaid/Dropbox/Code/Sensory_Interactive/SI-Code/si-wordpress-setup/static_render

docker run -v /Users/smcquaid/Dropbox/Code/Sensory_Interactive/SI-Code/si-static-responsive/:/var/www:rw -p 80:80 -d smcquaid/webapp /sbin/my_init --enable-insecure-key






