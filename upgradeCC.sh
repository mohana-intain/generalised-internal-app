#!/bin/bash
#
# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
#

echo "ChaincodeName is:" $1
ChaincodeName=$1

echo "version is :" $2
Version=$2

jq --version > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "Please Install 'jq' https://stedolan.github.io/jq/ to execute this script"
	echo
	exit 1
fi

starttime=$(date +%s)

# Print the usage message
function printHelp () {
  echo "Usage: "
  echo "  ./installCC.sh -l golang|node"
  echo "    -l <language> - chaincode language (defaults to \"golang\")"
}
# Language defaults to "golang"
LANGUAGE="golang"

# Parse commandline args
while getopts "h?l:" opt; do
  case "$opt" in
    h|\?)
      printHelp
      exit 0
    ;;
    l)  LANGUAGE=$OPTARG
    ;;
  esac
done

##set chaincode path
function setChaincodePath(){
	LANGUAGE=`echo "$LANGUAGE" | tr '[:upper:]' '[:lower:]'`
	case "$LANGUAGE" in
		"golang")
		CC_SRC_PATH="github.com/$ChaincodeName/go"
		;;
		"node")
		CC_SRC_PATH="$PWD/artifacts/src/github.com/$ChaincodeName/node"
		;;
		*) printf "\n ------ Language $LANGUAGE is not supported yet ------\n"$
		exit 1
	esac
}

setChaincodePath

echo "POST request Enroll on Org1  ..."
echo
ORG1_TOKEN=$(curl -s -X POST \
  http://localhost:4000/users \
  -H "content-type: application/x-www-form-urlencoded" \
  -d 'username=Jim&orgName=Org1')
echo $ORG1_TOKEN
ORG1_TOKEN=$(echo $ORG1_TOKEN | jq ".token" | sed "s/\"//g")
echo
echo "ORG1 token is $ORG1_TOKEN"
echo
echo "POST request Enroll on Org2 ..."
echo
ORG2_TOKEN=$(curl -s -X POST \
  http://localhost:4000/users \
  -H "content-type: application/x-www-form-urlencoded" \
  -d 'username=Barry&orgName=Org2')
echo $ORG2_TOKEN
ORG2_TOKEN=$(echo $ORG2_TOKEN | jq ".token" | sed "s/\"//g")
echo
echo "ORG2 token is $ORG2_TOKEN"
echo
echo "POST request Enroll on Org3 ..."
echo
ORG3_TOKEN=$(curl -s -X POST \
  http://localhost:4000/users \
  -H "content-type: application/x-www-form-urlencoded" \
  -d 'username=O3&orgName=Org3')
echo $ORG3_TOKEN
ORG3_TOKEN=$(echo $ORG3_TOKEN | jq ".token" | sed "s/\"//g")
echo
echo "ORG3 token is $ORG3_TOKEN"
echo
echo
echo "POST request Enroll on Org4 ..."
echo
ORG4_TOKEN=$(curl -s -X POST \
  http://localhost:4000/users \
  -H "content-type: application/x-www-form-urlencoded" \
  -d 'username=O4&orgName=Org4')
echo $ORG4_TOKEN
ORG4_TOKEN=$(echo $ORG4_TOKEN | jq ".token" | sed "s/\"//g")
echo
echo "ORG4 token is $ORG4_TOKEN"
echo
echo
echo
echo "POST request Enroll on Org5 ..."
echo
ORG5_TOKEN=$(curl -s -X POST \
  http://localhost:4000/users \
  -H "content-type: application/x-www-form-urlencoded" \
  -d 'username=O5&orgName=Org5')
echo $ORG5_TOKEN
ORG5_TOKEN=$(echo $ORG5_TOKEN | jq ".token" | sed "s/\"//g")
echo
echo "ORG5 token is $ORG5_TOKEN"
echo
echo
echo "POST request Enroll on Org6 ..."
echo
ORG6_TOKEN=$(curl -s -X POST \
  http://localhost:4000/users \
  -H "content-type: application/x-www-form-urlencoded" \
  -d 'username=O6&orgName=Org6')
echo $ORG6_TOKEN
ORG6_TOKEN=$(echo $ORG6_TOKEN | jq ".token" | sed "s/\"//g")
echo
echo "ORG6 token is $ORG6_TOKEN"
echo


echo "POST Install chaincode on Org1"
echo
curl -s -X POST \
  http://localhost:4000/chaincodes \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json" \
  -d "{
	\"peers\": [\"peer0.org1.example.com\",\"peer1.org1.example.com\"],
	\"chaincodeName\":\"$ChaincodeName\",
	\"chaincodePath\":\"$CC_SRC_PATH\",
	\"chaincodeType\": \"$LANGUAGE\",
	\"chaincodeVersion\":\"$Version\"
}"
echo
echo

echo "POST Install chaincode on Org2"
echo
curl -s -X POST \
  http://localhost:4000/chaincodes \
  -H "authorization: Bearer $ORG2_TOKEN" \
  -H "content-type: application/json" \
  -d "{
	\"peers\": [\"peer0.org2.example.com\",\"peer1.org2.example.com\"],
	\"chaincodeName\":\"$ChaincodeName\",
	\"chaincodePath\":\"$CC_SRC_PATH\",
	\"chaincodeType\": \"$LANGUAGE\",
	\"chaincodeVersion\":\"$Version\"
}"
echo
echo

echo "POST Install chaincode on Org3"
echo
curl -s -X POST \
  http://localhost:4000/chaincodes \
  -H "authorization: Bearer $ORG3_TOKEN" \
  -H "content-type: application/json" \
  -d "{
	\"peers\": [\"peer0.org3.example.com\",\"peer1.org3.example.com\"],
	\"chaincodeName\":\"$ChaincodeName\",
	\"chaincodePath\":\"$CC_SRC_PATH\",
	\"chaincodeType\": \"$LANGUAGE\",
	\"chaincodeVersion\":\"$Version\"
}"
echo
echo

echo "POST Install chaincode on Org4"
echo
curl -s -X POST \
  http://localhost:4000/chaincodes \
  -H "authorization: Bearer $ORG4_TOKEN" \
  -H "content-type: application/json" \
  -d "{
	\"peers\": [\"peer0.org4.example.com\",\"peer1.org4.example.com\"],
	\"chaincodeName\":\"$ChaincodeName\",
	\"chaincodePath\":\"$CC_SRC_PATH\",
	\"chaincodeType\": \"$LANGUAGE\",
	\"chaincodeVersion\":\"$Version\"
}"
echo
echo

echo "POST Install chaincode on Org5"
echo
curl -s -X POST \
  http://localhost:4000/chaincodes \
  -H "authorization: Bearer $ORG5_TOKEN" \
  -H "content-type: application/json" \
  -d "{
	\"peers\": [\"peer0.org5.example.com\",\"peer1.org5.example.com\"],
	\"chaincodeName\":\"$ChaincodeName\",
	\"chaincodePath\":\"$CC_SRC_PATH\",
	\"chaincodeType\": \"$LANGUAGE\",
	\"chaincodeVersion\":\"$Version\"
}"
echo
echo


echo "POST Install chaincode on Org6"
echo
curl -s -X POST \
  http://localhost:4000/chaincodes \
  -H "authorization: Bearer $ORG6_TOKEN" \
  -H "content-type: application/json" \
  -d "{
	\"peers\": [\"peer0.org6.example.com\",\"peer1.org6.example.com\"],
	\"chaincodeName\":\"$ChaincodeName\",
	\"chaincodePath\":\"$CC_SRC_PATH\",
	\"chaincodeType\": \"$LANGUAGE\",
	\"chaincodeVersion\":\"$Version\"
}"
echo
echo

echo "POST upgrade chaincode on Org1"
echo
curl -s -X POST \
  http://localhost:4000/channels/mychannel/chaincodeupgrade \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json" \
  -d "{
        \"peers\": [\"peer0.org1.example.com\",\"peer0.org2.example.com\",\"peer0.org3.example.com\",\"peer0.org4.example.com\",\"peer0.org5.example.com\",\"peer0.org6.example.com\"],
	\"chaincodeName\":\"$ChaincodeName\",
	\"chaincodeVersion\":\"$Version\",
	\"chaincodeType\": \"$LANGUAGE\",
	\"args\":[],
        \"fcn\":\"\" 
}"

echo
echo

