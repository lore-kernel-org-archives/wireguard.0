Return-Path: <SRS0=xwVK=AI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4517CC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Jun 2020 00:22:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8C042080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Jun 2020 00:22:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="CwMDh4rx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8C042080C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdee0dd9;
	Sat, 27 Jun 2020 00:03:33 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 41c3a14f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Jun 2020 00:03:32 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59d69f0d
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Jun 2020 00:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=b3z1Ika2k053NuwPALZ4Q3Qk8T8=; b=CwMDh4
 rxvTQgpb9t6lziCaFwrNb/7JezXYQHwj4QSrFcOBj1AEnRC16GKZwRUw2lQA/hNe
 Y/0kir+65lSe1daWTKLjh0lnzeXi9qrg5pgy3lUWu2EJUoHLZ0U8r2d/F7wq0VdT
 WW5MEcFeCkxDxx9A6bcnNDCzOPtZYAKKAl9IDYGPNlmWq5651dbOFojolpb4d3QZ
 4yLpKq6bif/Kl09jeCLoVBBHcuC3q0Yzmy49XBGpOC9sLaX/IBxOF7Pn0/imbftw
 iLtChHkSGdlziUyZp9GgBo6CtS/RZV7TBl+f3uQSTKudGlQhI53Sds2mS64Bzas3
 G425+/gFd/peTnrA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 83faaf3c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Jun 2020 00:03:31 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id q8so11649662iow.7
 for <wireguard@lists.zx2c4.com>; Fri, 26 Jun 2020 17:22:50 -0700 (PDT)
X-Gm-Message-State: AOAM530xoz7t8auK6GkGLNrYMsjuN07hib2GwI0gPTyIlGf8n4RiKX9e
 u0sdTQTt4b6ytqtp0ROGy4CtVMSLJj2VzKx291c=
X-Google-Smtp-Source: ABdhPJxv/V/0OszkpnGrACe/mfK5KNydokuhRm+uvVI9TJgTN7xJoU9T/KW/6g0gls3bi7Svdc/1qUTAY36VYL3FYPI=
X-Received: by 2002:a6b:c80a:: with SMTP id y10mr6109433iof.67.1593217369913; 
 Fri, 26 Jun 2020 17:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200626201330.325840-1-ndev@hwipl.net>
 <CAHmME9r7Q_+_3ePj4OzxZOkkrSdKA_THNjk6YjHxTQyNA2iaAw@mail.gmail.com>
In-Reply-To: <CAHmME9r7Q_+_3ePj4OzxZOkkrSdKA_THNjk6YjHxTQyNA2iaAw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 26 Jun 2020 18:22:38 -0600
X-Gmail-Original-Message-ID: <CAHmME9pX30q1oWY3hpjK4u-1ApQP7RCA07BmhtRQx=dR85MS9A@mail.gmail.com>
Message-ID: <CAHmME9pX30q1oWY3hpjK4u-1ApQP7RCA07BmhtRQx=dR85MS9A@mail.gmail.com>
Subject: Re: wireguard: problem sending via libpcap's packet socket
To: Hans Wippel <ndev@hwipl.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
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

Hi Hans,

Your test program appears to be doing:

socket(AF_PACKET, SOCK_RAW, htons(ETH_P_ALL)) = 3
sendto(3, "E\0\0+\0\0@\0@\21\267o\300\250\1\1\300\250\1\1\4\322\4\322\0\0272\221\1\2\3\4"...,
43, 0, NULL, 0) = 43

This means we're calling into af_packet's packet_sendmsg->packet_snd,
which appears to call     packet_parse_headers(skb, sock):

static void packet_parse_headers(struct sk_buff *skb, struct socket *sock)
{
    if ((!skb->protocol || skb->protocol == htons(ETH_P_ALL)) &&
        sock->type == SOCK_RAW) {
        skb_reset_mac_header(skb);
        skb->protocol = dev_parse_header_protocol(skb);
    }

    skb_probe_transport_header(skb);
}

So the question is, why isn't skb->protocol set on the packet that
makes it to wg_xmit?

Adding some printks, it looks like the result of:

    pr_err("SARU %s:%d\n", __FILE__, __LINE__);
    skb_reset_mac_header(skb);
    skb->protocol = dev_parse_header_protocol(skb);
    pr_err("%d\n", skb->protocol);

is:

    [    0.430754] SARU net/packet/af_packet.c:1864
    [    0.431454] 0

So digging a bit further, dev_parse_header_protocol:

static inline __be16 dev_parse_header_protocol(const struct sk_buff *skb)
{
    const struct net_device *dev = skb->dev;

    if (!dev->header_ops || !dev->header_ops->parse_protocol)
        return 0;
    return dev->header_ops->parse_protocol(skb);
}

Apparently the issue is that wireguard doesn't implement any
header_ops. I fixed that in this commit here:
https://git.zx2c4.com/wireguard-linux/commit/?id=73b20c384a8bc498c6b8950672003410ed6016da

In my tests, that commit appears to fix the problem exposed by your
test case. I'll probably wait a few days to think about this some more
and make sure this is correct before submitting, but it seems likely
that this will take care of the issue.

Thanks for the report and easy test case!

Jason
