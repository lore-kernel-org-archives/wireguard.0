Return-Path: <SRS0=23NU=3L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDCFC2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:56:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3228921835
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:56:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="PkiKjbYc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3228921835
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38e2b806;
	Wed, 22 Jan 2020 19:56:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2155bdd0
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jan 2020 19:56:54 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9270b13
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jan 2020 19:55:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bd76f41
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jan 2020 18:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=5PDmhAQAJNpQ7rLMd3Jcw4LTNc8=; b=PkiKjb
 YcHLB7Hh+NpNswV97Es97ioS1cyr0ngYKNbRWrLz7Jjc5+HloLB+ceR3t73vg/em
 a/mPo8YlD1iqQSBH7Nb7LSEex/yKUEZpW3RJoIofwoTyTylv2rKedXZ6TqBbnXrw
 XwTRYx1MhHr7fnkNGv7zfQulvz7xYVx0IvSPHRW51qtNK2A9zuJzzwX4P+SC8Rnr
 PMsG47fCJ43fMaxB4zGah+Gf0KDaOQaDnIZN/B1+vJMNnZm9Vq7j31Ui+2NreL1Q
 gswQcejIJVRMYFZ1pSFSPeDTDRKLfBDOGEP5bzE9y5qe4zpVH20ADQAKd2vNS+wN
 rVgKczNsAQDahatw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c84a4884
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jan 2020 18:54:11 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id i15so511163oto.2
 for <wireguard@lists.zx2c4.com>; Wed, 22 Jan 2020 11:55:18 -0800 (PST)
X-Gm-Message-State: APjAAAX5RB8qD3v/ZJRemvC5QWuYJJzPjXoToRB8jyeXDhXKAnYtH7gk
 2zBRa3Wuic7uiKvw1puyxylpfYnFVYO7DcBUaYU=
X-Google-Smtp-Source: APXvYqylvjxDaB90iuBDggLL0CBxvESoLhUeQRG4vvGcnFBlgGf8T8sJsr1yIc9vcJs8HdF/asJD3BPFeuRN4NxGSdE=
X-Received: by 2002:a9d:6745:: with SMTP id w5mr8757245otm.52.1579722917980;
 Wed, 22 Jan 2020 11:55:17 -0800 (PST)
MIME-Version: 1.0
References: <20200122194156.14049-1-rsk@revathskumar.com>
 <CAHmME9oQqAUcA8CAbhcj1cj5L5DxZr8aw7+9nun14M+C3e5pKw@mail.gmail.com>
 <b55e0dd5-0ddf-b2c7-59a3-fa7f44ca1e6a@pallas.us>
In-Reply-To: <b55e0dd5-0ddf-b2c7-59a3-fa7f44ca1e6a@pallas.us>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Jan 2020 20:55:06 +0100
X-Gmail-Original-Message-ID: <CAHmME9pBCjtqU7g1oBD_SfVt2a60gZpv9+DvtULzkB0dZq3A1Q@mail.gmail.com>
Message-ID: <CAHmME9pBCjtqU7g1oBD_SfVt2a60gZpv9+DvtULzkB0dZq3A1Q@mail.gmail.com>
Subject: Re: [PATCH] fix: make wireguard compatible with android TV
To: Derrick Lyndon Pallas <derrick@pallas.us>
Cc: Revath S Kumar <rsk@revathskumar.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Interesting! Thanks for the explanation.

Alright, merging this patch.

Thanks Revath.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
