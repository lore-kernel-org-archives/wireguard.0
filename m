Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b980e858
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 16:23:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7ddfc98
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 16:23:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2881f39f
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 16:23:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cd863c30
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 16:23:25 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id a103so162202143ioj.1
 for <wireguard@lists.zx2c4.com>; Tue, 02 May 2017 09:32:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGzienHd=L8tYn41WdjGSk4hvCWiUW8LUi4C8jf8piBhLA=dng@mail.gmail.com>
References: <CAGzienFDihyN8fDbKj4KQ-1cwz53_u7Vz3G37P08+wS=hbF0LA@mail.gmail.com>
 <CAHmME9pNgSjXeKnzM23Bb3Q=zZJKMDtq-3xevMzdtP7XdoMjkQ@mail.gmail.com>
 <CAGzienHd=L8tYn41WdjGSk4hvCWiUW8LUi4C8jf8piBhLA=dng@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 2 May 2017 18:32:56 +0200
Message-ID: <CAHmME9q9Z+P7=UTE2Sc9b7tUajjkgG-pnvgpMqBO33AGdwdoyw@mail.gmail.com>
Subject: Re: Ability to use one udp port for multiple wg interfaces
To: Damian Kaczkowski <damian.kaczkowski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, May 2, 2017 at 11:56 AM, Damian Kaczkowski
<damian.kaczkowski@gmail.com> wrote:
> Hello Janson.

My name is Jason.

> 3. Well if one uses firewall to control flows between zones in environment
> with mix protocols (eg. gre, ipsec, openvpn and so on) then using second
> tool just to control only wireguard ACLs is not very convenient way from
> administrative point of view. Also in case where peer is roaming and
> changing its source IP (eg. road warrior) then maintaining wireguard ACLs
> will be a huge PITA, if not impossible at large scale.

No, you are wrong. Allowed-ips controls the IP addresses _within_ the
tunnel. Thus your iptables rules can use "-i wg0 -s 10.0.0.3/32" or
similar to match a _precise_ peer.


> 4. Does wireguard have some means so that iptables can easily differentiate
> tunnels (peers) and put them in appropriate 'zone'? like eg.
> iptables -m policy --help
> iptables -m ah --help
> iptables -m esp --help
>
> Or something similar?

WireGuard has gone out of its way to explicitly avoid this brain
damage. Use the allowed-ips concept instead.
