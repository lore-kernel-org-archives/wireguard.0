Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16683C04EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Dec 2018 09:23:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3285A2147D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Dec 2018 09:23:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=depau.eu header.i=@depau.eu header.b="z1+Rfo+0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3285A2147D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=depau.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5513ba08;
	Mon, 3 Dec 2018 09:15:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 003cb5a3
 for <wireguard@lists.zx2c4.com>; Mon, 3 Dec 2018 09:15:18 +0000 (UTC)
Received: from mail30.static.mailgun.info (mail30.static.mailgun.info
 [104.130.122.30])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1026d50f
 for <wireguard@lists.zx2c4.com>; Mon, 3 Dec 2018 09:15:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=depau.eu; q=dns/txt;
 s=krs; 
 t=1543828983; h=Content-Type: To: Subject: Message-ID: Date: From:
 MIME-Version: Sender; bh=cBM2QMOs2cjE7Yuno4FPKASXR/lWjPMDDoZHAsNlaBM=;
 b=z1+Rfo+0SHdp71qcU2d5BiTzCE6PB+bi8pmQcSi9ScgSHPIAC4iet0rGkVsZIOWPQRnlhdv7
 FEBopoUYl0qt966ZCKz2/8FdDznnOsh4wjDpm2wYMpiz3CrOUlQAqQ71KYbvZrBtiKZrYL98
 pn3GzXwTInZa2tXGHBiKnJ29c60=
X-Mailgun-Sending-Ip: 104.130.122.30
X-Mailgun-Sid: WyI1MjViMCIsICJ3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tIiwgImIwZWQyIl0=
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by mxa.mailgun.org with ESMTP id 5c04f5f6.7f89b4ec4b30-smtp-out-n01;
 Mon, 03 Dec 2018 09:23:02 -0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id u18so10254573oie.10
 for <wireguard@lists.zx2c4.com>; Mon, 03 Dec 2018 01:23:01 -0800 (PST)
X-Gm-Message-State: AA+aEWa2WiBurh5S5Ebr0CMVCiyDBnZJnNb2ygSs77c/5tkh7hDnzfhJ
 VjoyHTFgRIdArhJGyzJX0+Vz5+XTVvLHQU4sUxw=
X-Google-Smtp-Source: AFSGD/WB91U01OZbPe34dsts4wDHp62/WVRF2Bass8bUpfkeCjL0WhecmABmQrU/YYBVh/5n8Yg+td+lI11Obr0dT5o=
X-Received: by 2002:aca:1e17:: with SMTP id m23mr9861425oic.332.1543828981085; 
 Mon, 03 Dec 2018 01:23:01 -0800 (PST)
MIME-Version: 1.0
From: Davide Depau <davide@depau.eu>
Date: Mon, 3 Dec 2018 09:22:49 +0000
X-Gmail-Original-Message-ID: <CAMp63jULeauEWi7KZzkOPTP+mphjo1FB-4=Mv6n4K3B1=kCT6w@mail.gmail.com>
Message-ID: <CAMp63jULeauEWi7KZzkOPTP+mphjo1FB-4=Mv6n4K3B1=kCT6w@mail.gmail.com>
Subject: Multiple endpoints with same public key
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/mixed; boundary="000000000000031b89057c1ab260"
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

--000000000000031b89057c1ab260
Content-Type: multipart/alternative; boundary="000000000000031b87057c1ab25e"

--000000000000031b87057c1ab25e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A few days ago I was struggling with a very slow connection and I was
wondering whether WireGuard can support this setup (please see attached
graph).

There is a WireGuard server (the port it's listening on is reachable from
the outside), then one client with two interfaces connected to the Internet
with two different IP addresses.

Is it possible to have *one* WireGuard interface on the client, which sends
packets to the server through both interfaces in a round-robin fashion? I
would expect the server to detect the client (identified by the public key)
is sending packets from multiple endpoints, and send packets to both
endpoints.

If that's not possible with the current implementation (it should not as it
would break roaming), can it be implemented as a new feature?

One solution that keeps roaming working would be to explicitly enable the
multiple endpoints feature for each peer in the config file. If it's
enabled, keepalive packets are always sent at a configurable rate on both
ends and, when they don't get acknoweledged from one endpoint, it is
discarded.
If the feature is not enabled, the peers behave as they do now.

I'm not sure how the peer with multiple outgoing interfaces could be
configured to use all of them, though. I'll just leave this here so if you
think the idea might be good somebody may come up with a solution.
--=20

--

Davide Depau
PoliEdro <https://poliedro-polimi.it/> =E2=80=93 PoliMi Pride <https://poli=
mipride.it/>
Cell: +39 327 798 7963

--000000000000031b87057c1ab25e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>A few days ago I was struggling with a very slow conn=
ection and I was wondering whether WireGuard can support this setup (please=
 see attached graph).</div><div><br></div><div>There is a WireGuard server =
(the port it&#39;s listening on is reachable from the outside), then one cl=
ient with two interfaces connected to the Internet with two different IP ad=
dresses.</div><div><br></div><div>Is it possible to have <b>one</b> WireGua=
rd interface on the client, which sends packets to the server through both =
interfaces in a round-robin fashion? I would expect the server to detect th=
e client (identified by the public key) is sending packets from multiple en=
dpoints, and send packets to both endpoints.</div><div><br></div><div>If th=
at&#39;s not possible with the current implementation (it should not as it =
would break roaming), can it be implemented as a new feature?</div><div><br=
></div><div>One solution that keeps roaming working would be to explicitly =
enable the multiple endpoints feature for each peer in the config file. If =
it&#39;s enabled, keepalive packets are always sent at a configurable rate =
on both ends and, when they don&#39;t get acknoweledged from one endpoint, =
it is discarded.</div><div>If the feature is not enabled, the peers behave =
as they do now.</div><div><br></div><div>I&#39;m not sure how the peer with=
 multiple outgoing interfaces could be configured to use all of them, thoug=
h. I&#39;ll just leave this here so if you think the idea might be good  so=
mebody may come up with a solution.<br></div></div>-- <br><div dir=3D"ltr" =
class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"lt=
r"><pre style=3D"color:rgb(0,0,0);margin-top:0px;margin-bottom:0px;padding:=
0px;white-space:pre-wrap"><font size=3D"2" face=3D"verdana, sans-serif">--<=
/font></pre><pre style=3D"color:rgb(0,0,0);margin-top:0px;margin-bottom:0px=
;padding:0px;white-space:pre-wrap"><font size=3D"2" face=3D"verdana, sans-s=
erif">Davide Depau<br><a href=3D"https://poliedro-polimi.it/"><font color=
=3D"#00508f"><font face=3D"verdana, sans-serif"><font style=3D"font-size:10=
pt" size=3D"2"><span style=3D"background:transparent none repeat scroll 0% =
0%">PoliEdro</span></font></font></font></a><font color=3D"#000000"><font f=
ace=3D"verdana, sans-serif"><font style=3D"font-size:10pt" size=3D"2"><span=
 style=3D"background:transparent none repeat scroll 0% 0%"> =E2=80=93 </spa=
n></font></font></font><a href=3D"https://polimipride.it/"><font color=3D"#=
00508f"><font face=3D"verdana, sans-serif"><font style=3D"font-size:10pt" s=
ize=3D"2"><span style=3D"background:transparent none repeat scroll 0% 0%">P=
oliMi Pride</span></font></font></font></a>
Cell: +39 327 798 7963<br></font></pre></div></div>

--000000000000031b87057c1ab25e--

--000000000000031b89057c1ab260
Content-Type: application/pdf; name="drawing.pdf"
Content-Disposition: attachment; filename="drawing.pdf"
Content-Transfer-Encoding: base64
Content-ID: <167734e0914dd898f221>
X-Attachment-Id: 167734e0914dd898f221

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
Z3MgNAovRm9udEJCb3hbLTEwMjAgLTQ2MiAxNzkyIDEyMzJdL0l0YWxpY0FuZ2xlIDAKL0FzY2Vu
dCA5MjgKL0Rlc2NlbnQgLTIzNQovQ2FwSGVpZ2h0IDEyMzIKL1N0ZW1WIDgwCi9Gb250RmlsZTIg
NSAwIFIKPj4KZW5kb2JqCgo4IDAgb2JqCjw8L0xlbmd0aCAzMDgvRmlsdGVyL0ZsYXRlRGVjb2Rl
Pj4Kc3RyZWFtCnicXZHPboMwDMbveYocu0NFAi1dJYTU0SJx2B+N7gFoYrpII0SBHnj7xXG3STuA
frY/W87npGqOjTVz8uZH1cLMe2O1h2m8eQX8AldjmUy5Nmq+R/Gvhs6xJPS2yzTD0Nh+LAqWvIfa
NPuFrw56vMADS169Bm/sla8+qjbE7c25LxjAzlywsuQa+jDnuXMv3QBJ7Fo3OpTNvKxDy5/gvDjg
aYwlraJGDZPrFPjOXoEVQpS8qOuSgdX/anJPLZdefXY+SGWQCrHblYHTyHnkLHIqkDekyZC3pNki
55RPkXfEOfIjafbIe+KYPxBL5CfiOLMirpCPxCfkE83cINeUR5aC8ribpP3zGpn2z3C+pP2zNJpw
fy3agff6sZmrm/fB4njU6C26aiz83t2NDrvi9w1CtZebCmVuZHN0cmVhbQplbmRvYmoKCjkgMCBv
YmoKPDwvVHlwZS9Gb250L1N1YnR5cGUvVHJ1ZVR5cGUvQmFzZUZvbnQvQkFBQUFBK0RlamFWdVNh
bnMKL0ZpcnN0Q2hhciAwCi9MYXN0Q2hhciAxOQovV2lkdGhzWzYwMCA4MTcgNjM0IDMxNyA1MjAg
NjE1IDQxMSA1OTEgMjc3IDM1MiA2MTIgNTQ5IDI3NyA2MzMgMzkyIDYzNAo2MzQgNjExIDYzNiA2
MzYgXQovRm9udERlc2NyaXB0b3IgNyAwIFIKL1RvVW5pY29kZSA4IDAgUgo+PgplbmRvYmoKCjEw
IDAgb2JqCjw8L0YxIDkgMCBSCj4+CmVuZG9iagoKMTEgMCBvYmoKPDwvRm9udCAxMCAwIFIKL1By
b2NTZXRbL1BERi9UZXh0XQo+PgplbmRvYmoKCjEgMCBvYmoKPDwvVHlwZS9QYWdlL1BhcmVudCA0
IDAgUi9SZXNvdXJjZXMgMTEgMCBSL01lZGlhQm94WzAgMCA4NDEuODg5NzYzNzc5NTI4IDU5NS4y
NzU1OTA1NTExODFdL0dyb3VwPDwvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdCL0kgdHJ1ZT4+
L0NvbnRlbnRzIDIgMCBSPj4KZW5kb2JqCgoxMiAwIG9iago8PC9Db3VudCAxL0ZpcnN0IDEzIDAg
Ui9MYXN0IDEzIDAgUgo+PgplbmRvYmoKCjEzIDAgb2JqCjw8L0NvdW50IDAvVGl0bGU8RkVGRjAw
NTMwMDZDMDA2OTAwNjQwMDY1MDAyMDAwMzE+Ci9EZXN0WzEgMCBSL1hZWiAwIDU5NS4yNzUgMF0v
UGFyZW50IDEyIDAgUj4+CmVuZG9iagoKNCAwIG9iago8PC9UeXBlL1BhZ2VzCi9SZXNvdXJjZXMg
MTEgMCBSCi9NZWRpYUJveFsgMCAwIDg0MSA1OTUgXQovS2lkc1sgMSAwIFIgXQovQ291bnQgMT4+
CmVuZG9iagoKMTQgMCBvYmoKPDwvVHlwZS9DYXRhbG9nL1BhZ2VzIDQgMCBSCi9PcGVuQWN0aW9u
WzEgMCBSIC9YWVogbnVsbCBudWxsIDBdCi9PdXRsaW5lcyAxMiAwIFIKPj4KZW5kb2JqCgoxNSAw
IG9iago8PC9BdXRob3I8RkVGRjAwNDQwMDYxMDA3NjAwNjkwMDY0MDA2NTAwMjAwMDQ0MDA2NTAw
NzAwMDYxMDA3NT4KL0NyZWF0b3I8RkVGRjAwNDQwMDcyMDA2MTAwNzc+Ci9Qcm9kdWNlcjxGRUZG
MDA0QzAwNjkwMDYyMDA3MjAwNjUwMDRGMDA2NjAwNjYwMDY5MDA2MzAwNjUwMDIwMDAzNjAwMkUw
MDMxPgovQ3JlYXRpb25EYXRlKEQ6MjAxODEyMDMwOTQ3NDQrMDEnMDAnKT4+CmVuZG9iagoKeHJl
ZgowIDE2CjAwMDAwMDAwMDAgNjU1MzUgZiAKMDAwMDAxMDg1OCAwMDAwMCBuIAowMDAwMDAwMDE5
IDAwMDAwIG4gCjAwMDAwMDA5NTcgMDAwMDAgbiAKMDAwMDAxMTE5NiAwMDAwMCBuIAowMDAwMDAw
OTc3IDAwMDAwIG4gCjAwMDAwMDk5NDkgMDAwMDAgbiAKMDAwMDAwOTk3MCAwMDAwMCBuIAowMDAw
MDEwMTYzIDAwMDAwIG4gCjAwMDAwMTA1NDAgMDAwMDAgbiAKMDAwMDAxMDc3MSAwMDAwMCBuIAow
MDAwMDEwODAzIDAwMDAwIG4gCjAwMDAwMTEwMjcgMDAwMDAgbiAKMDAwMDAxMTA4MyAwMDAwMCBu
IAowMDAwMDExMjk1IDAwMDAwIG4gCjAwMDAwMTEzOTYgMDAwMDAgbiAKdHJhaWxlcgo8PC9TaXpl
IDE2L1Jvb3QgMTQgMCBSCi9JbmZvIDE1IDAgUgovSUQgWyA8MkM1NDcwNEU5NEY1N0ZFRTRFRDRD
QjNDNjJGQzRFNTA+CjwyQzU0NzA0RTk0RjU3RkVFNEVENENCM0M2MkZDNEU1MD4gXQovRG9jQ2hl
Y2tzdW0gLzU3QjE4RjlCNTczRTAwNUMxQzhFMEIzNjdFQTMyNkEwCj4+CnN0YXJ0eHJlZgoxMTYy
NQolJUVPRgo=
--000000000000031b89057c1ab260
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--000000000000031b89057c1ab260--
