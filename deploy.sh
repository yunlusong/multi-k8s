docker buld -t yunlusong/multi-client:lastest -t yunlusong/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t yunlusong/multi-server:lastest -t yunlusong/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t yunlusong/multi-worker:lastest -t yunlusong/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker
docker push yunlusong/multi-client:latest
docker push yunlusong/multi-client:$GIT_SHA
docker push yunlusong/multi-server:latest
docker push yunlusong/multi-server:$GIT_SHA
docker push yunlusong/multi-worker:latest
docker push yunlusong/multi-worker:$GIT_SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=yunlusong/multi-server:$GIT_SHA
kubectl set image deployments/client-deployment client=yunlusong/multi-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=yunlusong/worker-worker:$GIT_SHA
