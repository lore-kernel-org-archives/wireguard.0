Return-Path: geokozey@mailfence.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab3cdf54
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 22:50:58 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com
 [212.3.242.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acdb8746
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 22:50:58 +0000 (UTC)
From: Geo Kozey <geokozey@mailfence.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <512085110.395523.1509058361413@ichabod.co-bxl>
In-Reply-To: <CAHmME9qkhgFbmnGqTidCBCo_-Ksvgwxs8gf1OSYhWk6HhNcdgg@mail.gmail.com>
References: <2027941193.391349.1509047899053@ichabod.co-bxl>
 <CAHmME9ouUyaR6UeWeL-5a1MLkm1fE6VDmC94=K1DszrcRoPwtw@mail.gmail.com>
 <976454169.394660.1509055309999@ichabod.co-bxl>
 <CAHmME9qkhgFbmnGqTidCBCo_-Ksvgwxs8gf1OSYhWk6HhNcdgg@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Date: Fri, 27 Oct 2017 00:52:41 +0200 (CEST)
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: Geo Kozey <geokozey@mailfence.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> From: Jason A. Donenfeld <Jason@zx2c4.com>
> Sent: Fri Oct 27 00:19:27 CEST 2017
> To: Geo Kozey <geokozey@mailfence.com>
> Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
> 
> 
> On Thu, Oct 26, 2017 at 11:53 PM, Geo Kozey <geokozey@mailfence.com> wrote:
> > No, with fixed resolv.conf pointing to local namserver only there would be no DNS resolution as your cache has to come from somewhere. I'm talking specifically about local nameserver without external connectivity but I think users may want to use their own static nameservers with dynamic one which they get from wg for whatever reason. Having to chose one over another as only possibility isn't best solution IMO.
> 
> Usually people who do this usually point their cache toward the remote
> tunneled nameserver, via, say, dnsmasq's -S option. Some people do
> indeed enjoy multiple entries in their resolv.conf and rely on this
> generally buggy behavior, which means you could make an argument that
> I shouldn't be using openresolv's "-x" option, and maybe you'd have a
> case. But I don't care for nobs, and those powerusers probably don't
> want wg-quick anyway or can just use PostUp.
> 
> In any case, this is a different issue from what this thread is trying
> to determine, so if you'd like to bikeshed -x vs -m and options and
> whatnot in openresolv, please do so on an entirely different thread
> with a different subject.
> ----------------------------------------
The thing is if "openresolv -x"  isn't best solution then this thread with your patch can go straight to /dev/null. You wrote yourself that you don't care about nobs and power users won't use it anyway so what's the point?. Especially as distro maintainers are against all of this. IMO "openresolv -x" is usable for preventing people who have no idea what they doing from shooting themselves in foot. Powerusers most of the time will choose full control over what is and what isn't in their resolv.conf.

G.K.
