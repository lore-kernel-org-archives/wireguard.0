Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0cc15535
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 22:12:30 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 497e583a
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 22:12:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c276dd44
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 22:03:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4e073f32
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 22:03:38 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id 10-v6so1087471oix.2
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 15:26:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180415235801.411a50af@natsu>
References: <CA+bb15uz7jkD2GZhSQANkH9JPi5Sq2g20wrm0avTRFiOMJ55iA@mail.gmail.com>
 <20180415235801.411a50af@natsu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 16 Apr 2018 00:26:56 +0200
Message-ID: <CAHmME9o=N+Qhnst=ep6Cax+rPNhJLRmP-Ha7E=bfVoJhUq9gXA@mail.gmail.com>
Subject: Re: Why does 'allowed-ips' affect route selection behavior?
To: "Patrick O'Sullivan" <irish@insaneirish.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Patrick,

I see some others on the wireguard mailing list have replied to a
ghost email. That is, I don't have the original that they're replying
to. Looking into it a bit further, it appears that reasonable spam
filters -- which includes but is not limited to gmail's -- will have
your mail immediately bounced, because of your strict dmarc entry
("v=DMARC1; p=reject; rua=mailto:dmarc@insaneirish.com"), since
mailing list servers like lists.zx2c4.com tend to "remail" things. You
might want to loosen these up a bit. Anyway, I've pulled it out of the
archives for quoting here:

> Hi Folks,
>
> Getting my feet wet with wireguard and enjoying the simplicity and
> performance thus far. Nonetheless, I have a question about how the
> normal route selection process is being affected by what's configured
> for 'allowed-ips'.
>
> I set up a peer and configured 'allowed-ips' for 0.0.0.0/0, as I was
> going to be sending multiple routes over the peer link via BGP and
> didn't want to keep modifying it. However, even though my default
> route was over a different interface, this seemed to result in Linux
> trying to route default traffic over wg0 despite there not being a
> default route pointing to wg0.
>
> Specifically:
>
> $ sudo ip route show
> default via 10.199.199.1 dev wlan0
> 10.111.111.0/24 dev wg0 proto kernel scope link src 10.111.111.100
> 10.199.199.0/24 dev wlan0 proto kernel scope link src 10.199.199.131
>
> By this route table, traffic to e.g. 4.2.2.1 should use 10.199.199.1.
> Packet captures were showing traffic trying to instead use wg0. Then I
> found this:
>
> $ sudo ip route get 4.2.2.1
> 4.2.2.1 dev wg0 table 51820 src 10.111.111.100
>     cache
>
> Can someone please explain this behavior?
>
> Obligatory... $ uname -rvm
> 4.14.30-v7+ #1102 SMP Mon Mar 26 16:45:49 BST 2018 armv7l
>
> And... $ dpkg -l | grep wireguard
> ii  wireguard                       0.0.20180413-1               all
>        fast, modern, secure kernel VPN tunnel (metapackage)
> ii  wireguard-dkms                  0.0.20180413-1               all
>        fast, modern, secure kernel VPN tunnel (DKMS version)
> ii  wireguard-tools                 0.0.20180413-1               armhf
>        fast, modern, secure kernel VPN tunnel (userland utilities)

Are you using wg-quick(8)? If so, wg-quick will by default do special
things to sync up the allowed ips and the system routing table, which
includes some special case rule tricks for 0.0.0.0/0. It sounds like
you know what you're doing and don't actually want this behavior. For
this, you can simply specify Table=off in the [Interface] section.
This overrides the default value of Table=auto. Alternatively, you can
choose Table=main if you want those routes added to the default table
with no special rule tricks. Or, you can choose an arbitrary
named-table or number if you'd like to add the allowed ips to some
other routing table. The man page has info.

Jason
