Return-Path: <SRS0=5rhV=NT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED40BC0044C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Nov 2018 02:53:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43BCD20857
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Nov 2018 02:53:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="rmeb15h/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43BCD20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cloudflare.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61200923;
	Thu, 8 Nov 2018 02:49:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ee080a5
 for <wireguard@lists.zx2c4.com>; Wed, 7 Nov 2018 15:45:22 +0000 (UTC)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a348aeb
 for <wireguard@lists.zx2c4.com>; Wed, 7 Nov 2018 15:45:22 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id e4so21557177qkh.6
 for <wireguard@lists.zx2c4.com>; Wed, 07 Nov 2018 07:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=mkcSLHVcivIT0bv0F8hCg+aIxnbhpAa9C88he/Nl2Sw=;
 b=rmeb15h/PDWw68MbosNJI4tJ0e6vFTXT+mO10SU32qoVRjx57hUujjIJrPD3r/Y9c4
 VccZkgsjLJD/+LVTNcDddRBSB4rETXBez4TNKnJrXu7N6bNLFl8nEK15vhFPdYeuDeZZ
 PUXcECnp9Pf271FEDqZduh7H6wruA2QTD4fDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=mkcSLHVcivIT0bv0F8hCg+aIxnbhpAa9C88he/Nl2Sw=;
 b=lJCOnZPiaVQC7vgpFQpOVjFwyyU/x+FLDZaFXWCJKqElJG0xB7bPCT4kXZFqeL/igh
 r45uStSUGJWUZLl5DgenaodOxEMWs7GNd+1dIFYS5BZlkkZ8mEzP7Xk0x40wv5QxANCi
 G53sT/x+oCWfNJRDpPHGSq+n29KO8W/Iv6vRm3dcSXOoilJHNNOwcIpidw/bX8wGjzRv
 vcjdEAJO8V1RN/5/0WdHdtb1gU3HPerTuT0g574vIOSJuilrJGSlIFMfSHIFYOKX8SIM
 v4gDhP6A2Dn1EVyCdZSPOZQFCTvyherW2x8Kw1vXBy75hrpOYN7Zn+d0SAk/PsCxsrgC
 PlBQ==
X-Gm-Message-State: AGRZ1gL9+zjnJzN0SUs7dGVp22rMMKLH97MMpUOaztdDcVs9g2GOJt93
 Qi3M16PvxAayKOr4VMQUhlVVeGjj6yi4xQ==
X-Google-Smtp-Source: AJdET5dMhX4TVziJhJLvZO9LujssKgcmIarVyRGLlQENyDx1c9inUyFo5Sx9ZKPC92+qjsBQHMT2xQ==
X-Received: by 2002:ad4:4312:: with SMTP id c18mr748579qvs.59.1541605790018;
 Wed, 07 Nov 2018 07:49:50 -0800 (PST)
Received: from [192.168.71.41] ([38.142.118.154])
 by smtp.gmail.com with ESMTPSA id 38sm741267qkw.56.2018.11.07.07.49.48
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Nov 2018 07:49:49 -0800 (PST)
From: Vlad Krasnov <vlad@cloudflare.com>
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
Subject: Not really TAI64N
Message-Id: <0257672C-2D55-415B-873A-A4D78BF48516@cloudflare.com>
Date: Wed, 7 Nov 2018 10:49:48 -0500
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.100.39)
X-Mailman-Approved-At: Thu, 08 Nov 2018 03:49:22 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

VGhlIFdpcmVHdWFyZCBzcGVjIHN0YXRlcyB0aGF0IGEgdGltZXN0YW1wIHVzZWQgaXMgVEFJNjRO
LCBob3dldmVyIHRoZSB3aXJlZ3VhcmQtZ28gaW1wbGVtZW50YXRpb24gcHJvZHVjZXMgYW4gaW52
YWxpZCB0aW1lc3RhbXAsIGJlY2F1c2UgdGhlIEdvIGZ1bmN0aW9uIG5vdy5Vbml4TmFubygpIHJl
dHVybnMgdGhlIHRvdGFsIG51bWJlciBvZiBuYW5vc2Vjb25kcyBmcm9tIGVwb2NoIGFuZCB0cnVu
Y2F0ZWQgdG8gMzJiaXQsIHdoZXJlYXMgVEFJNjROIHJlcXVpcmVzIGl0IHRvIGJlIGluIHRoZSBy
YW5nZSBbMCwgOTk5OTk5OTk5XS4KCk1vcmVvdmVyIHRoZSBrZXJuZWwgaW1wbGVtZW50YXRpb24g
ZG9lcyBub3QgY2hlY2sgaWYgYSB0aW1lc3RhbXAgaXMgdmFsaWQgVEFJNjROIGF0IGFsbCwgaXQg
c2ltcGx5IGNoZWNrcyB0aGF0IHRoaXMgaXMgYSBtb25vdG9uaWNhbGx5IGluY3JlYXNpbmcsIDEy
IGJ5dGUgbG9uZywgYmlnIGVuZGlhbiBudW1iZXIuCgpXaGlsZSB0aGlzIGlzIHByb2JhYmx5IG5v
dCBpbnNlY3VyZSwgaXQgZ29lcyBhZ2FpbnN0IHdoYXQgaXMgc3RhdGVkIGluIHRoZSB3aGl0ZXBh
cGVyLgoKQWxzbywgdGhlIGZ1bmN0aW9uIHVzZWQgZm9yIGNvbXBhcmlzb24gaXMgbWVtY21wLCBu
b24tY29uc3RhbnQgdGltZSBmdW5jdGlvbiwgdGhhdCBzaG91bGRu4oCZdCBiZSB1c2VkIGluIGNy
eXB0b2dyYXBoaWMgY29udGV4dC4KCkNoZWVycywKVmxhZApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFy
ZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5m
by93aXJlZ3VhcmQK
