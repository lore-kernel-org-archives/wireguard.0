Return-Path: joerg@higgsboson.tk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17bf9bb8
 for <wireguard@lists.zx2c4.com>; Wed, 1 Mar 2017 08:12:55 +0000 (UTC)
Received: from mail.thalheim.io (mail.thalheim.io [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48f5ab52
 for <wireguard@lists.zx2c4.com>; Wed, 1 Mar 2017 08:12:54 +0000 (UTC)
Received: from [10.100.45.200] (wj0732.dip.tu-dresden.de [141.76.98.220])
 by mail.thalheim.io (Postfix) with ESMTPSA id 14FB935A37
 for <wireguard@lists.zx2c4.com>; Wed,  1 Mar 2017 08:14:41 +0000 (UTC)
Subject: Re: RTNETLINK answers: Operation not supported
To: wireguard@lists.zx2c4.com
References: <CAPtYZXijvKABYy35SjHTGNrC4fFkP+9xwyUR8RyUOjMB=mB2WQ@mail.gmail.com>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Message-ID: <b0f40ee5-0683-3a59-39b0-dc5b7fef3b12@higgsboson.tk>
Date: Wed, 1 Mar 2017 09:14:40 +0100
MIME-Version: 1.0
In-Reply-To: <CAPtYZXijvKABYy35SjHTGNrC4fFkP+9xwyUR8RyUOjMB=mB2WQ@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


On 2017-02-28 17:08, William Clark wrote:
> Hello,
>
> So I wanted to try WireGuard but unfortunately I can't get pas this part:
> ip link add dev wg0 type wireguard.
>
> When ever I run the command "ip link add dev wg0 type wireguard"
> I get the output:
> RTNETLINK answers: Operation not supported
>
> This both happens on CentOS 7 and Fedora 25 and Ubuntu 16.04.
>
> CentOS 7 Kernel:
> Linux hostname 3.10.0-514.6.2.el7.x86_64 #1 SMP Thu Feb 23 03:04:39 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux
> Fedora 25 Kernel:
> Linux hostname 4.9.7-x86_64-X #2 SMP Thu Feb 2 15:43:55 EST 2017 x86_64 x86_64 x86_64 GNU/Linux
>
> I've tried installing Linux headers too, but no luck and I've rebooted after the upgrade too, and still no luck.
>
> Thanks a lot.

If the following commands do not succeed, the wireguard kernel module was not installed correctly:

$ modprobe wireguard
$ lsmod | grep wireguard
wireguard             126976  0
x_tables               28672  2 xt_hashlimit,wireguard
ip6_udp_tunnel         16384  1 wireguard
udp_tunnel             16384  1 wireguard
ipv6                  401408  162 nf_conntrack_ipv6,nf_defrag_ipv6,wireguard,bridge
