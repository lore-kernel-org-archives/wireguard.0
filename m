Return-Path: eric@ericlight.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c63f2c5e
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Apr 2018 13:48:08 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4075f6d
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Apr 2018 13:48:08 +0000 (UTC)
Message-Id: <1524923360.509743.1353883656.6A466327@webmail.messagingengine.com>
From: Eric Light <eric@ericlight.com>
To: reiner otto <augustus_meyer@yahoo.de>, wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Date: Sun, 29 Apr 2018 01:49:20 +1200
Subject: Re: Route all traffic to one IP _only_ via wireguard
In-Reply-To: <570542680.2946509.1524910065103@mail.yahoo.com>
References: <570542680.2946509.1524910065103.ref@mail.yahoo.com>
 <570542680.2946509.1524910065103@mail.yahoo.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Reiner! 

I think the problem here is your client's AllowedIPs section. If you only want to access one address, you only enter that target IP - not the whole internet space (0.0.0.0/0). That's why everything is being routed out via your wg0. 

So you should change that client AllowedIPs to 172.16.0.1/32, and that'll fix it. Alternatively, set it to /24 if you also want access to other devices within the corporate LAN... That's how I do it. 

I think that's all you need. Sorry if I've missed something! :) 

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Sat, 28 Apr 2018, at 22:07, reiner otto wrote:
> My basic setup of wg works, I can ssh from/to server or client.
> But the real goal is to tunnel only traffic with a specific destination IP
> via wireguard from client to server. 
> I.e. a local router, which allows direct access to the web,
> _BUT_ all traffic going to the corporate server using wireguard only.
> Corporate server (public 1.2.3.4) == wireguard server (172.16.0.1).
> 
> I tried various settings on my client, like
> ip route 1.2.3.4 dev wg0
> ip route 1.2.3.4 via 172.16.0.1 
> etc.
> but nothing worked.
> 
> Any help really appreciated.
> 
> ---
> wg0.conf on server (1.2.3.4):
> [Interface]
> ListenPort = 1234
> PrivateKey = secret
> [Peer]
> PublicKey = secret
> AllowedIPs = 172.16.0.0/16
> -
> wg0.conf on client (172.16.18.31):
> [Interface]
> PrivateKey = secret
> ListenPort = 1234
> [Peer]
> PublicKey = secret
> AllowedIPs = 0.0.0.0/0
> Endpoint = 1.2.3.4:1234
> 
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
