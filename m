Return-Path: <SRS0=Sp06=U3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F5AC4321A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jun 2019 12:02:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 015722086D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jun 2019 12:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYebKZ8e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 015722086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20db8c40;
	Fri, 28 Jun 2019 12:02:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b65902f
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Jun 2019 13:19:10 +0000 (UTC)
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4482a7f4
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Jun 2019 13:19:10 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id b7so2421696otl.11
 for <wireguard@lists.zx2c4.com>; Wed, 26 Jun 2019 06:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4+mKZWVVgbqg9OE6OH610jW9VIJ/8hBaW0PjRAhjGKI=;
 b=HYebKZ8e+gNhbW/hNnZsBuarZGkqum1Cmx+HetFXLcS8EqRUXE9lkWfNuusxtAgMMZ
 LERSoR2EUzK+xUAQ16keUJx/AH9BCJvexdffjGsQGBjOroyVWbwKlFi97IqqXeypcFE9
 5DWQ72wdTB2e4IPEtXgT9hBb0rR80nDZ6kGh8Ny6SxRVs40c76K8JAyD27FpQmXx6fW2
 lALI+sXwqBAeV81SBYPv+P38OyfkTQvGLTGiVVI/aaX+OI7JM+41HVop/zuE6s00VYqU
 dlK62mYLQP2k6A9aGlxKohHXPloMR1IoGET/6dfrFndpNRXfkCeoOzQv+URq76DvNRdg
 tvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4+mKZWVVgbqg9OE6OH610jW9VIJ/8hBaW0PjRAhjGKI=;
 b=QgOinKW1zi7HCo1aLoi3VVB258Z88ejd2evK9NABmL28fsNnVR3keqpyrmClTjaphR
 iP8UVsMtDk5DllQV7rJfrnuFpzYWKfkyqPP677yq6zAtOiDrv11NPYoTcM8wTEYqLel9
 7NPHe6TDpPE29WffKyp1TJFJCQWyXpvIPdToN3TbdkN3tqLrDLDWznAKTZk+N/4NUltR
 UpiLyNBE+QwazcmWERbmNu0hwCPJIp4cSAH6AzUVZewS2bCBZoOMTpci4LhUcrr3obKW
 ga2bOvxBOJvmJfpW80GLKpf9NZrjAOFZCQ5JWT2NhAceoKUYFGg9GZgLOwx1yQyRw4mk
 eVgQ==
X-Gm-Message-State: APjAAAWgT36+kUYK0/FfO2nJq+xNfC4bxSRT+Car52f2eobBqJclZxvX
 yT7hadRxjhJBIYoeZBTiU1rTFD7nkdL+16v3L/JQZrWU2o4=
X-Google-Smtp-Source: APXvYqwiKvgimJA5lqYwbQv5+Fwz1JiKVN/BD3S8u7Y/lpp3dMBxBwifq7Am3DGYftDr2DN30WbthXlJt1Tw45ZTwts=
X-Received: by 2002:a9d:7203:: with SMTP id u3mr3231875otj.313.1561555150259; 
 Wed, 26 Jun 2019 06:19:10 -0700 (PDT)
MIME-Version: 1.0
From: Michael <gravitygrazer@gmail.com>
Date: Wed, 26 Jun 2019 15:18:59 +0200
Message-ID: <CADXv92b2P79-OJBzK+aXhKFr3k_VqZkkkAuZOg5dALui8aNTiA@mail.gmail.com>
Subject: RHEL8 package install or build fail
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 28 Jun 2019 14:02:05 +0200
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
Content-Type: multipart/mixed; boundary="===============7856298478774936147=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7856298478774936147==
Content-Type: multipart/alternative; boundary="000000000000074bf3058c39e449"

--000000000000074bf3058c39e449
Content-Type: text/plain; charset="UTF-8"

folks, current wireguard seems not to install or build on RHEL 8.0

(1) via yum and the wireguard repo at
https://copr-be.cloud.fedoraproject.org/results/jdoss/wireguard/epel-7-$basearch/

[root@<>]# yum install wireguard-dkms wireguard-tools
...
Copr repo for wireguard owned by jdoss
          1.7 kB/s | 3.5 kB     00:01
Error:
 Problem 1: conflicting requests
  - nothing provides dkms needed by
wireguard-dkms-1:0.0.20190601-1.el7.noarch
 Problem 2: package wireguard-tools-1:0.0.20190601-1.el7.x86_64 requires
wireguard-dkms, but none of the providers can be installed

and (2) building without much trying albeit -

[root@<> src]# make
  CC [M]  /root/WireGuard/src/main.o
In file included from <command-line>:
/root/WireGuard/src/compat/compat.h:828:20: error: redefinition of
'skb_mark_not_on_list'
 static inline void skb_mark_not_on_list(struct sk_buff *skb)
                    ^~~~~~~~~~~~~~~~~~~~
In file included from /root/WireGuard/src/compat/compat.h:787,
                 from <command-line>:
./include/linux/skbuff.h:1362:20: note: previous definition of
'skb_mark_not_on_list' was here
 static inline void skb_mark_not_on_list(struct sk_buff *skb)
                    ^~~~~~~~~~~~~~~~~~~~

Thanks in advance for hints,

-- Mike

--000000000000074bf3058c39e449
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>folks, current wireguard seems not to install or buil=
d on RHEL 8.0</div><div><br></div><div>(1) via yum and the wireguard repo a=
t=C2=A0<a href=3D"https://copr-be.cloud.fedoraproject.org/results/jdoss/wir=
eguard/epel-7-$basearch/">https://copr-be.cloud.fedoraproject.org/results/j=
doss/wireguard/epel-7-$basearch/</a><br></div><div><br></div><div>[root@&lt=
;&gt;]# yum install wireguard-dkms wireguard-tools<br>...<br>Copr repo for =
wireguard owned by jdoss =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1.7 kB/s | 3.5 kB =C2=A0 =C2=A0 00:0=
1 =C2=A0 =C2=A0<br>Error: <br>=C2=A0Problem 1: conflicting requests<br>=C2=
=A0 - nothing provides dkms needed by wireguard-dkms-1:0.0.20190601-1.el7.n=
oarch<br>=C2=A0Problem 2: package wireguard-tools-1:0.0.20190601-1.el7.x86_=
64 requires wireguard-dkms, but none of the providers can be installed<br><=
/div><div><br></div><div>and (2) building without much trying albeit -=C2=
=A0</div><div><br></div><div>[root@&lt;&gt; src]# make<br>=C2=A0 CC [M] =C2=
=A0/root/WireGuard/src/main.o<br>In file included from &lt;command-line&gt;=
:<br>/root/WireGuard/src/compat/compat.h:828:20: error: redefinition of &#3=
9;skb_mark_not_on_list&#39;<br>=C2=A0static inline void skb_mark_not_on_lis=
t(struct sk_buff *skb)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~<br>In file included from /root/Wi=
reGuard/src/compat/compat.h:787,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:<br>./include/linux/skbuf=
f.h:1362:20: note: previous definition of &#39;skb_mark_not_on_list&#39; wa=
s here<br>=C2=A0static inline void skb_mark_not_on_list(struct sk_buff *skb=
)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
^~~~~~~~~~~~~~~~~~~~<br></div><div><br></div><div>Thanks in advance for hin=
ts,</div><div><br></div><div>-- Mike</div><div><br></div></div>

--000000000000074bf3058c39e449--

--===============7856298478774936147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7856298478774936147==--
