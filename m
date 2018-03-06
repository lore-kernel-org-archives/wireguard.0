Return-Path: chm.duquesne@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 753a7e06
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 15:31:52 +0000 (UTC)
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
 [209.85.216.178])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 756128b4
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 15:31:52 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id a23so25044646qtn.0
 for <wireguard@lists.zx2c4.com>; Tue, 06 Mar 2018 07:41:15 -0800 (PST)
MIME-Version: 1.0
Sender: chm.duquesne@gmail.com
In-Reply-To: <2324848.yjpPJzxhSp@subterfuge>
References: <CAHLp1YmDybu01qzrH4-=8U0Cm7__3myF4p75iejBB5Zd+AKs8g@mail.gmail.com>
 <CAHLp1YkeCV5KxT2npcSOVb_vyB5oWFY2vq4bA12QLFFeJytzvA@mail.gmail.com>
 <2324848.yjpPJzxhSp@subterfuge>
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Tue, 6 Mar 2018 16:40:54 +0100
Message-ID: <CAHLp1Yn_MzvVROKHA_+uvMghhvxiNvvfYnjVri8RK5iq6X0zwQ@mail.gmail.com>
Subject: Re: Assigning addresses with avahi-autoipd
To: Reuben Martin <reuben.m.work@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat, Mar 3, 2018 at 5:04 AM, Reuben Martin <reuben.m.work@gmail.com> wrote:
> ARP is layer2. Wireguard is layer3. If you want ARP requests to propogate
> between the networks you will have to set up layer2 tunneling of some sort.

Ok, thanks a lot. The other VPN software I have used can also
transport layer2: openvpn has the bridge mode, tinc has the switch
mode. I was assuming wireguard had (or could aquire) this capability
as well. Are there reasons not to support this? I would like to have
your opinion.

> If you want multicast traffic to propogate, an IGMP / MLP proxy server would
> probably be the easiest solution.

Thank you for the advice, but then I think I will just hack something
with dnsmasq. The point of using mDNS was to avoid maintaining an
extra piece of software. The moment I setup an IGMP / MLP proxy, I
fail this goal, and at this point if I am going to set up something, I
would rather fall back to a DNS management tool.

Cheers,
Christophe-Marie
