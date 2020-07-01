Return-Path: <SRS0=8CbH=AM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A80C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Jul 2020 03:06:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70E0620724
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Jul 2020 03:06:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="K9yaSoGc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70E0620724
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68e61006;
	Wed, 1 Jul 2020 02:45:51 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 03c047cb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jul 2020 02:45:49 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2439878c
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jul 2020 02:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=R9DEFN3UTgzrwtlGfelndGRjm/k=; b=K9yaSo
 GcK/yOYEBss/knqA4sTiRkMX5KqDdGkbwByz9yBONvwY9Kg5xE0DrEjBtpOS92+W
 V5hU14DBxg28ufhdNANybwLPlIrIb0RtAWyg/eH26szwQ850oHISlXov24XggwfO
 XxHKH6WY+v0JnhSndQcsHyjY5RHNKMhIJe2kxEaTheDTPpvejFp1hsIBRjwUuAG6
 DZXxuCm9F0g99L+rNcRBQm9Jc5kKXwdanT3A/Hr1nuoJ1VeTShyKlLKplRzB0RnS
 233yuaTxwIm5qD8YhjvRBBxJ1PSJxmyhwFKn7fs1bbNYVtcifaUcZdTSP/8YDNDd
 IfnIUQ5Z4aj4AqZg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f8a4abcd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jul 2020 02:45:49 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id k6so19752335ili.6
 for <wireguard@lists.zx2c4.com>; Tue, 30 Jun 2020 20:05:40 -0700 (PDT)
X-Gm-Message-State: AOAM530u1QN0+EmkWZM7r8LxA7U695dEg1NDlI5rauzoL94qzZJFC/hO
 fSJ5L4qSWwGxoEqqBlV/4WxsFICwciTjI+mHYpA=
X-Google-Smtp-Source: ABdhPJzvZpPYevkb+E/N947mpuDYYqdmifycB2+o+GTUDXRNw9oidCnJ++JE9hpoFIHfFuPIbNWqU492xSDZnZujAFM=
X-Received: by 2002:a92:50f:: with SMTP id q15mr6007687ile.38.1593572738185;
 Tue, 30 Jun 2020 20:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200626201330.325840-1-ndev@hwipl.net>
 <CAHmME9r7Q_+_3ePj4OzxZOkkrSdKA_THNjk6YjHxTQyNA2iaAw@mail.gmail.com>
 <CAHmME9pX30q1oWY3hpjK4u-1ApQP7RCA07BmhtRQx=dR85MS9A@mail.gmail.com>
 <CAHmME9oCHNSNAVTNtxO2Oz10iqj_D8JPmN8526FbQ8UoO0-iHw@mail.gmail.com>
 <CA+FuTSdpU_2w9iU+Rtv8pUepOcwqHYaV1jYVfB6_K157E6CSZw@mail.gmail.com>
In-Reply-To: <CA+FuTSdpU_2w9iU+Rtv8pUepOcwqHYaV1jYVfB6_K157E6CSZw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 30 Jun 2020 21:05:27 -0600
X-Gmail-Original-Message-ID: <CAHmME9rZieNAYeeK90HLoaoeKJEv5vE9MHfn-q5zFY8_ebNqxw@mail.gmail.com>
Message-ID: <CAHmME9rZieNAYeeK90HLoaoeKJEv5vE9MHfn-q5zFY8_ebNqxw@mail.gmail.com>
Subject: Re: wireguard: problem sending via libpcap's packet socket
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Hans Wippel <ndev@hwipl.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, Jun 28, 2020 at 2:04 PM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> On Sat, Jun 27, 2020 at 1:58 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Hi again Hans,
> >
> > A few remarks: although gre implements header_ops, it looks like
> > various parts of the networking stack change behavior based on it. I'm
> > still analyzing that to understand the extent of the effects.
> > Something like <https://git.zx2c4.com/wireguard-linux/commit/?id=40c24fd379edc1668087111506ed3d0928052fe0>
> > would work, but I'm not thrilled by it. Further research is needed.
> >
> > However, one thing I noticed is that other layer 3 tunnels don't seem
> > to be a fan of libpcap. For example, try injecting a packet into an
> > ipip interface. You'll hit exactly the same snag for skb->protocol==0.
>
> Not setting skb protocol when sending over packet sockets causes many
> headaches. Besides packet_parse_headers, virtio_net_hdr_to_skb also
> tries to infer it.
>
> Packet sockets give various options to configure it explicitly: by
> choosing that protocol in socket(), bind() or, preferably, by passing
> it as argument to sendmsg. The socket/bind argument also configures
> the filter to receive packets, so for send-only sockets it is
> especially useful to choose ETH_P_NONE (0) there. This is not an
> "incorrect" option.
>
> Libpcap does have a pcap_set_protocol function, but it is fairly
> recent, so few processes will likely be using it. And again it is
> still not ideal if a socket is opened only for transmit.
>
> header_ops looks like the best approach to me, too. The protocol field
> needs to reflect the protocol of the *outer* packet, of course, but if
> I read wg_allowedips_lookup_dst correctly, wireguard maintains the
> same outer protocol as the inner protocol, no sit (6-in-4) and such.

WireGuard does allow 6-in-4 and 4-in-6 actually. But parse_protocol is
only ever called on the inner packet. The only code paths leading to
it are af_packet-->ndo_start_xmit, and ndo_start_xmit examines
skb->protocol of that inner packet, which means it entirely concerns
the inner packet. And generally, for wireguard, userspace only ever
deals with the inner packet. That inner packet then gets encrypted and
poked at in strange ways, and then the encrypted blob of sludge gets
put into a udp packet and sent some place. So I'm quite sure that the
behavior just committed is right.

And from writing a few libpcap examples, things seem to be working
very well, including Hans' example.

Hans - if you want to try out davem's net.git tree, you can see if
this is working properly for you.

Jason
