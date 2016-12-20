Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f58096b
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 10:04:44 +0000 (UTC)
Received: from mx.sealand.io (mx1.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8b3fec3
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 10:04:44 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: openwrt route_allowed_ips is inprecise
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <40FCA8CB-1FAA-42AF-B229-8692568F8226@danrl.com>
Date: Tue, 20 Dec 2016 11:15:20 +0100
Message-Id: <59811706-CB39-4A8F-823B-9B270ABFD211@danrl.com>
References: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
 <20161220011334.GB16814@tuxmachine.polynome.dn42>
 <CAHmME9rDK0MEFH2oOVjeTF0n=J6=Hsk9e5Hyj2GDnFk8V3LtwA@mail.gmail.com>
 <89D5D16F-84AF-4FC6-9AA1-55EFCB6A3B9E@danrl.com>
 <CAHmME9popkFYu-am43TMCc6NcPtUA5dYRWPuTDJS-B69L73_cQ@mail.gmail.com>
 <40FCA8CB-1FAA-42AF-B229-8692568F8226@danrl.com>
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


> On 20 Dec 2016, at 09:52, Dan L=C3=BCdtke <mail@danrl.com> wrote:
>=20
> Regarding the initial preciseness issue, have you tested that on LEDE? =
I can't manage to get duplicate routes. However, outdated testing =
environment. Will rebuild and test again. I can't quite understand what =
the initial issue was. Wouldn't you get a "rtnetlink: file exists" when =
you try to add an route that already exists?

New environment, build from latest sources this morning. Can't =
reproduce. I can't see duplicate routes. Static routes were added via =
LuCI to represent a typical user's approach.

Can we drop this discussion until we can reproduce the problem?

>>=20
>>> Regarding LEDE, netifd should track the routes being added and the =
extra routes do not really do harm.
>>=20
>> Alright then...
>>=20
>> Speaking of netifd, did you ever fix that netifd issue with the IP =
dependency?
>=20
> I am on it. First version did add dependency for both protocols if the =
endpoint name had A and AAAA records. However, I find it cleaner to =
check which endpoint wg chose to use and only add that IP address as an =
depedency. Patch/PR comes when I am satisfied with stability.

https://github.com/openwrt/packages/pull/3680

This is the leanest approach I came up with and my top candidate for =
merging. Review very welcome.

Thanks!

Dan=
