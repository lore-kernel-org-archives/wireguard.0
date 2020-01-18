Return-Path: <SRS0=23NU=3L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C70C2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:53:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7EC221835
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chrisspiller.me header.i=@chrisspiller.me header.b="xPt+YjHc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7EC221835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chrisspiller.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e325046;
	Wed, 22 Jan 2020 19:48:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19ec4ec1
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Jan 2020 04:58:16 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53b41849
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Jan 2020 04:58:16 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id u2so9561404wmc.3
 for <wireguard@lists.zx2c4.com>; Fri, 17 Jan 2020 20:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chrisspiller.me; s=google;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=pV4VUdYMXG9qdahPkgo2HqypkPETuwKjj+S+vYzMRjo=;
 b=xPt+YjHcSlxLuup9B2rj/7FOcU1STMUhiUV14jg6hoPrwdHCfoxASyxgQab0GQA3Xq
 UFxzZoqOaRe5AB5Unw88VvK/nuiK37YcX1CYMcmvxq9JtMVQ77mGkZs3SQ8WJHuw/kP1
 jr1w12jDzr5V5mioxPc54DvtHMgSOQrOzO0/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=pV4VUdYMXG9qdahPkgo2HqypkPETuwKjj+S+vYzMRjo=;
 b=oKV5Z0oM2DaUku/EVu26eHabyNwLLi4k3G1kp3KmW72q9GurEO6sZ4A2G6ro2YJh4o
 +KvrqKhAVlIjqy9emmjF8HA0+kThRunmXZSBFJDlg7v316yyhT+YZFX6m4iaA6cg1CZF
 A8asr4KXg2CUv/GtWO8Se6ShdI8+vnrHRMa5qxFda9Jlq4KdQaAVGyLLxR5s0kCC7Gv3
 wnQksfqF0pOrkF96NCV0DcWSW8JyPE2WznJQ16I2Bqvyfu1HcOW/fuCf7gEyCXsPUn30
 3nTzVgWRbqgPoWV01WZJ7gQnDoy7vxIR5ReXYNYe/FuyZTRivZga6Cfz3lYkYD5Dhk2S
 B0SQ==
X-Gm-Message-State: APjAAAVRO9fMco3Z8ptOLQakJc+tmLy1iRg7MoWWaQKvu23lRsUNIFm6
 XYsvRseV+khGQsfVBI8b4bzTYeMqqRIxBg42VEx/V0zZVReVXQ==
X-Google-Smtp-Source: APXvYqwEbdKqC84TfswMnVbuys8H1pTiGQm3bRfzPSPL4Ta497WizThaILwj+5ItFprFxtvUGYZ5x6+ba62jqhObLeA=
X-Received: by 2002:a1c:f008:: with SMTP id a8mr7804641wmb.81.1579323495714;
 Fri, 17 Jan 2020 20:58:15 -0800 (PST)
MIME-Version: 1.0
From: Christopher Spiller <self@chrisspiller.me>
Date: Fri, 17 Jan 2020 20:58:04 -0800
Message-ID: <CACfbXi01TynRZjqux0SWFbj9B20zkq1UVr6PHK1TUYyySD-tAg@mail.gmail.com>
Subject: Module build fails on CentOS 8 kernel-4.18.0-168
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 22 Jan 2020 20:48:09 +0100
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

SSBub3RpY2VkIHdpcmVndWFyZCBmYWlsaW5nIHRvIHN0YXJ0IGFmdGVyIGEgcmVjZW50IHVwZ3Jh
ZGUuIEFmdGVyIGEKYml0IG9mIGRpZ2dpbmcsIEkgZm91bmQgdGhlIGRrbXMgYnVpbGQgZmFpbGlu
Zy4gRnJvbSB0aGUgYnVpbGQgbG9nOgoKCi92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDIw
MDEwNS9idWlsZC9jb21wYXQvY29tcGF0Lmg6ODM4OjIxOgplcnJvcjogcmVkZWNsYXJhdGlvbiBv
ZiBlbnVtZXJhdG9yIOKAmE5MQV9VTlNQRUPigJkKICNkZWZpbmUgTkxBX01JTl9MRU4gTkxBX1VO
U1BFQwogICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+Ci4vaW5jbHVkZS9uZXQvbmV0bGlu
ay5oOjE4NjoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYTkxBX01JTl9MRU7igJkK
ICBOTEFfTUlOX0xFTiwKICBefn5+fn5+fn5+fgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9pbmNs
dWRlL25ldC9ydG5ldGxpbmsuaDo2LAogICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL25l
dC9zY2hfZ2VuZXJpYy5oOjE5LAogICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4
L2ZpbHRlci5oOjI1LAogICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL25ldC9zb2NrLmg6
NjQsCiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvdGNwLmg6MjMsCiAgICAg
ICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvaXB2Ni5oOjEwNiwKICAgICAgICAgICAg
ICAgICBmcm9tIC4vaW5jbHVkZS9uZXQvaXB2Ni5oOjE2LAogICAgICAgICAgICAgICAgIGZyb20K
L3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMjAwMTA1L2J1aWxkL2NvbXBhdC9jb21wYXQu
aDo4OTYsCiAgICAgICAgICAgICAgICAgZnJvbSA8Y29tbWFuZC1saW5lPjoKLi9pbmNsdWRlL25l
dC9uZXRsaW5rLmg6MTY2OjI6IG5vdGU6IHByZXZpb3VzIGRlZmluaXRpb24gb2YK4oCYTkxBX1VO
U1BFQ+KAmSB3YXMgaGVyZQogIE5MQV9VTlNQRUMsCiAgXn5+fn5+fn5+fgoKCi4vaW5jbHVkZS9u
ZXQvaXA2X2ZpYi5oOiBJbiBmdW5jdGlvbiDigJhmaWI2X2luZm9fcmVsZWFzZeKAmToKL3Zhci9s
aWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMjAwMTA1L2J1aWxkL2NvbXBhdC9jb21wYXQuaDo4MjI6
MTg6CmVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhjYWxsX3JjdV9i
aOKAmTsgZGlkIHlvdSBtZWFuCuKAmGNhbGxfcmN14oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5j
dGlvbi1kZWNsYXJhdGlvbl0KICNkZWZpbmUgY2FsbF9yY3UgY2FsbF9yY3VfYmgKICAgICAgICAg
ICAgICAgICAgXn5+fn5+fn5+fn4KLi9pbmNsdWRlL25ldC9pcDZfZmliLmg6MzAwOjM6IG5vdGU6
IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhjYWxsX3JjdeKAmQogICBjYWxsX3JjdSgmZjZpLT5y
Y3UsIGZpYjZfaW5mb19kZXN0cm95X3JjdSk7CiAgIF5+fn5+fn5+CgoKL3Zhci9saWIvZGttcy93
aXJlZ3VhcmQvMC4wLjIwMjAwMTA1L2J1aWxkL3F1ZXVlaW5nLmg6IEluIGZ1bmN0aW9uCuKAmHdn
X3Jlc2V0X3BhY2tldOKAmToKL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMjAwMTA1L2J1
aWxkL2NvbXBhdC9jb21wYXQuaDo3ODg6Mzk6CmVycm9yOiB0b28gbWFueSBhcmd1bWVudHMgdG8g
ZnVuY3Rpb24g4oCYc2tiX3Byb2JlX3RyYW5zcG9ydF9oZWFkZXLigJkKICNkZWZpbmUgc2tiX3By
b2JlX3RyYW5zcG9ydF9oZWFkZXIoYSkgc2tiX3Byb2JlX3RyYW5zcG9ydF9oZWFkZXIoYSwgMCkK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4KL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMjAwMTA1L2J1aWxkL3F1ZXVl
aW5nLmg6MTA2OjI6IG5vdGU6IGluCmV4cGFuc2lvbiBvZiBtYWNybyDigJhza2JfcHJvYmVfdHJh
bnNwb3J0X2hlYWRlcuKAmQogIHNrYl9wcm9iZV90cmFuc3BvcnRfaGVhZGVyKHNrYik7CiAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KSW4gZmlsZSBpbmNsdWRlZCBmcm9tCi92YXIvbGliL2Rr
bXMvd2lyZWd1YXJkLzAuMC4yMDIwMDEwNS9idWlsZC9jb21wYXQvY29tcGF0Lmg6Nzg3LAogICAg
ICAgICAgICAgICAgIGZyb20gPGNvbW1hbmQtbGluZT46Ci4vaW5jbHVkZS9saW51eC9za2J1ZmYu
aDoyNTY0OjIwOiBub3RlOiBkZWNsYXJlZCBoZXJlCiBzdGF0aWMgaW5saW5lIHZvaWQgc2tiX3By
b2JlX3RyYW5zcG9ydF9oZWFkZXIoc3RydWN0IHNrX2J1ZmYgKnNrYikKICAgICAgICAgICAgICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKCkknbSBub3Qgc3VyZSBhYm91dCB0aGUg
cmVkZWNsYXJhdGlvbiBvZiBlbnVtZXJhdG9yIG9yIGltcGxpY2l0CmRlY2xhcmF0aW9uIGVycm9y
cywgYnV0IEkgZGlkIGZpbmQgYSBjaGFuZ2UgdG8Kc2tiX3Byb2JlX3RyYW5zcG9ydF9oZWFkZXIg
aGVyZToKaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC9kMmFhMTI1ZDYy
OTA4MGM0ZjNlMzFmMjNiN2Y2MTJlZjZiODQ5MmFjI2RpZmYtY2U1OWJiZDhiNGVmZDI0NzViZmQ3
YjUwZmU0MjA2NzEKCgpUaGFua3MsCkNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3Rz
Lnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVn
dWFyZAo=
