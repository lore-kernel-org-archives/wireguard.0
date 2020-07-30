Return-Path: <SRS0=8w0v=BJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9396C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jul 2020 00:57:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D9662075D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jul 2020 00:57:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fphu4gLu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D9662075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3317979c;
	Thu, 30 Jul 2020 00:33:58 +0000 (UTC)
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e3767706
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jul 2020 00:33:55 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id l6so24169683qkc.6
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jul 2020 17:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=c5XK6GIeWGjy/vNGVTSPHqoq3UjtbqP4HTXqVpoKQrE=;
 b=fphu4gLu3d2x8G59jaBrziVdDbWtxdkO236B55QFVqQYcxpo9mUtoOZKqgOMhTMvID
 qGMqDEu3HRF1ngLb3U+k+pzm89iyY1Sn7bri40WEXSlJIL0xS9XZa73vL+WHEHXr2p+O
 fImUJZ54hzGjx+KjTf9Hn0rcz0O9UiGuTtFRQoQx0KDlBY0DWM1EEt6p4/29iIEdsdce
 qdAMYPOml2XMhcaRykg+wR+ELdmy0RKS11yQV7y8hXVuStyoK46p8QEGqfDBa61G3rVR
 ZC6Niep2UuW63TBynyEfM2YokgjB48x7WLk5PjupfrslR1n4Otrlt8hnf8nDN7/Rs/do
 XMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=c5XK6GIeWGjy/vNGVTSPHqoq3UjtbqP4HTXqVpoKQrE=;
 b=Qp3WiFKMUBs38E/7SR0AAFIk5RV9Q+aAXZHv0iJCult2uTknip72Rt9DVcnRiWcpuZ
 XEjm3KNIkQmrTaeEwah4vK6wg7BiZgIEHCIotq7vKxSui+0m7AVl4T7hZsKvyOPrAb5C
 Cxm0UitlCbvgGHfcXsGP5CFHHvah7RfVjo06a7I17br1klmfIR5wBVs5wQ87xovgSDoL
 0+KdKMOVrouFo9S8JbGguc0A0tLgva+bcjSoiiUvrBSMJDjQSlk6odwo2ij5mW8Yl49i
 2wYSRffFIJxl6uN0+bCWw6UOiEke1mZE+LcHGBpHo9bVxKDDRQuFQHzfwP+4UEkz/cBP
 b8UQ==
X-Gm-Message-State: AOAM533d9yQOZZ/W3QqBcgfRORAEkECr+OqDsDNf2azZdx0/u+dR1hpL
 TMjnHMY+P+wOLJtAS32QVeo=
X-Google-Smtp-Source: ABdhPJxoGsjf9hEnzkkD72CBuRRcXPzsTSWZkROxlH/WEPIilBz/94oG3CZV4YtXOd1SPJJFKUtIbg==
X-Received: by 2002:a37:8286:: with SMTP id
 e128mr36249464qkd.101.1596070653193; 
 Wed, 29 Jul 2020 17:57:33 -0700 (PDT)
Received: from richs-mbp-pro.lan ([70.16.106.169])
 by smtp.gmail.com with ESMTPSA id a5sm3302941qtc.44.2020.07.29.17.57.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Jul 2020 17:57:32 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Confused about AllowedIPs meaning?
From: Rich Brown <richb.hanover@gmail.com>
In-Reply-To: <20200729221814.GA32170@matrix-dream.net>
Date: Wed, 29 Jul 2020 20:57:31 -0400
Cc: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>,
 Gunnar Niels <gunnar.s.niels@gmail.com>, wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <AF335FF5-251F-409A-9B9A-5D65D2EDA3DD@gmail.com>
References: <02830f08-9e6f-a9f1-54c3-43758e95758f@gmail.com>
 <26A86FD2-5A2D-49DC-A140-2E4B43213936@tomcsanyi.net>
 <ECF44AE9-A461-4252-8A33-B2A813280493@gmail.com>
 <20200729221814.GA32170@matrix-dream.net>
To: =?utf-8?Q?Ivan_Lab=C3=A1th?= <labawi-wg@matrix-dream.net>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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

These are helpful comments.

> On Jul 29, 2020, at 6:18 PM, Ivan Lab=C3=A1th =
<labawi-wg@matrix-dream.net> wrote:
>=20
> On Tue, Jul 28, 2020 at 05:33:43PM -0400, Rich Brown wrote:
>> AllowedIPs is the set of addresses that your WireGuard peer will send =
across the tunnel to its peer.=20
>=20
> The definition is close, but not precise. Assuming things haven't
> changed much:
>=20
>  AllowedIPs specifies the set of addresses that your WireGuard
> host will send across the tunnel to its peer, and accept from
> the peer.

I think you and M. Rubon from earlier this afternoon are saying much the =
same thing. I like those definitions because they make it explicit that =
the AllowedIPs are used both for transmission (only packets with those =
destinations will be sent through the tunnel) and receipt (only those =
source addresses will be allowed back through the tunnel).=20

But I believe these definitions still leave uncertainty:

- Should the definition of AllowedIPs mention the "Address" of the peer? =
That is, must the peer's Address be listed in AllowedIPs? [*]
- Some guides state that the Address specified for this peer and the =
other peer should be chosen from a subnet different from any on the =
networks. Is this a recommendation? A requirement? [**]

My goal is to produce a straightforward "can't fail" guide for people =
who simply want to set up a VPN from their laptop to their office or =
home network. (Of course, the definitions must be correct, but I want to =
leave out all the details and options that aren't essential for that =
simple case.) Is the following a "good enough" definition to include in =
a "Just Do This" guide?=20

> AllowedIPs  =E2=80=94 a comma-separated list of IP (v4 or v6) =
addresses with CIDR masks which are allowed:
> - as destination addresses when sending via this peer and=20
> - as source addresses when receiving via this peer.

Thanks.

Rich

[*] I think it is not necessary to specify the peer's Address in =
AllowedIPs. If it's not included, it won't be possible to interact with =
the peer using that address (since it's not in AllowedIPs). However, the =
peer will likely have an address that *is* in AllowedIPs, and that's how =
it will be accessible. True?

[**] I suspect it would be possible to assign each peer's Address from =
an existing subnet. But for simplicity, the I believe the guide should =
recommend a completely different subnet for the peers to avoid any =
confusion. True?

PS The remainder of the note is good/correct, but it muddies the water =
by bringing up lots options and special cases that don't apply to the =
simplest use cases.

> AllowedIPs is not a set of addresses, but of networks, wherein
> the peer with most specific match wins - as in a routing table.
> Also, beware negations might not do what you expect.
>=20
>=20
> Routing should work like so:
>=20
> When a linux system is sending a packet, it first consults
> the system routing table to choose the appropriate device.
> Then, if the outgoing device is a wireguard tunnel, it
> consults the routing table of the WG device to choose a peer.
> WG device's routing table is constructed from peers' AllowedIPs.
> When a peer is selected, the packet is encapsulated and sent
> to the peer's latest enpoint. Then the system routing table
> is again consulted, and hopefully a different outgoing device
> is selected.
>=20
> Note that the routing table is in fact a tree where the most
> specific match wins - both the system one and wireguard's.
> Also note that overlapping networks are allowed (e.g. 0.0.0.0/0,
> and 10.0.0.0/8), but identical networks in a single WG device
> are not allowed as neither would be more specific. The system
> routing table would throw an error on such attempts, but wireguard
> silently discards the old route keeping only the last one,
> so you need to be careful here.
>=20
>=20
> Such is basic routing. In more complicated scenarios:
> - routing rules select the routing table
> - iptables/nftables can change addresses, select devices, even clone =
packets
> - namespaces can nearly create an isolated network host/partition
> and you can also have xfrm encapsulation, maybe vdevs do something..
> All of this is either before the packet enters wireguard device
> (where wireguard routing is done), and/or after the packet is
> encapsulated/decapsulated (encrypted/decrypted) and processed again.
>=20
>=20
> When a packet is received, the system may also check the routing
> table for the source/peer address, and if the source device
> doesn't match the routing table entry, the packet would be discarded
> - so called reverse path filtering.
> Initial lookup of the encapsulated packet source in the system
> routing table is governed by the rp_filter setting.
> When a packet is processed by wireguard, the inner, decapsulated
> source is unconditionally checked for in the device routing table
> and packet discarded if peer doesn't match - i.e. the peer's allowed
> IPs must match, and also be the single most specific match.
> After wireguard decapsulation, the inner packet is again processes
> by the system, possibly checking the ips.
>=20
>=20
> Regards,
> Ivan

