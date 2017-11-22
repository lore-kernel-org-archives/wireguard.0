Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe637155
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 15:44:27 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf40c6b8
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 15:44:27 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id BF55511682
 for <wireguard@lists.zx2c4.com>; Wed, 22 Nov 2017 10:49:35 -0500 (EST)
Received: from macpro.priv.abelbeck.com (wsip-70-165-110-240.om.om.cox.net
 [70.165.110.240])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 7A5421167F
 for <wireguard@lists.zx2c4.com>; Wed, 22 Nov 2017 10:49:35 -0500 (EST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: roaming and ddns dynamic ip
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAC6SzHJ_xHN5fCn2mQ=xrx2Uz6YbZLoHE6As0bwE1SmzprCn+g@mail.gmail.com>
Date: Wed, 22 Nov 2017 09:49:33 -0600
Message-Id: <D8DF2FC5-F5BF-474E-B774-C0FF4D993DB9@lonnie.abelbeck.com>
References: <CAC6SzHKVvOEZYXiuK-O6jMN=OOPjfogq2bbeHnYA1xoLew-OcQ@mail.gmail.com>
 <CAHmME9qmZCt7GDeXZtDBwSeg2z1Md9UQENbNo5TXvSqWion9rA@mail.gmail.com>
 <CAC6SzHJ_xHN5fCn2mQ=xrx2Uz6YbZLoHE6As0bwE1SmzprCn+g@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


On Nov 22, 2017, at 6:51 AM, d tbsky <tbskyd@gmail.com> wrote:

> 2017-11-22 19:59 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
>> Hello,
>>=20
>> This is not a bug. DNS resolution is not done by the WireGuard =
module,
>> but rather by the configuration tool. If you want to update an IP,
>> you'll need to devise a mechanism for this. One popular one is this
>> example script:
>> https://git.zx2c4.com/WireGuard/tree/contrib/examples/reresolve-dns ,
>> but many other possibilities exist too.
>>=20
>> Jason
>=20
> I don't think it's a bug. as you said, that's by design.although it
> means I need other tool to co-maintain the vpn connection.

Jason, question, if each endpoint had PersistentKeepalive enabled, does =
that update the endpoint addresses via your roaming code ?  Or does =
actual tunnel data traffic need to occur to update roaming endpoints ?

If PersistentKeepalive updates roaming endpoints, then it would seem to =
be a very rare situation when both endpoints had an address change =
within the PersistentKeepalive window.

Lonnie
=20
