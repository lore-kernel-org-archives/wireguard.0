Return-Path: yszhou4tech@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ed8fddd
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 13:26:24 +0000 (UTC)
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
 [209.85.161.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f6a1f3c
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 13:26:24 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id s62so783820ywg.0
 for <wireguard@lists.zx2c4.com>; Fri, 22 Sep 2017 06:53:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAECwjAgTb1qtiUabMBbg_6cnA+V0YQLd=316o_QU25Ffkxn4ow@mail.gmail.com>
References: <CAECwjAgRyK0T3vtBUzR1P-d--vdEDS=Jj-nFWHx1=7ivEd6Zvw@mail.gmail.com>
 <59e5680d-da17-a8c4-0c16-08f0b27a4f75@gmail.com>
 <CAECwjAgTb1qtiUabMBbg_6cnA+V0YQLd=316o_QU25Ffkxn4ow@mail.gmail.com>
From: Yousong Zhou <yszhou4tech@gmail.com>
Date: Fri, 22 Sep 2017 21:53:33 +0800
Message-ID: <CAECwjAhRc-2q9OY3dCQ1cQpdzB95O8qw5h_13eJGdtTAdT43Pg@mail.gmail.com>
Subject: Fwd: Flood ping can cause oom when handshake fails
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Sorry, my previous mail dropped off list accidentally.

                yousong


---------- Forwarded message ----------
From: Yousong Zhou <yszhou4tech@gmail.com>
Date: 22 September 2017 at 21:22
Subject: Re: Flood ping can cause oom when handshake fails
To: Aaron Jones <aaronmdjones@gmail.com>


On 22 September 2017 at 21:15, Aaron Jones <aaronmdjones@gmail.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> On 22/09/17 12:58, Yousong Zhou wrote:
>> The first issue is that occasionally wireguard failed to send
>> handshake initiation packets to the remote.  I got to this
>> conclusion by two observations
>>
>> - Tearing down then bringing up ("ifup air") the local wireguard
>> device did not trigger the update of "latest handshake" timestamp
>> on the remote
>
> WireGuard does not negotiate sessions when the interface is configured,
> it negotiates when it is required to do so (when you send a packet to
> the tunnel address of the peer, and there is no session with that peer),
> so if you want to see if negotiation is being performed, issue a ping
> immediately after reconfiguring the interface.
>
>> - Wireguard packets can be captured on eth0.1 but not on the
>> remote
>>

Yes, I am aware of the "silence is a virtue" feature in the technical
paper.  That's why I kept (flood) pinging, trying to trigger the
handshake.  Tearing down and bringing up the interface was to make
sure that the udp traffic captured on eth0.1 is about handshake setup,
not data packets.

                yousong
