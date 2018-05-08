Return-Path: logcabin@fastmail.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b538110
 for <wireguard@lists.zx2c4.com>; Tue, 8 May 2018 16:21:11 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id adce7a36
 for <wireguard@lists.zx2c4.com>; Tue, 8 May 2018 16:21:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5BC5022733
 for <wireguard@lists.zx2c4.com>; Tue,  8 May 2018 12:23:41 -0400 (EDT)
Message-Id: <1525796621.839781.1365024480.36F36E48@webmail.messagingengine.com>
From: logcabin@fastmail.net
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Date: Tue, 08 May 2018 12:23:41 -0400
In-Reply-To: <4f1f154f85bb01204c883e37e41eba86@rcrdbrt.com>
Subject: Re: WG interface to ipv4
References: <4f1f154f85bb01204c883e37e41eba86@rcrdbrt.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, May 8, 2018, at 11:44 AM, Riccardo Berto wrote:
> 
> 
> I don't really get why the iface bindings should be accomplished at the 
> WireGuard level. If I get it correctly, it won't be safer than it 
> already is.
> WireGuard just has to provide a secure and standard network interface. 
> There are other full-featured, clogged VPNs out there that can even make 
> you the coffee, I'd like WireGuard to stand out and stick to the 
> original "UNIX tools philosophy": do one thing and do it well.
>
Agree completely. I'd be happy to  see  WG remain as a fast, simple packet-encryption-transmission  engine. 
_______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
