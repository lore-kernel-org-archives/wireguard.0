Return-Path: <SRS0=VbKr=4W=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE50C3F2CD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Mar 2020 06:00:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED323208CD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Mar 2020 06:00:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="eT5YAKka"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED323208CD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04b2bee5;
	Thu, 5 Mar 2020 05:55:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ce395d4
 for <wireguard@lists.zx2c4.com>; Thu, 5 Mar 2020 05:55:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5145e01
 for <wireguard@lists.zx2c4.com>; Thu, 5 Mar 2020 05:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=DeNiYhNsLSWU5HcLXmZL0Oo9Q8M=; b=eT5YAK
 kaG/knxkJtpDImo9kAASthuDfXb+xyt8/oOr3/khF/D5E9gf+Q0saVgkO564sqq5
 ykv5QoU5xTKc+Vd91l23dZRI5YznbNwwrdAo5t7JNaCcN9OWgAlSVczr1A1F3R0g
 2+hssrWNOpcg5wbo0RewbAQrjFOAT/8mY4jE3DhqD4+FtO5CMDGF0e1nAb3BcQ0k
 O9q/3WQmVTDUtBVUb5LZpYSFmoQK+x6yXTIdQR+mQV/dIgI0Ii6VicbgKF+A/1d+
 pCFeQNNQHv/+KqOXQ72k/4Av4KDk18UZw+C9Dikwz0kcG86p6nU85qQObEsadcNc
 2aqdaIk1l56ZRO0g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 88cc55ee
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Mar 2020 05:55:37 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id d15so5193065iog.3
 for <wireguard@lists.zx2c4.com>; Wed, 04 Mar 2020 22:00:16 -0800 (PST)
X-Gm-Message-State: ANhLgQ1lXm4FYloTK+YvhdTB7IMQCJQvjnTCLeean/RfE7WLMnYjo3jM
 qNiqWYqlDVD/J6m5e0C8EvR1KbHXGja4/moe0UA=
X-Google-Smtp-Source: ADFU+vv6r70OUUDShNKoDwzypXopFBBewjVcjdrjqzyTNFl/riEWfoGbKY38/w5ZTlDYSHY2i89O0EcokKTgsBzrF5A=
X-Received: by 2002:a05:6602:2501:: with SMTP id
 i1mr5200335ioe.231.1583388015467; 
 Wed, 04 Mar 2020 22:00:15 -0800 (PST)
MIME-Version: 1.0
References: <20200304162154.8600-1-tklauser@distanz.ch>
In-Reply-To: <20200304162154.8600-1-tklauser@distanz.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 5 Mar 2020 14:00:04 +0800
X-Gmail-Original-Message-ID: <CAHmME9o+qacQhiZO_7hW0+uv1EASqLhTmcKWGXeVs02MryK0rg@mail.gmail.com>
Message-ID: <CAHmME9o+qacQhiZO_7hW0+uv1EASqLhTmcKWGXeVs02MryK0rg@mail.gmail.com>
Subject: Re: [PATCH wireguard-go] global: use RTMGRP_* consts from x/sys/unix
To: Tobias Klauser <tklauser@distanz.ch>
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
Content-Type: multipart/mixed; boundary="===============0970459076056173030=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0970459076056173030==
Content-Type: multipart/alternative; boundary="00000000000034229e05a015404d"

--00000000000034229e05a015404d
Content-Type: text/plain; charset="UTF-8"

Applied, thanks.

--00000000000034229e05a015404d
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Applied, thanks.</div></div>

--00000000000034229e05a015404d--

--===============0970459076056173030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0970459076056173030==--
