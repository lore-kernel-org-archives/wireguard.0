Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0813AC65C2F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 01:13:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94E1B2145D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 01:13:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPgc4iH7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94E1B2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58da62dd;
	Sun, 7 Oct 2018 01:12:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4247b53
 for <wireguard@lists.zx2c4.com>; Sat, 6 Oct 2018 11:26:56 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40e6a40f
 for <wireguard@lists.zx2c4.com>; Sat, 6 Oct 2018 11:26:56 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id 63-v6so13860623ljs.4
 for <wireguard@lists.zx2c4.com>; Sat, 06 Oct 2018 04:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=XjFyB4tk0XG1QPMYkfMhnAbyCKjXA3Dyc0WBLnzPCKI=;
 b=bPgc4iH7i6XbjIuZ5G7x4XNwZMPyltmxHVKzgeX4musgR/j/ZMp24SK5jJ5u5kNsyk
 emkgbGQ0LLcPlarKSGninLsD/6Du0VkDq/DpAk+Mc2kJl3CHgug8nmWC6BpUFdkmP63W
 HCiL9QPC113joXfVwA6LriSGhKspY+7BHh2bi6QzPiPj5bFTY5/gAQU9Jg+UIVlXuiiE
 bp/GSBw8YYE03PDSbCEj+3X3w0TIyiav3lAZw+kP0JQeW44mZce2MgCFQSKTDXN6m2Fl
 MhUi6JBMlcjouNaRZja529kXFZSBKn74mmSuv+gABn7zIXR6jcQrvAXd+Z3vIBadjXjE
 k7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=XjFyB4tk0XG1QPMYkfMhnAbyCKjXA3Dyc0WBLnzPCKI=;
 b=JI2cEuaAAzwrNPUCbDWv08yJ/nn/n/Y8aa0NwKc0CXOyzn561mR8sGrEtsNxgzY8gN
 MmXlyfRBVBU1nh57R6/CyLeHrEUkoEJ2KVmU1lFlcxKBGx61T8EIi8xoezJ26wb36fQw
 p5jY6699FuABZXLhDvSqHlDidkcwijvd+j2BBFfshRW4IP4BsY1y2gt/XYpeJNbUt9ei
 j1bi5F1MkzfJx0snKmlrFUtUlN/cgU/9VH4Udi+tKD8owZu02N+nnntVkUmGYLWIfhjJ
 iEJctoIPZJtQIimn7TTZRx/MC2AAHXNwudh0huZQbIV7R9SRvsSJLjZALLHRHYV42fMB
 XISg==
X-Gm-Message-State: ABuFfogVCLHj0LLjP7CdOsxydX/kUlUXaSgFLQIioSpoAK518yPQiVFN
 qgXNsMVJ+yeJMc2ssJl/1bKgCTUYPLQ=
X-Google-Smtp-Source: ACcGV62ZRnmrShijkbKEoHW1jzkgseTMyHm3DLVYosY/AAp9xNtJl4FeQz2i6EO+ToyH2dnFSP8aJA==
X-Received: by 2002:a2e:4942:: with SMTP id
 b2-v6mr9629437ljd.129.1538825245771; 
 Sat, 06 Oct 2018 04:27:25 -0700 (PDT)
Received: from [192.168.100.7] (shpd-95-53-188-103.vologda.ru. [95.53.188.103])
 by smtp.gmail.com with ESMTPSA id t200-v6sm2338299lff.77.2018.10.06.04.27.24
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 06 Oct 2018 04:27:25 -0700 (PDT)
From: Evgeniy Ivanov <e601809@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Private and public keys generation
Message-Id: <8531EC91-607C-4525-863F-31CDD9FCC791@gmail.com>
Date: Sat, 6 Oct 2018 14:27:24 +0300
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.9.1)
X-Mailman-Approved-At: Sun, 07 Oct 2018 03:12:52 +0200
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

SGkgZXZlcnlib2R5LAoKSeKAmW0gYWJsZSB0byBnZW5lcmF0ZSB0aGUgcHJpdmF0ZSBrZXlzIHBy
ZXR0eSBzdHJhaWdodGZvcndhcmQgd2l0aCBhbnkgdG9vbCBJIGxpa2UgKGVnOiBkZCBpZj0vZGV2
L3VyYW5kb20gYnM9MzIgY291bnQ9MSAyPi9kZXYvbnVsbCB8IGJhc2U2NCkKCkJ1dCBub3csIEni
gJltIG1vcmUgY3VyaW91cyBhYm91dCBnZW5lcmF0aW5nIHRoZSBwdWJsaWMga2V5cyB3aXRob3V0
IHVzaW5nIHdnIHB1YmtleSBkaXJlY3RseS4gQW55IHRob3VnaHRzPwoKVGhhbmtzIQoKLS0gCkJl
c3QgUmVnYXJkcywKRXZnZW5peSBJdmFub3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3Rz
Lnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVn
dWFyZAo=
