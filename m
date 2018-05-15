Return-Path: eric@ericlight.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32c0ae9c
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 20:50:36 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cd678b2
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 20:50:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 6C35122648
 for <wireguard@lists.zx2c4.com>; Tue, 15 May 2018 16:50:36 -0400 (EDT)
Message-Id: <1526417435.709029.1373298160.471617A2@webmail.messagingengine.com>
From: Eric Light <eric@ericlight.com>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Date: Wed, 16 May 2018 08:50:35 +1200
Subject: Re: Multiple (client-)peers with same keys possible ?
In-Reply-To: <267632710.2840000.1526409369057@mail.yahoo.com>
References: <267632710.2840000.1526409369057.ref@mail.yahoo.com>
 <267632710.2840000.1526409369057@mail.yahoo.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Reiner!

I can't figure out how that would work, considering WG is based around crypto-key routing.  How would it know where to route a given packet?

Additionally, two sets of AllowedIPs=0.0.0.0/0 would imply two different default routes.

I just don't see how that could function, tbh.  :)

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Wed, 16 May 2018, at 06:36, reiner otto wrote:
> Is it possible somehow, to define multiple (client-)peers to share the 
> same keys ?
> (Trading some loss of security for simpler distribution)
> 
> I.e. on server:
> [Interface]
> ListenPort = 5000
> PrivateKey = ABCD ...XYZ
> Address=172.16.0.1
> 
> [Peer]
> PublicKey = 1234...7890
> AllowedIPs = 172.16.0.0/16
> 
> 
> client1:
> [Interface]
> PrivateKey = top...secret
> ListenPort = 5000
> Address = 172.16.0.2
> [Peer]
> PublicKey = everybodyknows
> AllowedIPs = 0.0.0.0/0
> Endpoint = 1.2.3.4
> 
> client2:
> [Interface]
> PrivateKey = top...secret
> ListenPort = 5000
> Address = 172.16.0.3
> [Peer]
> PublicKey = everybodyknows
> AllowedIPs = 0.0.0.0/0
> Endpoint = 1.2.3.4
> ....
> ....
> ....
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
