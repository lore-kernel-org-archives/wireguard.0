Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24E8C2BD09
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Jun 2024 11:35:31 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31677768;
	Thu, 27 Jun 2024 11:35:29 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch [185.203.114.86])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c7268044
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jun 2024 11:35:26 +0000 (UTC)
Received: from bridge.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id C7BFF20CCD;
 Thu, 27 Jun 2024 13:35:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1719488125;
 bh=cJLrh0NKao6w16sZGADfulXouRgQ0UJeKE1T8f9f6IQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fWGibKEPdB8Tw+jIeUm4cgCX/Tx5yDVksCjf4zzovUE7u4yFTW+sgxY3K7cEPrXou
 kdRb7+IIwIoKgXUR+YawtBe4SpaT41UBO5eQYHJi9W6qY1ACUM6EOwz0ivZAjTRdLG
 66BBw++IWa+aMLI0Jggrl/8dFHSUsOLeWUnuphm/d6s24wOYoyE0nUUur2QkNfitpU
 bkComK765WDXjXJKA1KZCICNftXU3edRL2zcEUQXujvE+NjZexIe9e+zuaeD5sZDCw
 OerXYhoHnoao1I8Sikg60zB+IAagSFZk7utMZUl4QwfTzkjw7uFn+6fpTV3fT7Th+4
 VinAHncOFlJjA==
Received: by bridge.localdomain (Postfix, from userid 1000)
 id 8750B1A6A2B7; Thu, 27 Jun 2024 13:33:23 +0200 (CEST)
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Adrian Larsen <alarsen@maidenheadbridge.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Fwd: Wireguard address binding - how to fix?
In-Reply-To: <43aac110-8699-41b3-bad8-7a38bf984b45@maidenheadbridge.com>
 (Adrian Larsen's message of "Mon, 24 Jun 2024 10:36:06 +0100")
References: <740ee793-0ed2-4cf6-ba4a-07268b46b761@maidenheadbridge.com>
 <43aac110-8699-41b3-bad8-7a38bf984b45@maidenheadbridge.com>
Date: Thu, 27 Jun 2024 13:33:18 +0200
Message-ID: <87ed8ihb7l.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
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

--=-=-=
Content-Type: text/plain


Hello Adrian,

I tried 1,2 and 3 and observed that wireguard seems to be taking the correct
routing table when using fwmark:

--------------------------------------------------------------------------------
# cat /etc/wireguard/or3ge.conf
[Interface]
PrivateKey = ...
Address = 2a0a:5480:5:2::2/64
Table = off
FwMark = 0x42

[Peer]
PublicKey = 3WNj2YuTTm+5wpsAOauRQ3bEMv/WXcKMDZXbJPB8fx0=
AllowedIPs = ::/0, 0.0.0.0/0
Endpoint = 194.5.220.43:5001
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
[09:32] server142.place10:~# ip r sh table 42
194.5.220.0/24 via 192.168.1.254 dev eth1 proto bird metric 32
194.187.90.23 via 192.168.1.254 dev eth1 proto bird metric 32
212.103.65.231 via 192.168.1.254 dev eth1 proto bird metric 32
[09:32] server142.place10:~# ip rule ls
0:      from all lookup local
32765:  from all fwmark 0x42 lookup 42
32766:  from all lookup main
32767:  from all lookup default
--------------------------------------------------------------------------------

So the long story short is that one cannot match on the ip address with
wireguard, potentially because it does not do the address binding by
default.

But I have to say thanks, at least one problem solevd for the moment!

Best regards,

Nico

Adrian Larsen <alarsen@maidenheadbridge.com> writes:

> Hi Friends,
>
> You can achieve address binding on a Linux box with a mix of marking,
> ip rules, ip route and Source NAT.
>
> 1) On WG interface, add "FwMark = 0x34" (the value 0x34 is an example,
> you can put any value here)
>
> 2) Create IP Rule "from all fwmark 0x34 lookup rt_wg0_out" -> this
> will force the outgoing packet to use the route table "rt_wg0_out"
>
> 3) On the route table "rt_wg0_out" create the default or specific
> route to force the packet market with 0x34 to leave using the
> interface where your desire "IP address" resides.
>
> 4) Create a POSTROUTING -> SNAT forcing mark 0x34 via the desired "IP
> address". This will bind your "IP address".
>
> Done! The packet with mark 0x34 will be routed via the correct
> interface using the source IP you want.
>
> I hope this helps.
>
> Best regards,
>
> Adrian Larsen
> Maidenhead Bridge
> Cloud Security Connectors for SSE vendors.
> m: +44 7487640352
> e:alarsen@maidenheadbridge.com
>
> On 09/06/2024 16:39, Nico Schottelius wrote:
>> Jason,
>>
>> may I shortly ask what your opinion is on the patch and whether there is
>> a way forward to make wireguard usable on systems with multiple IP
>> addresses?
>>
>> Best regards,
>>
>> Nico
>>
>> Nico Schottelius<nico.schottelius@ungleich.ch>  writes:
>>
>>> d tbsky<tbskyd@gmail.com>  writes:
>>>> I  remembered how exciting when I tested wireguard at 2017. until I
>>>> asked muti-home question in the list.
>>>> wiregurad is beautiful,elegant,fast but not easy to get along with.
>>>> openvpn is not so amazing but it can get the job done.
>>> Nice summary, hits the nail quite well.
>>>
>>> Jason, do you mind having a look at the submitted patches for IP address
>>> binding and comment on them? Or alternatively can you give green light
>>> for generally moving forward so that a direct inclusion in the Linux
>>> kernel would be accepted?
>>>
>>> Best regards,
>>>
>>> Nico
>>>

--=-=-=
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--==-=-=
Content-Type: text/plain


--
Sustainable and modern Infrastructures by ungleich.ch

--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJRBAEBCgA7FiEEZZsNkehufiT9FWnQxykhoSk/LSQFAmZ9Tf4dHG5pY28uc2No
b3R0ZWxpdXNAdW5nbGVpY2guY2gACgkQxykhoSk/LSSeVRAAkzLOYerh+twOE6JK
EaL0hynz2CnFDS1+B3u2dS17EdZpRlZrdBWjGv5O9yeChUoLBc+LOXAghQk/n84n
FXcPcKJ6WLeDftnXhX7xylOWVaW1jSiAxGDgqNsPecFpDS+302ZtRMllyiuv262e
ZZ7DBpzS0ESF5u3EjhgIHPGC13zcy53rABPJ8DabXVIIe0mJRUvojqtuHv1h1Bwq
VfWFvfQf6EJaqZJ77UJeTmBKq7lwj9PmV2ow+W7MXzs5d+DKHde+oqJfNyMloCCO
NdLIT50tJhkIsH7TrJIiBqRtiXS5HGY1IQKDflTk3HK8bQb8YaAbHjbtKXNTthn3
NiIXFAeF5AgeGOIf5Zj9cEBkCPBxJAci3ky6fZ67+kyrG/F4uLtcm1JX5xtMmy9i
STo50Pezwy+RLAZ+DGlGNs01fTXfeBy5rIk03ssCYz6ibU0KZXPfN3nioQquh9RF
4vD/ibkn+fOeJxUJw5yHWFSFRADoi66i68++nb9GVbXaaNWQRgJhkY1nGMqr2ViI
GuaGAVA/WyOIBYaHQr+oMlFLJDKrmGtukB7l9/V1KkODT4vSO1of9oQHS4fRqzvA
6qFHPBqYhVakvWDTS2d2FALLvsJIOAvZyCIFmhJXZ4Ya6/rL9WpyGR7V9clumdmR
If8VLijEzEj7o8rSilNpKFPoJkc=
=W03H
-----END PGP SIGNATURE-----
--==-=-=--

--=-=-=--
