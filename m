Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BE3C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:38:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3692206BF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=revathskumar-com.20150623.gappssmtp.com header.i=@revathskumar-com.20150623.gappssmtp.com header.b="ptuxAD9d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3692206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=revathskumar.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ec25965;
	Mon, 6 May 2019 20:33:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31a91d9d
 for <wireguard@lists.zx2c4.com>; Mon, 6 May 2019 09:28:12 +0000 (UTC)
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 696a647e
 for <wireguard@lists.zx2c4.com>; Mon, 6 May 2019 09:28:12 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id w6so10848941otl.7
 for <wireguard@lists.zx2c4.com>; Mon, 06 May 2019 02:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=revathskumar-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=0DcS+Ldx2Ubw5rPP1ha3sHABVeH3KjNPhzHVwrAyhf8=;
 b=ptuxAD9dkhx+CVaRiN0TS77QC9H6R50zPVaMNYqOhcWApU1pkcWMbQA04jnHeOfZTk
 29y4L3EdqHy0SxYf95kBUQsqW23QzdqSt/abNjRF2jN749hPJMQjg/8wXqzrwVq3U3A8
 q+ezJr9jNQ+aqxZDjMarc+/JFfFOs++o70chO6vej4SJfGRHNwNbuNQgCz/T5dPIo1l8
 xVVE2jVVww+jGYgSjihGwgHQqhyifeIe3AV/5+/xFNgroHYoQRdmp5AwI+JBfOeXZ3uG
 w/onRwj0mnc/FTvu3eo2uz6w9YVWuWp4DM0Vw4803t1vc71YLax4xwgPGwhsVIJfEnQC
 lJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0DcS+Ldx2Ubw5rPP1ha3sHABVeH3KjNPhzHVwrAyhf8=;
 b=i9Wh1WVT9qbVSC0hZ++67f0E5ln7qBikYrdoECEvckSv1GQOEKN3DU6yAb/3bnUyes
 NK1SrVYb25dBu1OPYHmB2zXOywTBvyUvlQr2bkrdNFOXedyy3ZJcNhIehG1E5v5flDHe
 2jLJIrllD4Dtb9k3CSfNnw+qoF+funqztlQkXcMPr5Ut8yAtnLZ8BVH/J79Ufs6Z3Yab
 ng1Fnt3JGGOjFklj5ZT7e8YXhtbHVZeHl3hfNtsAaqsOZ10ueBH9Luvy8qENNqGVM+Gf
 cj8DfQNXNYSo/j7fUn13RA8XyPrumFvzJhuGAD0BP4EaWOIcbcboMXMLffgsd2D4ExIy
 ndzQ==
X-Gm-Message-State: APjAAAXRLi1UqwwtyGqrKFO5KNq31ZG5yw4//lijopD+8KQFXPAUBa2e
 88mU7rGfIUGLQPbk1ARYk4zPpN9JQaeFaxLQEk16stbrcwvBgXmW
X-Google-Smtp-Source: APXvYqz6sNiSaIvQZnBSHUZkuqjVwyxuAlsonZUKmXB64FM7odWd4V608PL5FF9vkEgHPlohGlc5aklTHwS2ON44TI8=
X-Received: by 2002:a9d:6a06:: with SMTP id g6mr14142614otn.169.1557134890504; 
 Mon, 06 May 2019 02:28:10 -0700 (PDT)
MIME-Version: 1.0
From: Revath S Kumar <rsk@revathskumar.com>
Date: Mon, 6 May 2019 09:27:59 +0000
Message-ID: <CAO=kRDLSnhMHFbiKsxvuPeHo3WT9EQLTeu6T8nRF_nJLWr=NMA@mail.gmail.com>
Subject: Wireguard andoird and Fire TV
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 06 May 2019 22:33:16 +0200
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
Content-Type: multipart/mixed; boundary="===============7215413562979121933=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7215413562979121933==
Content-Type: multipart/alternative; boundary="000000000000042acb058834b8e4"

--000000000000042acb058834b8e4
Content-Type: text/plain; charset="UTF-8"

Hello all,

I tried to side load the wireguard android on Fire TV stick.
I was successfully able to install and create a new config.
But once the config is created I was not able to enable the config.

The navigation using the FireTV remote never gets focus on config toggle
button.

Any plan to support TV sooner?

with regards,
Revath S Kumar,
JavaScripter / Rubyist / PHP

www.phprepo.in
blog.revathskumar.com

--000000000000042acb058834b8e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello all,<br><br>I tried to side lo=
ad the wireguard android on Fire TV stick.<br>I was successfully able to in=
stall and create a new config.<br>But once the config is created I was not =
able to enable the config.<br><br>The navigation using the FireTV remote ne=
ver gets focus on config toggle button.<br><br>Any plan to support TV soone=
r? <br></div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">with regards,=
<br>Revath S Kumar,<br><div><span>JavaScripter / </span>Rubyist / PHP<br><b=
r><a href=3D"http://www.phprepo.in" target=3D"_blank">www.phprepo.in</a><br=
></div><div><a href=3D"http://blog.revathskumar.com" target=3D"_blank">blog=
.revathskumar.com</a></div></div></div></div></div></div></div></div></div>=
</div>

--000000000000042acb058834b8e4--

--===============7215413562979121933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7215413562979121933==--
