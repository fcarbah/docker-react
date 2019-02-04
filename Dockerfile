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

#copy from build phase
Copy --from=builder /var/www/html/build /usr/share/nginx/html