Return-Path: labawi-wg@matrix-dream.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8f42221
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 09:29:37 +0000 (UTC)
Received: from matrix-dream.net (matrix2.matrix-dream.net [84.200.73.251])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bc22331
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 09:29:37 +0000 (UTC)
Date: Tue, 21 Nov 2017 09:34:35 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: =?utf-8?B?0KDQvtC80LDQvSDQk9Cw0LLRgNC40LvQvtCy?= <kogeler@gmail.com>
Subject: Re: new bug on armhf
Message-ID: <20171121093435.GA4278@matrix-dream.net>
References: <CALpTdxnL6akts71rb4yg+wisxqqs0U2wXPE5c12J9yMHVL6wGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <CALpTdxnL6akts71rb4yg+wisxqqs0U2wXPE5c12J9yMHVL6wGw@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

I don't know much about arm modules, but is seems
like a generic module-kernel mismatch.

Are you using kernel configuration and sources
for the running kernel?

Regards,
Ivan


On Mon, Nov 20, 2017 at 10:34:09PM +0300, Роман Гаврилов wrote:
> Hello!
> 
> I have new bug on armhf.
> 
> ____________________________________________________________
> 
> build from:
> https://git.zx2c4.com/WireGuard/commit/?id=82cacee3511e5c2f624203487124e5ba0151c84d
> 
> ____________________________________________________________
> 
> software:
> Ubuntu Xenial 16.04
> 
> hardware:
> PC: Orange Pi Plus 2E
> SOC: Allwinner H3
> 
> ____________________________________________________________
> cat /proc/cpuinfo
> processor    : 0
> model name    : ARMv7 Processor rev 5 (v7l)
> BogoMIPS    : 11.42
> Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
> vfpd32 lpae evtstrm
> CPU implementer    : 0x41
> CPU architecture: 7
> CPU variant    : 0x0
> CPU part    : 0xc07
> CPU revision    : 5
> 
> processor    : 1
> model name    : ARMv7 Processor rev 5 (v7l)
> BogoMIPS    : 11.42
> Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
> vfpd32 lpae evtstrm
> CPU implementer    : 0x41
> CPU architecture: 7
> CPU variant    : 0x0
> CPU part    : 0xc07
> CPU revision    : 5
> 
> processor    : 2
> model name    : ARMv7 Processor rev 5 (v7l)
> BogoMIPS    : 11.42
> Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
> vfpd32 lpae evtstrm
> CPU implementer    : 0x41
> CPU architecture: 7
> CPU variant    : 0x0
> CPU part    : 0xc07
> CPU revision    : 5
> 
> processor    : 3
> model name    : ARMv7 Processor rev 5 (v7l)
> BogoMIPS    : 11.42
> Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
> vfpd32 lpae evtstrm
> CPU implementer    : 0x41
> CPU architecture: 7
> CPU variant    : 0x0
> CPU part    : 0xc07
> CPU revision    : 5
> 
> Hardware    : Allwinner sun8i Family
> Revision    : 0000
> Serial        : 02c0008149ab5a29
> 
> ____________________________________________________________
> 
> uname -a
> Linux LAB-HOME-SERVER 4.13.14-sunxi #240 SMP Mon Nov 20 00:09:06 CET 2017
> armv7l armv7l armv7l GNU/Linux
> 
> ____________________________________________________________
> 
> I use mainline kernel.
> 
> Kernel config:
> https://drive.google.com/open?id=1H6Vk7P8bCNAktBhmfJpTtGse2rRauRiB
> 
> ____________________________________________________________
> 
> sudo modprobe wireguard
> modprobe: ERROR: could not insert 'wireguard': Exec format error
> 
> ____________________________________________________________
> 
> dmesg | grep wiregu
> [  532.927236] wireguard: loading out-of-tree module taints kernel.
> [  532.930604] wireguard: unknown relocation: 51
> [  533.005892] wireguard: unknown relocation: 51
> 
> -- 
> Thanks,
> Roman Gavrilov

> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
