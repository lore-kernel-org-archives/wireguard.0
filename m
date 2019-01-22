Return-Path: <SRS0=LuSS=P6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFAAC282C3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Jan 2019 21:46:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 043AB20866
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Jan 2019 21:46:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca header.b="VWjfnDwb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 043AB20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d685fe73;
	Tue, 22 Jan 2019 21:41:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f645fc34
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Jan 2019 21:41:01 +0000 (UTC)
Received: from sonic306-4.consmr.mail.bf2.yahoo.com
 (sonic306-4.consmr.mail.bf2.yahoo.com [74.6.132.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 456189d9
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Jan 2019 21:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1548193560; bh=S5/RWwxliC3y+/08d5VMJZtTyxEx1dE3T4QqJU2qA0s=;
 h=From:Subject:To:Date:From:Subject;
 b=VWjfnDwbFDL8hHQwY2h0I+K/os6m3wYL+INwN+jNeZdIHhxBNT6/XJC7WZUOJWgTkZyYAOlsjsZlJs8IbdCKszW11Fk3tloocCGbpRtMq8WelVkNVqIkiWI5EeTKnKj1eVwJqRspKMjrKhN9TlFLSXRXu+eJ4raZG5FxR4YR/6cUd5ciPnLm/vVPpLMGv6+HP9whRC+BN2htOf9dLTf1PdUDc9lB1VrFMacKIJQyOk3D4oT8cb6TWbAAuHJ1QOSNvVzRnhcyI/zoDhB0f3biLI/3zRqt1N6+qOk/whCX4mDsXwA7c2y4IMsS0URuL7DboWCXsGpjBnWxLMJCP30W1w==
X-YMail-OSG: Nc6IxJ4VM1ntenR.VIQS2l_p41PEYCkY9PgQfs7gArDHEysIAlq.6nCWQ4.7vTL
 r.V7BdbDogZHt.FWiy1wDbAj1ZAPuPZdpoVb9.z0Q6BBvVLrmM.47idGZYpWhZeLz7JiPqhKgdis
 h4jsO126n8a2A3avoNFh95n.wroLztGMBobPLl_f6YxdCorC_UR_YzbgkALTFL54Qa8aOpNd3Ilx
 KdXEGzrt.CXM7Yee9P6tQWBUyFA7dkW0K_6kM9B74f2f8pw6X1EP_UK_vfKl7RfF08cf8jJkdea4
 _ZHxbnjaXuzjax5IOUHh15urMzk1T7w5GpZOWGs1MZNRCZKo4isDhHCb0HBaDN9gWDqhYyJTufz6
 GZjT8wHHCndqFsiknyKtYaPbFmAHKVGgSEUmzvYUzTNutBwrliMQ9PPCUbj.T0fq9fkf.BESFjCt
 F7g2OG_UgFs8Kp3JRp4W4lsmNjZboaBxia3IRJfA_5yPca.tNJQp98iAmjgWOvKRxA.0Ma92gwVK
 PqCVLL6wlc2gfFzRU.aMepZcgGchnePKh.0wdeqi5HlQXHEfjCTpsiBFFccxxamQ6Xw3U8bDeABa
 UcJQe7Y3mEP4C2JkP.AGruJs3GsD5DkUu9xrW9I0XPJfNi7k.rEtuEO5k0jL4My6X9WmMKFLCdLG
 1JewEAYFK0HgvVuYy5q.RL.EVwiyVgaRtgoQ3uKT.gryWgeb.A2KSYshw4rHYK0iGhVwTV_ViiwN
 ZZ88xdt8DhaXvDF_Pescu4zlo5ews9v2eZuG1B_me2982ss_5_hClz0HN3tB99KJcRaaj.SN.Xux
 t16LIDpfEC8Xxdk.PEVzdJpT3XHHDPGuOEPSFLVc4V9gLytR2nUn1M4SLv9TlfKMie5agrWSNJbm
 vSZVjew68h5Okrbv0GpUqIXdkXbpjRZqfzXenYNWki.4IjwiZweUPRj.9iB2jx6Dy8PSl1zfplxl
 uGzPQRjTXVq5.1qNo4kpsAhBdFAbvDsuRgcagr4RPkuXhqsLGGrrQhS0rsBN06GPzfpIx4VUUOeX
 o0PL.xL4iS_rhSI0aJvjx32mJWm2yBnnrIkZhv_g-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.bf2.yahoo.com with HTTP; Tue, 22 Jan 2019 21:46:00 +0000
Received: from pink.alxu.ca (EHLO localhost) ([198.98.62.56])
 by smtp410.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
 652f75762b7f44ac72218d6d8dbb6d9d for <wireguard@lists.zx2c4.com>;
 Tue, 22 Jan 2019 21:45:55 +0000 (UTC)
MIME-Version: 1.0
From: Alex Xu <alex_y_xu@yahoo.ca>
Subject: [bug] wireguard-android does not correctly add resolved IPv6 endpoints
To: wireguard@lists.zx2c4.com
Message-ID: <154819355461.7369.7953485802650364220@pink.alxu.ca>
User-Agent: alot/0.8
Date: Tue, 22 Jan 2019 21:45:54 +0000
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

description:

Using wireguard android 2018.12.18 on an IPv6-only network, it is not
possible to use a DNS name for an endpoint.

steps to reproduce:

1. create a tunnel. set the endpoint to example.com:12345
2. bring up the tunnel

expected results:

the tunnel is brought up (in this case it won't actually work because
example.com is not a wireguard server, but it will be brought up)

actual results:

In the log, there is this error:

WireGuard/GoBackend/wg0: Failed to set endpoint: x:x:x:x::1:40257

additional information:

entering the same IP address with square brackets works fine.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
