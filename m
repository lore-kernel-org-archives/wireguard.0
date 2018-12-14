Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B70C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:00:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A391218D3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:00:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=figure.com header.i=@figure.com header.b="QzUingce"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A391218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=figure.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 689002c7;
	Wed, 2 Jan 2019 17:57:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5c22dbd
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Dec 2018 18:14:35 +0000 (UTC)
Received: from mail-yw1-xc2d.google.com (mail-yw1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1a1d01f
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Dec 2018 18:14:34 +0000 (UTC)
Received: by mail-yw1-xc2d.google.com with SMTP id d16so136205ywa.5
 for <wireguard@lists.zx2c4.com>; Fri, 14 Dec 2018 10:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=figure.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=GVb8LCxH2YihnvtHm/aktu4I/QRdggrb/grBltY07/A=;
 b=QzUingceyRwRBrJqSxndauIiqN5aLizX7gGmUSxWCR7HsHo/E52iNsmiYdFH5V2RU5
 ucegSZxUPxlCjiat54YF2o/PnaY7U6HvLZSYbJ8c31rd6WqjvkNduVxPmX3uXP2lC2RK
 8CifbtWSn82W1Jrd2MgqssrXZi9ML9ujnKyjrQCTO508jpAc9eDTiAzgY56WNM9Ak9ld
 Wlv4/kAne6x/vwKnZO8CtI/pf4bN32/nr7orbUirpQsSrD1K4tnC6pmWSjbpWFc0aCbC
 QoEj01R0oym1pjDr6ywuhQ1N/WpqP0lfP3o89RDgOBe+WGQObFjVd/Z+UQr+I5Or4G1h
 7SgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GVb8LCxH2YihnvtHm/aktu4I/QRdggrb/grBltY07/A=;
 b=Dr4NNz9S8dFeoaADon0gLMPu0xFuY6iXO66l2sI+vyhg5IijbIHGilSGwjnjapToIU
 lSNB0c2yLyc1M7bZhwHk3kXpq+ZwgbtdNLbQP7rw+7DV6D71kdC2IHeBJZ4fnzA3zmYr
 3rkG8KjF3yumlcpj2fhCTT8ztPVRGf3xy1XzNV6fE+RapJoi2L1su+4ngMhkIgPmFzBA
 Bm8e5EkFBFWYDKttQfx5jf7PbKc4PR4vli6ziDCWSYjJ+ZFv1Mb/0FgHz3GqG/Li4UX0
 Nz37vuuyfC10uL+y4UQtgI8Dogwab7oLkdNEDagPBPHlwLj5/v4Yt+wn6xdgUFHOHn9M
 bPlQ==
X-Gm-Message-State: AA+aEWa7jPPViX+H6mwC+J77lo9eORp3NTfpR3kjw3P44RmY50DNAcOd
 Lv1rg45SemCSmY5tmlZlt0kC9wJTsMo+KRub2ks8Yd4aMfXRTW7q43n1F5iR1P+SX2ADWw7ztZ8
 3G9y1Cux9oT9GJGj5Gaqd8zrKAovYx350Whc=
X-Google-Smtp-Source: AFSGD/UhF82PyRqhD9VyjwPRFmN0u2dMobeUCSvjWl2gFoxUzIBUHJXzd8CyQoJnvqe1TpAXKb8bwWYF0ZSPY1bRt5Y=
X-Received: by 2002:a81:20d4:: with SMTP id g203mr4365193ywg.142.1544811826494; 
 Fri, 14 Dec 2018 10:23:46 -0800 (PST)
MIME-Version: 1.0
From: Pippin Wallace <pwallace@figure.com>
Date: Fri, 14 Dec 2018 11:23:20 -0700
Message-ID: <CAHj=41oohTckRQvNvi_6v-0BhaUmFyNv6+7O-TxRTgoWVCJYtA@mail.gmail.com>
Subject: More MTU questions
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 02 Jan 2019 18:57:41 +0100
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
Content-Type: multipart/mixed; boundary="===============3203294392497963041=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3203294392497963041==
Content-Type: multipart/alternative; boundary="00000000000029d997057cff880b"

--00000000000029d997057cff880b
Content-Type: text/plain; charset="UTF-8"

WG List,

I have read the previous posts in the archive that mentioned MTU but did
not derive an answer to the following.

I had a frame length of 1474 try to transit WG and it sent back a ICMP
"fragmentation needed" but the source would not fragment the packet.  So I
upped the wg0 MTU to 1488, which worked for this frame, but saw all the
notes about the going over 1440 for IPv4 traffic may cause problems.

What is the best approach to deal with this problem?  I read about MSS
clamping but am not sure this will work or is the best first approach.

I am out of my depth with this at present and could really use some advice
from this expert group.

If I just need to read an RFC or other doc would you please point me in the
right direction?

Sincere regards,

Pippin

-- 
This message and its contents are confidential. If you received this 
message in error, do not use or rely upon it. Instead, please inform the 
sender and then delete it. Thank you.

--00000000000029d997057cff880b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">WG List,<div><br>I have read the previous posts in the arc=
hive that mentioned MTU but did not derive an answer to the following.<div>=
<br></div><div>I had a frame length of 1474 try to transit WG and it sent b=
ack a ICMP &quot;fragmentation needed&quot; but the source would not fragme=
nt the packet.=C2=A0 So I upped the wg0 MTU to 1488, which worked for this =
frame, but saw all the notes about the going over 1440 for IPv4 traffic may=
 cause problems.=C2=A0=C2=A0</div><div><br></div><div>What is the best appr=
oach to deal with this problem?=C2=A0 I read about MSS clamping but am not =
sure this will work or is the best first approach.=C2=A0=C2=A0</div><div><b=
r></div><div>I am out of my depth with this at present and could really use=
 some advice from this expert group.</div><div><br></div><div>If I just nee=
d to read an RFC or other doc would you please point me in the right direct=
ion?<br><br>Sincere regards,</div><div><br></div><div>Pippin</div><div><br>=
</div><div><br><div><br></div><div><br></div></div></div></div>

<br>
<font size=3D"3">This message and its contents are confidential. If you rec=
eived this message in error, do not use or rely upon it. Instead, please in=
form the sender and then delete it. Thank you.</font>
--00000000000029d997057cff880b--

--===============3203294392497963041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3203294392497963041==--
