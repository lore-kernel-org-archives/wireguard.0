Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d808824
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 08:33:12 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [91.121.86.59])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00e6fb09
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 08:33:12 +0000 (UTC)
Date: Sat, 14 Apr 2018 13:47:25 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Include directive to support "conf.d/*" and the like
Message-ID: <20180414134725.10b778a6@natsu>
In-Reply-To: <CAHmME9q8Vp6GTH3u0Lu21HSoBUny58yfdDUB17yss9sq8wzpyg@mail.gmail.com>
References: <20180316130222.3a9d0611@natsu> <87y3isxp3w.fsf@fifthhorseman.net>
 <CAHmME9q8Vp6GTH3u0Lu21HSoBUny58yfdDUB17yss9sq8wzpyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Roman Mamedov <rm.wg@romanrm.net>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat, 14 Apr 2018 03:47:57 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> Hi Roman,
> 
> This also came up in another thread I was replying to earlier tonight.
> While one way indeed is to have an 'include' directive, it seems
> simple enough to just do something like:
> 
> $ wg setconf wg0 <(cat /etc/wireguard/mysite.conf.d/*.conf)
> 
> And then you can have various fragments in there like:
> 
> 000-interface.conf
> 001-peergroupA.conf
> 001-peergroupB.conf
> 001-peergroupC.conf
> 
> And so forth. Would this be an acceptable solution for you?

Yeah, thanks. I settled on a solution similar to this. Since WG in my case is
"external" to the main OS (i.e. not wired into standard initscripts or network
configuration), I have my own shell-script bringing it up anyways -- and that
script might as well pre-process or generate the configuration file. So now I
build a full config file in /tmp/ from various pieces and auto-detected
host-specific conditions, and then do a setconf to that. (Rather than addconf
as some suggested, I prefer to have the complete file available on disk for
inspection in case any debugging is needed).

-- 
With respect,
Roman
