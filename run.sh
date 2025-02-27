docker run -d \
-p 8080:3000 \
--name $1 \
--restart unless-stopped \
--env-file .env \
-v $(pwd)/data:/data \
ghcr.io/requarks/wiki:2.5
