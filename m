Return-Path: tim@sedlmeyer.us
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36df253d
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 11:45:48 +0000 (UTC)
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
 [209.85.223.195])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6d9d360
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 11:45:48 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id d7so17706563ioc.11
 for <wireguard@lists.zx2c4.com>; Mon, 16 Apr 2018 05:00:19 -0700 (PDT)
Return-Path: <tim@sedlmeyer.us>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com.
 [209.85.223.179])
 by smtp.gmail.com with ESMTPSA id k71sm6172007ioo.30.2018.04.16.05.00.17
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Apr 2018 05:00:17 -0700 (PDT)
Sender: Timothy Sedlmeyer <tim@sedlmeyer.us>
Received: by mail-io0-f179.google.com with SMTP id d7so17706478ioc.11
 for <wireguard@lists.zx2c4.com>; Mon, 16 Apr 2018 05:00:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJqFBzx2=aQox=RhtK-L0FsLZ+xKL19v4jQ0WGO6hxwubBYuGQ@mail.gmail.com>
References: <CAApANAYEwJfsopDUvDOHv5jZ62oz88wHsggVPLPgjzUMzaWCkA@mail.gmail.com>
 <CAJqFBzx2=aQox=RhtK-L0FsLZ+xKL19v4jQ0WGO6hxwubBYuGQ@mail.gmail.com>
From: Tim Sedlmeyer <tim@sedlmeyer.org>
Date: Mon, 16 Apr 2018 08:00:16 -0400
Message-ID: <CAK_h9uEaGd3JM8g9b03+OYbTx=M61g58qZ2iSaOgCwVve1diAw@mail.gmail.com>
Subject: Re: Bird OSPF Problems
To: Zsolt Hegyi <hegyi.mokka@gmail.com>
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

On Mon, Apr 16, 2018 at 6:31 AM, Zsolt Hegyi <hegyi.mokka@gmail.com> wrote:
> Hi Cedric,
>
> As far as I know, wireguard doesn't support multicasts yet, which OSPF uses
> for neighbor discovery. The reason why BGP works is because it uses unicast
> TCP packets as means of communication.
>
> To get around this, try telling BIRD that your wireguard interface is an
> NBMA network (or a point-to-point link).

When it is said that wireguard doesn't support multicast what is
really meant is that
multicast traffic won't be replicated across multiple peers on the
same interface. If
only a single peer is required to receive the multicast traffic than
assigning the multicast
address to that peer will allow the multicast traffic to traverse the
wireguard connection
to it. When using OSPF with wireguard I find it easiest to just
assign each peer to a seperate wireguard interface with an allowed-ip
of 0.0.0.0/0.
Then it just works because the multicast traffic passes and I don't
have to worry about
assigning every network that might ever use the peer to the allowed-ip list.

If you need to use OSPF over a single or multiple peers on the same
interface than
most likely you should set the interface type to point-to-multipoint.
point-to-point still
uses multicast and NBMA still has a DR election and expects all
neighbors to be fully
meshed and able to talk directly to each other over the network.
point-to-multipoint uses
unicast but treats each link as a point-to-point connection so there
is no DR election.

>
> vista
>
> On Mon, 16 Apr 2018, 11:27 cedric Kienzler, <cedrickienzler1@gmail.com>
> wrote:
>>
>> Hey List,
>>
>> i'm currently facing issues with OSPF over the wireguard tunnel.
>>
>> I use both, IPv4 and IPv6 and everything works fine. I can ping through
>> the tunnel, traffic flows perfectly, but when i try to configure OSPF using
>> the Bird routing daemon, i didn't even see a HELLO message. Also when trying
>> to list the interface using 'show ospf interfaces' i didn't even see the
>> Interface.
>>
>> For IPv6 i use 2a03.... as prefix.
>> Should i configure multicast IPv6 (fe80::) on the interface too to get
>> OSPF working?
>>
>> Interesting fact: BGB using Bird works just fine.
>>
>> Anyone here that could help me?
>>
>>
>> Thanks a lot.
>>
>> Best regards,
>> Cedi
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
