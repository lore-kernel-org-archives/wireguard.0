Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bacace8
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 14:40:41 +0000 (UTC)
Received: from mx.sealand.io (mx.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42c52b9d
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 14:40:41 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: openwrt route_allowed_ips is inprecise
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CAHmME9p8KwzZONpAk=hF1GBQ_psR6Hjgv5yAxvogHxvm4KpfSg@mail.gmail.com>
Date: Tue, 20 Dec 2016 15:51:24 +0100
Message-Id: <C11142B8-C7EA-4B18-A86C-2981549D0641@danrl.com>
References: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
 <20161220011334.GB16814@tuxmachine.polynome.dn42>
 <CAHmME9rDK0MEFH2oOVjeTF0n=J6=Hsk9e5Hyj2GDnFk8V3LtwA@mail.gmail.com>
 <89D5D16F-84AF-4FC6-9AA1-55EFCB6A3B9E@danrl.com>
 <CAHmME9popkFYu-am43TMCc6NcPtUA5dYRWPuTDJS-B69L73_cQ@mail.gmail.com>
 <40FCA8CB-1FAA-42AF-B229-8692568F8226@danrl.com>
 <59811706-CB39-4A8F-823B-9B270ABFD211@danrl.com>
 <CAHmME9p8KwzZONpAk=hF1GBQ_psR6Hjgv5yAxvogHxvm4KpfSg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


> On 20 Dec 2016, at 14:33, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Tue, Dec 20, 2016 at 11:15 AM, Dan L=C3=BCdtke <mail@danrl.com> =
wrote:
>> New environment, build from latest sources this morning. Can't =
reproduce. I can't see duplicate routes. Static routes were added via =
LuCI to represent a typical user's approach.
>>=20
>> Can we drop this discussion until we can reproduce the problem?
>=20
> That's a weird way of putting it, because you !=3D we.

Sorry, not a native speaker.

> config wireguard_wg
>       option public_key '0Nz4n2wdhDJtFbkdIFqlJ4vkKIGFgBVQPxyJ0XWE31o=3D'=

>       list allowed_ips '10.200.100.1/32'
>       option route_allowed_ips '1'
> config interface 'wgnet'
>       option proto 'static'
>       option ifname 'wg'
>       option ipaddr '10.200.100.4/24'
> -->
> root@mipsnet:~# ip r
> 10.200.100.0/24 dev wg  src 10.200.100.4
> 10.200.100.1 dev wg

I see what you mean now. Don't see a real problem there despite =
ugliness, but let me think of a solution. May not be my highest priority =
right now, though.


Cheers,

Dan=
