Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e76f793
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 May 2017 15:20:52 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.117])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbb3edb7
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 May 2017 15:20:52 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Florian Klink <flokli@flokli.de>, wireguard@lists.zx2c4.com
Subject: Re: [PATCH] tools: add wireguard@.service
In-Reply-To: <20170526084423.31088-1-flokli@flokli.de>
References: <20170526084423.31088-1-flokli@flokli.de>
Date: Fri, 26 May 2017 11:30:26 -0400
Message-ID: <87wp93octp.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain

Hi Florian--

On Fri 2017-05-26 10:44:23 +0200, Florian Klink wrote:
> If you simply want to create wireguard interfaces and configure them,
> wg-quick might be too much, as it also configures Addresses, MTU and
> adds routes. This unit file can be used in cases where you want to use
> wg(8) to configure the wireguard interface, but do regular network
> configuration on top of the link by something else (possibly not knowing
> wireguard, like systemd-networkd or NetworkManager.

I like this suggestion, but i see it as a stopgap until there is real
integration with systemd-networkd -- this would ideally be a .network
unit just like every other network interface, right?

A couple thoughts on the .service file:

> diff --git a/src/tools/wireguard@.service b/src/tools/wireguard@.service
> new file mode 100644
> index 0000000..b6d53bf
> --- /dev/null
> +++ b/src/tools/wireguard@.service
> @@ -0,0 +1,19 @@
> +[Unit]
> +Description=WireGuard via wg(8) for %I
> +After=network-online.target
> +Wants=network-online.target

This implies that the network is online *before* the interface comes up.
That means that other tools which depend on the wireguard link being
established can no longer depend on network-online.target, right?

> +Documentation=man:wg(8)
> +Documentation=https://www.wireguard.io/
> +Documentation=https://www.wireguard.io/quickstart/
> +Documentation=https://git.zx2c4.com/WireGuard/about/src/tools/wg.8

I think given the use of the conf file, the [Unit] section should also
have:

ConditionFileNotEmpty=/etc/wireguard/%i.conf

Regards,

        --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAlkoShIACgkQFJitxsGS
Mjd6bxAAkxDYyLriUMnXwbCfjF2loqPFfw5J6ZQGqb8Je69ASj6u15Znp/azIgZC
K5aAVTZCY7UgYFxypdhymg3mghDUIs4pnh0tgTrYK3XVTgqFQnNtLEe1T182CG2g
Qgsc6YKCwle4NdXBzqXDPDQLGXzvd7RLfnEAOCqWZwV6ZaAi0Pv6CJXa89xDOAPG
LdZiUb1aODW5c9igb01a0PHvjxnvkZvJFjHa/N0ed9cfebrFMqaGHf+4wEkEdPYz
1k2smvfyJs5aYzFdyCLd7jRH75DOwKdARJE4miGPUxHzF1BubUSFEvj7KTI4Gf9J
Nm9ny6a5BK/yXLT2T99ecQR9mn4rjngvkE1g9xxaZ6rLz9vXWKrwUw3cGWKJsho5
ul85kI5Wq7gkIA9yiRyRUf+VUauXypBFLTiqVbcjq5G7jlSrDeoKMQZiFg6B3ZU1
6Y71v6+/gUDretTd2cTyCme4Q2X1h5hrj8UqNkYfIibIOi7axvplj1r+A3UiOf64
nGfGGqfA1RngElVrYLjAIqt92ZklZN3+cAgF9dp0KKZOKBtTVcrl0hkOUGf0eBnm
rFhqsc7Ds+CwFa8XVvPtRDw54C1z/wxv/nXaNhRmewNqKHkdNi3UvpHqGTHUzUI5
d7YSwPY2MM9tpX+OS2QOEImpsQ8Fh/Ciihe7oLXnX8pGIe/uXy0=
=xMFA
-----END PGP SIGNATURE-----
--=-=-=--
