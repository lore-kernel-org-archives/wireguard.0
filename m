Return-Path: ameretat.reith@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a68299c
 for <wireguard@lists.zx2c4.com>; Sat, 7 Oct 2017 12:55:42 +0000 (UTC)
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66f5f93b
 for <wireguard@lists.zx2c4.com>; Sat, 7 Oct 2017 12:55:42 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id v13so11200868pgq.6
 for <wireguard@lists.zx2c4.com>; Sat, 07 Oct 2017 06:25:06 -0700 (PDT)
Return-Path: <ameretat.reith@gmail.com>
Date: Sat, 7 Oct 2017 16:54:54 +0330
From: Ameretat Reith <ameretat.reith@gmail.com>
To: Ryan McGee <rwm.pc.repair@gmail.com>
Subject: Re: wireguard bypass question
Message-ID: <20171007165454.0a7166d5@gmail.com>
In-Reply-To: <CANcRkim=9nUOQT5abRfTOVfXzVc1wAo+b_hNQjugHsxABhiWVw@mail.gmail.com>
References: <CANcRkik-gjJqz89FFtAXPC2_ixi8uZv6wDTTOOsjJqNieiDPKg@mail.gmail.com>
 <CAHmME9qHxvQc63ubFxv7KvrrJ0J26q6dSJPi4YYjjqs=cDDhxg@mail.gmail.com>
 <CANcRkim=9nUOQT5abRfTOVfXzVc1wAo+b_hNQjugHsxABhiWVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, 5 Oct 2017 18:00:00 -0700
Ryan McGee <rwm.pc.repair@gmail.com> wrote:

> So I set up the VPN using Mullvad's guad here:
> https://mullvad.net/guides/running-wireguard-router/
> 
> I've tried vpnbypass filling out just the domain
> "/netflix.com/vpnbypass" then I also tried adding the port ranges,
> IPs and ports found at:
> https://backlothelp.netflix.com/hc/en-us/articles/115000257627-What-are-Netflix-s-Aspera-IP-Addresses-and-Port-Ranges-

Ryan, Netflix IPs are much much more than this list.

> Nothing seems to work as netflix still sees me going through a VPN.

On which platform you want to watch Netflix? If It's Linux, you may mark
packets of one instance of browser by the power of namespaces and
abusing TOS field of IP packets and then on LEDE you can exclude these
packets from VPN by iptables. If you watch on any browser, dnsmasq and
IPset approach is cleanest approach [1]. If It's mobile, you need to
find Netflix and AWS IPs and route them outside of VPN by iptables. Last
approach works everywhere but It's most dirty method.

If I were you I would just start another access point in router and
exclude incoming traffic to that AP from VPN. Then I'd connect to this
AP just for watching Netflix.

1: In this case our interests are subdomains of `netflix.com` and
`nflxvideo.net`
