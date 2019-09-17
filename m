Return-Path: <SRS0=ifwh=XT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B219BC432C1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Sep 2019 08:54:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FEC22146E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Sep 2019 08:54:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tzbUqDEP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FEC22146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 828fe827;
	Tue, 24 Sep 2019 08:54:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9398bfcf
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Sep 2019 01:03:20 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97c12477
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Sep 2019 01:03:19 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z9so1705488edq.8
 for <wireguard@lists.zx2c4.com>; Mon, 16 Sep 2019 18:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eFsLKNLGpgG55AIDIbYCLocFEG1K6h1dt8PHZEaAKo4=;
 b=tzbUqDEPg/8xbqXZVKvi8bOpBoqiG1R2tT8uCJFr2IpMSJWSfJZ1PCJnMAGlQnzUd4
 ZnbHlOgZkH19TDeF1evt54lA+1EQ4EC/HXwIrtD73/OOKK7PT5a7sLO/WSmoK9VSrCsl
 RvsFiBnd01/5tbiO2+EGlQ5yYTaCgbzJ3FcPj2+5RY6J4N5DYhYz/azuou3zXlm2ky9H
 KW7fFUGSRXPwBr67iUoz3o3AMGPhwjY88pRcHEjMtl4GI3CTmc9hPlfCkuWvE1oj6ix9
 5Le8fdi9RE197dfxeEdN6r92rTyxlaHI5lr46WmEECi3rfHLWAUTfUv/+QhJ3wsQ54rn
 UU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eFsLKNLGpgG55AIDIbYCLocFEG1K6h1dt8PHZEaAKo4=;
 b=bWqqaruMMxuoIPsbqEG39pqM5y0R1bUWYy3TfzfD6MEPVQA4/00NOJoJURGYIcirHZ
 97rwSj31sQbJb5cHOgkzF7Mgq8I4lGLpBOMQdodwTNSMHsv8UkVguHtwbDZ4l3x1i+I+
 YvqclZ/uR+VrJmceC3KWMdQo4jAhz9sI2fVKNry0srBtR2o717V85R5oAG49Lxs4gCns
 pRUKsTol5MIAhK+EuFDQ3e1iwT4j6+yigsbi0CG3Fqyjx4p1SX8ARwtc+tValRNZSkQ/
 yju+uEcdOt8wQhxS7pGCxL9CpmcfFhbPr11axCYzezkJ3PkTVQFGSWuiPwCFyn7vso8D
 KJpQ==
X-Gm-Message-State: APjAAAW1iDuto2FZeI6VQpRJPOfYtsGXztqIZwsdjGuuqr1EtlvnYVD/
 btZNd4RhNJu2VsUjxIobm4pO8nXFRhb5648CUyc3mI8FRDU=
X-Google-Smtp-Source: APXvYqwjTAsq1fmik1iW8zPjFaZgbqXU3BgKvuTqarSNfWYOF7jNFrFpRLa/1rwEb8aAXU34ADodB6jNtQ9Fs+Be2Ko=
X-Received: by 2002:a50:d51b:: with SMTP id u27mr2069954edi.249.1568682198029; 
 Mon, 16 Sep 2019 18:03:18 -0700 (PDT)
MIME-Version: 1.0
From: Kai Haberzettl <khaberz@gmail.com>
Date: Tue, 17 Sep 2019 03:03:05 +0200
Message-ID: <CA+CGqoLP5OY9=ehZvAoxr0gLX04RO-dOWOq4ySfJjzir8SmHVQ@mail.gmail.com>
Subject: Chrome Android bypassing Wireguard DNS settings - Plus fix
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Tue, 24 Sep 2019 10:54:23 +0200
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
Content-Type: multipart/mixed; boundary="===============1835233297741374496=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1835233297741374496==
Content-Type: multipart/alternative; boundary="0000000000002ddb600592b549d6"

--0000000000002ddb600592b549d6
Content-Type: text/plain; charset="UTF-8"

When using Chrome in Android, it may bypass the DNS settings set in the
Wireguard configuration. In my case, this happened only when on mobile
networks, not on Wifi, for some reason. When in mainland China, this means
e.g. that Google can't be accessed in Chrome. (Firefox worked fine for me)

To fix this, go to chrome://flags and search for "DNS" in the search field.
Change the setting of "Async DNS resolver" to "Disabled".

Cheers,
Kai

--0000000000002ddb600592b549d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">When using Chrome in Android, it may bypass the DNS settin=
gs set in the Wireguard configuration. In my case, this happened only when =
on mobile networks, not on Wifi, for some reason. When in mainland China, t=
his means e.g. that Google can&#39;t be accessed in Chrome. (Firefox worked=
 fine for me)<div><br></div><div>To fix this, go to chrome://flags and sear=
ch for &quot;DNS&quot; in the search field. Change the setting of &quot;Asy=
nc DNS resolver&quot; to &quot;Disabled&quot;.=C2=A0</div><div><br></div><d=
iv>Cheers,</div><div>Kai</div></div>

--0000000000002ddb600592b549d6--

--===============1835233297741374496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1835233297741374496==--
