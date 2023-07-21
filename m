Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB72DEB64DC
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Jul 2023 08:03:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 106e30a5;
	Fri, 21 Jul 2023 08:03:19 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch [185.203.114.86])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8a6414e1
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jul 2023 08:03:16 +0000 (UTC)
Received: from sun.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 98CEA20F3A;
 Fri, 21 Jul 2023 10:03:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1689926596;
 bh=kIfMzfywH2VqIc6Kkv5CHVhZPqaOnkprn10FMaYkKJI=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=oe3mOVvkriKAN5SSJiFLPMdYqCLy8zKJ4mAgEfr2znM68X1Bcf7cKLS/3XCAQYwLB
 toHrwLvBCxFlOgqyEkuBDszpprCLaY1fKaG1XAPr1WyqmbTZAHnNMzuNsgchskaAwe
 5erdNZG0pgYQHtL5boKUkVkbZpdpSpQnzJq5+s9DrWcFs6gOs+GuBJTuNKvTwmW/JV
 HrknwzxQfpTf3j+8wkR7WkRzwGhqFQcvYo/Joe+qaPmnE7CTkJD0pg1fZXw5QVWh4J
 kGQtvntSqcw+1M1DHuHbNkXZQdQd8zGDrzM4xUyJWwQKRjcusVrsCvUgxTyw/G00rY
 AbX8UK3WVEBQg==
Received: by sun.localdomain (Postfix, from userid 1000)
 id 9407228A2999; Fri, 21 Jul 2023 10:03:16 +0200 (CEST)
References: <20230721000643.44y5pd7sfcjzhbjw@House.clients.dxld.at>
User-agent: mu4e 1.8.13; emacs 28.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
Cc: wireguard@lists.zx2c4.com, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Baptiste Jonglez <baptiste@bitsofnetworks.org>, Nico Schottelius
 <nico.schottelius@ungleich.ch>
Subject: Re: Wg source address is too sticky for multihomed systems aka
 multiple endpoints redux
Date: Fri, 21 Jul 2023 09:31:33 +0200
In-reply-to: <20230721000643.44y5pd7sfcjzhbjw@House.clients.dxld.at>
Message-ID: <87351h4rp7.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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


Good morning,

Daniel Gr=C3=B6ber <dxld@darkboxed.org> writes:
> [...]
> I have a multihomed router [...]

following up the thread from February, we migrated away from wireguard
to openvpn on systems that have are multi homed.

The main reason for that is the following type of connection to a high
probability fails to work:

1) device -> [NAT/FIREWALL] -> multi homed server [IP A]
2) multi homed server [IP B] -- blocked by firewall as it does not match
table entry

This always happens when the server has as an asymmetric route back to
the originating device, which really depends on the routing tables
or routing policy present on the multi homed server.

I'm a big fan of simplicity, but without an equivalent of openvpn's
"local" statement, wireguard is deemed to be unusable in many network
scenarios.

Best regards,

Nico


--
Sustainable and modern Infrastructures by ungleich.ch
