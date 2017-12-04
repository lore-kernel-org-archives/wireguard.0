Return-Path: pim@zandbergen.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4de304f
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 17:47:40 +0000 (UTC)
Received: from zandbergen.org (zandbergen.org [85.146.253.152])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 380749b8
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 17:47:40 +0000 (UTC)
Received: from [IPv6:2a00:18c8:1001:fff0:6a05:caff:fe47:4692]
 (botero.macroscoop.nl [IPv6:2a00:18c8:1001:fff0:6a05:caff:fe47:4692])
 by zandbergen.org (Postfix) with ESMTPSA id 7E2BE1541338
 for <wireguard@lists.zx2c4.com>; Mon,  4 Dec 2017 18:54:19 +0100 (CET)
Subject: Re: Wireguard ceased to work after Fedora 26->27 upgrade
To: wireguard@lists.zx2c4.com
References: <b984758b-93ce-f909-e63e-f31fb575a5f9@gmail.com>
 <CAHmME9qFWDme113eRkxtK4ut9tK1i3auWT_YrCsZwrUdZAiJHw@mail.gmail.com>
From: Pim Zandbergen <pim@zandbergen.org>
Message-ID: <34ce36c3-38fe-96fe-4b2d-22a819272a8d@zandbergen.org>
Date: Mon, 4 Dec 2017 18:54:12 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9qFWDme113eRkxtK4ut9tK1i3auWT_YrCsZwrUdZAiJHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I was just about to upgrade my f26 router when I read=C2=A0 about this is=
sue.
As a test, I installed wireguard on a f27 host from scratch. It just work=
ed.
So I suppose, removing before upgrade and installing afterwards should=20
avoid Germano's issue.
