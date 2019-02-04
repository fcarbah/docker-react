#multistep docker build

#build phase
From node:alpine as builder

Workdir /var/www/html

Copy package.json .

Run npm install

Copy . .

Run npm run build


#run phase
From nginx

#expose port -- allows elasticbeanstalk to open port 80
Expose 80

#copy from build phase
Copy --from=builder /var/www/html/build /usr/share/nginx/html