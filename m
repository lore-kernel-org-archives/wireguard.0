Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A1DC04EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Dec 2018 10:06:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E790E20851
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Dec 2018 10:06:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="Ssoga3Dq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E790E20851
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cloudflare.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92f74095;
	Mon, 3 Dec 2018 09:58:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c506584c
 for <WireGuard@lists.zx2c4.com>; Mon, 3 Dec 2018 09:58:57 +0000 (UTC)
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03cafdaf
 for <WireGuard@lists.zx2c4.com>; Mon, 3 Dec 2018 09:58:57 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id a77so10365020oii.5
 for <WireGuard@lists.zx2c4.com>; Mon, 03 Dec 2018 02:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=4AEaIjB+6AcS/rBZbezAluiAbqbhS03GBIpb6Uqec18=;
 b=Ssoga3DqnAx4tXH1fIi84p6Lel4CFrJV+G+EcO4tqrWwp5cDYGCPGjz+vAOlJGrZwY
 XFfKZv9kYhiwshvvNxP8WYGalW4R5zJp0fw4MF2NN/fQlxkR9J7rji+vpff2wMyEVPi7
 ozuEhVdZo25Qv4n3xwEDWZ29rQGBYmvIAdplw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4AEaIjB+6AcS/rBZbezAluiAbqbhS03GBIpb6Uqec18=;
 b=iPdSfgS3KMngnTMj9dWHyfjKMiQOMYR+n0W7PvLSEQ8fQMhFRm2EFq+LqvAs7kKlmp
 SSblHal1OTBvfbugHUc7G7T5TvpeDcKQI2FEvxsX3+GV+b0QxaydUy6O7aeGHqCoudIs
 YOsS6v1Pp0Co5wfhWjhbXd8f17NH926TZiDQSsWjIema0z3UQmYS5CAROMkNDlN3Z/e/
 a3toq4uTTMl5O1nS0NeRGppDIsdcF/2DItEXBWZwl4FLhsDzlDx8aaxGMMHc7sIqNUt1
 AZL0x9ST4kgjaJA+8LfG4KSu1Gd2S2AP6TyoOAqk5So6gkw7gJhQB6mzC3AZA4+o5s33
 FNyA==
X-Gm-Message-State: AA+aEWbytKlInu7YzFVJrb/Ny9b6xb3YemmXr7lPVlaOyhxTzHoUK2ZP
 QiazGLaG42u6etYfOWPragNt7kV06GPW7uKjIs7ypgLQ
X-Google-Smtp-Source: AFSGD/WXNIBP2fDiWVt7efewf10ZysmXs7czg6tW3lZCSdzv8auMW3Kr7nOQDTLdSn8kPA7Nmq4pf2RSAnhbQS6+EPw=
X-Received: by 2002:aca:c649:: with SMTP id w70mr9792632oif.186.1543831601705; 
 Mon, 03 Dec 2018 02:06:41 -0800 (PST)
MIME-Version: 1.0
From: Chris Branch <cbranch@cloudflare.com>
Date: Mon, 3 Dec 2018 10:06:30 +0000
Message-ID: <CAMhRzNT3Ss4P4h4AFxiZLKcmEG59=sXYFDdFgmnpF9MMWOA0vQ@mail.gmail.com>
Subject: wireguard-go foreground mode broken on Linux
To: WireGuard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============8361933523434631472=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8361933523434631472==
Content-Type: multipart/alternative; boundary="0000000000003696e4057c1b4ef5"

--0000000000003696e4057c1b4ef5
Content-Type: text/plain; charset="UTF-8"

Though this isn't a common use case, I thought I should note that commit
2e772194cf7cd7c37d24364a9f9d407dc96a25e8 causes a regression in
wireguard-go running in foreground mode (-f flag); packets are never read
from the TUN interface.

I got as far as debugging that it works again if you call Fd() at least
once after SetNonblock i.e. it's not introduced by any of the other changes
in that commit. I've stopped looking at this for now, but thought I would
warn others and see if anyone else has some ideas.

--0000000000003696e4057c1b4ef5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Though this isn&#39;t a common use case, I thought I shoul=
d note that commit 2e772194cf7cd7c37d24364a9f9d407dc96a25e8 causes a regres=
sion in wireguard-go running in foreground mode (-f flag); packets are neve=
r read from the TUN interface.<div><br></div><div>I got as far as debugging=
 that it works again if you call Fd() at least once after SetNonblock i.e. =
it&#39;s not introduced by any of the other changes in that commit. I&#39;v=
e stopped looking at this for now, but thought I would warn others and see =
if anyone else has some ideas.</div></div>

--0000000000003696e4057c1b4ef5--

--===============8361933523434631472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8361933523434631472==--
