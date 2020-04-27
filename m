Return-Path: <SRS0=Mtl/=6L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27173C4CECD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Apr 2020 19:53:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 959DA206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Apr 2020 19:53:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="h19MkNH/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 959DA206B8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a5e99be;
	Mon, 27 Apr 2020 19:41:46 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4565247c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Apr 2020 19:41:44 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3a6fd11
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Apr 2020 19:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=bD/Ek6XWQKJM
 Rm4YC5GvwoC7u+w=; b=h19MkNH/dQ+5uM8ObBdkgYYHVzvT8YHq01phV+UGfpe5
 CaE72tOolnKiSEuKpSQqdVNz1HmAn/D1SEmI4NdE4ZYqitrayoItml/F/r8sI1y5
 hq59t2R7lpk4AGB8MI/HmL4RcpIgykuPCB/lE7Lim35+VQ9ZIvp62ylgAVmfwS2/
 Ad/76Q5/vkYAOBuCNLMmJXDLPA6rk2ZxdNr+gPfphUReiu8q6eava9sTsBuBm1kr
 VBtWul6ZCt5tJ3Qwb4qmfOZt/DLAZ7BBJUZYqinRpDUM/HfRqo3vc5K4hGcPDfel
 DruRaIaEjmLbbX7wJ32lJT+hSMSJZ6ve/JuVte32xw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eaef8404
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Apr 2020 19:41:44 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id i3so20231106ioo.13
 for <wireguard@lists.zx2c4.com>; Mon, 27 Apr 2020 12:53:16 -0700 (PDT)
X-Gm-Message-State: AGi0PubSrMZhQzOtqBP1QFDWK89tlm/fobPzS1COP12QC3LNbe1Ym/Mg
 9d4q3tj68Lb3BYy9H/ZrPH/SJUAy6mOeYfVndgs=
X-Google-Smtp-Source: APiQypK9AIltvGkCnZ8RapfTrs23cBgVFl5W8sgFvuUW9vkYVkKldKmhk7lyEVPWQXWR0Psl3wi4ZGtHNMaPGYS7Pcc=
X-Received: by 2002:a02:77c3:: with SMTP id g186mr12507895jac.95.1588017195794; 
 Mon, 27 Apr 2020 12:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200427144625.581110-1-toke@redhat.com>
In-Reply-To: <20200427144625.581110-1-toke@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 27 Apr 2020 13:53:04 -0600
X-Gmail-Original-Message-ID: <CAHmME9oMjw6-vG1eSrvPoC51qFSZRf75DUin8to5vGr5RJjDuw@mail.gmail.com>
Message-ID: <CAHmME9oMjw6-vG1eSrvPoC51qFSZRf75DUin8to5vGr5RJjDuw@mail.gmail.com>
Subject: Re: [PATCH net] wireguard: Use tunnel helpers for decapsulating ECN
 markings
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: David Miller <davem@davemloft.net>, Netdev <netdev@vger.kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Olivier Tilmans <olivier.tilmans@nokia-bell-labs.com>,
 Dave Taht <dave.taht@gmail.com>, 
 "Rodney W . Grimes" <ietf@gndrsh.dnsmgr.net>
Content-Type: text/plain; charset="UTF-8"
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

Hey Toke,

Thanks for fixing this. I wasn't aware there was a newer ECN RFC. A
few comments below:

On Mon, Apr 27, 2020 at 8:47 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
> RFC6040 also recommends dropping packets on certain combinations of
> erroneous code points on the inner and outer packet headers which shouldn=
't
> appear in normal operation. The helper signals this by a return value > 1=
,
> so also add a handler for this case.

This worries me. In the old implementation, we propagate some outer
header data to the inner header, which is technically an authenticity
violation, but minor enough that we let it slide. This patch here
seems to make that violation a bit worse: namely, we're now changing
the behavior based on a combination of outer header + inner header. An
attacker can manipulate the outer header (set it to CE) in order to
learn whether the inner header was CE or not, based on whether or not
the packet gets dropped, which is often observable. That's some form
of an oracle, which I'm not too keen on having in wireguard. On the
other hand, we pretty much already _explicitly leak this bit_ on tx
side -- in send.c:

PACKET_CB(skb)->ds =3D ip_tunnel_ecn_encap(0, ip_hdr(skb), skb); // inner p=
acket
...
wg_socket_send_skb_to_peer(peer, skb, PACKET_CB(skb)->ds); // outer packet

We considered that leak a-okay. But a decryption oracle seems slightly
worse than an explicit and intentional leak. But maybe not that much
worse.

I wanted to check with you: is the analysis above correct? And can you
somehow imagine the =3D=3D2 case leading to different behavior, in which
the packet isn't dropped? Or would that ruin the "[de]congestion" part
of ECN? I just want to make sure I understand the full picture before
moving in one direction or another.

> +               if (INET_ECN_decapsulate(skb, PACKET_CB(skb)->ds,
> +                                        ip_hdr(skb)->tos) > 1)
> +               if (INET_ECN_decapsulate(skb, PACKET_CB(skb)->ds,
> +                                        ipv6_get_dsfield(ipv6_hdr(skb)))=
 > 1)

The documentation for the function says:

*  returns 0 on success
*          1 if something is broken and should be logged (!!! above)
*          2 if packet should be dropped

Would it be more clear to explicitly check for =3D=3D2 then?

> +ecn_decap_error:
> +       net_dbg_ratelimited("%s: Non-ECT packet from peer %llu (%pISpfsc)=
\n",
> +                           dev->name, peer->internal_id, &peer->endpoint=
.addr);

All the other error messages in this block are in the form of: "Packet
.* from peer %llu (%pISpfsc)\n", so better text here might be "Packet
is non-ECT from peer %llu (%pISpfsc)\n". However, do you think we
really need to log to the console for this? Does it add much in the
way of wireguard internals debugging? Can't network congestion induce
it in complicated scenarios? Maybe it'd be best just to increment
those error counters instead.

> +       ++dev->stats.rx_errors;
> +       ++dev->stats.rx_length_errors;

This should use stats.rx_frame_errors instead of length_errors, which
is also what net/ipv6/sit.c and drivers/net/geneve.c do on ECN-related
drops.

Thanks,
Jason
