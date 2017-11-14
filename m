Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d56cffe
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 16:31:45 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 6b9d433c
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 16:31:45 +0000 (UTC)
Date: Tue, 14 Nov 2017 10:34:53 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Road Warrior config with fwmark
Message-ID: <20171114163453.GA27547@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

It would be nice if fwmark was mentioned on https://www.wireguard.com/netns/ 
when covering routing all of your traffic through your tunnel for Road 
Warrior setups.

I noticed the fwmark support when looking at tools/wg-quick.bash. 
fwmark can be used to set up routing configurations that are essentially 
(they don't give bogus addresses) independent of the local network 
configuration. So no special action needs to be taken as you move from 
one wireless network to another. This makes the rules based approach much 
more competitive with the namespace technique.

I have this working on my laptop, but I want to tweak my router so that 
I don't need to have special iptables rules on my home network.

I have things set up to give my laptop the same static IP address, no matter 
where it is located.
