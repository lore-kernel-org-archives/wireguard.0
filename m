Return-Path: eric@ericlight.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00ce7346
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Apr 2018 20:43:36 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c9be077
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Apr 2018 20:43:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id DBCA921A06
 for <wireguard@lists.zx2c4.com>; Thu, 12 Apr 2018 16:57:38 -0400 (EDT)
Message-Id: <1523566658.669085.1336152104.41A547DF@webmail.messagingengine.com>
From: Eric Light <eric@ericlight.com>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
References: <c7a04eeded1bdf5a9b4f9cf1e5291a91@rcrdbrt.com>
Subject: Re: Troubleshooting WireGuard connections
Date: Fri, 13 Apr 2018 08:57:38 +1200
In-Reply-To: <c7a04eeded1bdf5a9b4f9cf1e5291a91@rcrdbrt.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Riccardo,

Welcome!  Not off-topic at all.

Your config looks fine to my eyes; I don't think you _need_ different ports per endpoint, but I might be wrong.

With your tcpdump, if you can see incoming ICMP requests you should see outgoing ones too -- make sure they're not coming in on wg0 and going out on eth0; I've had that happen to me before.  Can you send through the output of: `tcpdump -ni any icmp`?

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Thu, 12 Apr 2018, at 21:09, Riccardo Berto wrote:
> WireGuard doesn't always work with my devices.
> I ran out of options for troubleshooting it so I'm writing here, hoping 
> for a stable solution. I see it's not a strict devel-only mailing list 
> but if I'm off-topic I apologize in advance and I'll fade-out in the 
> background, waiting for better times.
> 
> Here's my problem: WireGuard "sometimes" works. I have a client that 
> always talks with the server without problems (the laptop, 10.0.0.4), it 
> always pings and trasfers data correctly. It just works as expected. I 
> have 2 others (Raspberry Pis: 10.0.0.2, 10.0.0.3) that don't work most 
> of the time. I tried enabling the PersistentKeepalive feature on those 
> and the WireGuard interface has some low traffic due to it but no chance 
> of pinging or having traffic with them 99 times out of 100. "tcpdump -i 
> wg0" shows ping requests, from both sides, but no answers.
> In the rare occasions they work, I can ping everyone from every client, 
> as expected with my configuration files.
> 
> Also, with all the devices I tried both the new systemd-networkd's 
> WireGuard implementation and systemd's wg-quick@wg0.service method, as 
> well as testing manually with wg-quick. The systemd version is 238.
> Archlinux is running on every node and I'm using the latest publicly 
> available WireGuard snapshot as of writing this, 20180304.
> 
> 
> #####################################
> # Server config (VPS on vultr.com): #
> #####################################
> [Interface]
> Address = 10.0.0.1/24
> SaveConfig = true
> ListenPort = 21
> PrivateKey = ------------
> 
> [Peer]
> PublicKey = ------------
> AllowedIPs = 10.0.0.3/32
> Endpoint = Client1:51820
> PersistentKeepalive = 30
> 
> [Peer]
> PublicKey = ------------
> AllowedIPs = 10.0.0.4/32
> Endpoint = Client3:51821
> 
> [Peer]
> PublicKey = ------------
> AllowedIPs = 10.0.0.2/32
> Endpoint = Client2:21
> PersistentKeepalive = 30
> 
> 
> #####################################
> # Client 1 config (Raspberry Pi 3): #
> #####################################
> [Interface]
> Address = 10.0.0.3/24
> ListenPort = 51820
> PrivateKey = ------------
> 
> [Peer]
> PublicKey = ------------
> AllowedIPs = 10.0.0.1/24
> Endpoint = VPS:21
> 
> 
> #####################################
> # Client 2 config (Raspberry Pi 3): #
> #####################################
> [Interface]
> Address = 10.0.0.2/24
> PrivateKey = ------------
> ListenPort = 21
> 
> [Peer]
> PublicKey = ------------
> AllowedIPs = 10.0.0.1/24
> Endpoint = VPS:21
> 
> 
> ##############################################
> # Client 3 config (personal laptop, x86_64): #
> ##############################################
> [Interface]
> Address = 10.0.0.4/24
> ListenPort = 51821
> PrivateKey = ------------
> 
> [Peer]
> PublicKey = ------------
> AllowedIPs = 10.0.0.0/24
> Endpoint = VPS:21
> 
> 
> 
> Any help is appreciated.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
