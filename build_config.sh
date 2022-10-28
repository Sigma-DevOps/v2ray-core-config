if [ "$outbound_mode" = freedom ]; then
    eval "echo \"$(cat config_patterns/freedom_outbound.json)\"" >outbound_config.json
elif [ "$outbound_mode" = vmess ]; then
    eval "echo \"$(cat config_patterns/vmess_outbound.json)\"" >outbound_config.json
else
    echo "No outbound_mode is defined"
    exit -1
fi

eval "echo \"$(cat config_patterns/vmess_inbound.json)\"" >inbound_config.json

vmess_inbound_config=$(cat inbound_config.json)
outbound_config=$(cat outbound_config.json)

eval "echo \"$(cat config_patterns/base_config.json)\"" >config.json

rm inbound_config.json outbound_config.json
