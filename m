Return-Path: yszhou4tech@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd2166f1
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Oct 2017 09:51:39 +0000 (UTC)
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
 [209.85.161.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8515a47
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Oct 2017 09:51:39 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id k3so11509261ywk.8
 for <wireguard@lists.zx2c4.com>; Mon, 23 Oct 2017 02:52:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pA5vkCYsdFDHeXjYV=HFRm1aAFJGT1RsjuSrpZ8jZiog@mail.gmail.com>
References: <CAECwjAgRyK0T3vtBUzR1P-d--vdEDS=Jj-nFWHx1=7ivEd6Zvw@mail.gmail.com>
 <CAHmME9pA5vkCYsdFDHeXjYV=HFRm1aAFJGT1RsjuSrpZ8jZiog@mail.gmail.com>
From: Yousong Zhou <yszhou4tech@gmail.com>
Date: Mon, 23 Oct 2017 17:52:37 +0800
Message-ID: <CAECwjAhh-mhGvEAW-9cXSSHmJJkD4m0xUA9ac3TP7PKWXFWj-w@mail.gmail.com>
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

Hi,

Sorry for the late reply to the issue.  I have been away from the
problematic device for a while and only found time and finally decided
to debug this further just a while ago...

The oom issue caused by staged packets is now gone with the change of
queue length from 1024 to 128.

The handshake failure issue persists but it's more an issue of the
network infrastructure than the wireguard itself.  Previously I
thought maybe the handshake packets were actually not on the wire
because maybe wireguard could not work with the switch and vlan
setting, but I could not confirm that guess because I cannot observe
traffics on the intermediate devices.

I just captured and replayed the udp handshake packets with varying
TTL settings (with corrected ip checksum), it seems that some
intermediate devices just dropped these packets silently!!!  Well, the
still more annoying part is that it's not a deterministic behaviour,
other traffics like tcp and icmp flows through it just fine most of
the time and the udp port 21841 i am using for wireguard fails more
frequently.

I guess stealthy channel is not part of the game with wireguard at the
moment...  Thanks for the good work though, really awesome.

Regards,
                yousong


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
>
>> The second issue is that when handshake fails, flood ping traffic that
>> was expected to be forwarded through the wireguard interface can cause
>> oom and hang the device to death.  There is a [kworker] process taking
>> up high cpu usage.
>
> That's very interesting. Here's what I suspect happening: before
> there's a handshake, outgoing packets are queued up to be sent for
> when a handshake does occur. Right now I allow queueing up a whopping
> 1024 packets, before they're rotated out and freed LIFO. This is
> obviously silly for low-ram situations like yours, and I should make
> that mechanism a bit smarter. I'll do that for the next snapshot. I
> assume that the high CPU kworker is a last minute attempt at memory
> compaction, or something of that sort. However, it'd be good to know
> -- could you find more information about that process? Perhaps
> /proc/pid/stack or related things in there?
>
> Additionally, I see that you're running 20170907, which is an older
> snapshot. If you update to the newer one (20170918), I'd be interested
> to learn if the behavior is different.
>
> Jason
