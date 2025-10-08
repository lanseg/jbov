# Just a Bunch of VPNs
Just a Bunch of VPNs with a certbot that gets certificates from letsencrypt. Certbot starts first,
retrieves or updates the certificates if needed and makes them available in a shared volume
for the VPNs.

## Configuration

As everywhere in Docker, configuration is done with env variables.

|Name             |Values    |Services|Description                                                 |
|-----------------|----------|--------|------------------------------------------------------------|
|DRY_RUN          |true/false|certbot |Makes certbot simulate certificate retrieval, for troubleshouting or DNS checks|
|DOMAINS          |comma-separated list of domain names|certbot|Certbot will get certificates for these domains|
|EMAIL            |email     |certbot |Optional. Letsencrypt will add this email to the certificate |
|CAMOUFLAGE_SECRET|string    |ocserv  |Part that goes as a query param to confuse some traffic analysers, e.g. "https://your.server.com/?CAMOUFLAGE_SECRET"|
|DOMAIN|string|ocserv|Domain name for the VPN server. There must be a certificate issued for this domain and available at "/certs/config/live/"|
|MAX_CLIENTS|number|ocserv|Maximum number of connection the VPN server can handle
|IPV4_NETWORK|IPV4 netmask|ocserv|Network for the clients.|

## Security

Non-root user for the service in a container. No hardening or extended protection measures.

## Plans

Now I'm working on adding a couple of other VPN servers (like Wireguard or OpenVPN) that will have
similar configuration or some more sophisticated protocols that could be started as easy.
