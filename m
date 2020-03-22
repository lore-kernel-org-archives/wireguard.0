Return-Path: <SRS0=Tlvr=5H=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B84C1975A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 22 Mar 2020 20:25:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DEB420722
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 22 Mar 2020 20:25:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="RI+6sSDA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DEB420722
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50b0c4a8;
	Sun, 22 Mar 2020 20:18:20 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a49baf6e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Mar 2020 20:18:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5fb8c6f3
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Mar 2020 20:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=9pMEgbSxxaOT93/ZqsyQtANg9wg=; b=RI+6sS
 DAoCgf4AXHin3ZPnAymE0UsDfkjQOaKdUVyvrgcwaC8lpxSJXNUMW+FDEqHazMbo
 vW8YpCi1yNbMBBtVRCgpy0zfb026pynv9US6bJCqkUk8JfLjrdVezx37J5fKVs8s
 brAY2Fq6dTbIrJIy4u67USwRxdagYmTTWs64EBHtxd23zZpL4TqDXeA4cGp4i1VI
 fHqzJMtMTYZh2lFUjyeLiCdnx5MIJJUDxsXr1IMT6ZgeVCuUxvUCZm+XhU6aOn09
 tMcldJ3DczUQmX7LA+xFV7iv84a0rm8/Vo83YPxts/FcV1vyxQGCSw4mWlTs/bTb
 bi90tWmuoImjYeTw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0610e748
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Mar 2020 20:18:18 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id k29so11253089ilg.0
 for <wireguard@lists.zx2c4.com>; Sun, 22 Mar 2020 13:25:13 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2ISPILv/OoVM/wUx5ZaLwGvUPQvXocqOE6BK3TkavsYI5FKqha
 mEJKnHzjn33wg86PQQg1OzGp0G2RQqfEt/II7hk=
X-Google-Smtp-Source: ADFU+vsrDDMDYHc4gpd1OKNNsdJx2l4WKjOB4uR2ZMHgNnux38OuPjRwHIU86ZyieMDVjYGzPyjR7gMbezrem/oAa78=
X-Received: by 2002:a92:cece:: with SMTP id z14mr9752715ilq.38.1584908712716; 
 Sun, 22 Mar 2020 13:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <7273dde5-290a-7657-1c4e-3397db01038b@electromail.org>
 <CAHmME9qd6-Q+XNPeC0xNg+1Dgrc71dwimJ2m5ES5YP_qDRmG=Q@mail.gmail.com>
In-Reply-To: <CAHmME9qd6-Q+XNPeC0xNg+1Dgrc71dwimJ2m5ES5YP_qDRmG=Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 22 Mar 2020 14:25:02 -0600
X-Gmail-Original-Message-ID: <CAHmME9r_DdK36d+Eh8_JwntDnVn_axHNPf93XcXikroPPoBjcw@mail.gmail.com>
Message-ID: <CAHmME9r_DdK36d+Eh8_JwntDnVn_axHNPf93XcXikroPPoBjcw@mail.gmail.com>
Subject: Re: using wireguard intents from tasker?
To: Franz Schwartau <franz@electromail.org>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

WireGuard for Android >= 0.0.20200322 supports Tasker integration now:
https://data.zx2c4.com/wireguard-supports-tasker.png . Simply select
the remote control option.

This may require some small tweaks in your Tasker. I've informed the
generally responsive developer about this, and things should be moving
along. Email their support, support@joaoapps.com , if you'd like to
have a more up to date picture of what's up.

Regards,
Jason
