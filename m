Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A283C64EB1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:13:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE70120989
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE70120989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=activezone.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a515c3e;
	Thu, 6 Dec 2018 23:05:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3861287d
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Nov 2018 17:26:55 +0000 (UTC)
Received: from titan-smx.freebsdcloud.com (titan-smx.freebsdcloud.com
 [IPv6:2001:4b88:1002:0:82:206:32:1960])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85f480b8
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Nov 2018 17:26:55 +0000 (UTC)
Received: from [IPv6:2001:4b88:1002:82:206:32:240:1000]
 (1000-240-32-206-82.ipv6.0xdeadc0de.eu
 [IPv6:2001:4b88:1002:82:206:32:240:1000]) (authenticated bits=0)
 by titan-smx.freebsdcloud.com (8.15.2/8.15.2) with ESMTPSA id wAQHXm8n005745
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <wireguard@lists.zx2c4.com>; Mon, 26 Nov 2018 18:33:48 +0100 (CET)
 (envelope-from markus@activezone.de)
X-Authentication-Warning: ns2.freebsdcloud.com: Host
 1000-240-32-206-82.ipv6.0xdeadc0de.eu
 [IPv6:2001:4b88:1002:82:206:32:240:1000] claimed to be
 [IPv6:2001:4b88:1002:82:206:32:240:1000]
To: wireguard@lists.zx2c4.com
From: Markus Grundmann <markus@activezone.de>
Openpgp: preference=signencrypt
Autocrypt: addr=markus@activezone.de; prefer-encrypt=mutual; keydata=
 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
Subject: Simple Shell Script for "Status Monitoring" your WireGuard
Message-ID: <59d2f673-9525-0535-7143-a515a1b7f7e0@activezone.de>
Date: Mon, 26 Nov 2018 18:33:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:05:18 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7964282043375100309=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7964282043375100309==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="X9dXZiI78GaV6pAiMbToaUrQVWn6nghT6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--X9dXZiI78GaV6pAiMbToaUrQVWn6nghT6
Content-Type: multipart/mixed; boundary="70IXvvy9Hbsmni0saBOpX9i4h5mfvSdCP";
 protected-headers="v1"
From: Markus Grundmann <markus@activezone.de>
To: wireguard@lists.zx2c4.com
Message-ID: <59d2f673-9525-0535-7143-a515a1b7f7e0@activezone.de>
Subject: Simple Shell Script for "Status Monitoring" your WireGuard

--70IXvvy9Hbsmni0saBOpX9i4h5mfvSdCP
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Hi!

I'm new to WireGuard and a formerly user with some experiences on
OpenVPN with complex setups but sometimes (I believe) a tools must be
changed ;-)

Now my environment will be migrated to WireGuard and I have wrote a
little shell script to get a status page for my peerings.

If you are interested on this script please visit the following site:

https://activezone.de/wireguard/

A screenshot let you know what type of information the script offers as
HTML output on your webserver. My WireGuard server has no WWW interface
but I connecting from a webserver to the system with WireGuard over SSH
by a simple CGI and then I fetch the output of a script named
"wireguardinfo". However! Use/modify it on your own risk and I hope some
users of WireGuard have some benefits on this script.

Thank you for WireGuard. A easy to configure VPN solution!

--=20
Best regards,
Markus

Better Privacy with PGP encrypted Mail: http://activezone.de/pgp/
Fingerprint: 58C5 8BAF 6FCE B24F 1881 B5B8 F2A8 E1D0 484B 0054
Threema ID: 7ZRET2JY

=E2=80=9EWer die Freiheit aufgibt um Sicherheit zu gewinnen,
 der wird am Ende beides verlieren.=E2=80=9C -- Benjamin Franklin


--70IXvvy9Hbsmni0saBOpX9i4h5mfvSdCP--

--X9dXZiI78GaV6pAiMbToaUrQVWn6nghT6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJb/C57AAoJEPKo4dBISwBUJ0UP/34CJOpInRvGtwGhirRAV03r
TrM0kA3vMnSNE6KflbyugEmsu7H7/XKOaShVTtksyKHcE48aX+UT26QDaRUZnMXv
3+775vM+slmI0bJbdoowF+MPxL9+Vi/beyaB3FPJD7zzYN4FS4PmvNf4xxgJF95Y
Nq4HXf8+mZ4eLkFd/Q5mQS2rLZn4nzIpra640LmouA4Y9TaQfRdBs03N6ewAGNir
7URaTN42wr4e2/NlycK5B+1k63vt/GpqVsyiEq0BkVAZ7gqLwII1MQqEBvl8v33p
YtAW6nsF7TMsHyUeWVt7VPqCGI6WgTY51s8vhSvrxh6YL3TcEAVe3XWurM5zfSAe
H/aUXDsUjweTVL0gcHhlGQx0QTAaNh85Ixi2yZL0e0JdBOtuKYkGwHzN5+35d+rm
vWBPPeYXAAsXXIuF2b3p6Yv6NkE7HWYveemNxpRUFRxv/aZK2Ih1gY3sKQgTWNSn
zfNn0hf1czFlpl4JCJo5zq5/XuzPmu2ijSThy+KjsYrzeUqYdtBbNEEaiS7h7ua/
gVvuGIpRC68qpHvzU9LI8EpM1MvOC9qRvOLU9jgUEYMcwu3xeM+idNsWhM0n5poQ
CW1dSfd2ouwByLq9ui7O4Mpc1vmz4Ahovnz4p+3y9fNR4tV/Ewagm+Zch8FxX55y
iB3EO2MSFZHNYAPD5d2X
=J9TM
-----END PGP SIGNATURE-----

--X9dXZiI78GaV6pAiMbToaUrQVWn6nghT6--

--===============7964282043375100309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7964282043375100309==--
