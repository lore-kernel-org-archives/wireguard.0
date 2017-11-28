Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b10c3fca
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 06:08:29 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id bb83e2de
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 06:08:28 +0000 (UTC)
Date: Tue, 28 Nov 2017 00:13:06 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Should I expect faster recovery after one side goes down
Message-ID: <20171128061306.GA7842@wolff.to>
References: <20171127094931.GA3104@wolff.to>
 <CAHmME9q+giuOXVz1=hE-F34vFMP0GxzveMzLbzrjeXbbjnrGCQ@mail.gmail.com>
 <20171127134914.GA9392@wolff.to> <20171127173354.GA17685@wolff.to>
 <CAHmME9rq+eaLMZP+a1OAcu1=65X7Q_PrsMNBwAm7U2HaNWfUVQ@mail.gmail.com>
 <20171127182558.GA19220@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <20171127182558.GA19220@wolff.to>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I'm pretty sure I'm being bit by firewall rules on the router. It seems to 
be rejecting all of the tunnel packets and it has no reason to try to 
connect to the laptop the handshake never occurs again. I suspect that 
normally a connection established related rule lets things through. I just 
need to figure out how the start up packet is different so that it gets 
through. The systemd iptables service eventually seems to stop. Probably 
there is a DNS request that needs to timeout.
I do some source address rewriting and it may be that the initial addresses 
used for the encapsulating packets are different than the ones later.
So most likely this is all on my end and not wireguard related.
Thanks for the tcpdump suggestion. I should have tried that sooner.
