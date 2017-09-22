Return-Path: yszhou4tech@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87afb382
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 13:11:01 +0000 (UTC)
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
 [209.85.161.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d52bd5c6
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 13:11:01 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id t127so749576ywg.4
 for <wireguard@lists.zx2c4.com>; Fri, 22 Sep 2017 06:38:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pA5vkCYsdFDHeXjYV=HFRm1aAFJGT1RsjuSrpZ8jZiog@mail.gmail.com>
References: <CAECwjAgRyK0T3vtBUzR1P-d--vdEDS=Jj-nFWHx1=7ivEd6Zvw@mail.gmail.com>
 <CAHmME9pA5vkCYsdFDHeXjYV=HFRm1aAFJGT1RsjuSrpZ8jZiog@mail.gmail.com>
From: Yousong Zhou <yszhou4tech@gmail.com>
Date: Fri, 22 Sep 2017 21:38:11 +0800
Message-ID: <CAECwjAg17g-87-gtR9EGzYgiXh1eLx69R=2gnBObQ5TdLkDyfw@mail.gmail.com>
Subject: Re: Flood ping can cause oom when handshake fails
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 22 September 2017 at 21:19, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hi Yousong,
>
> Thanks for the report.
>
> On Fri, Sep 22, 2017 at 2:58 PM, Yousong Zhou <yszhou4tech@gmail.com> wrote:
>> The first issue is that occasionally wireguard failed to send
>> handshake initiation packets to the remote.  I got to this conclusion
>> by two observations
>>  - Tearing down then bringing up ("ifup air") the local wireguard
>> device did not trigger the update of "latest handshake" timestamp on
>> the remote
>
>
> The handshake will not actually occur until you try to send data over
> the interface. So after bringing the interface up, send a ping. Then
> you'll have the handshake. If you'd like the handshake to happen
> immediately and for packets in general to persistently be sent, to,
> for example, keep NAT mappings alive, there's the persistent-keepalive
> option. See the wg(8) man page for details.
>
>>  - Wireguard packets can be captured on eth0.1 but not on the remote
>
> I'm not sure I understood this point. Can you elaborate?

The VoCore device has a built-in switch and as I understand the cpu
port of which will be present as eth0 in the Linux system.  Port 4 of
the switch was configured to belong to VLAN 1 and will be present as
eth0.1.

Default route in the main table points to eth0.1 and traffic flows
through it just fine.  I have the following observations when
handshake fails

 - I can send udp traffic with netcat from my laptop to the remote
peer's endpoint.  The traffic can be captured on the remote and
ignored as expected.  This means the traffic to the remote endpoint
can go through eth0.1 just fine
 - I can also capture wireguard traffic on eth0.1 with tcpdump, but
the same traffic cannot be captured on the remote which means that the
udp traffic sent from the kernel very likely failed to be sent out on
wire.

                yousong
