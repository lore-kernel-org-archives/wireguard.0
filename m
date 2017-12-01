Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b10d97b2
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 16:57:39 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 28ad1cdf
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 16:57:39 +0000 (UTC)
Date: Fri, 1 Dec 2017 11:02:39 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Subject: Re: Should I expect faster recovery after one side goes down
Message-ID: <20171201170239.GA28010@wolff.to>
References: <20171127094931.GA3104@wolff.to>
 <CAHmME9q+giuOXVz1=hE-F34vFMP0GxzveMzLbzrjeXbbjnrGCQ@mail.gmail.com>
 <20171127134914.GA9392@wolff.to> <20171127173354.GA17685@wolff.to>
 <CAHmME9rq+eaLMZP+a1OAcu1=65X7Q_PrsMNBwAm7U2HaNWfUVQ@mail.gmail.com>
 <20171127182558.GA19220@wolff.to> <20171128061306.GA7842@wolff.to>
 <20171128064413.GA9218@wolff.to> <20171128084237.GA12292@wolff.to>
 <20171201084319.GA30956@tuxmachine.polynome.dn42>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <20171201084319.GA30956@tuxmachine.polynome.dn42>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Dec 01, 2017 at 09:43:19 +0100,
  Baptiste Jonglez <baptiste@bitsofnetworks.org> wrote:
>
>It sounds like one of these situations where persistent keepalives would
>be useful, doesn't it?

It is definitely useful as the laptop is expected to be behind NAT, but it 
doesn't help with the rebooting the router breaking historical source 
NAT (on my local network) while the other end remembers where it last got a 
packet from. The solution below dealt with that.

>
>> I found a way to make it work more automatically. The reason the port was
>> getting reassigned was because the original connection packet was being
>> tracked and was conflicting with the source nat mapping even though in
>> reallity the connection was the same. By putting in CT --notrack rules I was
>> able to block that traking and without the conflict the port doesn't get
>> remapped. I don't need tracking or the original connection for my firewall
>> rules so this should be OK. On testing it seems to work as expected. Now
>> when I reboot my router, my laptop reconnects and the wireguard tunnel works
>> without having to restart it.
