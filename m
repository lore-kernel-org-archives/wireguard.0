Return-Path: <SRS0=O0ly=UR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F79C31E5B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:13:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 491E2213F2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:13:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bghuJgMo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 491E2213F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db59e861;
	Tue, 18 Jun 2019 15:13:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4a1fd29
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Jun 2019 16:10:47 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7abc0249
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Jun 2019 16:10:47 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id s15so5070863wmj.3
 for <wireguard@lists.zx2c4.com>; Sat, 15 Jun 2019 09:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Xb7NCZp09yJzWUAVjP6uPzYaA60WQOt3k8t2EdmOOgE=;
 b=bghuJgMoMMfLGx583zdN9Fj8xaFdIjDIu1DbkizsoraBmyBMzSnx8NtTVJn86sMrKR
 WFkg8ngGU7OaI+YjAVoVtqwq2qSD7SvkPJmZz+7ZtsGCWzo1pG6FD8NAADmqHPY9NKnC
 QBKSRVj8yp/D5ve4E9k48Vesfcx5+ioZts+1ueD/ruwlhzwx82M7TYJgG88JxqgIBKMF
 0FkKWYSHagohXvQLGMtME15obxmMGRVisg63SReZZ15A/FvIgvEhbVIXPDBahlZ1FWmH
 Y7b1FINr8uQtCGaY58+6NQh6n3jpexBvHn1m5BmZOseZaon6zWQ2mVdg6FT38gxQtfX+
 i02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Xb7NCZp09yJzWUAVjP6uPzYaA60WQOt3k8t2EdmOOgE=;
 b=lO24i+Tbla+gQVfevhQJREx+F+ZIU+KXTqvGtcnTChtN66Dy/W6fB7EPdcgxrR9TTp
 BeQYh8P8xDdlxUV1JjPPsbNMGZWTmsuibVDlSlijo2EtSmzDlwiV0juB/k2gnzTelL9B
 HbFnM3Bv/4QsEq2QZav7pkUikg97AbIqrUW7HF2SY/wVkZxUh6qZ0U1lJ/GR3L/cPCp1
 RY923DblWiaJwzrc1OctmA7h56nkfU7Tu15tn+9xZy1RXX6TDXijA99yApcFq3ZJb0Xe
 NkzdCqtU2oQSNlG6R6MfWWXbL2CxF+W929DwmB5ajbUxG8WRqBkgToFIaW5I+gxBdvb+
 USFw==
X-Gm-Message-State: APjAAAWeLMCqRnVEOe9ALOcCbYdzCFgZNtFoCqxJCsapNaCBrswZdrVk
 NfAM441FqkwxbHSo1z7pPfNHU2IFCJ3sz9nrqg9o18gI
X-Google-Smtp-Source: APXvYqypqK0VL27mW5DAN3KBS6ZqbAjvsbDDeKCvh9jkpOlRhRe/lo64LhEee7EJd55/mi0Fm8E+kDzDKk0O4Jr/phQ=
X-Received: by 2002:a1c:6641:: with SMTP id a62mr6528803wmc.175.1560615044612; 
 Sat, 15 Jun 2019 09:10:44 -0700 (PDT)
MIME-Version: 1.0
From: Andriy Perev Ortkin <irherder@gmail.com>
Date: Sat, 15 Jun 2019 19:10:34 +0300
Message-ID: <CABwq4PiyPwjPL+RPVcWZYy66j4gaVRc3OHEA6Aqm_SbL=9VFAQ@mail.gmail.com>
Subject: commit 99895f27f3d63d2e92a5c1c411205ae70f2a5ca breaks build on arm64
To: wireguard@lists.zx2c4.com
Content-Type: multipart/mixed; boundary="0000000000005dcf63058b5f0155"
X-Mailman-Approved-At: Tue, 18 Jun 2019 17:13:38 +0200
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--0000000000005dcf63058b5f0155
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

commit https://git.zx2c4.com/WireGuard/commit/?id=3D799895f27f3d63d2e92a5c1=
c411205ae70f2a5ca
breaks out of tree module build on arm64 , kernel 5.1.10
strangely when building x86_64 everything is fine

  CC [M]  /home/asavah/kross/src/WireGuard/src/main.o
In file included from /home/asavah/kross/src/WireGuard/src/compat/compat.h:=
824,
                 from <command-line>:
./include/linux/timekeeping.h:67:8: error: unknown type name =E2=80=98ktime=
_t=E2=80=99
   67 | extern ktime_t ktime_get(void);
      |        ^~~~~~~

The following patch fixes the issue, however I have no idea why x86_64
builds fine and arm64 does not,
neither I'm sure that the patch is right, it fixed the issue for me tho.

--0000000000005dcf63058b5f0155
Content-Type: application/octet-stream; name="001-ktime.patch"
Content-Disposition: attachment; filename="001-ktime.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jwxpvjdu0>
X-Attachment-Id: f_jwxpvjdu0

ZGlmZiAtLWdpdCBhL3NyYy9jb21wYXQvY29tcGF0LmggYi9zcmMvY29tcGF0L2NvbXBhdC5oCmlu
ZGV4IDYxNGY0NTguLjViYTliNjcgMTAwNjQ0Ci0tLSBhL3NyYy9jb21wYXQvY29tcGF0LmgKKysr
IGIvc3JjL2NvbXBhdC9jb21wYXQuaApAQCAtODIxLDYgKzgyMSw3IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBza2JfbWFya19ub3Rfb25fbGlzdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQogI2lmIExJTlVY
X1ZFUlNJT05fQ09ERSA8IEtFUk5FTF9WRVJTSU9OKDMsIDE3LCAwKQogI2luY2x1ZGUgPGxpbnV4
L2hydGltZXIuaD4KICNlbHNlCisjaW5jbHVkZSA8bGludXgva3RpbWUuaD4KICNpbmNsdWRlIDxs
aW51eC90aW1la2VlcGluZy5oPgogI2VuZGlmCiBzdGF0aWMgaW5saW5lIHM2NCBfX291cl9rdGlt
ZV9nZXRfY29hcnNlX2Jvb3R0aW1lKHZvaWQpCg==
--0000000000005dcf63058b5f0155
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--0000000000005dcf63058b5f0155--
