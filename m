Return-Path: <SRS0=ZPJq=DX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD823C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:20:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E47F2087D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:20:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlZZFN9q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E47F2087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8644c053;
	Fri, 16 Oct 2020 13:16:56 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 264f9d0b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Oct 2020 14:00:49 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id p5so3814641ejj.2
 for <wireguard@lists.zx2c4.com>; Thu, 15 Oct 2020 07:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jOAPkmdYoSk/QnBC40B3DmT2zVBAW6b/ZnO5JUn0gEU=;
 b=FlZZFN9qPAtndF1UYBjIch7bg+0jI49m96j7KgS6LBqCb80KGq6ZLapIGn7VtoHpA+
 0HtpNGfOLxc4n8gaypkWtWGRkMSglMqrS0uBw5PwQdMw8h0d9KqoNkpo7RPRwnCULOcO
 27K0WZHuiX7RQ/Y22YwJbauq8lPJvCs0YJ2yfVN9lLb75OQTIVJ9FngWZgvrF6Fea6W6
 nRtAptyUqCArRCj/VafDYZ9/QdEkx2vcMJuY6AFlepxlGsF0lcAiQ9FDSmApXf8DkwsI
 1aKgbsqN+aLJnLU0ha9qnMkgoiijzuz5RrKllBEH2dVGaYSrGWvd2bOeC1mCiALdIBBp
 hQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jOAPkmdYoSk/QnBC40B3DmT2zVBAW6b/ZnO5JUn0gEU=;
 b=eWgeS/nlfUWUfl9b0HXM4WC0KlCaZMjq5bhohBXPTMPYIvsdj3AcaFI3av0SNUPkf2
 UUnZ5+P7Vb9PcUQJiI0KLHh+N75hygs3QORm/3XaxnR+V4quEZ6FSwK6+gY5g+uWEwIs
 LsHCVND+Wjj5kXCVNFi/owARslt00i8lDsEvo6vfdetjqv96o4kSf4pPpX6UzDP4rbeA
 1Twgj6lj9AMhimFPARGVV2TWCtTbKeP+ptI/9aoM/Nf1CpScEEN+Lo5p/BEIG2QwIAzE
 k08iCjXVdFWpV44f8yi0df5h4c5arpha7eNdSBzkcaFYpRtKKrsdBgq384XxhVLpyapR
 FNZA==
X-Gm-Message-State: AOAM532D+DGt7+h885M0wA5b8Pvboz+T34sutQLd8SzGrjxHkzWhigt2
 8oj+HtUOJBYk8mVrExn8KJxHGFfpos3NpoLgS+f1AfKWGESYpc4K
X-Google-Smtp-Source: ABdhPJzAR/aQ6ME4hcRqwr4Y4TgjijinHM9Pw0TUHvNla0c4+Xhxc1r9N8epO12LeUhD9Ob7fl+tsGrS+cUEQ3yvG3Q=
X-Received: by 2002:a17:906:3cc:: with SMTP id
 c12mr4561806eja.216.1602770468468; 
 Thu, 15 Oct 2020 07:01:08 -0700 (PDT)
MIME-Version: 1.0
From: Dashamir Hoxha <dashohoxha@gmail.com>
Date: Thu, 15 Oct 2020 16:00:56 +0200
Message-ID: <CAMucfLxvG08p=Z+gR=YjePf1C40y9UiwgzHWgEwxp7jH5Ghviw@mail.gmail.com>
Subject: [PATCH] wg-quick: linux: fix sysctl inside a docker container
To: wireguard@lists.zx2c4.com
Content-Type: multipart/mixed; boundary="0000000000006e199705b1b614a9"
X-Mailman-Approved-At: Fri, 16 Oct 2020 15:16:50 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
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

--0000000000006e199705b1b614a9
Content-Type: text/plain; charset="UTF-8"

In Docker containers you cannot run `sysctl`. So, it is not possible to set
`sysctl -q net.ipv4.conf.all.src_valid_mark=1` from inside the container.
However you can set it when creating the container, with the Docker option:
`--sysctl net.ipv4.conf.all.src_valid_mark=1`

This patch checks first if `net.ipv4.conf.all.src_valid_mark` is already set,
before trying to set it. Otherwise `sysctl` will fail in a docker container,
and `wg-quick` will fail to start the interface.

--0000000000006e199705b1b614a9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-wg-quick-linux-fix-sysctl-inside-a-docker-container.patch"
Content-Disposition: attachment; 
	filename="0001-wg-quick-linux-fix-sysctl-inside-a-docker-container.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kgaw52l20>
X-Attachment-Id: f_kgaw52l20

RnJvbSBiYjFlNWRhNGRlYTI1NzBmMjA5ZWQ0NjFmZjljYWI0YzUzMjhkZjJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYXNoYW1pciBIb3hoYSA8ZGFzaG9ob3hoYUBnbWFpbC5jb20+
CkRhdGU6IFRodSwgMTUgT2N0IDIwMjAgMTU6MjQ6MTUgKzAyMDAKU3ViamVjdDogW1BBVENIXSB3
Zy1xdWljazogbGludXg6IGZpeCBzeXNjdGwgaW5zaWRlIGEgZG9ja2VyIGNvbnRhaW5lcgoKU2ln
bmVkLW9mZi1ieTogRGFzaGFtaXIgSG94aGEgPGRhc2hvaG94aGFAZ21haWwuY29tPgotLS0KIHNy
Yy93Zy1xdWljay9saW51eC5iYXNoIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc3JjL3dnLXF1aWNrL2xpbnV4LmJh
c2ggYi9zcmMvd2ctcXVpY2svbGludXguYmFzaAppbmRleCBlNGQ0YzRmLi40NGY3OWYxIDEwMDc1
NQotLS0gYS9zcmMvd2ctcXVpY2svbGludXguYmFzaAorKysgYi9zcmMvd2ctcXVpY2svbGludXgu
YmFzaApAQCAtMjM3LDcgKzIzNyw5IEBAIGFkZF9kZWZhdWx0KCkgewogCXByaW50ZiAtdiByZXN0
b3JlICclc0NPTU1JVFxuKm1hbmdsZVxuLUkgUE9TVFJPVVRJTkcgLW0gbWFyayAtLW1hcmsgJWQg
LXAgdWRwIC1qIENPTk5NQVJLIC0tc2F2ZS1tYXJrICVzXG4tSSBQUkVST1VUSU5HIC1wIHVkcCAt
aiBDT05OTUFSSyAtLXJlc3RvcmUtbWFyayAlc1xuQ09NTUlUXG4nICIkcmVzdG9yZSIgJHRhYmxl
ICIkbWFya2VyIiAiJG1hcmtlciIKIAlwcmludGYgLXYgbmZ0Y21kICclc2FkZCBydWxlICVzICVz
IHBvc3RtYW5nbGUgbWV0YSBsNHByb3RvIHVkcCBtYXJrICVkIGN0IG1hcmsgc2V0IG1hcmsgXG4n
ICIkbmZ0Y21kIiAiJHBmIiAiJG5mdGFibGUiICR0YWJsZQogCXByaW50ZiAtdiBuZnRjbWQgJyVz
YWRkIHJ1bGUgJXMgJXMgcHJlbWFuZ2xlIG1ldGEgbDRwcm90byB1ZHAgbWV0YSBtYXJrIHNldCBj
dCBtYXJrIFxuJyAiJG5mdGNtZCIgIiRwZiIgIiRuZnRhYmxlIgotCVtbICRwcm90byA9PSAtNCBd
XSAmJiBjbWQgc3lzY3RsIC1xIG5ldC5pcHY0LmNvbmYuYWxsLnNyY192YWxpZF9tYXJrPTEKKwlp
ZiBbWyAkcHJvdG8gPT0gLTQgJiYgJChzeXNjdGwgLW4gbmV0LmlwdjQuY29uZi5hbGwuc3JjX3Zh
bGlkX21hcmspID09ICcwJyBdXTsgdGhlbgorCQljbWQgc3lzY3RsIC1xIG5ldC5pcHY0LmNvbmYu
YWxsLnNyY192YWxpZF9tYXJrPTEKKwlmaQogCWlmIHR5cGUgLXAgbmZ0ID4vZGV2L251bGw7IHRo
ZW4KIAkJY21kIG5mdCAtZiA8KGVjaG8gLW4gIiRuZnRjbWQiKQogCWVsc2UKLS0gCjIuMjUuMQoK
--0000000000006e199705b1b614a9--
