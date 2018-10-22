Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5ECC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:11:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E9620685
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:11:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcaGkv34"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1E9620685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a41dc81b;
	Sun, 4 Nov 2018 17:07:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c40055b
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Oct 2018 01:15:44 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38d61f6f
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Oct 2018 01:15:44 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id 189-v6so8528169wmw.2
 for <wireguard@lists.zx2c4.com>; Sun, 21 Oct 2018 18:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=EWL03WzzEOZmHdCNzHsLklaNYegXx6/nL8Xq/u9gjgs=;
 b=jcaGkv34GeBXyExV2AyfZF8c31hLUaVAbAlCSaFdZjuQKtVY+vM0gvAJEGsCEShxNQ
 Bt8wdtuGWNDXWwd1/Ns9xujlCeX04M7wvv1zzo3OvQTGLUGMRATH1GGs3XcKQlZ4axVT
 JD3+R/om76cwlyPT0YYChOIWTR9zEbpLGwEddSXhnClGrVjd1eUE2xxISti2JRrQQp5F
 2tc1VahKPSYk5ssCJFt70UzPhSQ6NmKL9Yb27aOZtxE8l5+ACU5X1VN6ZcEQeNhnuUQz
 SieBLtxh1xODEWSK+oo2cbehdlVTkKvfSvCPveVYzA97J34cSgdnWcTEmqIiLLBWhNyS
 yHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=EWL03WzzEOZmHdCNzHsLklaNYegXx6/nL8Xq/u9gjgs=;
 b=CFt0FVFrmMDaqMjzLTjoVaAcaWfa7ISwxMmZgcy6q0rfWhg/lptarQjwkSb00gPCDg
 BmEaF9Ci/2zS4SJ3cnSXMwwsbh+MfjlxRokmxxORUj9ADRIr7U0c4Pw3uySYjO1LNIp4
 vh+1o1UXXbss8IzWBkev9XcEvav0o2H5/vxTiFMq8YdqiUyLseBenxNuznpnrV7+cfuM
 5xv/hM6a3jS2Q1s40OEHFF7RWY46NHTCE95HkoOlIMqVLjhEQ7gtqqeq4v6mhJFfdQJA
 PBjbezhJ+kWX8AuW1FdMry2WJPKuXs8K9ceBERQ8/z/pzuN8Ac/pHawRhs+T0JlcrPjb
 KjVQ==
X-Gm-Message-State: ABuFfoir66YqJ71Z8zoTygjVzlk8BFbjC65Z7fzxRI/PDVuLZEaHN0m6
 TBZOI6AfYWZbfAQj2NcTCT3XltBd2/b71blz0YjbBa59nKw=
X-Google-Smtp-Source: ACcGV62Z3eYboDCuJjx6osVbz7qIt1jnj55spLCW2y5dJ5IHjof27wuMMWGzh+dBbZlSxeZktluRQScd5uGf379hKF4=
X-Received: by 2002:a1c:ae15:: with SMTP id
 x21-v6mr13194570wme.73.1540171088096; 
 Sun, 21 Oct 2018 18:18:08 -0700 (PDT)
MIME-Version: 1.0
From: Love4Taylor <love4taylor.me@gmail.com>
Date: Mon, 22 Oct 2018 09:17:56 +0800
Message-ID: <CAD6UttB+_G4RY-TwyJ7w6rX-wKqqRqds0B9hMVvFPfjNHvwtgg@mail.gmail.com>
Subject: Google Play can't Download through Kernel module backend
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sun, 04 Nov 2018 18:07:23 +0100
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

Hi,
I recently discovered that when I use the Kernel module backend,
Google Play will always be stuck in Downloading, I got the following
logcat, but everything works fine when using Go module backend
(Android VPN).

D DownloadManager: [558] Starting
W DownloadManager: [514] Stop requested with status HTTP_DATA_ERROR:
SSL handshake aborted: ssl=0x766f2a4008: I/O error during system call,
Connection reset by peer
D DownloadManager: [514] Finished with status WAITING_TO_RETR

D DownloadManager: [558] Starting
W DownloadManager: [555] Stop requested with status HTTP_DATA_ERROR:
failed to connect to r1---sn-3qqp-ioqsl.gvt1.com/27.85.180.172 (port
443) from /10.0.0.101 (port 49253) after 20000ms
D DownloadManager: [555] Finished with status HTTP_DATA_ERROR

I think it should not be a server problem, even if I use the free
server provided by TunSafe, it is the same problem. It seems that the
DownloadManager called by Google Play has not passed Wireguard at
all(10.0.0.101 is my LAN IP). Then I did the following test.
Kernel module backend + Router blocks Google domain name: Google Play
stuck in Downloading, the log is the same as above.
Go module backend + Router blocks Google domain name: Everything works
fine, no error log.
Kernel module backend + Router does not block Google domain name:
Everything works fine, no error log.

My Phones: OG Pixel/Nexus6 (Both are Android 9)
The link is route etc. on my phone: http://ix.io/1n8q
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
