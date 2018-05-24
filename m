Return-Path: joerg@higgsboson.tk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2240c7e
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 13:56:01 +0000 (UTC)
Received: from mail.thalheim.io (mail.thalheim.io [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 748ba036
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 13:56:01 +0000 (UTC)
Received: from [172.20.129.247] (pat-131-252.wlan.net.ed.ac.uk
 [192.41.131.252])
 by mail.thalheim.io (Postfix) with ESMTPSA id C03D1A136
 for <wireguard@lists.zx2c4.com>; Thu, 24 May 2018 13:57:19 +0000 (UTC)
Subject: Re: [wireguard-android] 'roaming' from LTE to WiFi with version
 0.0.20180523
To: wireguard@lists.zx2c4.com
References: <1527119825.1012882.1382673952.168165E8@webmail.messagingengine.com>
 <1527135367.1083058.1382934352.4E96D38A@webmail.messagingengine.com>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Message-ID: <f40f4b86-90a6-ff2c-4d17-7d2a278c201b@higgsboson.tk>
Date: Thu, 24 May 2018 14:57:18 +0100
MIME-Version: 1.0
In-Reply-To: <1527135367.1083058.1382934352.4E96D38A@webmail.messagingengine.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>



On 2018-05-24 05:16, nnet wrote:
> So this is how it ends:
>
> 05-23 20:33:45.323  9600  9619 D WireGuard/GoBackend/wireguard: peer(AsMM…SeWg) - Sending handshake initiation                                    
> 05-23 20:33:45.326  9600  9619 E WireGuard/GoBackend/wireguard: peer(AsMM…SeWg) - Failed to send handshake initiation write udp6 [::]:46719->[]:41414: sendto: network is unreachable                                                                                      
> 05-23 20:33:45.326  9600  9619 D WireGuard/GoBackend/wireguard: peer(AsMM…SeWg) - Awaiting keypair                                                
> 05-23 20:33:50.367  9600  9678 D WireGuard/GoBackend/wireguard: peer(AsMM…SeWg) - Sending handshake initiation                                    
> 05-23 20:33:50.376  9600  9678 E WireGuard/GoBackend/wireguard: peer(AsMM…SeWg) - Failed to send handshake initiation write udp6 [::]:46719->[snip]:41414: sendto: network is unreachable
> 05-23 20:36:10.188  9600 11291 D WireGuard/GoBackend/wireguard: peer(AsMM…SeWg): Handshake did not complete after 20 attempts, giving up
> 05-23 20:39:12.258  9600  9677 D WireGuard/GoBackend/wireguard: :peer(AsMM…SeWg) Removing all keys, since we haven't received a new one in 540 seconds
>
> Interestingly it's trying to send out to an IPv6 address. The peer endpoint IP is IPv4 only (the LTE is IPv4-in-6).

In the wg command it resolves the domain once and picks the preferred protocol family of the system (which is ipv6 when its available).
Since this is only done once it will stick to ipv6 for ever until the VPN is reconfigured by wg.
This is an unsolved known problem.
