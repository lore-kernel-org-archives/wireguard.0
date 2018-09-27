Return-Path: <SRS0=l6+B=MO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E4CC64EB5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 03:06:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76A922083F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 03:06:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcwCx+kk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76A922083F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d8fe9a0;
	Tue, 2 Oct 2018 03:06:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef27d1bd
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Sep 2018 06:51:40 +0000 (UTC)
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e759d31
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Sep 2018 06:51:40 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id y22-v6so864488vsj.10
 for <wireguard@lists.zx2c4.com>; Wed, 26 Sep 2018 23:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Smlrw8Yi0AhOIFm9SqDbZvAfHaUDcZiWy1uioV+5b0k=;
 b=fcwCx+kkaLlCg5qlEXZhdvSvQhat5OIq8HR7jC36kbbuxeL7DCFriGcpyGjwooGUfW
 zgmjmO6/rs+ML+d0Xx8gyI+p2mbb4VF8XkX61G2gazPJ9N73FVmC83+ws5DQ26CmISzu
 XDy8QybiT6YLoz2WO8mBowPXf5wO1eXXTNkEnehz6fJM90dWmaLA201TjyYV1hXDIz+T
 YxWwPfnJl8UwhGcHktQW+qRxD1/YwAB/i2tUyRnYeG0fHNVA+lL7aJ5rbPalGrNGkuYJ
 faNapluijwxzN2aOchInel37t2fEct0ZACY8Sl1Nvq3B2CIatLmT4GkP0Le31Tqclu2R
 ptLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Smlrw8Yi0AhOIFm9SqDbZvAfHaUDcZiWy1uioV+5b0k=;
 b=PNAUTpUz285dKlX3imN6adT4tkyPVZKO9NvFIo/qKUuCdF3mRxxlGIjb6ZjhZlG3TP
 VXRQCDx95PItD6PhSRcVY/J6O0qEiXsAKxx6jI2EUtK96nX2O1XIokMoZrGnQCOKOKhG
 Rrlh9OAN/KP1nzuO1nnjoplB+VFSXU01Fqzw0Nhrtov1TmHYBIGJrLXssG/AhMqCvt8S
 P8u3MS5RVl1HgX9HVmWAsyKb0WjMgmRYd/YwbIkRmdDMvV39mmBs2xXgGxJa1ebeFOor
 YCPkb/a9ZQQr05b439OxP+nmvQuJxQ7YriTzBQDw/Xr4UDBn5iW+I802xnu3C/ydANMj
 CdIw==
X-Gm-Message-State: ABuFfoindzFXWL2cV7v2hHWz/abvhyxNfsgNS3IL97DqXk9MBRj1t4GL
 PWdY1qs2bmHsMLeliceQOZK6Q91Gvn/ELgP9TmajiAwv
X-Google-Smtp-Source: ACcGV63mb7L67a4TBiQK0cCjvLODc/NTbdPmByN5xybScmg95QoZ/4+VXhdCcwzv1ym4LV9iJpBauC7xl/sCQP5rgyw=
X-Received: by 2002:a67:6f85:: with SMTP id
 k127-v6mr2579958vsc.236.1538031266950; 
 Wed, 26 Sep 2018 23:54:26 -0700 (PDT)
MIME-Version: 1.0
From: Philipp Richter <richterphilipp.pops@gmail.com>
Date: Thu, 27 Sep 2018 08:54:15 +0200
Message-ID: <CA+Vb7hpWG4DEfSFe_S1rajsuiVJkkfJ9Y29-tSWYnserOeGssQ@mail.gmail.com>
Subject: Implicit declaration of function 'read_cpuid_part', asm/simd.h: No
 such file or directory with 0.0.20180925 on arm kernel 3.10.107
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Tue, 02 Oct 2018 05:06:16 +0200
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

SGVsbG8sCgppdCdzIG1lIGFnYWluIHdpdGggbXkgc3VwZXIgYW5jaWVudCBrZXJuZWwgKnNpZ2gq
CgpJJ20gZ2V0dGluZyB0aGVzZSBlcnJvcnMgd2l0aCB0aGUgMC4wLjIwMTgwOTI1IHNuYXBzaG90
IDoKCkRLTVMgbWFrZS5sb2cgZm9yIHdpcmVndWFyZC0wLjAuMjAxODA5MjUgZm9yIGtlcm5lbCAz
LjEwLjEwNy0yLUFSQ0ggKGFybXY3bCkKVGh1IFNlcCAyNyAwODo0NDoxOCBDRVNUIDIwMTgKbWFr
ZTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy9saW51eC0zLjEwLjEwNy0yLUFSQ0gnCiBM
RCAgICAgIC92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWlsZC9idWlsdC1p
bi5vCiBDQyBbTV0gIC92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWlsZC9t
YWluLm8KIENDIFtNXSAgL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTgwOTI1L2J1aWxk
L25vaXNlLm8KIENDIFtNXSAgL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTgwOTI1L2J1
aWxkL2RldmljZS5vCiBDQyBbTV0gIC92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDky
NS9idWlsZC9wZWVyLm8KIENDIFtNXSAgL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTgw
OTI1L2J1aWxkL3RpbWVycy5vCiBDQyBbTV0gIC92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4y
MDE4MDkyNS9idWlsZC9xdWV1ZWluZy5vCiBDQyBbTV0gIC92YXIvbGliL2RrbXMvd2lyZWd1YXJk
LzAuMC4yMDE4MDkyNS9idWlsZC9zZW5kLm8KIENDIFtNXSAgL3Zhci9saWIvZGttcy93aXJlZ3Vh
cmQvMC4wLjIwMTgwOTI1L2J1aWxkL3JlY2VpdmUubwogQ0MgW01dICAvdmFyL2xpYi9ka21zL3dp
cmVndWFyZC8wLjAuMjAxODA5MjUvYnVpbGQvc29ja2V0Lm8KIENDIFtNXSAgL3Zhci9saWIvZGtt
cy93aXJlZ3VhcmQvMC4wLjIwMTgwOTI1L2J1aWxkL2hhc2h0YWJsZXMubwogQ0MgW01dICAvdmFy
L2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxODA5MjUvYnVpbGQvYWxsb3dlZGlwcy5vCiBDQyBb
TV0gIC92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWlsZC9yYXRlbGltaXRl
ci5vCiBDQyBbTV0gIC92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWlsZC9j
b29raWUubwogQ0MgW01dICAvdmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxODA5MjUvYnVp
bGQvbmV0bGluay5vCiBDQyBbTV0gIC92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDky
NS9idWlsZC9jcnlwdG8vemluYy9jaGFjaGEyMC9jaGFjaGEyMC5vCiBBUyBbTV0gIC92YXIvbGli
L2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWlsZC9jcnlwdG8vemluYy9jaGFjaGEyMC9j
aGFjaGEyMC1hcm0ubwogQ0MgW01dICAvdmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxODA5
MjUvYnVpbGQvY3J5cHRvL3ppbmMvcG9seTEzMDUvcG9seTEzMDUubwogQVMgW01dICAvdmFyL2xp
Yi9ka21zL3dpcmVndWFyZC8wLjAuMjAxODA5MjUvYnVpbGQvY3J5cHRvL3ppbmMvcG9seTEzMDUv
cG9seTEzMDUtYXJtLm8KIENDIFtNXSAgL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTgw
OTI1L2J1aWxkL2NyeXB0by96aW5jL2NoYWNoYTIwcG9seTEzMDUubwogQ0MgW01dICAvdmFyL2xp
Yi9ka21zL3dpcmVndWFyZC8wLjAuMjAxODA5MjUvYnVpbGQvY3J5cHRvL3ppbmMvYmxha2Uycy9i
bGFrZTJzLm8KSW4gZmlsZSBpbmNsdWRlZCBmcm9tCi92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAu
MC4yMDE4MDkyNS9idWlsZC9jcnlwdG8vemluYy9jaGFjaGEyMC9jaGFjaGEyMC5jOjIwOgovdmFy
L2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxODA5MjUvYnVpbGQvY3J5cHRvL3ppbmMvY2hhY2hh
MjAvY2hhY2hhMjAtYXJtLWdsdWUuaDoKSW4gZnVuY3Rpb24g4oCYY2hhY2hhMjBfZnB1X2luaXTi
gJk6Ci92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWlsZC9jcnlwdG8vemlu
Yy9jaGFjaGEyMC9jaGFjaGEyMC1hcm0tZ2x1ZS5oOjMwOjEwOgplcnJvcjogaW1wbGljaXQgZGVj
bGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYcmVhZF9jcHVpZF9wYXJ04oCZOyBkaWQgeW91Cm1lYW4g
4oCYcmVhZF9jcHVpZF9leHTigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0
aW9uXQogc3dpdGNoIChyZWFkX2NwdWlkX3BhcnQoKSkgewogICAgICAgICBefn5+fn5+fn5+fn5+
fn4KICAgICAgICAgcmVhZF9jcHVpZF9leHQKIENDIFtNXSAgL3Zhci9saWIvZGttcy93aXJlZ3Vh
cmQvMC4wLjIwMTgwOTI1L2J1aWxkL2NyeXB0by96aW5jL2N1cnZlMjU1MTkvY3VydmUyNTUxOS5v
CmNjMTogc29tZSB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwptYWtlWzFdOiAqKiog
W3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MzA5OgovdmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAu
MjAxODA5MjUvYnVpbGQvY3J5cHRvL3ppbmMvY2hhY2hhMjAvY2hhY2hhMjAub10KRXJyb3IgMQpt
YWtlWzFdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgpJbiBmaWxlIGluY2x1
ZGVkIGZyb20KL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTgwOTI1L2J1aWxkL2NyeXB0
by96aW5jL2N1cnZlMjU1MTkvY3VydmUyNTUxOS5jOjI1OgovdmFyL2xpYi9ka21zL3dpcmVndWFy
ZC8wLjAuMjAxODA5MjUvYnVpbGQvY3J5cHRvL3ppbmMvY3VydmUyNTUxOS9jdXJ2ZTI1NTE5LWFy
bS1nbHVlLmg6ODoxMDoKZmF0YWwgZXJyb3I6IGFzbS9zaW1kLmg6IE5vIHN1Y2ggZmlsZSBvciBk
aXJlY3RvcnkKI2luY2x1ZGUgPGFzbS9zaW1kLmg+CiAgICAgICAgIF5+fn5+fn5+fn5+fgpjb21w
aWxhdGlvbiB0ZXJtaW5hdGVkLgptYWtlWzFdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6
MzA4OgovdmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxODA5MjUvYnVpbGQvY3J5cHRvL3pp
bmMvY3VydmUyNTUxOS9jdXJ2ZTI1NTE5Lm9dCkVycm9yIDEKbWFrZTogKioqIFtNYWtlZmlsZTox
MjMzOgpfbW9kdWxlXy92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWlsZF0g
RXJyb3IgMgptYWtlOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMvbGludXgtMy4xMC4xMDct
Mi1BUkNIJwoKCkkgdW5kZXJzdGFuZCBpZiBpdCdzIGp1c3Qgbm8gcG9zc2libGUgYW55bW9yZSB0
byBzdXBwb3J0IHN1Y2ggYW5jaWVudApzb2Z0d2FyZS4gSW5zdGVhZCBvZiBjb2xsZWN0aW5nIGR1
c3QgaXQgc2VydmVzIGFzIGEgbmljZSB3aXJlZ3VhcmQKZW5kcG9pbnQgOikKCldpcmVndWFyZCBo
YXMgYmVlbiBhbWF6aW5nIHNvIGZhciwgdGhhbmtzIGZvciBzdWNoIGdyZWF0IHNvZnR3YXJlLgoK
QmVzdCBSZWdhcmRzLApQaGlsaXBwIFJpY2h0ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlz
dHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2ly
ZWd1YXJkCg==
