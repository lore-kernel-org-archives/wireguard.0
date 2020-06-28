Return-Path: <SRS0=JnmV=AK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 875CDC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 19:08:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07148206E2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 19:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqfFC0dU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07148206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98aad832;
	Mon, 29 Jun 2020 18:48:54 +0000 (UTC)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3a154faf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 28 Jun 2020 19:45:15 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id v19so11357851qtq.10
 for <wireguard@lists.zx2c4.com>; Sun, 28 Jun 2020 13:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y1zn/fxfOmFeMHXh6Gk5ZdelSOYcZKVlBOAb2rVI9JA=;
 b=EqfFC0dU0x9WmdbUtY9//oru81LC5z9OHEIZ/cE8DpHTbzHFsiXIulMEAgIgpIIaIP
 GkRIO+PtS+PrpMmfhiVfor2iXBSbT3w4R+wEr27nFnuk076Fl8ZNGCaxEnAX4ab0dB8i
 mc8IzAv35RgtJ4E7vi61uoy4bLdYiJy1l9O8CZWiIsVXOpR0+D7h+95vPps5OH9Scd/T
 SblhjR97HBCCc5pbmHdlH5CpN3v8KFBvjJt3qBpBfwITW7f0G/XHzg1AISj3sTwjlFG6
 apRaSMFFobh+TgUWCQ8ayJxtVbNhGeOQYQU+G2HAZok+redvJoqLxMkSifYHdXqYxR+1
 EK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y1zn/fxfOmFeMHXh6Gk5ZdelSOYcZKVlBOAb2rVI9JA=;
 b=Biw3Y0bVde2MDL9bD3tbib4x/5lnjqIX+COCgrkgREZK2ytVJcvtsDTvnS/xwQWFo5
 OnoiMRCeWkrqC//TuR21SpRySR45kFhzuHHMKQiKKg6uB5iMLSb+W62Uem8LBniH8C/2
 eb5QkY82AiWyFciekDTbNe1qlqb9s+1hqWtws4reN239Uu9vjGIM9CD3jcC6lXpejbKu
 MSUqTpz5iwzseWNxThkkUv8vaM2JSIhim3tZK+2eWACZln2GjpPXUXKUwgog+yyHHOk5
 i/+9K1gVOHkwkNyiU+QxPBWPsGmbxrS/SvRcSy5y5M6cD+4psTg8j+7FezVV/QIHbVAy
 IrMA==
X-Gm-Message-State: AOAM530kvtm84+QfoYfP/FXTsDWq2OlUsXvdB0l+reAZDCc2BeKXJV1g
 Y+3v0wCPp/pedhh7JQwSD3mMqV45
X-Google-Smtp-Source: ABdhPJx7l4SY/hTIoZGRyrVlWHwQryFaJk1c4wj04yyd7rHAi2eQAxpnGnQxeWds2SdyCs+tablYUw==
X-Received: by 2002:ac8:31a6:: with SMTP id h35mr12745456qte.323.1593374687708; 
 Sun, 28 Jun 2020 13:04:47 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176])
 by smtp.gmail.com with ESMTPSA id 19sm14009797qke.44.2020.06.28.13.04.46
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Jun 2020 13:04:46 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id k18so7394052ybm.13
 for <wireguard@lists.zx2c4.com>; Sun, 28 Jun 2020 13:04:46 -0700 (PDT)
X-Received: by 2002:a25:cf82:: with SMTP id
 f124mr21339639ybg.441.1593374686050; 
 Sun, 28 Jun 2020 13:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200626201330.325840-1-ndev@hwipl.net>
 <CAHmME9r7Q_+_3ePj4OzxZOkkrSdKA_THNjk6YjHxTQyNA2iaAw@mail.gmail.com>
 <CAHmME9pX30q1oWY3hpjK4u-1ApQP7RCA07BmhtRQx=dR85MS9A@mail.gmail.com>
 <CAHmME9oCHNSNAVTNtxO2Oz10iqj_D8JPmN8526FbQ8UoO0-iHw@mail.gmail.com>
In-Reply-To: <CAHmME9oCHNSNAVTNtxO2Oz10iqj_D8JPmN8526FbQ8UoO0-iHw@mail.gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Sun, 28 Jun 2020 16:04:08 -0400
X-Gmail-Original-Message-ID: <CA+FuTSdpU_2w9iU+Rtv8pUepOcwqHYaV1jYVfB6_K157E6CSZw@mail.gmail.com>
Message-ID: <CA+FuTSdpU_2w9iU+Rtv8pUepOcwqHYaV1jYVfB6_K157E6CSZw@mail.gmail.com>
Subject: Re: wireguard: problem sending via libpcap's packet socket
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Hans Wippel <ndev@hwipl.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 29 Jun 2020 20:48:52 +0200
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

On Sat, Jun 27, 2020 at 1:58 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi again Hans,
>
> A few remarks: although gre implements header_ops, it looks like
> various parts of the networking stack change behavior based on it. I'm
> still analyzing that to understand the extent of the effects.
> Something like <https://git.zx2c4.com/wireguard-linux/commit/?id=40c24fd379edc1668087111506ed3d0928052fe0>
> would work, but I'm not thrilled by it. Further research is needed.
>
> However, one thing I noticed is that other layer 3 tunnels don't seem
> to be a fan of libpcap. For example, try injecting a packet into an
> ipip interface. You'll hit exactly the same snag for skb->protocol==0.

Not setting skb protocol when sending over packet sockets causes many
headaches. Besides packet_parse_headers, virtio_net_hdr_to_skb also
tries to infer it.

Packet sockets give various options to configure it explicitly: by
choosing that protocol in socket(), bind() or, preferably, by passing
it as argument to sendmsg. The socket/bind argument also configures
the filter to receive packets, so for send-only sockets it is
especially useful to choose ETH_P_NONE (0) there. This is not an
"incorrect" option.

Libpcap does have a pcap_set_protocol function, but it is fairly
recent, so few processes will likely be using it. And again it is
still not ideal if a socket is opened only for transmit.

header_ops looks like the best approach to me, too. The protocol field
needs to reflect the protocol of the *outer* packet, of course, but if
I read wg_allowedips_lookup_dst correctly, wireguard maintains the
same outer protocol as the inner protocol, no sit (6-in-4) and such.
