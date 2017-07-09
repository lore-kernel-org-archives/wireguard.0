Return-Path: jomat+wireguard.io@jmt.gr
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bc0f697
 for <wireguard@lists.zx2c4.com>; Sun, 9 Jul 2017 22:59:00 +0000 (UTC)
Received: from mx0.jmt.gr (mx0.jmt.gr [81.7.7.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50f743d8
 for <wireguard@lists.zx2c4.com>; Sun, 9 Jul 2017 22:59:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Sun, 09 Jul 2017 23:17:04 +0000
From: jomat+wireguard.io@jmt.gr
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Subject: Re: Debian-based configuration for wireguard
In-Reply-To: <20170709213020.GF22784@tuxmachine.polynome.dn42>
References: <20170709213020.GF22784@tuxmachine.polynome.dn42>
Message-ID: <35cd4d321a82ba05aa4e118979bc5a87@jmt.gr>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

On 2017-07-09 21:30, Baptiste Jonglez wrote:
> The goal is to reuse functionalities from /etc/network/interfaces, 
> which
> is quite natural on Debian.  Simple use-cases like the point-to-point
> tunnel don't need wg-quick at all.

Nice! I also don't like wg-quick too much, but also dislike the
pre-/post-/-up/-down directives in my /etc/network/interfaces, so
I put this script to /etc/network/if-pre-up.d/ and if-post-down.d
which could work for Debian, too:

https://github.com/jomat/aports/blob/master/testing/wireguard/wireguard.ifupdown

Bye,
jomat
