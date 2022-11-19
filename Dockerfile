FROM v2fly/v2fly-core

ARG outbound_mode=freedom

ARG vmess_outbound_address=1.1.1.1
ARG vmess_outbound_port=80
ARG vmess_outbound_uuid="5ec21013-aa58-433a-ade5-caf033f3817b"
ARG vmess_outbound_alterid=0
ARG vmess_outbound_level=0
ARG vmess_outbound_security="auto"
ARG vmess_outbound_transport="ws"
ARG vmess_outbound_path="/"

ARG vmess_inbound_listen_address=0.0.0.0
ARG vmess_inbound_uuid="2135915d-9f55-46e9-8379-efe79a276257"
ARG vmess_inbound_alterid=0
ARG vmess_inbound_path="/"

ARG http_proxy_listen_port=8000
ARG socks_proxy_listen_port=1080
ARG vmess_inbound_listen_port=80

ENV V2RAY_VMESS_AEAD_FORCED false

EXPOSE $http_proxy_listen_port $socks_proxy_listen_port $vmess_inbound_listen_port

ADD . /root
WORKDIR /root
RUN sh build_config.sh
RUN cp /root/config.json /etc/v2ray/config.json
RUN cat ./config.json

CMD ["run"]
