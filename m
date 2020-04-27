Return-Path: <SRS0=Mtl/=6L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7216C4CECD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Apr 2020 20:42:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8722E2073C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Apr 2020 20:42:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dkOCproB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8722E2073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c46b2a41;
	Mon, 27 Apr 2020 20:31:19 +0000 (UTC)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 381b53ac
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Apr 2020 20:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588020169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hN1gF6rS0X1c948374Yf2+9FpSd+eL2OmWJxGRco2QE=;
 b=dkOCproBDzN0CxLmr9Bo/r/+0jNx9GLqGrI+H4LJNEVjZtWBQebfbBFTr5Ur3TvuSC6OtH
 wfAQJFZL14H22/6NnGWF5KEyB/NVoioHaN0p6El73p+B/S117i0rtJ8TDu9GBuvDvSi7gM
 ZzeuquSdWkfQWdlLe4/AHRuEMXd+yiA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-7eni0mGFMYuqOyRT1fUPUg-1; Mon, 27 Apr 2020 16:42:45 -0400
X-MC-Unique: 7eni0mGFMYuqOyRT1fUPUg-1
Received: by mail-lf1-f69.google.com with SMTP id t11so7995319lfc.17
 for <wireguard@lists.zx2c4.com>; Mon, 27 Apr 2020 13:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=wexwFZmDvGYeH37HBBDJc2ujKdUpDXnMllT4hZqgqhg=;
 b=uAykXchL4gCI1s15jL4UHMuP+woLuc3p0iEBl0itV9UGanup4x9RH9iYhc3NQPb33O
 00o4+o6XJAuFdOXBRar0N7EWTvLruFxp/tRzj6QBDji4COzJAfMtfw52fujqIfuwkvyP
 Zs8aQFLyX53KLeE29GXm11Ut9PVUa39CViQNKrImPT35ylrm/ZJDRom6+bS7pZfhEU4B
 dEBHeUdk7pDKr8maefSRY8F+egV89/3PKfEb2Ckdl4Of3qkyLnUdLAbnKGU6XRx3iBdu
 Hy6ATVTjSXb3QsVWN6qngXT+xSONinuDWCLHVQPmCbNCtquuECLrquwc+gq6XMSaZQZp
 t4DQ==
X-Gm-Message-State: AGi0PuY5p0VRdUEVUvJlU8vFuUirb7PFtMpPLBqzggL+3jpK6Xyf4S9h
 2TDrVh9F5JDce/nzz/zs0zgk3SHPvIf1ThjI91FONG7v/dsT3bgxub9adh9PQioOMn5HFCRd4Fw
 a90Kw9PGyFMJYxhWl5EjX
X-Received: by 2002:a2e:9490:: with SMTP id c16mr15165845ljh.110.1588020164040; 
 Mon, 27 Apr 2020 13:42:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypJiDS+/PwHYnN0cmfEOVv61Fs9PjZ034O186NwzgODJgEBioBJDWNtbWJJGGdUjTUjm+w8G0w==
X-Received: by 2002:a2e:9490:: with SMTP id c16mr15165827ljh.110.1588020163717; 
 Mon, 27 Apr 2020 13:42:43 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
 by smtp.gmail.com with ESMTPSA id f4sm12067342lfa.24.2020.04.27.13.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 13:42:43 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id 534721814FF; Mon, 27 Apr 2020 22:42:42 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: David Miller <davem@davemloft.net>, Netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Olivier Tilmans <olivier.tilmans@nokia-bell-labs.com>,
 Dave Taht <dave.taht@gmail.com>, "Rodney W . Grimes" <ietf@gndrsh.dnsmgr.net>
Subject: Re: [PATCH net] wireguard: Use tunnel helpers for decapsulating ECN
 markings
In-Reply-To: <CAHmME9oMjw6-vG1eSrvPoC51qFSZRf75DUin8to5vGr5RJjDuw@mail.gmail.com>
References: <20200427144625.581110-1-toke@redhat.com>
 <CAHmME9oMjw6-vG1eSrvPoC51qFSZRf75DUin8to5vGr5RJjDuw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Mon, 27 Apr 2020 22:42:42 +0200
Message-ID: <87d07sy81p.fsf@toke.dk>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Hey Toke,
>
> Thanks for fixing this. I wasn't aware there was a newer ECN RFC. A
> few comments below:
>
> On Mon, Apr 27, 2020 at 8:47 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@re=
dhat.com> wrote:
>> RFC6040 also recommends dropping packets on certain combinations of
>> erroneous code points on the inner and outer packet headers which should=
n't
>> appear in normal operation. The helper signals this by a return value > =
1,
>> so also add a handler for this case.
>
> This worries me. In the old implementation, we propagate some outer
> header data to the inner header, which is technically an authenticity
> violation, but minor enough that we let it slide. This patch here
> seems to make that violation a bit worse: namely, we're now changing
> the behavior based on a combination of outer header + inner header. An
> attacker can manipulate the outer header (set it to CE) in order to
> learn whether the inner header was CE or not, based on whether or not
> the packet gets dropped, which is often observable. That's some form
> of an oracle, which I'm not too keen on having in wireguard. On the
> other hand, we pretty much already _explicitly leak this bit_ on tx
> side -- in send.c:
>
> PACKET_CB(skb)->ds =3D ip_tunnel_ecn_encap(0, ip_hdr(skb), skb); // inner=
 packet
> ...
> wg_socket_send_skb_to_peer(peer, skb, PACKET_CB(skb)->ds); // outer packe=
t
>
> We considered that leak a-okay. But a decryption oracle seems slightly
> worse than an explicit and intentional leak. But maybe not that much
> worse.

Well, seeing as those two bits on the outer header are already copied
from the inner header, there's no additional leak added by this change,
is there? An in-path observer could set CE and observe that the packet
gets dropped, but all they would learn is that the bits were zero
(non-ECT). Which they already knew because they could just read the bits
directly from the header.

Also note, BTW, that another difference between RFC 3168 and 6040 is the
propagation of ECT(1) from outer to inner header. That's not actually
done correctly in Linux ATM, but I sent a separate patch to fix this[0],
which Wireguard will also benefit from with this patch.

> I wanted to check with you: is the analysis above correct? And can you
> somehow imagine the =3D=3D2 case leading to different behavior, in which
> the packet isn't dropped? Or would that ruin the "[de]congestion" part
> of ECN? I just want to make sure I understand the full picture before
> moving in one direction or another.

So I think the logic here is supposed to be that if there are CE marks
on the outer header, then an AQM somewhere along the path has marked the
packet, which is supposed to be a congestion signal, which we want to
propagate all the way to the receiver (who will then echo it back to the
receiver). However, if the inner packet is non-ECT then we can't
actually propagate the ECN signal; and a drop is thus the only
alternative congestion signal available to us. This case shouldn't
actually happen that often, a middlebox has to be misconfigured to
CE-mark a non-ECT packet in the first place. But, well, misconfigured
middleboxes do exist as you're no doubt aware :)

>> +               if (INET_ECN_decapsulate(skb, PACKET_CB(skb)->ds,
>> +                                        ip_hdr(skb)->tos) > 1)
>> +               if (INET_ECN_decapsulate(skb, PACKET_CB(skb)->ds,
>> +                                        ipv6_get_dsfield(ipv6_hdr(skb))=
) > 1)
>
> The documentation for the function says:
>
> *  returns 0 on success
> *          1 if something is broken and should be logged (!!! above)
> *          2 if packet should be dropped
>
> Would it be more clear to explicitly check for =3D=3D2 then?

Hmm, maybe? Other callers seem to use >1, so I figured it was better to
be consistent with those. I won't insist on that, though, so if you'd
rather I use a =3D=3D2 check I can certainly change it?

>> +ecn_decap_error:
>> +       net_dbg_ratelimited("%s: Non-ECT packet from peer %llu (%pISpfsc=
)\n",
>> +                           dev->name, peer->internal_id, &peer->endpoin=
t.addr);
>
> All the other error messages in this block are in the form of: "Packet
> .* from peer %llu (%pISpfsc)\n", so better text here might be "Packet
> is non-ECT from peer %llu (%pISpfsc)\n". However, do you think we
> really need to log to the console for this? Does it add much in the
> way of wireguard internals debugging? Can't network congestion induce
> it in complicated scenarios? Maybe it'd be best just to increment
> those error counters instead.

The other callers do seem to hide the logging behind a module parameter
specifically for this purpose. I put in this log message because the use
of net_dbg() indicated that these were already meant for non-production
error debugging. But if you'd rather avoid the logging that's fine by me.

>> +       ++dev->stats.rx_errors;
>> +       ++dev->stats.rx_length_errors;
>
> This should use stats.rx_frame_errors instead of length_errors, which
> is also what net/ipv6/sit.c and drivers/net/geneve.c do on ECN-related
> drops.

Oops, that's my bad; copied the wrong error handling block it seems
(didn't even notice they were incrementing different counters). Will
fix.

-Toke

[0] https://lore.kernel.org/netdev/20200427141105.555251-1-toke@redhat.com/=
T/#u

