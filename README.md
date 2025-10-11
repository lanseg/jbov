# Just a Bunch of VPNs
Just a Bunch of VPNs with a certbot that gets certificates from letsencrypt. Certbot starts first,
retrieves or updates the certificates if needed and makes them available in a shared volume
for the VPNs.

## Configuration

As everywhere in Docker, configuration is done with env variables.

|Service |Param             |Values      |Description                                                 |
|--------|------------------|------------|------------------------------------------------------------|
|certbot |DRY_RUN           |true/false  |Makes certbot simulate certificate retrieval, for troubleshouting or DNS checks|
|certbot |DOMAINS           |comma-separated list of domain names|Certbot will get certificates for these domains|
|certbot |EMAIL             |email       |Optional. Letsencrypt will add this email to the certificate |
|all vpns|DOMAIN            |string      |Domain name for the VPN server. There must be a certificate issued for this domain and available at "/certs/config/live/"|
|all vpns|MAX_CLIENTS       |number      |Maximum number of connection the VPN server can handle|
|all vpns|IPV4_NETWORK      |IPV4 netmask|Network for the clients.|
|ocserv  |CAMOUFLAGE_SECRET |string      |Part that goes as a query param to confuse some traffic analysers, e.g. "https://your.server.com/?CAMOUFLAGE_SECRET"|

## Security

Non-root user for the service in a container. No hardening or extended protection measures.

## Plans

Now I'm working on adding a couple of other VPN servers (like Wireguard or OpenVPN) that will have
similar configuration or some more sophisticated protocols that could be started as easy.
