Return-Path: <SRS0=7A+2=6T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244B2C47247
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 May 2020 06:54:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81C7E206A5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 May 2020 06:54:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bajz8N7C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81C7E206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b216ecd;
	Tue, 5 May 2020 06:41:56 +0000 (UTC)
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [2607:f8b0:4864:20::c35])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b23b3d50
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 06:41:53 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id p67so308550ooa.11
 for <wireguard@lists.zx2c4.com>; Mon, 04 May 2020 23:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xNfg0RdcE5og5cdwLgyEszCiC1a3cEGKmbJaRhG+K70=;
 b=bajz8N7C3wKIbFQGZq+vQoJWUbxrPc7crH+yl4OgCy+vtucGGgBBjKd4DtXA+kL4sb
 rKPcwtyuJKhadjseGZI6G0wOr/qAv1P9Ej7Mp05U413e/cJdJG4OizeJugCQjyJ86IOn
 xwbHTDPIGgrsni1a8m1D9wGSWxq/fW2PG85Zws7vb+MnRPlYMo26yHteKrOai1cEYO4w
 7O8ZwOitRwx4lieMpSNkG3FHFPGG2WfksghJDtQ+cy08x6Y4iRQlC1XdDKQC8xSzWNeu
 6HWOxcciVEsL93Iij6TZnJ/w5CaBB3nF2f8KBBBzoSwPALs2G1J/vy1zdhqHUG+ASD+l
 p9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xNfg0RdcE5og5cdwLgyEszCiC1a3cEGKmbJaRhG+K70=;
 b=dS3PNPo44tsmYZ4GesfcpcsGF39T7IbQGBwHVa0oqETqHcSy5TbmmbYX2dxfwzRe4C
 bY5R+Zw4iuh3p9NNzF0aaixyvDKY+XdjEDsPSF0wa1f5UGBALLt4KifuIs6jVYLyIcvE
 +4w9Ae+qT73FG+UQLJopfmvEBvGFb8ybpeQVRW+qBOTi045Tx2QKeEqFUO3sGA4AZodt
 DPgsEOA32yP74mrdH4D/rbt/RXy/o9aYGuVPB20uw/mOnKqd1/1K4n5/VH2fiovgF/wB
 rjccCh3CvsJVGJl5ZMlKcqSQD7H3gyft7ZBQdkPpQMPSpbhc+ITXs+kHLjE2iwKPxuGM
 v4hQ==
X-Gm-Message-State: AGi0PuZcyCCS1mU5A82tkJY87TP3NMczxkwaLnJldxVS5I/QJXeXwcJC
 IvFbJIeuM0sU2FxJ7vXi0BNXb0tfxU1ord1bkFxs1v5Q
X-Google-Smtp-Source: APiQypL2nSS3/XzR07mZRyAFqKUbt20TAiQe8vaxsl7OHomOtbgdLhzTLDstNUZpKYsIVcs4I9hiVeG6gzFEBun+jPw=
X-Received: by 2002:a4a:d44a:: with SMTP id p10mr1724999oos.11.1588661662992; 
 Mon, 04 May 2020 23:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAF75rJBKTbaK6CEQcmto=YcgA5NGrG85jSvSrYZpQV-L1xFMww@mail.gmail.com>
 <a0985c12-6360-b192-1884-1d58db763a78@zx2c4.com>
In-Reply-To: <a0985c12-6360-b192-1884-1d58db763a78@zx2c4.com>
From: Wang Jian <larkwang@gmail.com>
Date: Tue, 5 May 2020 14:54:10 +0800
Message-ID: <CAF75rJDxM-m-wL89-JhQwbOk_1X4F2ebUzWuEz_2EULZ7bwm5Q@mail.gmail.com>
Subject: Re: soft lockup - may be related to wireguard (backported)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Jason A. Donenfeld <Jason@zx2c4.com> =E4=BA=8E2020=E5=B9=B45=E6=9C=885=E6=
=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=886:28=E5=86=99=E9=81=93=EF=BC=9A
> Can you send full networking configuration in enough detail that I'll be
> able to reliably reproduce this problem? If I can't reproduce it, it's
> unlikely I'll be able to fix it.

I will send full networking configuration to you privately. The
configuration works
and the problem occured only once.

>
> Meanwhile, it really really looks from your stacktrace that you have one
> wireguard interface going over another wireguard interface:
>
> [27929.506367]  wg_packet_send_staged_packets+0x320/0x5d0 [wireguard]
> [27929.506426]  wg_xmit+0x324/0x490 [wireguard]
> [27929.506469]  dev_hard_start_xmit+0x8d/0x1e0
> [27929.506508]  __dev_queue_xmit+0x721/0x8e0
> [27929.506549]  ip_finish_output2+0x19b/0x590
> [27929.506604]  ? nf_confirm+0xcb/0xf0 [nf_conntrack]
> [27929.506648]  ip_output+0x76/0xf0
> [27929.506681]  ? __ip_finish_output+0x1c0/0x1c0
> [27929.506720]  iptunnel_xmit+0x174/0x210
> [27929.506761]  send4+0x120/0x390 [wireguard]
> [27929.506806]  wg_socket_send_skb_to_peer+0x98/0xb0 [wireguard]
> [27929.506860]  wg_packet_tx_worker+0xa9/0x210 [wireguard]
>
> Here, a wireguard encrypted udp packet is being sent to an endpoint that
> then is being routed to a wireguard interface. What in your network
> config would make that possible?

Maybe some erroneous ip route/rule magic that I don't notice.
