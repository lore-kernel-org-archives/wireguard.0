Return-Path: <SRS0=PTk7=4O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=3.0 tests=CHARSET_FARAWAY_HEADER,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,RCVD_ILLEGAL_IP,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3EDC4BA09
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 03:23:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA2FA2082F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 03:23:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=vip.qq.com header.i=@vip.qq.com header.b="CWIR9hC8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA2FA2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vip.qq.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 373d80d4;
	Wed, 26 Feb 2020 03:19:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5bdd133
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 03:19:24 +0000 (UTC)
Received: from smtpbg510.qq.com (smtpbg506.qq.com [203.205.250.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14c67545
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 03:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vip.qq.com;
 s=s201512; t=1582687377;
 bh=1asytwIr+s9ps19SNJgZaoA04EAKrR22SQXQOqLWlNA=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=CWIR9hC8faSHvpLT/dvihLZlcRfzyWzs7CUP1LzmOnxziGkvqlGC/UHVtcScAF/SE
 hhO0gJ+XHr4tJJLjW97ZrWt51Hy1E2feBFPoqPHtwNBmLMNno9dQssBhDI0v/v07Ui
 Q8lvcPc1zCazq9dD+DK+ilN8wf6p56t9wFLLLQ14=
X-QQ-FEAT: tvtHwrVUWtkPO7XY/J+6Nhup38FzIUY8xzuK/HDaB3N7NGqnUleyFm6K8gh8Q
 asIey42m4/l3Vrb6V/QZHErq9cYLtArP8rl3VKaOZbsH67+46e4TXV+OCQUzUd22RcThISu
 UO2V7HTdCnR0uNBN5+3sz94R0Vb/5hNBYCUoDPcYQGczQPyRozibRjBx3ZIR8oi2TCExh0U
 ts2wKMMJuZLE7TvIw7S4gzDwNIBi5HFAJEmOftRCWQfqpWpzPvu6JWeC8QiJa+xVD2XqYek
 y7yVZtAZON2Vl908cbs9wolDv/4faP8prgAsnXxDiErKVTMhZ3b77PhTU=
X-QQ-SSF: 00000000000000F000000000000000X
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 255.182.126.209
X-QQ-STYLE: 
X-QQ-mid: webmail408t1582687314t9671612
From: "=?gb18030?B?TWF0c3VyaQ==?=" <srb12345@vip.qq.com>
To: "=?gb18030?B?U2FtdWVsIEhvbGxhbmQ=?=" <samuel@sholland.org>,
 "=?gb18030?B?d2lyZWd1YXJk?=" <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH] Update Simplified Chinese translation
Mime-Version: 1.0
Date: Wed, 26 Feb 2020 11:21:54 +0800
X-Priority: 3
Message-ID: <tencent_07629FD45F61AFA294B45370034A94F7C90A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Wed, 26 Feb 2020 11:21:55 +0800 (CST)
Feedback-ID: webmail:vip.qq.com:bgweb:bgweb4
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
Content-Type: multipart/mixed; boundary="===============6941688811056095978=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.

--===============6941688811056095978==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5E55E452_11F81F78_71E0371C"
Content-Transfer-Encoding: 8Bit

This is a multi-part message in MIME format.

------=_NextPart_5E55E452_11F81F78_71E0371C
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

Jm5ic3A7ICZuYnNwOyBZZXN0ZXJkYXkgSSByZW1hZGUgYSBwYXRjaCB0aGF0IGNvbnRhaW5z
IGFsbCB0aGUgY2hhbmdlcyBzbyBmYXIuDQpQbGVhc2UgcmV2aWV3IGl0LiAidmFsdWVzLXpo
LXJDTiIgaGFzIG5vdCBiZWVuIG1lcmdlZCB5ZXQsIGp1c3QNCmlnbm9yZSB0aG9zZSB0d28g
cGF0Y2hlcyBJIHNlbnQgYmVmb3JlIChvbiAwMi8xNiBhbmQgMDIvMjMpLiBUaGFua3MuDQoN
Cg0KDQoNClJlZ2FyZHMsDQpNYXRzdXJpDQoNCg0KDQoNCi0tLS0tLS0tLS0tLS0tLS0tLSDU
rcq808q8/iAtLS0tLS0tLS0tLS0tLS0tLS0NCreivP7IyzombmJzcDsiU2FtdWVsIEhvbGxh
bmQiPHNhbXVlbEBzaG9sbGFuZC5vcmcmZ3Q7Ow0Kt6LLzcqxvOQ6Jm5ic3A7MjAyMMTqMtTC
MjXI1SjQx8batv4pIMnPzuc4OjU2DQrK1bz+yMs6Jm5ic3A7Ik1hdHN1cmkiPHNyYjEyMzQ1
QHZpcC5xcS5jb20mZ3Q7OyJ3aXJlZ3VhcmQiPHdpcmVndWFyZEBsaXN0cy56eDJjNC5jb20m
Z3Q7Ow0KDQrW98ziOiZuYnNwO1JlOiBbUEFUQ0hdIFVwZGF0ZSBTaW1wbGlmaWVkIENoaW5l
c2UgdHJhbnNsYXRpb24NCg0KDQoNCk9uIDIvMjMvMjAgNToxMiBBTSwgc3JiMTIzNDVAdmlw
LnFxLmNvbSB3cm90ZToNCiZndDsgRnJvbTogTGlsbGlnYW50TWF0c3VyaSA8c3JiMTIzNDVA
dmlwLnFxLmNvbSZndDsNCiZndDsgDQomZ3Q7IFNpZ25lZC1vZmYtYnk6IExpbGxpZ2FudE1h
dHN1cmkgPHNyYjEyMzQ1QHZpcC5xcS5jb20mZ3Q7DQomZ3Q7IC0tLQ0KJmd0OyZuYnNwOyBh
cHAvc3JjL21haW4vcmVzL3ZhbHVlcy16aC1yQ04vc3RyaW5ncy54bWwgfCAxMCArKysrKysr
Ky0tDQomZ3Q7Jm5ic3A7IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQomZ3Q7IA0KJmd0OyBkaWZmIC0tZ2l0IGEvYXBwL3NyYy9tYWluL3Jlcy92
YWx1ZXMtemgtckNOL3N0cmluZ3MueG1sIGIvYXBwL3NyYy9tYWluL3Jlcy92YWx1ZXMtemgt
ckNOL3N0cmluZ3MueG1sDQomZ3Q7IGluZGV4IDMzNjBkYWUuLjk3ZTg3MWEgMTAwNjQ0DQom
Z3Q7IC0tLSBhL2FwcC9zcmMvbWFpbi9yZXMvdmFsdWVzLXpoLXJDTi9zdHJpbmdzLnhtbA0K
Jmd0OyArKysgYi9hcHAvc3JjL21haW4vcmVzL3ZhbHVlcy16aC1yQ04vc3RyaW5ncy54bWwN
CiZndDsgQEAgLTEsMjEgKzEsMjcgQEANCiZndDsmbmJzcDsgPD94bWwgdmVyc2lvbj0iMS4w
IiBlbmNvZGluZz0idXRmLTgiPyZndDsNCiZndDsmbmJzcDsgPHJlc291cmNlcyZndDsNCiZn
dDsmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7IDxwbHVyYWxzIG5hbWU9ImRlbGV0ZV9lcnJv
ciImZ3Q7DQomZ3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7IDxp
dGVtIHF1YW50aXR5PSJvbmUiJmd0O87et6jJvrP9ICVkIM/uo7olczwvaXRlbSZndDsNCiZn
dDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7IDxp
dGVtIHF1YW50aXR5PSJvdGhlciImZ3Q7zt63qMm+s/0gJWQgz+6juiVzPC9pdGVtJmd0Ow0K
DQpUaGVzZSBsb29rIHRvIGJlIHRoZSBzYW1lIGFzIHRoZSAib3RoZXIiIGNhc2UuIEFkZGl0
aW9uYWwgcXVhbnRpdHkgaXRlbXMgYXJlDQpvbmx5IG5lZWRlZCBpZiB0aGV5IGFyZSBkaWZm
ZXJlbnQ6DQoNCmh0dHBzOi8vZGV2ZWxvcGVyLmFuZHJvaWQuY29tL2d1aWRlL3RvcGljcy9y
ZXNvdXJjZXMvc3RyaW5nLXJlc291cmNlI3BsdXJhbHMtaXRlbS1lbGVtZW50

------=_NextPart_5E55E452_11F81F78_71E0371C
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj4mbmJzcDsgJm5ic3A7IFllc3RlcmRheSBJIHJlbWFkZSBh
IHBhdGNoIHRoYXQgY29udGFpbnMgYWxsIHRoZSBjaGFuZ2VzIHNvIGZhci48L2Rpdj48ZGl2
PlBsZWFzZSByZXZpZXcgaXQuICJ2YWx1ZXMtemgtckNOIiBoYXMgbm90IGJlZW4gbWVyZ2Vk
IHlldCwganVzdDwvZGl2PjxkaXY+aWdub3JlIHRob3NlIHR3byBwYXRjaGVzIEkgc2VudCBi
ZWZvcmUgKG9uIDAyLzE2IGFuZCAwMi8yMykuIFRoYW5rcy48L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PlJlZ2FyZHMsPC9kaXY+PGRpdj5NYXRzdXJpPC9kaXY+
PGRpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LXNp
emU6IDEycHg7Zm9udC1mYW1pbHk6IEFyaWFsIE5hcnJvdztwYWRkaW5nOjJweCAwIDJweCAw
OyI+LS0tLS0tLS0tLS0tLS0tLS0tINStyrzTyrz+IC0tLS0tLS0tLS0tLS0tLS0tLTwvZGl2
PjxkaXYgc3R5bGU9ImZvbnQtc2l6ZTogMTJweDtiYWNrZ3JvdW5kOiNlZmVmZWY7cGFkZGlu
Zzo4cHg7Ij48ZGl2PjxiPreivP7Iyzo8L2I+Jm5ic3A7IlNhbXVlbCBIb2xsYW5kIiZsdDtz
YW11ZWxAc2hvbGxhbmQub3JnJmd0Ozs8L2Rpdj48ZGl2PjxiPreiy83KsbzkOjwvYj4mbmJz
cDsyMDIwxOoy1MIyNcjVKNDHxtq2/ikgyc/O5zg6NTY8L2Rpdj48ZGl2PjxiPsrVvP7Iyzo8
L2I+Jm5ic3A7Ik1hdHN1cmkiJmx0O3NyYjEyMzQ1QHZpcC5xcS5jb20mZ3Q7OyJ3aXJlZ3Vh
cmQiJmx0O3dpcmVndWFyZEBsaXN0cy56eDJjNC5jb20mZ3Q7Ozx3YnI+PC9kaXY+PGRpdj48
L2Rpdj48ZGl2PjxiPtb3zOI6PC9iPiZuYnNwO1JlOiBbUEFUQ0hdIFVwZGF0ZSBTaW1wbGlm
aWVkIENoaW5lc2UgdHJhbnNsYXRpb248L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj5PbiAy
LzIzLzIwIDU6MTIgQU0sIHNyYjEyMzQ1QHZpcC5xcS5jb20gd3JvdGU6PGJyPiZndDsgRnJv
bTogTGlsbGlnYW50TWF0c3VyaSAmbHQ7c3JiMTIzNDVAdmlwLnFxLmNvbSZndDs8YnI+Jmd0
OyA8YnI+Jmd0OyBTaWduZWQtb2ZmLWJ5OiBMaWxsaWdhbnRNYXRzdXJpICZsdDtzcmIxMjM0
NUB2aXAucXEuY29tJmd0Ozxicj4mZ3Q7IC0tLTxicj4mZ3Q7Jm5ic3A7IGFwcC9zcmMvbWFp
bi9yZXMvdmFsdWVzLXpoLXJDTi9zdHJpbmdzLnhtbCB8IDEwICsrKysrKysrLS08YnI+Jmd0
OyZuYnNwOyAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KTxicj4mZ3Q7IDxicj4mZ3Q7IGRpZmYgLS1naXQgYS9hcHAvc3JjL21haW4vcmVzL3ZhbHVl
cy16aC1yQ04vc3RyaW5ncy54bWwgYi9hcHAvc3JjL21haW4vcmVzL3ZhbHVlcy16aC1yQ04v
c3RyaW5ncy54bWw8YnI+Jmd0OyBpbmRleCAzMzYwZGFlLi45N2U4NzFhIDEwMDY0NDxicj4m
Z3Q7IC0tLSBhL2FwcC9zcmMvbWFpbi9yZXMvdmFsdWVzLXpoLXJDTi9zdHJpbmdzLnhtbDxi
cj4mZ3Q7ICsrKyBiL2FwcC9zcmMvbWFpbi9yZXMvdmFsdWVzLXpoLXJDTi9zdHJpbmdzLnht
bDxicj4mZ3Q7IEBAIC0xLDIxICsxLDI3IEBAPGJyPiZndDsmbmJzcDsgJmx0Oz94bWwgdmVy
c2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPyZndDs8YnI+Jmd0OyZuYnNwOyAmbHQ7cmVz
b3VyY2VzJmd0Ozxicj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyAmbHQ7cGx1cmFs
cyBuYW1lPSJkZWxldGVfZXJyb3IiJmd0Ozxicj4mZ3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsgJm5ic3A7ICZsdDtpdGVtIHF1YW50aXR5PSJvbmUiJmd0O87et6jJvrP9
ICVkIM/uo7olcyZsdDsvaXRlbSZndDs8YnI+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsgJmx0O2l0ZW0gcXVhbnRpdHk9Im90aGVyIiZn
dDvO3reoyb6z/SAlZCDP7qO6JXMmbHQ7L2l0ZW0mZ3Q7PGJyPjxicj5UaGVzZSBsb29rIHRv
IGJlIHRoZSBzYW1lIGFzIHRoZSAib3RoZXIiIGNhc2UuIEFkZGl0aW9uYWwgcXVhbnRpdHkg
aXRlbXMgYXJlPGJyPm9ubHkgbmVlZGVkIGlmIHRoZXkgYXJlIGRpZmZlcmVudDo8YnI+PGJy
Pmh0dHBzOi8vZGV2ZWxvcGVyLmFuZHJvaWQuY29tL2d1aWRlL3RvcGljcy9yZXNvdXJjZXMv
c3RyaW5nLXJlc291cmNlI3BsdXJhbHMtaXRlbS1lbGVtZW50PGJyPjwvZGl2Pg==

------=_NextPart_5E55E452_11F81F78_71E0371C--


--===============6941688811056095978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6941688811056095978==--

