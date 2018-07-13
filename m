Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f57b8f46
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Jul 2018 17:58:34 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27de9f39
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Jul 2018 17:58:34 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: receive: use gro call instead of plain call
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <20180713211526.5ead23b8@natsu>
Date: Fri, 13 Jul 2018 13:06:17 -0500
Message-Id: <1501BF28-689D-4F75-9815-FED869F1CB78@lonnie.abelbeck.com>
References: <CAHmME9rP8fE7U9VxLauQ_Ee-w6ox-DAAFkvAOjx52bxGT58w4w@mail.gmail.com>
 <580E3DE0-4D06-46C5-A972-96C1F687A7B7@abelbeck.com>
 <F0797C8C-D288-4531-A21F-4FD38764544A@lonnie.abelbeck.com>
 <20180713211526.5ead23b8@natsu>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


> On Jul 13, 2018, at 11:15 AM, Roman Mamedov <rm@romanrm.net> wrote:
>=20
> On Fri, 13 Jul 2018 08:49:45 -0500
> Lonnie Abelbeck <lists@lonnie.abelbeck.com> wrote:
>=20
>> For certain lower-end x86 boxes I test, I noticed WG 0.0.20180708 =
w/NAPI actually slowed down receive performance.
>>=20
>> Jason recently added "receive: use gro call instead of plain call" =
[1] commit, which made a big performance improvement.
>=20
> Yes I'm also seeing about 20% higher performance with this patch (from =
1.3-1.4
> to 1.6 Gbit on same-host VMs). This is awesome!

Hi Roman, thanks for the followup ...


> ...and... if I switch TCP Congestion Control from bbr to illinois on =
sender, I
> now get 2.0 Gbit. WTF. :)

> Lonnie, which one do you use on your hosts?

We are using Linux 3.16.57 and CONFIG_TCP_CONG_ADVANCED=3Dn, so standard =
stuff ...

pbx ~ # sysctl net.ipv4.tcp_available_congestion_control
net.ipv4.tcp_available_congestion_control =3D cubic reno

pbx ~ # sysctl net.ipv4.tcp_congestion_control
net.ipv4.tcp_congestion_control =3D cubic


Lonnie=
