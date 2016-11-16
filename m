Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d506553a
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 17:42:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a37044e
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 17:42:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 286c738f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 17:42:49 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id w33so111086635qtc.3
 for <wireguard@lists.zx2c4.com>; Wed, 16 Nov 2016 09:45:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1F78626C-0102-4833-8E86-AEC1403507BF@danrl.com>
References: <A124E9F5-B1CF-4904-A849-EEAAD788030C@danrl.com>
 <55998A34-BCEC-4693-ABC4-48AC108F7A64@danrl.com>
 <39B38656-DD06-43E8-BC20-BAF5BC622EBA@danrl.com>
 <20161116081527.GB14469@tuxmachine.polynome.dn42>
 <E0BFF696-C9B9-45BC-98E5-E736C1AE11EF@danrl.com>
 <CAHmME9ph6MXEkwTdSgQ5MBRAimOv512zNjipxAo+qXSbLDpscg@mail.gmail.com>
 <CAHmME9pX8iG67Mz_0zN-biOTyGXtm2DjRtQQwJTw9UTxz3ar4w@mail.gmail.com>
 <1F78626C-0102-4833-8E86-AEC1403507BF@danrl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Nov 2016 18:45:39 +0100
Message-ID: <CAHmME9otOTxc8X=-qKSHsFtm6u9G3rda7efdnaAgR8qnYY6fuA@mail.gmail.com>
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Wireguard in OpenWRT/LEDE: FYI: Pull Request
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Live on wireguard.io/install/ now:

> commit 6bd5f8cde97456e37415eab80c19d9e8241f7639
> Author: Jason A. Donenfeld <Jason@zx2c4.com>
> Date:   Wed Nov 16 18:44:17 2016 +0100
>
>     Add openwrt docs
>
> diff --git a/docs/install.md b/docs/install.md
> index 0946182..98579e9 100644
> --- a/docs/install.md
> +++ b/docs/install.md
> @@ -46,11 +46,11 @@ As WireGuard nears closer to release time, distribution support will be much wid
>      boot.extraModulePackages = [ cfg.boot.kernelPackages.wireguard ];
>      environment.systemPackages = [ pkgs.wireguard ];
>
> -#### OpenWRT <small>[trunk &ndash; [module &amp; tools](https://github.com/openwrt/packages/blob/master/net/wireguard/Makefile)]</small>
> +#### OpenWRT &amp; LEDE <small>[trunk &ndash; [module &amp; tools](https://github.com/openwrt/packages/blob/master/net/wireguard/Makefile)]</small>
>
>      # opkg install kmod-wireguard wireguard-tools
>
> -Note that the OpenWRT package does not yet enable multi-core crypto, but their developers are working on it.
> +Further installation and configuration instructions may be found on the [wiki](https://wiki.lede-project.org/docs/user-guide/tunneling_interface_protocols).
>
>  #### <i class="fa fa-apple"></i> Mac OS X <small>[homebrew &ndash; [tools](http://braumeister.org/formula/wireguard-tools)]</small>
>
