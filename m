Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28B2C46467
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Jan 2023 00:40:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5997566;
	Thu, 12 Jan 2023 00:36:36 +0000 (UTC)
Received: from mxint.skidrow.la (mxint.skidrow.la [45.79.85.189])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ace83e71
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2023 17:01:21 +0000 (UTC)
Received: from mxint.skidrow.intra (mxint.skidrow.intra [192.168.177.206])
 by mxint.skidrow.la (Postfix) with ESMTPSA id B9099209AC;
 Wed,  4 Jan 2023 17:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mxint.skidrow.la B9099209AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidrow.la;
 s=20200308; t=1672851678;
 bh=CyhinR71Igor3qpPh2WBDDVmpsqeqb3LiGexJZehSYw=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=JKjUG8vS7Qpty7Kuni5+CTTN0hQDCZyYphwCMQ73qhTkF35ymeY3Y82i7FVHSeUTv
 waHXvlVOaBLIjkjYmuFbO6y/jX4u+aSs4771jI9X7/beUd8tUYNV6LQeRnyuwkUkZV
 c/H2vOTY/xzAGo7bY+bVo6osBnZ5z/D3ypSzerY9Si8Is6pcDtz5bywDZwL7FWU7Ko
 LrY6bxdnC6Qv0+uLcrFDxrGW9GmtR2N8DROsjHYEaaO82T2TNs720KTm/wVCdzl8cr
 hl2jneCNU3V3f79p/PDs0+YJ9OQaSsDrW1OwGGOUdvoGw1JTGPlO8qu0qRHY6svpBn
 k1gQTSvmB5HNw==
MIME-Version: 1.0
Date: Wed, 04 Jan 2023 09:01:18 -0800
From: Jeremy Hansen <jeremy@skidrow.la>
To: "Contact@nagel-mail.com" <contact@nagel-mail.com>, Wireguard
 <wireguard@lists.zx2c4.com>
Subject: Re: Prevent all traffic from going through the WG tunnel
In-Reply-To: <C52E1F98-95C4-41C4-BF67-10618CDF0AEB@nagel-mail.com>
References: <8798af73660eb86c6fd661be90af8b73@skidrow.la>
 <C52E1F98-95C4-41C4-BF67-10618CDF0AEB@nagel-mail.com>
Message-ID: <d57da2b0589d47af917132a1342a9480@skidrow.la>
X-Sender: jeremy@skidrow.la
Organization: Skidrow
Content-Type: multipart/signed; protocol="application/pgp-signature";
 boundary="=_2ab95b4adaee65f7a6f9fcc84dc063ac"; micalg=pgp-sha256
X-Mailman-Approved-At: Thu, 12 Jan 2023 00:36:34 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)

--=_2ab95b4adaee65f7a6f9fcc84dc063ac
Content-Type: multipart/mixed;
 boundary="=_fd5ae5900cd5d853b9480db49355851d"

--=_fd5ae5900cd5d853b9480db49355851d
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8;
 format=flowed


Thank you for all who answered.  This is working as expected now and I 
have a better understanding of how the AllowedIPs config works as well.

-jeremy

On 2023-01-04 06:47, Contact@nagel-mail.com wrote:
> Hello,
> As I understand your question, you are trying to accomplish, that only
> your WireGuard network ( extracted from your config some 10.0.0.0/8
> network. The 192.168.128.0/17 would be a home network?)
> Will be routed from your client to your WireGuard server. The rest
> should just leave your client network card and routed from your local
> network. For that you simply have to set: AllowedIPs = 10.10.10.1/32
> Or the whole 10.x/x Network you are using.
> Hope I understood your question correctly.
> 
> Mit freundlichen Grüßen / best regards
> 
> J. Nagel
> Fachinformatiker Systemintegration
> 
> Contact@Nagel-Mail.com
> 
>> Am 04.01.2023 um 14:47 schrieb Jeremy Hansen <jeremy@skidrow.la>:
>> 
>> ﻿I have a remote network that I've tied in to my WG server.  I'm 
>> noticing that all traffic from this remote network that goes outbound 
>> to the internet is getting routed through my wireguard server.
>> 
>> Client config:
>> [Interface]
>> PrivateKey = XXXX
>> Address = 10.10.10.10/32
>> ListenPort = 51821
>> 
>> [Peer]
>> PublicKey = XXXX
>> Endpoint = 11.11.11.11:51821 <- IP of the WG server.
>> AllowedIPs = 0.0.0.0/0, ::/0
>> PersistentKeepAlive=25
>> 
>> 
>> Server config:
>> [Interface]
>> PrivateKey = XXXX
>> Address = 10.10.10.1/32
>> ListenPort = 51821
>> 
>> PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o 
>> %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eno1 -j MASQUERADE
>> PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o 
>> %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eno1 -j MASQUERADE
>> 
>> # IP forwarding
>> PreUp = sysctl -w net.ipv4.ip_forward=1
>> 
>> [Peer]
>> PublicKey = XXXX
>> AllowedIPs = 10.10.10.10/32, 192.168.128.0/17 <- Client's internal 
>> network.
>> 
>> 
>> My goal is that regular outbound traffic just goes out the client 
>> node's outside routable interface and traffic between the internal 
>> networks goes through wireguard.
>> 
>> For example, I'm seeing email being sent through the MTA I have 
>> configured on the "client" is showing up as originating from the 
>> outbound IP of the "server".
>> 
>> Thanks!
>> <0x1BF1B863.asc>

--=_fd5ae5900cd5d853b9480db49355851d
Content-Transfer-Encoding: 7bit
Content-Type: application/pgp-keys;
 name=0x1BF1B863.asc
Content-Disposition: attachment;
 filename=0x1BF1B863.asc;
 size=3959

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=WcFU
-----END PGP PUBLIC KEY BLOCK-----

--=_fd5ae5900cd5d853b9480db49355851d--


--=_2ab95b4adaee65f7a6f9fcc84dc063ac
Content-Type: application/pgp-signature;
 name=signature.asc
Content-Disposition: attachment;
 filename=signature.asc;
 size=833
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE6ymR/mT7hGiXMC8qMnfv/BvxuGMFAmO1sN4ACgkQMnfv/Bvx
uGMffQ/9FfxTS/cVMdNB2vqSoTRo+gEThegzZHGUMJmpkzDI4jLOpVmUOJ1ZkSyp
EqXju88OoNwGNJTVvsg3d1StfMq7hLYEa+SFCCBVZZR9mdGnT4g4LuA05J73RMX2
L2HmihD3Ry0b6QPOWYt224cXw0w4/D9Kt11pafrLFrxwP5rx80PTEYVLoEMoriGt
2sgN2jUA4SOsiQYvf9uCZL+I2NZcJuRIt85OMEJ8ZIy5dXmdeCxgZ66ZjUu4lExI
qn80cCes19eg82CpxUAFkW6YkwtXxWY8YWvFRjk+pRkQFT26BbfmhPQVJEV4UKOy
oSbwuCJLuOvmdW72EBiOZU7vALPeRJborLJt/NJqEBV2l4q3ivYrNEhUK9BGBWSV
v44zUe1x3uK3/cRUrocSNRbLkn9gP5rNc5mNVlIjawGXSyJrCDyyYEfF16IvL4EA
uJ7JvpF5z9ri+6Zip+6sojrg8RXepzkOZBHIClGGoNtVLOgTljcLIP3Oja8/k+zW
r3NKWVB/2KePGUgpZ8mua8nHwYpOiRzud2SXaC11OQN+pETgQjJ3JXCz6ODuEJoh
gg1QHXh5mO9bHQOXhnqE7pHpmQ6NsGsqJj1xKOmGDP6nOvmChqmEVIL9RGEatcf/
wdoSz0CNr74zJmcKcWa8YXTyK2zDQ6Wsq3/WhyKsTL7A5sS0Y7U=
=tCdv
-----END PGP SIGNATURE-----

--=_2ab95b4adaee65f7a6f9fcc84dc063ac--
