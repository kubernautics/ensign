#!/bin/bash
podman create \
    --name subspace \
    --restart always \
    --network host \
    --cap-add NET_ADMIN \
    --volume /usr/bin/wg:/usr/bin/wg \
    --volume /data:/data \
    --env SUBSPACE_HTTP_HOST="subspace.example.com" \
    --env SUBSPACE_NAMESERVER="1.1.1.1" \
    --env SUBSPACE_LISTENPORT="51820" \
    --env SUBSPACE_IPV4_POOL="10.99.97.0/24" \
    --env SUBSPACE_IPV6_POOL="fd00::10:97:0/64" \
    --env SUBSPACE_IPV4_GW="10.99.97.1" \
    --env SUBSPACE_IPV6_GW="fd00::10:97:1" \
    --env SUBSPACE_IPV6_NAT_ENABLED=1 \
  docker.io/subspacecommunity/subspace:latest

podman start subspace
