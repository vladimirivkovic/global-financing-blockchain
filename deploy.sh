#!/bin/bash

docker cp contract/ peer0.org1.example.com:/home/

docker exec -it peer0.org1.example.com bash
    CORE_PEER_LOCALMSPID=Org1MSP
    CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp
    peer chaincode install -n globalfinancing -v 1.0 -l node -p /home/contract/
    peer chaincode instantiate -n globalfinancing -v 1.0 -c '{"Args":["instantiate"]}' -C mychannel

cd javascript
node enrollAdmin.js
node registerUser.js

cd ..
cp javascript/wallet/user1 web-app/controller/restapi/features/fabric/_idwallet/


