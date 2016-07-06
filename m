Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83ad24e4
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 15:21:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 994a1726
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 15:21:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1bc51b00
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 15:21:08 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id f6so156859485lfg.0
 for <wireguard@lists.zx2c4.com>; Wed, 06 Jul 2016 08:21:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160706150845.GE2040@lud.polynome.dn42>
References: <20160629112423.GC31514@lud.polynome.dn42>
 <20160704074837.GA24805@lud.polynome.dn42>
 <20160705220336.GA18854@lud.polynome.dn42>
 <CAHmME9rOUu4CBAgaSg684F45VT2Od9QHExNT=ftqn46EdpTxeQ@mail.gmail.com>
 <CAHmME9paKdCr_-W5_PJ1nxnNqCLdbuJ04T+PUp2NaMZZV+K2Tg@mail.gmail.com>
 <20160706150845.GE2040@lud.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 6 Jul 2016 17:21:11 +0200
Message-ID: <CAHmME9pP6CodwdYVmzj_SuHzB3WmMt+Jy1H+-yvfENeKdBLWTQ@mail.gmail.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] OpenWRT package for wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Jul 6, 2016 at 5:08 PM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
> Interesting.  I found this script in LEDE:
>
>   https://git.lede-project.org/?p=source.git;a=blob;f=scripts/strip-kmod.sh;hb=HEAD

Cool script. I'll play with it when I get home. It's possible that it
doesn't do enough, though. WireGuard is split into several files, so
there are some non-static function. But, those functions aren't in use
elsewhere in the kernel -- they shouldn't be exported. So it's a
matter of tuning things so that these symbols are removed. Will get
back to you on this...
