Return-Path: labawi-wg@matrix-dream.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 999c07c3
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 21:39:42 +0000 (UTC)
Received: from matrix-dream.net (matrix2.matrix-dream.net
 [IPv6:2001:1608:10:3::a:8])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a03f9e75
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 21:39:42 +0000 (UTC)
Received: from ivan by matrix-dream.net with local (Exim 4.89)
 (envelope-from <labawi-wg@matrix-dream.net>) id 1fIhfn-0004y3-I4
 for wireguard@lists.zx2c4.com; Tue, 15 May 2018 22:39:55 +0100
Date: Tue, 15 May 2018 22:39:55 +0100
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: wireguard@lists.zx2c4.com
Subject: Re: Multiple (client-)peers with same keys possible ?
Message-ID: <20180515213955.GA19046@matrix-dream.net>
References: <267632710.2840000.1526409369057.ref@mail.yahoo.com>
 <267632710.2840000.1526409369057@mail.yahoo.com>
 <1526417435.709029.1373298160.471617A2@webmail.messagingengine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1526417435.709029.1373298160.471617A2@webmail.messagingengine.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

as said, I don't concieve a reasonable way of using the same key.
Wireguard routes and needs to identify and know its clients.

That said, I don't see a reason why the clients couldn't have similar
private keys.

e.g.

Server:

Private = PrivateKey

[Peer1]
Pubkey = secret_to_public(notreallysecret..001)
AllowedIPs = 172.16.0.1/16

[Peer2]
Pubkey = secret_to_public(notreallysecret..002)
AllowedIPs = 172.16.0.2/16


I would carefully consider security consequences and possible
alternatives before deploying such a scheme.

Cheers,
ivan


On Wed, May 16, 2018 at 08:50:35AM +1200, Eric Light wrote:
> Hi Reiner!
> 
> I can't figure out how that would work, considering WG is based around crypto-key routing.  How would it know where to route a given packet?
> 
> Additionally, two sets of AllowedIPs=0.0.0.0/0 would imply two different default routes.
> 
> I just don't see how that could function, tbh.  :)
> 
> E
> 
> --------------------------------------------
> Q: Why is this email five sentences or less?
> A: http://five.sentenc.es
> 
> On Wed, 16 May 2018, at 06:36, reiner otto wrote:
> > Is it possible somehow, to define multiple (client-)peers to share the 
> > same keys ?
> > (Trading some loss of security for simpler distribution)
> > 
> > I.e. on server:
> > [Interface]
> > ListenPort = 5000
> > PrivateKey = ABCD ...XYZ
> > Address=172.16.0.1
> > 
> > [Peer]
> > PublicKey = 1234...7890
> > AllowedIPs = 172.16.0.0/16
> > 
> > 
> > client1:
> > [Interface]
> > PrivateKey = top...secret
> > ListenPort = 5000
> > Address = 172.16.0.2
> > [Peer]
> > PublicKey = everybodyknows
> > AllowedIPs = 0.0.0.0/0
> > Endpoint = 1.2.3.4
> > 
> > client2:
> > [Interface]
> > PrivateKey = top...secret
> > ListenPort = 5000
> > Address = 172.16.0.3
> > [Peer]
> > PublicKey = everybodyknows
> > AllowedIPs = 0.0.0.0/0
> > Endpoint = 1.2.3.4
> > ....
> > ....
> > ....
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
