Return-Path: saeidscorp@yahoo.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8089e03
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 09:47:29 +0000 (UTC)
Received: from sonic310-12.consmr.mail.ir2.yahoo.com
 (sonic310-12.consmr.mail.ir2.yahoo.com [77.238.177.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bdc7709d
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 09:47:28 +0000 (UTC)
Received: from smtp165.mail.ir2.yahoo.com (EHLO scorpbook.localnet)
 ([46.228.39.32])
 by smtp410.mail.ir2.yahoo.com (JAMES SMTP Server ) with ESMTPA ID
 12e76f17809c46a16ad37ad0533e1494 for <wireguard@lists.zx2c4.com>;
 Tue, 06 Mar 2018 09:56:43 +0000 (UTC)
From: Saeid Akbari <saeidscorp@yahoo.com>
To: wireguard@lists.zx2c4.com
Subject: Re: Update: exempting two things from WireGuard tunneling
Date: Tue, 06 Mar 2018 13:26:10 +0330
Message-ID: <253396407.qCa4LE9dOI@scorpbook>
In-Reply-To: <CAKXLc7dPyiqBYCNedFc6cPyGCh3j4RmO7fKU+BNsH4g8T2dJKw@mail.gmail.com>
References: <d98b43d3-b847-c1c5-931a-5c3164061058@posteo.net>
 <9de22427-0180-ac5a-cd7c-b5f9810ecbf9@posteo.net>
 <CAKXLc7dPyiqBYCNedFc6cPyGCh3j4RmO7fKU+BNsH4g8T2dJKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Monday, March 5, 2018 11:12:25 PM +0330 Kalin KOZHUHAROV wrote:
> On Mon, Mar 5, 2018 at 7:59 PM, Nicholas Joll <najoll@posteo.net> wrote:
> 
> > (2) Netflix (which I run via a Chrome app).
> 
> ... cannot help you much here, but I guess it is some tcp, udp and rtp
> mix to some large cloud of IPs.
> 
> Cheers,
> Kalin.

On Monday, March 5, 2018 11:13:41 PM +0330 Jason A. Donenfeld wrote:
> Use the ipset= feature of dnsmasq, and then use policy routing on that
> ipset.

Or this link might help: http://www.evolware.org/?p=369

I personally prefer cgroups when I occasionally need to use some website or 
software with different routing needs. So I just simply start a new instance 
of my browser in that cgroup to have its traffic bypassed the wireguard. (or 
bypassing wg? not sure about the grammar :)

PS: I think iptables version 1.6.0(?) and onwards has cgroup match built in; 
so no need to use the binary provided by the website.
