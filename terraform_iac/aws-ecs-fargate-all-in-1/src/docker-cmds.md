1. docker build . -t dhruv2910/node-web-app

2. 
# Display first five created images.
docker image ls | head -5

# Display last five created images.
docker image ls | tail -5

3. docker run -p 49160:8080 -d dhruv2910/node-web-app

4. docker logs <container id>

5. 
# Enter the container
docker exec -it <container id> /bin/bash

6. 
# Stop our running container
docker stop <container id>

# Delete our running container
docker rm <container id>

# Kill our running container
docker kill <container id>

7. 
# Remove created docker image
docker rmi 