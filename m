Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d3f7d0a
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 09:44:51 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id f9629202
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 09:44:51 +0000 (UTC)
Date: Mon, 27 Nov 2017 03:49:31 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Should I expect faster recovery after one side goes down
Message-ID: <20171127094931.GA3104@wolff.to>
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

I'm not sure what is really going on but I have seen some very long delays 
after one side of the link goes down, while the other keeps sending 
packets. The work around is to restart the local side once the remote side 
is back up.

When I do some testing and say reboot the router the a wg tunnel terminates 
at, while continuing to use the laptop at the other end, after the router 
is back up very little traffic seems to get through or there is a very 
large latency. Restarting the iptables service with systemd will also 
hang. I don't know if that is forever or just a very long time. If I restart 
wireguard on the laptop (which deletes and recreates the device) things 
will start working normally again.

Is there some information I can collect that will illuminate what is going 
on here?
