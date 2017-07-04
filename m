Return-Path: mailings@roelf.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ab465eb
 for <wireguard@lists.zx2c4.com>; Tue, 4 Jul 2017 15:38:30 +0000 (UTC)
Received: from mail.aperture-laboratories.science
 (mail.aperture-laboratories.science [176.31.38.83])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f8bc814
 for <wireguard@lists.zx2c4.com>; Tue, 4 Jul 2017 15:38:30 +0000 (UTC)
Received: from mail.aperture-laboratories.science (localhost [127.0.0.1])
 by mail.aperture-laboratories.science (Postfix) with ESMTP id 95BF343D73
 for <wireguard@lists.zx2c4.com>; Tue,  4 Jul 2017 16:07:15 +0000 (UTC)
Received: from [IPv6:2a06:e881:1301:2:86ba:9dc0:2d2d:8faa] (unknown
 [IPv6:2a06:e881:1301:2:86ba:9dc0:2d2d:8faa])
 by mail.aperture-laboratories.science (Postfix) with ESMTPSA id 9FE5643D72
 for <wireguard@lists.zx2c4.com>; Tue,  4 Jul 2017 16:07:14 +0000 (UTC)
Subject: Re: problem wireguard + ospf + unconnected tunnels
To: wireguard@lists.zx2c4.com
References: <1499116162.70598782@f401.i.mail.ru>
From: "Roelf \"rewbycraft\" Wichertjes" <mailings+wireguard@roelf.org>
Message-ID: <740cb9af-aba8-c610-c1b7-0a7c69396e46@roelf.org>
Date: Tue, 4 Jul 2017 17:55:48 +0200
MIME-Version: 1.0
In-Reply-To: <1499116162.70598782@f401.i.mail.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

 From what you said, I surmise the following setup:
- Three devices, A, B and C.
- A talks ospf to B over wireguard.
- A talks ospf to C over wireguard.
- The connection between A and C has gotten interrupted. (maybe C is a 
laptop)
- The error causes the entire ospf process to fail for all interfaces.
   In other words: A will suddenly also stop talking B when the 
connection A<->C fails?

If I am correct in that, there are a few things to note:
  - The "No buffer space available" error is normal from wireguard when 
an interface cannot reach the peer.
  - A single "failing" interface shouldn't kill the ospf process for all 
interfaces.
  - This sounds more like a quagga problem, as I have a similar setup (I 
use my laptop for device C in my case) except I use the BIRD routing 
daemon instead of quagga (and this setup works fine for me).

Of course, before any definitive conclusions can be made, we'll need a 
bit more information. Could you possibly provide us with the following 
pieces of information:
  - What distribution are you using?
  - What kernel (version) are you using?
  - What wireguard version are you using?
  - What quagga version are you using?
  - Please provide the kernel logs.
  - Please provide the quagga logs.

On 07/03/2017 11:09 PM, ae wrote:
> situation
> 2 tunnels
> 1 normal - 2nd with unconnected ending
> + ospfd quagge
> 
> At start everything works fine - but after ~ 30-60 seconds - the ospf 
> stops working
> 
> This is due to the fact that the ospf daemon sends packets from the same 
> socket on different interfaces - and in the tunnel interface everything 
> goes fine - but in the 2nd packets accumulate
> And after a certain accumulation - the socket of the demon daemon stops 
> working on sending completely "No buffer space available"
> 
> Is it possible to fix this with settings?
> 
> 
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 
