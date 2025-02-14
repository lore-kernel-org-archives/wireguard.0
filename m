Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3A4C54E92
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 21:22:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81ccd0c7;
	Tue, 20 May 2025 19:54:40 +0000 (UTC)
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eefcad63
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2025 10:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1739530342; x=1771066342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X45XUOzd/bOUyeGuamt7kL+bHzoQ+bKhEEl7QpzEQY8=;
 b=aPkd+4eSOMgngMZFGVwnOUPf/0+Y6UjAzMu4LHL4i/epv7OXnqJv0qX6
 WWzoUlP0cpEwVg8Hs2ln8OOSNeuJzbhCOuPJ3sfWA5GXi6jXwqI7r73TX
 XHo8pc1mpd+fT9nR8FW3c+vgwLNQ5FWvd+JtQofsm16+qBXv6nv1ynr/O A=;
X-IronPort-AV: E=Sophos;i="6.13,285,1732579200"; d="scan'208";a="493875980"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 10:52:13 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.7.35:41133]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.181:2525]
 with esmtp (Farcaster)
 id 014291f4-deb9-4469-b9db-a2315c599e77; Fri, 14 Feb 2025 10:52:12 +0000 (UTC)
X-Farcaster-Flow-ID: 014291f4-deb9-4469-b9db-a2315c599e77
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Fri, 14 Feb 2025 10:52:08 +0000
Received: from 6c7e67bfbae3.amazon.com (10.118.254.117) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 14 Feb 2025 10:51:59 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <shaw.leon@gmail.com>
CC: <alex.aring@gmail.com>, <andrew+netdev@lunn.ch>,
 <b.a.t.m.a.n@lists.open-mesh.org>, <bpf@vger.kernel.org>,
 <bridge@lists.linux.dev>, <davem@davemloft.net>, <donald.hunter@gmail.com>,
 <dsahern@kernel.org>, <edumazet@google.com>, <herbert@gondor.apana.org.au>,
 <horms@kernel.org>, <kuba@kernel.org>, <kuniyu@amazon.com>,
 <linux-can@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-ppp@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <linux-wpan@vger.kernel.org>, <miquel.raynal@bootlin.com>,
 <netdev@vger.kernel.org>, <osmocom-net-gprs@lists.osmocom.org>,
 <pabeni@redhat.com>, <shuah@kernel.org>, <stefan@datenfreihafen.org>,
 <steffen.klassert@secunet.com>, <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH net-next v9 06/11] net: ipv6: Use link netns in newlink()
 of rtnl_link_ops
Date: Fri, 14 Feb 2025 19:51:48 +0900
Message-ID: <20250214105148.1920-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <CABAhCOSsZqzrsqct+c613TVhGJdubv+_wTDxmjH8z6-PL1Mu2A@mail.gmail.com>
References: <CABAhCOSsZqzrsqct+c613TVhGJdubv+_wTDxmjH8z6-PL1Mu2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.118.254.117]
X-ClientProxiedBy: EX19D041UWB004.ant.amazon.com (10.13.139.143) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)
X-Mailman-Approved-At: Tue, 20 May 2025 19:52:08 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

From: Xiao Liang <shaw.leon@gmail.com>
Date: Fri, 14 Feb 2025 17:22:28 +0800
> On Thu, Feb 13, 2025 at 7:00 PM Kuniyuki Iwashima <kuniyu@amazon.com> wrote:
> >
> > From: Xiao Liang <shaw.leon@gmail.com>
> > Date: Thu, 13 Feb 2025 17:55:32 +0800
> > > On Thu, Feb 13, 2025 at 4:37 PM Xiao Liang <shaw.leon@gmail.com> wrote:
> > > >
> > > > On Thu, Feb 13, 2025 at 3:05 PM Kuniyuki Iwashima <kuniyu@amazon.com> wrote:
> > > > >
> > > > [...]
> > > > > > diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
> > > > > > index 863852abe8ea..108600dc716f 100644
> > > > > > --- a/net/ipv6/ip6_gre.c
> > > > > > +++ b/net/ipv6/ip6_gre.c
> > > > > > @@ -1498,7 +1498,8 @@ static int ip6gre_tunnel_init_common(struct net_device *dev)
> > > > > >       tunnel = netdev_priv(dev);
> > > > > >
> > > > > >       tunnel->dev = dev;
> > > > > > -     tunnel->net = dev_net(dev);
> > > > > > +     if (!tunnel->net)
> > > > > > +             tunnel->net = dev_net(dev);
> > > > >
> > > > > Same question as patch 5 for here and other parts.
> > > > > Do we need this check and assignment ?
> > > > >
> > > > > ip6gre_newlink_common
> > > > > -> nt->net = dev_net(dev)
> > > > > -> register_netdevice
> > > > >   -> ndo_init / ip6gre_tunnel_init()
> > > > >     -> ip6gre_tunnel_init_common
> > > > >       -> tunnel->net = dev_net(dev)
> > > >
> > > > Will remove this line.
> > >
> > > However, fb tunnel of ip6_tunnel, ip6_vti and sit can have
> > > tunnel->net == NULL here. Take ip6_tunnel for example:
> > >
> > > ip6_tnl_init_net()
> > >     -> ip6_fb_tnl_dev_init()
> > >     -> register_netdev()
> > >         -> register_netdevice()
> > >             -> ip6_tnl_dev_init()
> > >
> > > This code path (including ip6_fb_tnl_dev_init()) doesn't set
> > > tunnel->net. But for ip6_gre, ip6gre_fb_tunnel_init() does.
> >
> > Ah, okay.  Then, let's set net in a single place, which would
> > be better than spreading net assignment and adding null check
> > in ->ndo_init(), and maybe apply the same to IPv4 tunnels ?
> 
> Tunnels are created in three ways: a) rtnetlink newlink,
> b) ioctl SIOCADDTUNNEL and c) during per netns init (fb).
> The code paths don't have much in common, and refactoring
> to set net in a single place is somewhat beyond the scope
> of this series. But for now I think we could put a general rule:
> net should be set prior to register_netdevice().
> 
> For IPv4 tunnels, tunnel->net of a) is set in ip_tunnel_newlink().
> b) and c) are set in __ip_tunnel_create():
> ip_tunnel_init_net() -> __ip_tunnel_create()
> ip_tunnel_ctl() -> ip_tunnel_create() -> __ip_tunnel_create()
> So net has already been initialized when register_netdevice()
> is called.
> 
> But it varies for IPv6 tunnels. Some set net for a) or c) while
> some don't. This patch has "fixed" for a). As for c) we can
> adopt the way of ip6_gre - setting net in *_fb_tunnel_init(),
> then remove the check in ndo_init().
> 
> Is it reasonable?

Yes, fair enough.
