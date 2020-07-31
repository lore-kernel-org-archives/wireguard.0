Return-Path: <SRS0=PVz2=BK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B43C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Jul 2020 14:20:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91CCF206DA
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Jul 2020 14:20:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="f1wFk+7m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91CCF206DA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f8c4593;
	Fri, 31 Jul 2020 13:55:45 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 46d27e4d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 Jul 2020 13:55:43 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0db959b
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 Jul 2020 13:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=2S5IqF6vSUMJErQ22QqWOr6YF8Q=; b=f1wFk+
 7mkataZk/A2RZxw49VkxTFXjPdzYfs5YffN+2WTlfymZvIi1p/AxiSGJxTgpn1Eh
 J0gdbcgBEPePG7O7zyckOK1fdbWU5L60UpdQFYWuPq1lCeobgshpKbE+Posx/Lkr
 JDEmUt2K4oVBB8sS+STKJavXH+LsCDLbiVlqFnniCguhiUaISw0VBrkOEqsBQ7Zc
 BPUqzF3yA4cTJpw7AVhsZESZkK2zQ/q4BUyo5ky2bvT+gwyGHy9ygboQ3UxAxa2v
 AUT6TyrL+qBUQJNZEOHgdRb53QOw63mi9IkkmBXlezvKmAR69EeT6gbT72VS4244
 aQ+vl89Chx2PzzwA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 708d3ad5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 Jul 2020 13:55:43 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id y18so17017924ilp.10
 for <wireguard@lists.zx2c4.com>; Fri, 31 Jul 2020 07:19:33 -0700 (PDT)
X-Gm-Message-State: AOAM531zOoJkJhEv2TZ4W8G9piMw++V7383mKts+qYrlBcuMdn2rqmNw
 mJxzsE2t/vnFjD5a6azlkMOvCGaLRMO2+LXuA0s=
X-Google-Smtp-Source: ABdhPJzV7Ooa1AW6xqjhJaW2xvk6XmBVPhMnQYoXUZ5Vwc2R5RnN6R2MItHbxxTJjxgsA9KyvJo3j7XQbpxpGvqP+sc=
X-Received: by 2002:a92:50f:: with SMTP id q15mr4076795ile.38.1596205173256;
 Fri, 31 Jul 2020 07:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200730162049.2869-1-siadat@gmail.com>
In-Reply-To: <20200730162049.2869-1-siadat@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 31 Jul 2020 16:19:21 +0200
X-Gmail-Original-Message-ID: <CAHmME9o4uRpaYPiPo1UNm1bMAOBMFKLvG1tajoPnkTVUTdmhdA@mail.gmail.com>
Message-ID: <CAHmME9o4uRpaYPiPo1UNm1bMAOBMFKLvG1tajoPnkTVUTdmhdA@mail.gmail.com>
Subject: Re: [PATCH] device ping test: get free port when testing
To: Sina Siadat <siadat@gmail.com>
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

Applied, thanks.
