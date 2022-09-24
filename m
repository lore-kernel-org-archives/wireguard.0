Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6423AC04A95
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Sep 2022 10:35:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 194d4ea7;
	Wed, 28 Sep 2022 10:21:09 +0000 (UTC)
Received: from mailhost.omnigroup.com (mailhost.omnigroup.com [204.128.250.1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 52199967
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Sep 2022 01:28:35 +0000 (UTC)
Received: from imap-bsd.omnigroup.com (imap.omnigroup.com [204.128.250.235])
 by mailhost.omnigroup.com (Postfix) with ESMTP id CE7092731526;
 Fri, 23 Sep 2022 18:28:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mailhost.omnigroup.com CE7092731526
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=omnigroup.com;
 s=default; t=1663982912;
 bh=3VJfFDc9Lrt/xbc+kGf7ZcW42ruuUbskTZnWAa6SAzs=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=KsBIJLic7ztMeFqmk9v3ul0TLXbfxekKmmiasjObA4CpfJzfkiqK/p8Rrrqqj68pN
 Ks5+ngB2ntXmja3uN8elb+ziAW9sbG1bScwS2HkDY+UJk3uGhlp6hPlhT0R+Oe0ipv
 12lXsebE2z7yvzxKWDSIC2YhcwIaXswPf2+CKdOc=
Received: from smtpclient.apple (pfsense.test.omnigroup.com [204.128.250.121])
 by imap-bsd.omnigroup.com (Postfix) with ESMTPSA id 6BE9549476;
 Fri, 23 Sep 2022 18:28:32 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.74\))
Subject: Re: MacOS app update needed
From: Ken Case <kc@omnigroup.com>
In-Reply-To: <CAHmME9o1psix3jGC5tx81dG_7D+WVrBhjYSho-_tLGu=S7H+1Q@mail.gmail.com>
Date: Fri, 23 Sep 2022 18:28:21 -0700
Cc: Simon Karberg <simon.karberg@agillic.com>,
 wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <3EAF348D-C304-4048-81CC-98110AD1BCAC@omnigroup.com>
References: <CALDyVtsgMjH1YqrTrosDVU2khC9iEgMgUYDd8D65+h-K54y2fA@mail.gmail.com>
 <CAHmME9o1psix3jGC5tx81dG_7D+WVrBhjYSho-_tLGu=S7H+1Q@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3731.200.74)
X-Mailman-Approved-At: Wed, 28 Sep 2022 10:20:52 +0000
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


> On Sep 22, 2022, at 04:48, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> On Wed, Sep 21, 2022 at 9:31 AM Simon Karberg =
<simon.karberg@agillic.com> wrote:
>>=20
>> Hi,
>>=20
>> I've been testing the Domain Search functionality on all 3 OS'
>> (Windows, Mac & Linux) and the setting:
>>=20
>> DNS=3D<dns server>, <search domains>
>> Is only being applied on Windows & Linux.
>>=20
>> Further testing on MacOS I've found that the homebrew installation =
works.
>> wiregurd-go is version 0.0.20220316 and wireguard-tools is version =
1.0.20210914
>>=20
>> The App Store app is version:
>> App: 1.0.15 (26)
>> Go backend: 2ef39d47
>=20
> Huh, that's surprising. This was added a few years ago with 9231c035
> ("global: support DNS search domains"), so it definitely *should* be
> supported. Might be a bug with the network config from
> PacketTunnelSettingsGenerator. I'll look into this when circling back
> to wireguard-apple development. Thanks for mentioning it.
>=20
> Jason
>=20

Oh, I have a pretty simple patch that fixes this bug that I've been =
running locally for months. I keep meaning to figure out the right place =
to send it, but keep not having time to look up where that is. Patch =
included below, anyone is welcome to use it (attributed or not) or to =
direct me to send it somewhere else!

				Cheers,
				Ken

---

Subject: [PATCH] Qualify routed DNS queries based on search domains.

Rather than unconditionally routing all DNS queries through the
associated tunnel's DNS, only route queries when no search domains
have been specified. When search domains _have_ been specified, route
those domains to the tunnel's DNS but let other domains continue to be
routed to other network interfaces.
---
Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift | 8 +++++++-
1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift =
b/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
index c53a82c..5b7f63c 100644
--- a/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
+++ b/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
@@ -88,7 +88,13 @@ class PacketTunnelSettingsGenerator {
            let dnsSettings =3D NEDNSSettings(servers: dnsServerStrings)
            dnsSettings.searchDomains =3D =
tunnelConfiguration.interface.dnsSearch
            if !tunnelConfiguration.interface.dns.isEmpty {
-                dnsSettings.matchDomains =3D [""] // All DNS queries =
must first go through the tunnel's DNS
+                if tunnelConfiguration.interface.dnsSearch.isEmpty {
+                    // Since no search domains were listed, use this =
tunnel's DNS for all queries
+                    dnsSettings.matchDomains =3D [""]
+                } else {
+                    // Only use this tunnel for the listed search =
domains
+                    dnsSettings.matchDomains =3D =
tunnelConfiguration.interface.dnsSearch
+                }
            }
            networkSettings.dnsSettings =3D dnsSettings
        }
--  2.37.0 (Apple Git-136)

