Return-Path: william@azirevpn.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fef801a8
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 12:53:51 +0000 (UTC)
Received: from mail.foilhat.net (mail.foilhat.net [185.169.40.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 423974e5
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 12:53:51 +0000 (UTC)
Received: from localhost (localhost [IPv6:::1])
 by mail.foilhat.net (Postfix) with ESMTP id E38B33E39DF
 for <wireguard@lists.zx2c4.com>; Tue,  7 Nov 2017 13:57:03 +0100 (CET)
Received: from mail.foilhat.net ([IPv6:::1])
 by localhost (mail.foilhat.net [IPv6:::1]) (amavisd-new, port 10032)
 with ESMTP id Xp547pbJJKQ4 for <wireguard@lists.zx2c4.com>;
 Tue,  7 Nov 2017 13:57:03 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by mail.foilhat.net (Postfix) with ESMTP id 6242A3E32F0
 for <wireguard@lists.zx2c4.com>; Tue,  7 Nov 2017 13:57:03 +0100 (CET)
Received: from mail.foilhat.net ([IPv6:::1])
 by localhost (mail.foilhat.net [IPv6:::1]) (amavisd-new, port 10026)
 with ESMTP id zudC0hxvP7Mz for <wireguard@lists.zx2c4.com>;
 Tue,  7 Nov 2017 13:57:03 +0100 (CET)
Received: from mail.foilhat.net (mail.foilhat.net [185.169.40.4])
 by mail.foilhat.net (Postfix) with ESMTP id 4DDEA3E39DF
 for <wireguard@lists.zx2c4.com>; Tue,  7 Nov 2017 13:57:03 +0100 (CET)
Date: Tue, 7 Nov 2017 13:57:03 +0100 (CET)
From: William =?utf-8?Q?=C3=96ling?= <william@azirevpn.com>
To: wireguard@lists.zx2c4.com
Message-ID: <993737547.71422.1510059423267.JavaMail.zimbra@azirevpn.com>
In-Reply-To: <CAC4KqtwH_XAXeXHSf9Kxs5t80Qag9GrMwp6SaPnO9bj=GVL-7w@mail.gmail.com>
References: <CAC4KqtwH_XAXeXHSf9Kxs5t80Qag9GrMwp6SaPnO9bj=GVL-7w@mail.gmail.com>
Subject: Re: Production usage of Wireguard
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

We run WireGuard in production for a sizable user base. We've had no proble=
ms with it at all so far. However, we'd like to create problems as a means =
of finding any latent bugs, so yesterday we opened up our service for free,=
 so we can get more people toasting our servers.

Check out https://www.azirevpn.com/wireguard if anybody wants to put some b=
andwidth through our pipes.

Br,
William, AzireVPN

----- Original Message -----
From: "Ferris Ellis" <ferris@ferrisellis.com>
To: wireguard@lists.zx2c4.com
Sent: Monday, November 6, 2017 10:41:18 PM
Subject: Production usage of Wireguard

Hello Wireguard mailing list!=20

I have been very interested in the WireGuard project for a little while now=
 and am in the process of evaluating it. While benchmarks and code reviews =
are useful, they don=E2=80=99t uncover many of the issues that can potentia=
lly wake one up at 3am. I=E2=80=99d hunted around on the web for a while bu=
t wasn=E2=80=99t able to find any articles on running WireGuard in a produc=
tion environment. I know the project is still young but was wondering if an=
yone on the mailing list had started using WireGuard in production? And, if=
 so, if they=E2=80=99d be willing to share some details about their use cas=
e and experience?=20

Cheers,=20
Ferris=20

--=20
Ferris Ellis=20

_______________________________________________=20
WireGuard mailing list=20
WireGuard@lists.zx2c4.com=20
https://lists.zx2c4.com/mailman/listinfo/wireguard=20
