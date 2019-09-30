Return-Path: <SRS0=knlp=XZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07FEC4360C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Sep 2019 08:45:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 596DC2081B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Sep 2019 08:45:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWmTJacI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 596DC2081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27f6a6f2;
	Mon, 30 Sep 2019 08:45:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24f75b00
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Sep 2019 08:45:01 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51c278d9
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Sep 2019 08:45:01 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id r134so6347729lff.12
 for <wireguard@lists.zx2c4.com>; Mon, 30 Sep 2019 01:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BCjgVe12mcKE3Q6TGhZS2ffIdmVw7p6daKKKBMuQtR0=;
 b=BWmTJacIN5qEl8/geSuKrCjdtGZ5bsurLhk8Jo+dvZewYDdyfWM06TvK7r/w0rRuMU
 PPPmiMTDp4dfP3037HPi7FC+DLq3FR3JsnY1khZA0GTBte/HMU4Cjhoc6slo0NjtsJff
 uE3WkOT/uWB+6SGz9R1osDOYkFql7Jal2PfA9MiP01vwICFVaNkyIiR0eob8Ah/WPE2r
 94he0tjZaIHuVhZlcmLvkesmcS7sdrVUfZlkWmyFJpEi4Gncgv6p30yG4x0hzTfqEa3T
 qqoZHncI7DZfNrWV7hz1spU4z0h5tHltDKahdRzY7S59gUgS0csPGVhOd2wWClKYyov2
 pX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BCjgVe12mcKE3Q6TGhZS2ffIdmVw7p6daKKKBMuQtR0=;
 b=PTWUkPDE3vIyhczeyp1YmIIkca/ohV9h7u4+Xsyp6FAPyg/1PrOj53pejkrsCuH6Be
 V8sDeyGOMCatj9wG6jTWE9qxvyClwI2mtTfF90v5Ic1geu3/2zX+Jrg3HQJf+WTJ2U/b
 2kG7zMVBSMHsmIeBWJJXhjqkJYMiXL1ungUHsPHGE8JrLiQRDo/SjqxZttS6/cN0oUR3
 evAgtut0AK7DznsZkEAzeYl6s6YPzjtzKuhbGWwYTWJ5hN3RtBu/inAY2tK2xJMM5/ae
 oBIBXaxwATYjnmGfvbhsl16fDKrPwZfe1XLhKfP+iOUZCcZCcW4X0io98dXuDAfPHAAn
 mryA==
X-Gm-Message-State: APjAAAUXLVKoLnxrBlg50zRhjdK43H7Ziq7qRnJUYeClJtZ+lRD/KNsA
 xx+So4fN0eveiXCgF1IddkeAODZ+daTPsaPi30I=
X-Google-Smtp-Source: APXvYqyT46rRl672GOUZOJl+QaZ+dd6QMN5sD1y5mt0GuwZhuaKRS1QZm+sAEFGZp0BRlNFAtMu7BUEVpWXtDdvoQVU=
X-Received: by 2002:a19:d6:: with SMTP id 205mr10996642lfa.144.1569833098844; 
 Mon, 30 Sep 2019 01:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <71fa7444-07f7-d7da-9a0b-895a27be18bd@bartschnet.de>
 <72539641-4832-70d5-09b5-430a8ab2deae@noc23.de>
 <CAOAVeL0e4JP+T6Z1353UPRmEXL84ZX5MSe+pjTO6xzzn9TB83A@mail.gmail.com>
 <87eezyp6f1.fsf@line.ungleich.ch>
In-Reply-To: <87eezyp6f1.fsf@line.ungleich.ch>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Mon, 30 Sep 2019 10:44:47 +0200
Message-ID: <CAKXLc7dYaAMxhnWnTMkbW4bGo=HOOhwxeCBcdP6y3D_+d5Uffg@mail.gmail.com>
Subject: Re: IPv6 endpoint AND IPv4 fallback endpoint in roadwarrior scenario?
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, Sep 30, 2019 at 9:53 AM Nico Schottelius
<nico.schottelius@ungleich.ch> wrote:
> At lookup time this works already.
>
yup!

> The problem is, if the underlying network topology changes and you need to reconnect via IPv4,
> when you had IPv6 underlying before.
>
Well, "if the underlying network topology changes" it is better to
detect and update things from OS level.
A restart of the wg interface (and using A/AAAA DNS records) works, so
it just needs to be initiated from whoever is taking care of the OS
network reconfiguration.

I would say that is "outside" feature, shouldn't be implemented at wg level.

Or ... actually, if there are other use cases, a more generic
"self-restart-timer" might be helpful. Something along the lines of
persistent-keepalive, but the reverse.
Persistent-keepalive is a packet send to the remote endpoint as a
one-way throw-and-forget packet, there are many valid configurations
that use it only on one of the ways (e.g. A --> B).
Currently, keepalive packets are discarded on the receive end after
updating the stats (e.g.
https://github.com/WireGuard/WireGuard/blob/0d9758d1afe5f812d5ccfcbb4b7c74f42f50318b/src/receive.c#L362
)

/* A packet with length 0 is a keepalive packet */
if (unlikely(!skb->len)) {
  update_rx_stats(peer, message_data_len(0));
  net_dbg_ratelimited("%s: Receiving keepalive packet from peer %llu
(%pISpfsc)\n",
    dev->name, peer->internal_id,
    &peer->endpoint.addr);
  goto packet_processed;
}

I would say a reverse-keepalive (not the best wording) is to try to
reconnect to the peer if it was off-line (no data or KA-packets) for
some predefined time. This can be measured in number of seconds since
last packet received (KA or data). If such a condition is met,
resetting the interface (and thus redoing DNS lookup) may result in
fixing the link disruption caused by topology change.

Again, this may be better implemented outside wireguard since the
timeout is available e.g. via `wg show <INTERFACE> latest-handshakes`
command.

Cheers,
Kalin.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
