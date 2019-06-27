Return-Path: <SRS0=cR9O=U2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73037C48BD7
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Jun 2019 14:26:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B8C220828
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Jun 2019 14:26:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="JxYSLkT/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B8C220828
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41c6cb0b;
	Thu, 27 Jun 2019 14:26:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c16344a6
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jun 2019 14:26:24 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 410b2a4d
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jun 2019 14:26:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1670280a
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jun 2019 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=A5iq/G
 XLDN4+ZlYWM7zR43baYho=; b=JxYSLkT/odFzMLMNH0offblsphVWOlOohbryK9
 9i9DUj6l3T0SMHsKan+8YYzBkcde+8K1jZxya2I6TBAXxKdQf8JMcsd0BPorg1z9
 XkoKRvACON7p3jNH7808rJJrdvRY45vuh/mRCby6ooK3QXfDvj+M8RcVKx5YNiIq
 4icoRr6z0tZMTneAVcSBhHbk1om/FJCizCmFmv3swLSKaicVaJiXYo0SGPBTStiJ
 opS+UrEHm41SZ8E5tsWAmv4RTW1q8Et58bIL68QO+NUHStNJglsGdZXdHwpNkBXT
 XzAz6E7XIALXZSa3P9Mrdon5F5LTgenhi38fZXviFo+8SZYQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 003aa463
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jun 2019 13:52:13 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id o101so2149765ota.8
 for <wireguard@lists.zx2c4.com>; Thu, 27 Jun 2019 07:26:24 -0700 (PDT)
X-Gm-Message-State: APjAAAWaZO7+SKaLHBbOvfdclnGiJ8k8Bs9G9MNaMBUC2LD55+tX5IBA
 jICmSDfIzbErblaj/K53aq5H1cXyWI4FSJhLs7o=
X-Google-Smtp-Source: APXvYqw2ObCgC5YiYkCEmZbO4QNyYgEFC6GqhEGOTxrdglZXd4wsn5jBBZPRBBYWwFOH5eybSlkX58U5oDKu2EVQjZE=
X-Received: by 2002:a05:6830:2148:: with SMTP id
 r8mr3705008otd.179.1561645583390; 
 Thu, 27 Jun 2019 07:26:23 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 27 Jun 2019 16:26:12 +0200
X-Gmail-Original-Message-ID: <CAHmME9o2Hixoo_XawTGjHoVmuV5h=VxdfN+3i9Lyc_eRuA_60A@mail.gmail.com>
Message-ID: <CAHmME9o2Hixoo_XawTGjHoVmuV5h=VxdfN+3i9Lyc_eRuA_60A@mail.gmail.com>
Subject: Deterministic Cryptographically Authenticated Network Signatures on
 Windows NLA
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

Recently there's been a decent amount of Windows reverse engineering
and research in order to come up with some rather simple but important
results. I figure it might be useful to document parts of this
somewhere.

On Windows, when an interface connects to an endpoint, it generates a
"Network Signature", which is supposed to uniquely identify a network.
This is done through the conjunction of the nla and network list
services, and the kernel. For wifi, it uses aspects about the AP and
SSID. For wwan, it uses details from there. And in general, for layer
2 connections, it hashes the mac address of the default gateway.  This
is sort of a terrible way to identify a network, since mac addresses
can be spoofed. It looks like Microsoft has toyed with trying to make
this less bad, with various papers and patents and whatnot for
"authenticated dhcp" with some fancy/dated crypto, but it doesn't
appear that these have gone anywhere. For layer 3 networks, nla
doesn't really know what to do and so winds up just hashing the GUID
of the NetCfgInstanceId for the interface. This means that every
particular layer 3 interface instance implies only a single network.

This Network Signature stuff matters because Windows will
automatically fiddle with firewall rules based on which network you're
connected to. Forge a network, and you can perhaps get a victim to
have a more permissive firewall.

For WireGuard, we're using Wintun interfaces [1]. We could roll with a
single interface, which then would have the same Network Signature and
hence firewall settings, no matter which WireGuard peers its hooked up
with. Or, we could have a new interface for every new connection
event, but this means adding an unbounded amount of garbage to the
registry and cluttering people's interface names with things like
"Local Area Connection 28912", because this is the 28912th time you've
used WireGuard. Neither is so ideal.

Since Wintun is a layer 3 interface, it turns out "all" we need to do
is deterministically generate the GUID at adapter installation time. I
couldn't find any documented way of doing this. After reversing 3
kernel drivers and 5 userland DLLs, I found that Windows is using a
certain registry value as a sort of temporary storage in between two
phases that it runs serially. By using the super old and ugly
SetupAPI, we're actually able to split these phases up, so that we can
modify this registry key before the next phase sees it. This is sort
of like exploiting a race condition, except we're able to entirely
pause the race while making our modifications, so we have 100%
reliability. This winds up looking something like:

CallClassInstaller(DIF_REGISTER_COINSTALLERS)
key = OpenDevRegKey(DICS_FLAG_GLOBAL, DIREG_DRV)
key.SetString("NetSetupAnticipatedInstanceId", deterministicGUID)
CallClassInstaller(DIF_INSTALLINTERFACES)

At the time of writing, other than our own source code, there are no
hits for NetSetupAnticipatedInstanceId on Google, Bing, Yandex, or
Baidu, so this might be the first description of such a technique.

So, now that we can control the GUID and hence the NetworkSignature,
we have to decide what determines a network. It turns out that in
WireGuard, we can do this with much higher cryptographic assurance
than any of the crazy "authenticated dhcp" proposals of Microsoft.
Specifically, we know our own interface public key, the public keys of
everyone we're willing to talk to, and which IP addresses we'll accept
from those peers. If that doesn't perfectly define a network, I don't
know what else does.

Therefore, we sort the public keys, and sort the allowed IPs for each
one, and then hash together a big block that looks like:

 label || len(interface name) || interface name ||
 interface public key || number of peers ||
 peer public key || number of peer allowed ips ||
 len(allowed ip string) || allowed ip/cidr in canonical string notation ||
 len(allowed ip string) || allowed ip/cidr in canonical string notation ||
 len(allowed ip string) || allowed ip/cidr in canonical string notation ||
 ...
 peer public key || number of peer allowed ips ||
 len(allowed ip string) || allowed ip/cidr in canonical string notation ||
 len(allowed ip string) || allowed ip/cidr in canonical string notation ||
 len(allowed ip string) || allowed ip/cidr in canonical string notation ||
 ...
 ...

We pick a stable encoding for each of those elements (32-bit little
endian integers, canonical IP address strings, well-known label
identifier, etc), pass it all to BLAKE2, and mint ourselves a fully
network-determined GUID.

Hopefully this should eliminate a class of firewall attacks on Windows
systems when using WireGuard. Perhaps this post will help others out
somewhere down the line.

By the way, since Windows security is pretty complex and hard to get
right -- and hard to even keep all of it in your head at the same time
-- we're maintaining an attacksurface.md [2] file, which evolves over
time to contain our latest understanding. Hopefully this will help
people point out where we're wrong, and also what areas we've
neglected to consider. If something there piques your interest, don't
hesitate to get in touch with security {at} wireguard ^dot^ com.

Regards,
Jason

[1] https://www.wintun.net/
[2] https://git.zx2c4.com/wireguard-windows/about/attacksurface.md
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
