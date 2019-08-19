Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5890AC3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F07E92080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=janestreet.com header.i=@janestreet.com header.b="TlRTCTOt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F07E92080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=janestreet.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26ed195f;
	Sun, 25 Aug 2019 15:43:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c1aab49
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Aug 2019 20:31:04 +0000 (UTC)
Received: from mxout1.mail.janestreet.com (mxout1.mail.janestreet.com
 [38.105.200.78])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20d35e27
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Aug 2019 20:31:03 +0000 (UTC)
X-JS-Received: from [30.32.81.38] (helo=igm-qpr-mailcore1)
 by mxout1.mail.janestreet.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <crichoux@janestreet.com>) id 1hzoIx-0007uP-0V
 for wireguard@lists.zx2c4.com; Mon, 19 Aug 2019 16:31:03 -0400
X-JS-Flow: external
X-JS-Received: by igm-qpr-mailcore1 with ocaml/mailcore/main_production
 (680c9fc0d05b) (envelope-from <crichoux@janestreet.com>)
 id BdWwcG-6bfdAA-e2; 2019-08-19 16:31:02.996722-04:00
X-JS-Scanner-attachment: No attachments
X-JS-Scanner-esets: Not scanned (internal mail)
Received: from mail-oi1-f198.google.com ([209.85.167.198])
 by mxgoog2.mail.janestreet.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hzoIw-0006Ry-UA
 for wireguard@lists.zx2c4.com; Mon, 19 Aug 2019 16:31:02 -0400
Received: by mail-oi1-f198.google.com with SMTP id e194so1278776oib.10
 for <wireguard@lists.zx2c4.com>; Mon, 19 Aug 2019 13:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=janestreet.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=vct8OFw+hPra25VipIZlRWTZzsibQwwro8HCGnAo/l4=;
 b=TlRTCTOtCge4HveW/IwqUtQToxFrJ9ldldnyGaig2aTFkx+2uBcOy/lkhcQat6k0qQ
 Za9G+BWRdsdDNQN7f0LwYoICPf/BdIt3ZSF8SpCblVAbJscYc0XH1IkMJJGG4/aqqA9a
 EAJ3ojwfp3VenQNl5oNRR9JeP7+bkPW93R4Ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vct8OFw+hPra25VipIZlRWTZzsibQwwro8HCGnAo/l4=;
 b=sxzFLhY6BhB64G0zUvjurhSU+u5emQl4ajiNVMDbIKCiR3ChOA2nUYlC6ifRVOQpAa
 rMyfZLcaKPUUcKlWnUJ8UvPHavuWGyday/vk+NwD9a9wTrfVYRTQGk8sQXoI3rDT6Qhm
 oYe8H4Xah5XC9YRdTdIA8/S/9+PGcSMOR0dSMmrmYIkd4dGRaE6W8bOlZq/7YI+rvkJJ
 42/TeIu1oCF9P3Tckhn5bibNvjuS/CU/dusi+hngmpZeahufTIgZStt2xsPiFKTPqbb0
 /Ar6aNZSngnHc8HWcbSGFmpqDfpiFU0RPJuf8x4QlTeTwr0WqK8n2yNS5NjbuUC8WVcn
 4nQw==
X-Gm-Message-State: APjAAAVaQwGlWSkD/o9pcRcMqGJJv0N5QcefQlkJKMy5Y/R6ashT9NHq
 n5huARmmidX/OJdkNZAKZdbcqSbcegYSWvUJvJkWS9JfQlHws0BUsEe30ZNEszWKK2OU+EoQGwc
 XFOEdEUiN5wP5eKHmLNptSi/z7hjqJvIlYR8=
X-Received: by 2002:a05:6830:108e:: with SMTP id
 y14mr11824563oto.283.1566246661620; 
 Mon, 19 Aug 2019 13:31:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw+JX7zIroKMG+AR7KuaqKND052oVgVOsTdwkOZVt3m1k3FtYDIJ8PIiw5yd5k/cnDeARgTice36J0lsp4O8XQ=
X-Received: by 2002:a05:6830:108e:: with SMTP id
 y14mr11824546oto.283.1566246661391; 
 Mon, 19 Aug 2019 13:31:01 -0700 (PDT)
MIME-Version: 1.0
From: Claude Richoux <crichoux@janestreet.com>
Date: Mon, 19 Aug 2019 16:30:50 -0400
Message-ID: <CAKZtF0rY6AZzyjwyAo5wtTqcS2GoOGPaUA1XVgGOaG_ZZ=rSbg@mail.gmail.com>
Subject: Wireguard-rs implementation
To: wireguard@lists.zx2c4.com
X-JS-Exim-Data-Received: 2019-08-19 16:31:02-0400
X-JS-Processed-by: mailcore
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:43:52 +0200
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
Content-Type: multipart/mixed; boundary="===============9132292256529191802=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============9132292256529191802==
Content-Type: multipart/alternative; boundary="000000000000e233bc05907e3748"

--000000000000e233bc05907e3748
Content-Type: text/plain; charset="UTF-8"

Hi there,
I am reimplementing the noise protocol, and I decided to test against
wireguard-rs to check my KDFs. After some confusion, I noticed that the
Blake2s HMAC function is incorrect (it disagrees with pycryptodome,
openssl, and Cloudflare's BoringTun implementation). I guess I'm just
wondering what the status is on wireguard-rs? I saw it on git, so I assumed
it was working, but maybe not?
Thanks!
Claude Richoux

--000000000000e233bc05907e3748
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi there,<div>I am reimplementing the noise protocol, and =
I decided to test against wireguard-rs to check my KDFs. After some confusi=
on, I noticed that the Blake2s HMAC function is incorrect (it disagrees wit=
h pycryptodome, openssl, and Cloudflare&#39;s BoringTun implementation). I =
guess I&#39;m just wondering what the status is on wireguard-rs? I saw it o=
n git, so I assumed it was working, but maybe not?</div><div>Thanks!</div><=
div>Claude Richoux</div></div>

--000000000000e233bc05907e3748--

--===============9132292256529191802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============9132292256529191802==--
