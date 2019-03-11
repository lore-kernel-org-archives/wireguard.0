Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3288C10F05
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:40:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E632183E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:40:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQwLz1nT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72E632183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a6668fc;
	Wed, 20 Mar 2019 22:39:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36f19551
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Mar 2019 14:20:21 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6836d239
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Mar 2019 14:20:20 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id y15so3535660wro.4
 for <wireguard@lists.zx2c4.com>; Mon, 11 Mar 2019 07:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YW/lzcbaJyDES3gbAmJEetE2+nhv9bjQ5+KsWlNjEaE=;
 b=dQwLz1nT4k9ntoceCXGZ+dfdnbDgcZ6B0d7UfHoIry+Q26GxPFZDUidXjPSZv5cMou
 53buLqcORQ5+CE1B5iezwLv772grBbCdIrwvV0vS/R7jVhjSLnh/fvJ+u4pITISBruMn
 0FgfbGQOXfnrzQuh+y+NBRwb4gvZdu9fJ10oMrVPhSJYGgrdYCkCAKxo8fb+0MqPFWg1
 /fRUvKhBmJjyv+99U13BnvTuT0RfTQGQgO32f8PDKqi5zHUH1sIMuFxSTJfBmI7u/WP9
 IXi5XUTvdOt0CSTbdPLdoKpRqKvafaBumUcv8qUILUDHrQSBxug8jimP0zXj+KYcsws+
 ixXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YW/lzcbaJyDES3gbAmJEetE2+nhv9bjQ5+KsWlNjEaE=;
 b=eATSh1bwGlD75+fc445se0XoE2DZNCFqWMvRZp/RMT2QptzMVvPl1+4QeVsss5aPIe
 Sgwr67uZdJ7ix4LZKokXGeiGfjXD/jl519afN2nrXmFX942cmAgIyhP26JK/xQvJjYyg
 fRg6TGMveB71XwZwORAYDrW+wNIwdjXuBBOfzgKIJrXzqZr7yDh9Cq3qUOB+gXTWEV0V
 Okhv9cdGoOlY0g48TJ2Qis1F7yhuJ06dz27lAD3YpmlH73cEkjKHRKvMNkfqCCduBKE5
 h4bb5xcYVOGfD/iFUnJ1NLIWt8GyNAh9DbpVJBcw/I6N1y1/g/XjZZFuFIqgdDOfCi66
 W+dA==
X-Gm-Message-State: APjAAAWukZein4xS/LIwgGQvF08NlyPKNSQ4qt1M/tRQE6ZfXzXXFuG3
 IgER0IvFO962WFkJJQItj8DgO0XTuP71fNiUTntF9ZB+YZ0=
X-Google-Smtp-Source: APXvYqzzQelN3JMkCeJ9so8OwJ43TYEviS2bvOZx0rN/ns1rQ2gZ2YC0rZ3HaW/s3g0C4uLOxt1+M4CMQnumDu+LOvM=
X-Received: by 2002:a5d:528e:: with SMTP id c14mr21230634wrv.304.1552314686066; 
 Mon, 11 Mar 2019 07:31:26 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Q2/Fn2t1IEJhxZ8=?= <cosku.bas@gmail.com>
Date: Mon, 11 Mar 2019 17:31:15 +0300
Message-ID: <CAAvxC95qZXF-eDkZ7P2e+nYbxXzh66FHN=x+iV2jDPvv7=uS8g@mail.gmail.com>
Subject: [Bug] MacOS import fails due to line ending
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:39:28 +0100
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
Content-Type: multipart/mixed; boundary="===============0888469455004869090=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0888469455004869090==
Content-Type: multipart/alternative; boundary="0000000000007154d20583d26d57"

--0000000000007154d20583d26d57
Content-Type: text/plain; charset="UTF-8"

Hi,

This came up when we tried to import our configuration files.
When the configuration file uses CRLF line ending instead of LF, importing
fails.

Regards

--0000000000007154d20583d26d57
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Hi,<br><br>This came up when we tried to import our configuration files.<br>When the configuration file uses CRLF line ending instead of LF, importing fails.<br><br>Regards</div>

--0000000000007154d20583d26d57--

--===============0888469455004869090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0888469455004869090==--
