Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB32C27C4F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 Jun 2024 14:53:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13d54eec;
	Thu, 13 Jun 2024 14:52:32 +0000 (UTC)
Received: from cynic.org (harbard.cynic.org [75.144.22.203])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1124685
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2024 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cynic.org;
 s=default; t=1718290349;
 bh=8ocqDfqFvyqS3ErR7BTI27QK1Z6jhfVgDE86sDflBDs=;
 h=Subject:From:Date:To;
 b=lALFyZYv0b/4AjEv4FLxMwvO9xr+zFsZMjUDj9GHpTd1yjCTU1GN+5QBEG/VlaAIi
 0nUUlvPN4G8gWbbodioU3OtU11Y9pqX6MRFpvuyUFAJW0WRoHasDbLBlzzd90uFSbr
 OZ9E+wp/VhWtpxHtZDAcjOvDp5UpOcWncwz5L3On38KgWS0mj4nfKWmc372aDf5uRQ
 eAqgCWAK8rG+RrzipJeckPluz2eWk58OShjFZoub4KnuhwnfbqBhFBvGhEeyr/l4Oz
 MKJ/xYiOy0cEj15AnPXb9K7FFB0FKEPIhojt6GEjXz5ZUDmex0q1byxEBHZHpg79Ab
 ehKNwdobJie6Q==
X-Default-Received-SPF: pass (skip=loggedin (res=PASS)) x-ip-name=10.10.10.100;
 envelope-from=<perry@cynic.org>; 
Received: from smtpclient.apple (unverified [10.10.10.100]) 
 by cynic.org (SurgeMail 7.8b) with ESMTP (TLS) id 10693-1278429 
 for multiple; Thu, 13 Jun 2024 07:52:28 -0700
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: Wireguard, iPhone, and cruise ships
From: Perry The Cynic <perry@cynic.org>
In-Reply-To: <d592d6a9-8d4f-4d0e-935d-73735c37bc7d@unstable.cc>
Date: Thu, 13 Jun 2024 07:52:19 -0700
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <DEFB63D6-D7B8-4774-85CF-A8B387401D52@cynic.org>
References: <60B826FA-3FCA-40B5-9771-8FFEDA6278AB@cynic.org>
 <d592d6a9-8d4f-4d0e-935d-73735c37bc7d@unstable.cc>
To: Antonio Quartulli <a@unstable.cc>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-Qnum: 10693
X-Authenticated-User: perry@cynic.org 
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

That works when I=E2=80=99m in my room/cabin/place. I=E2=80=99m actually =
building a Raspberry Pi-based travel box right now (so next time I have =
linux tools to diagnose problems), and it can do tcp =
wrapping/forwarding. But carrying a battery-powered router-sized thing =
around on vacation somewhat defeats the point of carrying an iPhone on =
travel. Another box to break, another battery to run out. And my wife =
wants vpn access too, even if she=E2=80=99s away from me.

Cheers
  =E2=80=94 perry


> On Jun 13, 2024, at 7:45=E2=80=AFAM, Antonio Quartulli <a@unstable.cc> =
wrote:
>=20
> Hi,
>=20
> On 13/06/2024 16:34, Perry The Cynic wrote:
>> So what are the practically available options here? I can set up =
whatever is needed on the server endpoint (it=E2=80=99s Debian), but =
what can I do on my phone to make wg work through an HTTP(s)-shaped =
pinhole? I=E2=80=99d hate to have to ditch wg for some other vpn just =
for that rare case=E2=80=A6 but what=E2=80=99s the answer?
>=20
> How about simply getting a small travel router that you can install =
between your devices and the uplink connection (being this wifi or =
ethernet)?
>=20
> The travel router could be running OpenWRT and thus allow you to play =
any wanted trick.
>=20
> Cheers,
>=20
> --=20
> Antonio Quartulli

