Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a81aab87
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 22:47:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86226951
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 22:47:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 778c322a
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 22:47:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8d6d9dd5
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 22:47:42 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id b204so98674239oii.1
 for <wireguard@lists.zx2c4.com>; Sat, 13 May 2017 15:58:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170513070534.GA22218@tuxmachine.polynome.dn42>
References: <20170513070534.GA22218@tuxmachine.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 14 May 2017 00:58:37 +0200
Message-ID: <CAHmME9o=EGWOcTRVtVQVCoJXL6KueX8eM98GWBJUtzEE67tAhw@mail.gmail.com>
Subject: Re: Installation instructions for Debian
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
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

Hey Baptiste,

Spectacular, thanks a bunch. I think I had asked about this same thing
a while back, but somehow I got confused in the ensuing mailing list
thread and eventually I forgot about it. So I'm glad you've brought
this back up. I updated the install page with verbatim what you sent.

Jason

On Sat, May 13, 2017 at 9:05 AM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
> Hi Jason,
>
> Could you update the installation instructions for Debian [1]?
>
> Based on the discussion from a few months ago, and given that Wireguard
> now supports Jessie's 3.16 kernel, these instructions should be added:
>
>     For Debian jessie or stretch:
>     # echo "deb http://deb.debian.org/debian/ unstable main" > /etc/apt/sources.list.d/unstable-wireguard.list
>     # cat <<EOF > /etc/apt/preferences.d/limit-unstable
>     Package: *
>     Pin: release a=unstable
>     Pin-Priority: 200
>     EOF
>     # apt update
>     # apt install wireguard-dkms wireguard-tools
>
> I have verified that the resulting setup is functional (with 0.0.20170421-2 on jessie).
>
> Thanks,
> Baptiste
>
> [1] https://www.wireguard.io/install/



-- 
Jason A. Donenfeld
Deep Space Explorer
fr: +33 6 51 90 82 66
us: +1 513 476 1200
www.jasondonenfeld.com
www.zx2c4.com
zx2c4.com/keys/AB9942E6D4A4CFC3412620A749FC7012A5DE03AE.asc
