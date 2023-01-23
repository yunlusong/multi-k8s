docker build -t andyylsong/multi-client:lastest -t andyylsong/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t andyylsong/multi-server:lastest -t andyylsong/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t andyylsong/multi-worker:lastest -t andyylsong/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker
docker push andyylsong/multi-client:latest
docker push andyylsong/multi-client:$GIT_SHA
docker push andyylsong/multi-server:latest
docker push andyylsong/multi-server:$GIT_SHA
docker push andyylsong/multi-worker:latest
docker push andyylsong/multi-worker:$GIT_SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=andyylsong/multi-server:$GIT_SHA
kubectl set image deployments/client-deployment client=andyylsong/multi-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=andyylsong/worker-worker:$GIT_SHA
