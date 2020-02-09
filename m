Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328FBC3B18F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 10:56:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9B9420675
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 10:56:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZelm7uk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9B9420675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c13b959e;
	Fri, 14 Feb 2020 10:53:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c605d363
 for <wireguard@lists.zx2c4.com>; Sun, 9 Feb 2020 17:29:42 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ce3dd8b
 for <wireguard@lists.zx2c4.com>; Sun, 9 Feb 2020 17:29:42 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id q8so4446286ljj.11
 for <wireguard@lists.zx2c4.com>; Sun, 09 Feb 2020 09:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iTVTryemIguY47/zLicoR9hoYX9tsRG5FMq1qDfl+Ok=;
 b=oZelm7uk9xWT4kbYvPSIyw79uWVauQAyNLNoth0ywph9GPhB1cDFIE4HfmmmLLab7X
 dpVn/37E54cw7GzAca3FQZ8vlqMV5ZxD87krPYUfH2EQmI0Z8GA9U5o+ObbMat05ZBe9
 NyMH0lX/8vTk8yOKFzSqfK3iEc/WvYGpJixgsH7XAW7m4DLVjZ2e+e1r7JH79uHgX1QE
 0egsZg1RcOKU0y0ljWPjXmQZG7fBA9m4MktwZCmyJuzb0HKmwQg3+m28VMNutribBwVy
 UQEYql68YFoBodQaT8n6SWbZpqXitEJO8emOR6NREzMc7lVcz+jGouzZR/SlZDSxacw2
 BhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iTVTryemIguY47/zLicoR9hoYX9tsRG5FMq1qDfl+Ok=;
 b=QD0ThikXlJSuVeywOs3VlCpgCAV2d+CvH9iKiJMEh4Dk/9K/ci9EmMnhCZk414Xh/x
 bXVgUjUf7u51UDb/55lat+R+63+HQcqpi+fGxEacGxmeOiloANRc6kxBBWvebamGjL+J
 eC+AGJ9Albce4lGtWM0t9kLbueoZ+E1SC4XcDbFE5Z3qB1pGxrff1SHAaHPBBvlRO78H
 9s0E/l3nFPdgVvr7rXyHzknogEmxgWoOo1OA1gy5SGdKisoRUB1mQtH+TIu99/10WxqQ
 9QBEmtOQ6l3/Wq3CjXMSiKSbI0vjA99euX7uqDz5odTkWtyRTCcHMTsjU5C97vXmHUhy
 8tGg==
X-Gm-Message-State: APjAAAXE5wRbFMS75kVqEJ0SX0XOpELfNnaQdLyXyScOUDUsnkgtgYRO
 lo3AG+Y4+WbfIvOKezcKQ5XNdcwsFvRPMA==
X-Google-Smtp-Source: APXvYqwRhVxm8jPioYCHd+zTvBlNCiIGbmi/Ci5DtSKIo3Ntw+H+zwmuW2M2UdGbQcXd53E8A57zKg==
X-Received: by 2002:a05:651c:20f:: with SMTP id
 y15mr5771515ljn.7.1581269468864; 
 Sun, 09 Feb 2020 09:31:08 -0800 (PST)
Received: from localhost.localdomain ([87.120.88.198])
 by smtp.gmail.com with ESMTPSA id r10sm5872895ljk.9.2020.02.09.09.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 09:31:08 -0800 (PST)
From: sebcbi1@gmail.com
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Change "Deselect All" to "Toggle All" in Excluded apps
 settings
Date: Sun,  9 Feb 2020 19:30:58 +0200
Message-Id: <20200209173058.11647-1-sebcbi1@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Feb 2020 11:53:42 +0100
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

RnJvbTogc2ViY2JpMSA8c2ViY2JpMUBnbWFpbC5jb20+CgpBbmRyb2lkIDogQ2hhbmdlIGZ1bmN0
aW9uYWxpdHkgaW4gZXhjbHVkZWQgYXBwcyBkaWFsb2cgZm9yIGJldHRlciB1c2VyIGV4cGVyaWVu
Y2Ugd2hlbiB1c2VyIHdhbnRzIG9ubHkgb25lIG9yIGZldyBhcHBzIHRvIHVzZSB3aXJlZ3VhcmQK
UGxlYXNlIHJldmlldyBpdGFsaWFuIGFuZCBydXNzaWFuIHRyYW5zbGF0aW9uCgotLS0KIC4uLi9j
b20vd2lyZWd1YXJkL2FuZHJvaWQvZnJhZ21lbnQvQXBwTGlzdERpYWxvZ0ZyYWdtZW50LmphdmEg
fCA0ICsrLS0KIGFwcC9zcmMvbWFpbi9yZXMvdmFsdWVzLWl0L3N0cmluZ3MueG1sICAgICAgICAg
ICAgICAgICAgICAgICAgfCAyICstCiBhcHAvc3JjL21haW4vcmVzL3ZhbHVlcy1ydS9zdHJpbmdz
LnhtbCAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogYXBwL3NyYy9tYWluL3Jlcy92YWx1
ZXMvc3RyaW5ncy54bWwgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIDQgZmlsZXMg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fw
cC9zcmMvbWFpbi9qYXZhL2NvbS93aXJlZ3VhcmQvYW5kcm9pZC9mcmFnbWVudC9BcHBMaXN0RGlh
bG9nRnJhZ21lbnQuamF2YSBiL2FwcC9zcmMvbWFpbi9qYXZhL2NvbS93aXJlZ3VhcmQvYW5kcm9p
ZC9mcmFnbWVudC9BcHBMaXN0RGlhbG9nRnJhZ21lbnQuamF2YQppbmRleCA2NzA1OWM3Li5jNTEz
ZDQ3IDEwMDY0NAotLS0gYS9hcHAvc3JjL21haW4vamF2YS9jb20vd2lyZWd1YXJkL2FuZHJvaWQv
ZnJhZ21lbnQvQXBwTGlzdERpYWxvZ0ZyYWdtZW50LmphdmEKKysrIGIvYXBwL3NyYy9tYWluL2ph
dmEvY29tL3dpcmVndWFyZC9hbmRyb2lkL2ZyYWdtZW50L0FwcExpc3REaWFsb2dGcmFnbWVudC5q
YXZhCkBAIC05OCw3ICs5OCw3IEBAIHB1YmxpYyBjbGFzcyBBcHBMaXN0RGlhbG9nRnJhZ21lbnQg
ZXh0ZW5kcyBEaWFsb2dGcmFnbWVudCB7CiAKICAgICAgICAgYWxlcnREaWFsb2dCdWlsZGVyLnNl
dFBvc2l0aXZlQnV0dG9uKFIuc3RyaW5nLnNldF9leGNsdXNpb25zLCAoZGlhbG9nLCB3aGljaCkg
LT4gc2V0RXhjbHVzaW9uc0FuZERpc21pc3MoKSk7CiAgICAgICAgIGFsZXJ0RGlhbG9nQnVpbGRl
ci5zZXROZWdhdGl2ZUJ1dHRvbihSLnN0cmluZy5jYW5jZWwsIChkaWFsb2csIHdoaWNoKSAtPiBk
aWFsb2cuZGlzbWlzcygpKTsKLSAgICAgICAgYWxlcnREaWFsb2dCdWlsZGVyLnNldE5ldXRyYWxC
dXR0b24oUi5zdHJpbmcuZGVzZWxlY3RfYWxsLCAoZGlhbG9nLCB3aGljaCkgLT4geworICAgICAg
ICBhbGVydERpYWxvZ0J1aWxkZXIuc2V0TmV1dHJhbEJ1dHRvbihSLnN0cmluZy50b2dnbGVfYWxs
LCAoZGlhbG9nLCB3aGljaCkgLT4gewogICAgICAgICB9KTsKIAogICAgICAgICBiaW5kaW5nLnNl
dEZyYWdtZW50KHRoaXMpOwpAQCAtMTA5LDcgKzEwOSw3IEBAIHB1YmxpYyBjbGFzcyBBcHBMaXN0
RGlhbG9nRnJhZ21lbnQgZXh0ZW5kcyBEaWFsb2dGcmFnbWVudCB7CiAgICAgICAgIGZpbmFsIEFs
ZXJ0RGlhbG9nIGRpYWxvZyA9IGFsZXJ0RGlhbG9nQnVpbGRlci5jcmVhdGUoKTsKICAgICAgICAg
ZGlhbG9nLnNldE9uU2hvd0xpc3RlbmVyKGQgLT4gZGlhbG9nLmdldEJ1dHRvbihEaWFsb2dJbnRl
cmZhY2UuQlVUVE9OX05FVVRSQUwpLnNldE9uQ2xpY2tMaXN0ZW5lcih2aWV3IC0+IHsKICAgICAg
ICAgICAgIGZvciAoZmluYWwgQXBwbGljYXRpb25EYXRhIGFwcCA6IGFwcERhdGEpCi0gICAgICAg
ICAgICAgICAgYXBwLnNldEV4Y2x1ZGVkRnJvbVR1bm5lbChmYWxzZSk7CisgICAgICAgICAgICAg
ICAgYXBwLnNldEV4Y2x1ZGVkRnJvbVR1bm5lbCghYXBwLmlzRXhjbHVkZWRGcm9tVHVubmVsKCkp
OwogICAgICAgICB9KSk7CiAgICAgICAgIHJldHVybiBkaWFsb2c7CiAgICAgfQpkaWZmIC0tZ2l0
IGEvYXBwL3NyYy9tYWluL3Jlcy92YWx1ZXMtaXQvc3RyaW5ncy54bWwgYi9hcHAvc3JjL21haW4v
cmVzL3ZhbHVlcy1pdC9zdHJpbmdzLnhtbAppbmRleCAyYWJhNWY4Li5iMzdkNzkyIDEwMDY0NAot
LS0gYS9hcHAvc3JjL21haW4vcmVzL3ZhbHVlcy1pdC9zdHJpbmdzLnhtbAorKysgYi9hcHAvc3Jj
L21haW4vcmVzL3ZhbHVlcy1pdC9zdHJpbmdzLnhtbApAQCAtNjYsNyArNjYsNyBAQAogICAgIDxz
dHJpbmcgbmFtZT0iZGFya190aGVtZV9zdW1tYXJ5X29uIj5TdGFpIHVzYW5kbyBpbCB0ZW1hIHNj
dXJvIChub3R0ZSk8L3N0cmluZz4KICAgICA8c3RyaW5nIG5hbWU9ImRhcmtfdGhlbWVfdGl0bGUi
PlVzYSB0ZW1hIHNjdXJvPC9zdHJpbmc+CiAgICAgPHN0cmluZyBuYW1lPSJkZWxldGUiPkVsaW1p
bmE8L3N0cmluZz4KLSAgICA8c3RyaW5nIG5hbWU9ImRlc2VsZWN0X2FsbCI+RGVzZWxlemlvbmEg
dHV0dG88L3N0cmluZz4KKyAgICA8c3RyaW5nIG5hbWU9InRvZ2dsZV9hbGwiPkludmVydGkgdHV0
dG88L3N0cmluZz4KICAgICA8c3RyaW5nIG5hbWU9ImRuc19zZXJ2ZXJzIj5TZXJ2ZXIgRE5TPC9z
dHJpbmc+CiAgICAgPHN0cmluZyBuYW1lPSJlZGl0Ij5Nb2RpZmljYTwvc3RyaW5nPgogICAgIDxz
dHJpbmcgbmFtZT0iZW5kcG9pbnQiPkVuZHBvaW50PC9zdHJpbmc+CmRpZmYgLS1naXQgYS9hcHAv
c3JjL21haW4vcmVzL3ZhbHVlcy1ydS9zdHJpbmdzLnhtbCBiL2FwcC9zcmMvbWFpbi9yZXMvdmFs
dWVzLXJ1L3N0cmluZ3MueG1sCmluZGV4IDJmMmMwM2IuLjAwYjk2ZmIgMTAwNjQ0Ci0tLSBhL2Fw
cC9zcmMvbWFpbi9yZXMvdmFsdWVzLXJ1L3N0cmluZ3MueG1sCisrKyBiL2FwcC9zcmMvbWFpbi9y
ZXMvdmFsdWVzLXJ1L3N0cmluZ3MueG1sCkBAIC02Niw3ICs2Niw3IEBACiAgICAgPHN0cmluZyBu
YW1lPSJkYXJrX3RoZW1lX3N1bW1hcnlfb24iPtCSINC00LDQvdC90YvQuSDQvNC+0LzQtdC90YIg
0LjRgdC/0L7Qu9GM0LfRg9C10YLRgdGPINGC0LXQvNC90LDRjyAo0L3QvtGH0L3QsNGPKSDRgtC1
0LzQsDwvc3RyaW5nPgogICAgIDxzdHJpbmcgbmFtZT0iZGFya190aGVtZV90aXRsZSI+0JjRgdC/
0L7Qu9GM0LfQvtCy0LDRgtGMINGC0LXQvNC90YPRjiDRgtC10LzRgzwvc3RyaW5nPgogICAgIDxz
dHJpbmcgbmFtZT0iZGVsZXRlIj7Qo9C00LDQu9C40YLRjDwvc3RyaW5nPgotICAgIDxzdHJpbmcg
bmFtZT0iZGVzZWxlY3RfYWxsIj7QodC90Y/RgtGMINCy0YvQtNC10LvQtdC90L3QvtC1PC9zdHJp
bmc+CisgICAgPHN0cmluZyBuYW1lPSJ0b2dnbGVfYWxsIj7QmNC90LLQtdGA0YLQuNGA0L7QstCw
0YLRjCDQstGB0LU8L3N0cmluZz4KICAgICA8c3RyaW5nIG5hbWU9ImRuc19zZXJ2ZXJzIj5ETlMt
0YHQtdGA0LLQtdGA0Ys8L3N0cmluZz4KICAgICA8c3RyaW5nIG5hbWU9ImVkaXQiPtCg0LXQtNCw
0LrRgtC40YDQvtCy0LDRgtGMPC9zdHJpbmc+CiAgICAgPHN0cmluZyBuYW1lPSJlbmRwb2ludCI+
0JrQvtC90LXRh9C90LDRjyDRgtC+0YfQutCwPC9zdHJpbmc+CmRpZmYgLS1naXQgYS9hcHAvc3Jj
L21haW4vcmVzL3ZhbHVlcy9zdHJpbmdzLnhtbCBiL2FwcC9zcmMvbWFpbi9yZXMvdmFsdWVzL3N0
cmluZ3MueG1sCmluZGV4IDMzNmNkNGUuLjg5YTMyYzAgMTAwNjQ0Ci0tLSBhL2FwcC9zcmMvbWFp
bi9yZXMvdmFsdWVzL3N0cmluZ3MueG1sCisrKyBiL2FwcC9zcmMvbWFpbi9yZXMvdmFsdWVzL3N0
cmluZ3MueG1sCkBAIC02Niw3ICs2Niw3IEBACiAgICAgPHN0cmluZyBuYW1lPSJkYXJrX3RoZW1l
X3N1bW1hcnlfb24iPkN1cnJlbnRseSB1c2luZyBkYXJrIChuaWdodCkgdGhlbWU8L3N0cmluZz4K
ICAgICA8c3RyaW5nIG5hbWU9ImRhcmtfdGhlbWVfdGl0bGUiPlVzZSBkYXJrIHRoZW1lPC9zdHJp
bmc+CiAgICAgPHN0cmluZyBuYW1lPSJkZWxldGUiPkRlbGV0ZTwvc3RyaW5nPgotICAgIDxzdHJp
bmcgbmFtZT0iZGVzZWxlY3RfYWxsIj5EZXNlbGVjdCBBbGw8L3N0cmluZz4KKyAgICA8c3RyaW5n
IG5hbWU9InRvZ2dsZV9hbGwiPlRvZ2dsZSBBbGw8L3N0cmluZz4KICAgICA8c3RyaW5nIG5hbWU9
ImRuc19zZXJ2ZXJzIj5ETlMgc2VydmVyczwvc3RyaW5nPgogICAgIDxzdHJpbmcgbmFtZT0iZWRp
dCI+RWRpdDwvc3RyaW5nPgogICAgIDxzdHJpbmcgbmFtZT0iZW5kcG9pbnQiPkVuZHBvaW50PC9z
dHJpbmc+Ci0tIAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNv
bQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
