Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A6BC35DF1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 00:47:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C32A2072D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 00:47:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQ8g+A28"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C32A2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63966eab;
	Tue, 25 Feb 2020 00:43:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c941be0
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Feb 2020 06:18:08 +0000 (UTC)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25f6df72
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Feb 2020 06:18:08 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id w47so5869447qtk.4
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 22:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=SXlI1mQGCfnkTzUr4YLbhtc5ZOEK9hM7CQFuruDgUOE=;
 b=YQ8g+A28H9H98G412S7hXn4v8EJBYZ3+ZYRK/6xCs/VFXOFUz4CDUfXcuhJ5RhK7MT
 1/L9O81hirS3upG4dUZsK9ee9d5KE5A+TnNH0G0EizlrneSKLwgiLDrPJgY+IQGNvJzf
 9nnZNi/FWhRDxgcZ2hOzMNj0CdXwXSrhnix0D5sKKJnDWxq+2jcRiSKGupmNiwqyOfaE
 TI7EwdXpaIiR4OOnu2GnFQ9DDRWTKu6EbLG8a3AEYBBYjfmqPT80HOO2Ay0iAcRlrgW9
 Ei4kR+ing5G+xY3c0fT1734IKj6ngfFyoNdhlvFFGiBpAb4/h3MAyfpHID4sW8q/jt2e
 qngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SXlI1mQGCfnkTzUr4YLbhtc5ZOEK9hM7CQFuruDgUOE=;
 b=j/YCFWVQvdBpNAEFd/dmvL0SgTNOUsvBrwhOXCwNticUaN4tv7TQYCs/4xXQ3otXsI
 Y0dotxi4M6M/LHmgfZz9VMlGrJqHo73dmlz65WIXSRVfXhX1nssHcYZvhS90yKuE8yOK
 vLba6+4oRRoaBJ8KzZ3vLbLWss0L9qMJ2dLFR6BsASGtcnJ6up2905mAFNYZJV1MT7dT
 fxJmT7/Yk+VnOkan4+bW3iYOg+RPwDPfYnJDReyZQxMTPvc1x6chXM2tsHYZOWH0O2F6
 KLsS0EpETLJBjtrgP/qsOFpT/EMh7p4Kv1Ii7+VWCkp7AbNqIPJ5ZWFoa9H6JMwek4Lp
 qNOQ==
X-Gm-Message-State: APjAAAU+taCQsnjTDiZLw+fat/oM67jiERD5TwEHA/Ud7czCT3+vnzBc
 1Rk/fm2nlj/Jsq2G0WlZSfx2tn8cqRgl10bKlMktsAXh
X-Google-Smtp-Source: APXvYqzdqJLz8e22FAYAO+jN3RjcwVJFmbvNgllLT9hV1jn4pewnN7xu7DuH1fXr24EkC8xh1fKCRRMJLK7aTPqFKcQ=
X-Received: by 2002:aed:34c1:: with SMTP id x59mr46897043qtd.236.1582525289068; 
 Sun, 23 Feb 2020 22:21:29 -0800 (PST)
MIME-Version: 1.0
From: John Smith <dingrite@gmail.com>
Date: Mon, 24 Feb 2020 01:21:18 -0500
Message-ID: <CA+5JoNrd7dNRQv+y7-wBw1denTt9GKnvF3S1R-FwgYixauMC=w@mail.gmail.com>
Subject: [feature request] Randomize PersistentKeepalive
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Tue, 25 Feb 2020 01:43:43 +0100
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
Content-Type: multipart/mixed; boundary="===============6678275601141875062=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6678275601141875062==
Content-Type: multipart/alternative; boundary="000000000000b3fc2b059f4c61e1"

--000000000000b3fc2b059f4c61e1
Content-Type: text/plain; charset="UTF-8"

There are some applications where you do not want a listener to know that a
channel is being kept alive and no information is being transmitted.

Perhaps the ideal solution would be to add an option to the wg tool to send
a keepalive packet, preferably of arbitrary size within some range. A
script could then be used to keep the channel alive in a manner. Would be
cleaner than sending something else through that may require further action
by the peer.

--000000000000b3fc2b059f4c61e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There are some applications where you do not want a listen=
er to know that a channel is being kept alive and no information is being t=
ransmitted.<div><br></div><div>Perhaps the ideal solution would be to add a=
n option to the wg tool to send a keepalive packet, preferably of arbitrary=
 size within some range. A script could then be used to keep the channel al=
ive in a manner. Would be cleaner than sending something else through that =
may require further action by the peer.</div></div>

--000000000000b3fc2b059f4c61e1--

--===============6678275601141875062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6678275601141875062==--
