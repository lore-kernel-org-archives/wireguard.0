Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a2fe01e
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 06:39:35 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 83c6c089
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 06:39:35 +0000 (UTC)
Date: Tue, 28 Nov 2017 00:44:13 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Should I expect faster recovery after one side goes down
Message-ID: <20171128064413.GA9218@wolff.to>
References: <20171127094931.GA3104@wolff.to>
 <CAHmME9q+giuOXVz1=hE-F34vFMP0GxzveMzLbzrjeXbbjnrGCQ@mail.gmail.com>
 <20171127134914.GA9392@wolff.to> <20171127173354.GA17685@wolff.to>
 <CAHmME9rq+eaLMZP+a1OAcu1=65X7Q_PrsMNBwAm7U2HaNWfUVQ@mail.gmail.com>
 <20171127182558.GA19220@wolff.to> <20171128061306.GA7842@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <20171128061306.GA7842@wolff.to>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Nov 28, 2017 at 00:13:06 -0600,
  Bruno Wolff III <bruno@wolff.to> wrote:
>I do some source address rewriting and it may be that the initial 
>addresses used for the encapsulating packets are different than the 
>ones later.

When I'm on the local network, 192.168.6.1 gets used for the initial 
source adddress and gets rewritten to 98.103.208.26 in order to make 
the source consistent for the laptop whether or not it is on the 
local network. (That way I don't need to allow connections from 
192.168.6.1 somewhere else where it wouldn't be my router.) When this 
happens the source port seems to normally get changed. Wireguard on the 
laptop remembers the new source port and tries to keep using it after 
the router is rebooted. But during the reboot the router forgets about 
the port mapping so it ends up dropping the packets. It has no reason 
to send packets on its own to the laptop (and wouldn't know where to 
send them) so the port doesn't get corrected.

I think the correct fix is to know if I reboot the router for testing 
something, I need to also restart wireguard to make sure it is sending 
data to the expected port. This isn't going to be an issue in normal 
operation.
