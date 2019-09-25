Return-Path: <SRS0=As8F=XU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MIME_BOUND_DIGITS_15,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44358C4320D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 08:50:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D77972082F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 08:50:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oVVeBd+v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D77972082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd75de26;
	Wed, 25 Sep 2019 08:50:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b867a70
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 01:06:32 +0000 (UTC)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51a86f76
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 01:06:32 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id t84so3394706oih.10
 for <wireguard@lists.zx2c4.com>; Tue, 24 Sep 2019 18:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=dYZ4NZIK2M/l5qRDkFJb+WbWs9iBvzO/to02z7ozZcY=;
 b=oVVeBd+v/VJYlX7AlRJRw81EUS5cbwy1NZWCv4ejsdbyMJXFnhy90JYLqgVVIaKlwq
 RbAAfdzZw/bYHvYnnTdE2WlJEIHZoq0Hc86iqEMK/+tgacZv8OeKRwh0avNDfmMBNfil
 xbEEwzkNzn4WuYzTk2fGx7feJNZJHicE2y/YwxFzO0FMW7AvRG+s3voODSGny0JQgBtr
 6y9ZcK1xLKxgx0DrMAvXsaGTwYoTGdfxxHEEkt/p4YfE5EWdkylGdSlutQOKt+2LS5FP
 sxlrkNytOzwlo4GfrbJHrJvwIzuWR+Rg3cIjcj/L5fTV/r/uEQgkgMVNIXfdZcUBCpxV
 mqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dYZ4NZIK2M/l5qRDkFJb+WbWs9iBvzO/to02z7ozZcY=;
 b=VON3w6ILYzjr1BDOKmkOfYG6Jqk3SBgKnfcaphhdwJIqdPDbFrp3Mte6KKnbJ8h6Ew
 7YSwbBQ5YpZlcuu1vrL3IT5pvVXfZXRCtsrGFjVhj3oDmUUucc5rYP5m1Am6ZSn7vag0
 0YJen7ITukW1XdXor1idRnFeNyjLGPxsop+H1h0grPocf9XCTY9K0Vdbv0rNP/RJ21SB
 hc+4iNMFbr5iiwxqeDpUnvbK7fjQnJ2x0Px8eAsZF/rPVA0p1hNocoivPNCwZJDRY7Z5
 Chnfg/hkZslbgW+ty0vtP2K7XCfDEvyCJg9QUTsfiWh2LpKKoVhlccbvED26w0M0RPuf
 +DBA==
X-Gm-Message-State: APjAAAUHBhZNGnGeRGLCh29ILPUAu7Y3Z/HLcpE9IcjLFOL1b41MTfgn
 Jsj0SzXxj82QdX5NZxdFfQxEEMNQapxDJvDPlTtf/ZQ5
X-Google-Smtp-Source: APXvYqx+MFc1h8kR+PUe3suwD90ODYU54kLBnn4gaZRhwZIlITXY3NNXb5MNgQMk5ma04XcnlupFIl4QaEHYfGopE24=
X-Received: by 2002:a05:6808:8ee:: with SMTP id
 d14mr2532756oic.31.1569373591665; 
 Tue, 24 Sep 2019 18:06:31 -0700 (PDT)
MIME-Version: 1.0
From: Brassy Panache <brassy.panache@gmail.com>
Date: Wed, 25 Sep 2019 11:06:18 +1000
Message-ID: <CAJLOqRznfra3wQz5Gd7-KQw98AN8CuLozC1ZSZk8mupoJ+77RQ@mail.gmail.com>
Subject: Error with wg-quick down when IPv6 not present
To: wireguard@lists.zx2c4.com
Content-Type: multipart/mixed; boundary="0000000000007469680593564345"
X-Mailman-Approved-At: Wed, 25 Sep 2019 10:50:01 +0200
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

--0000000000007469680593564345
Content-Type: multipart/alternative; boundary="0000000000007469650593564343"

--0000000000007469650593564343
Content-Type: text/plain; charset="UTF-8"

I have a kernel without IPv6 support.  I've noticed when running:

$ wg-quick down vpn


I receive the following errors:

[#] ip -4 rule delete table 51820
[#] ip -4 rule delete table main suppress_prefixlength 0
RTNETLINK answers: Address family not supported by protocol
Dump terminated
RTNETLINK answers: Address family not supported by protocol
Dump terminated
[#] ip link delete dev vpn
[#] resolvconf -d vpn -f


This is caused by the assumption that the command:

$ ip -6 rule show


will run on the system.  I have made a change to my local wg-quick script
which first tests if the command runs successfully before it clears the
rules.  The same should probably also be done prior to running the IPv4
version of the command.

An alternate approach could also be to check that IPv6 is available in the
running kernel, but there didn't seem to be a reliable cross-platform
mechanism to do that [0].

In any case, I have attached a patch which I am running locally to avoid
these spurious errors.

[0]:
https://stackoverflow.com/questions/39983121/how-to-detect-if-system-has-ipv6-enabled-in-a-unix-shell-script

--0000000000007469650593564343
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have a kernel without IPv6 support.=C2=A0 I&#39;ve =
noticed when running:</div><div><br></div><div><blockquote style=3D"margin:=
0 0 0 40px;border:none;padding:0px"><div>$ wg-quick down vpn</div></blockqu=
ote><br></div><div>I receive the following errors:</div><div><br></div><div=
><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>[#] i=
p -4 rule delete table 51820<br>[#] ip -4 rule delete table main suppress_p=
refixlength 0<br>RTNETLINK answers: Address family not supported by protoco=
l<br>Dump terminated<br>RTNETLINK answers: Address family not supported by =
protocol<br>Dump terminated<br>[#] ip link delete dev vpn<br>[#] resolvconf=
 -d vpn -f<br></div></blockquote><br></div><div>This is caused by the assum=
ption that the command:</div><div><br></div><div><blockquote style=3D"margi=
n:0 0 0 40px;border:none;padding:0px">$=C2=A0ip -6 rule show<br></blockquot=
e><br></div><div>will run on the system.=C2=A0 I have made a change to my l=
ocal wg-quick script which first tests if the command runs successfully bef=
ore it clears the rules.=C2=A0 The same should probably also be done prior =
to running the IPv4 version of the command.</div><div><br></div><div>An alt=
ernate approach could also be to check that IPv6 is available in the runnin=
g kernel, but there didn&#39;t seem to be a reliable cross-platform mechani=
sm=C2=A0to do that [0].</div><div><br></div><div>In any case, I have attach=
ed a patch which I am running locally to avoid these spurious errors.</div>=
<div><br></div><div>[0]:=C2=A0<a href=3D"https://stackoverflow.com/question=
s/39983121/how-to-detect-if-system-has-ipv6-enabled-in-a-unix-shell-script"=
>https://stackoverflow.com/questions/39983121/how-to-detect-if-system-has-i=
pv6-enabled-in-a-unix-shell-script</a></div></div>

--0000000000007469650593564343--

--0000000000007469680593564345
Content-Type: application/octet-stream; name=patch
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: base64
Content-ID: <f_k0yk5s6p0>
X-Attachment-Id: f_k0yk5s6p0

LS0tIC90bXAvd2ctcXVpY2sJMjAxOS0wOS0yNSAxMDo0MzoxOC44NTEwMzMwODggKzEwMDAKKysr
IC91c3IvYmluL3dnLXF1aWNrCTIwMTktMDktMjUgMTA6NDU6MTIuODM5ODMzNzE1ICsxMDAwCkBA
IC0xMDIsMTIgKzEwMiwxNCBAQAogCQl3aGlsZSBbWyAkKGlwIC00IHJ1bGUgc2hvdykgPT0gKiJm
cm9tIGFsbCBsb29rdXAgbWFpbiBzdXBwcmVzc19wcmVmaXhsZW5ndGggMCIqIF1dOyBkbwogCQkJ
Y21kIGlwIC00IHJ1bGUgZGVsZXRlIHRhYmxlIG1haW4gc3VwcHJlc3NfcHJlZml4bGVuZ3RoIDAK
IAkJZG9uZQotCQl3aGlsZSBbWyAkKGlwIC02IHJ1bGUgc2hvdykgPT0gKiJsb29rdXAgJHRhYmxl
IiogXV07IGRvCi0JCQljbWQgaXAgLTYgcnVsZSBkZWxldGUgdGFibGUgJHRhYmxlCi0JCWRvbmUK
LQkJd2hpbGUgW1sgJChpcCAtNiBydWxlIHNob3cpID09ICoiZnJvbSBhbGwgbG9va3VwIG1haW4g
c3VwcHJlc3NfcHJlZml4bGVuZ3RoIDAiKiBdXTsgZG8KLQkJCWNtZCBpcCAtNiBydWxlIGRlbGV0
ZSB0YWJsZSBtYWluIHN1cHByZXNzX3ByZWZpeGxlbmd0aCAwCi0JCWRvbmUKKwkJaWYgaXAgLTYg
cnVsZSBzaG93ICY+L2Rldi9udWxsIDI+JjEgOyB0aGVuCisJCQl3aGlsZSBbWyAkKGlwIC02IHJ1
bGUgc2hvdykgPT0gKiJsb29rdXAgJHRhYmxlIiogXV07IGRvCisJCQkJY21kIGlwIC02IHJ1bGUg
ZGVsZXRlIHRhYmxlICR0YWJsZQorCQkJZG9uZQorCQkJd2hpbGUgW1sgJChpcCAtNiBydWxlIHNo
b3cpID09ICoiZnJvbSBhbGwgbG9va3VwIG1haW4gc3VwcHJlc3NfcHJlZml4bGVuZ3RoIDAiKiBd
XTsgZG8KKwkJCQljbWQgaXAgLTYgcnVsZSBkZWxldGUgdGFibGUgbWFpbiBzdXBwcmVzc19wcmVm
aXhsZW5ndGggMAorCQkJZG9uZQorCQlmaQogCWZpCiAJY21kIGlwIGxpbmsgZGVsZXRlIGRldiAi
JElOVEVSRkFDRSIKIH0K
--0000000000007469680593564345
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--0000000000007469680593564345--
