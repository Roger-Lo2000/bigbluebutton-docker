#!/bin/sh
set -e

TARGET=/bbb-pads/config/settings.json

cp /bbb-pads/config/settings.json.template $TARGET
sed -i "s/ETHERPAD_API_KEY/\"$ETHERPAD_API_KEY\"/g" $TARGET
jq '.etherpad.host = "5.1.0.4"' $TARGET | sponge $TARGET
jq '.express.host = "0.0.0.0"' $TARGET | sponge $TARGET
jq '.redis.host = "5.1.0.5"' $TARGET | sponge $TARGET


cd /bbb-pads
export NODE_ENV=production
npm start
