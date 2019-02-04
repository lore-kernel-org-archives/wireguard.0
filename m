Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286EAC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:30:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B01C421B69
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:30:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIIMQJDQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B01C421B69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a227dc30;
	Sun, 17 Feb 2019 01:22:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e99ccf72
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 14:26:41 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42565688
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 14:26:41 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id z5so1463wrt.11
 for <wireguard@lists.zx2c4.com>; Mon, 04 Feb 2019 06:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3LOoYJgUlnOjUK3ujY6isS57JUCSCWmdxwTz17rRx9c=;
 b=hIIMQJDQloNdGzu3uPJnrcVgNd89q+mLgtH6QgnX+EHEKIVU7TBeLW6I+8ZJi4Qq8z
 H/UIwBv1PE6F8X9mj+CHPGfFNGXdkA1QJHujU/PYY7rCkObCy2l5Oz/x9SVmKaSF1/hU
 BRnSzhETJurq9fYQYMhGPPGVfhk93tpFqKfI9jHWMpnNrObwVCu/9HTvaEQ0h7WQruR8
 q3eimbSuvdgIsl61/18Zh0HB/LWfvx0l70eEj4C2wbKJsWfNv7gZTMTxXwxE5GZjsKMR
 I5PglM+qo+x0ksW5/pxboNvCrrtlQrOGO4UjZFgJ8JF9ILZU62PQRXGJ5rSmKIw6huVJ
 i+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3LOoYJgUlnOjUK3ujY6isS57JUCSCWmdxwTz17rRx9c=;
 b=ilUonM4ipd89m3VLQpVeOlPggJymJRdhr/WOvONC3mPSmj4L18dQycTKVtxZfvPDSO
 XdrO56V/DSTKAD0TtKHSVvzMgnrjg3wGDRZMEcj/ur1X2djQyYimlgpRXw+rcvLJC+qb
 DlAGDdRfCyQg/26Ww4ecAw0kmisgP1fXlpaSZZiTckHdSTNnot+9qeTTeewcbwdzzlJS
 vNPRJyCLk3oMiFJeHVyce6IR11VsBeNW8AGTmSgHS3g+zz+xHjX1Oe22B2YU4vNePHyS
 fZbLRQ7yD1AbHRujERszGORmr2J7lHtUROxJgfoEh2PJxBX4s7E8KIukoF+iPzdbSg+s
 RVEw==
X-Gm-Message-State: AHQUAuY5gjH1DCsIk1ZLcdqgO8zw0l8RcJH5d1k0GRrH2/+5YR05eh5k
 JwbW5iDvTZzlv4l4hltJXzpATWvsDzVWUv+dqWLdaRy4
X-Google-Smtp-Source: AHgI3Ia9tM4EzfQnMuhEqgX33eY43CS81sXbL4Tc3tevPe0l/aKpthwfFOLoKUOxq+0l5Omc3RgvCOM3krK/ihAxYI8=
X-Received: by 2002:adf:e68c:: with SMTP id r12mr4084803wrm.163.1549290795316; 
 Mon, 04 Feb 2019 06:33:15 -0800 (PST)
MIME-Version: 1.0
From: Anton Osmond <antonosmond@gmail.com>
Date: Mon, 4 Feb 2019 14:33:04 +0000
Message-ID: <CAKcysNyra1=4+KGVfkHu=VMeVH6u9fYksXRFNquzcO8p2C4UCw@mail.gmail.com>
Subject: Wireguard GCP Performance Fix
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sun, 17 Feb 2019 02:22:13 +0100
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
Content-Type: multipart/mixed; boundary="===============5172727339794233263=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5172727339794233263==
Content-Type: multipart/alternative; boundary="0000000000008238f30581125fae"

--0000000000008238f30581125fae
Content-Type: text/plain; charset="UTF-8"

Hi

I want to share some problems I had in getting wireguard setup and the
solutions I found.
It might be good to have a "common problems & solutions" section in the
wireguard documentation where things like this can be added to help users
in the future.

We decided to try wireguard and compare it to OpenVPN, well aware that
wireguard's still considered alpha/experimental.
Our use case was to have a VPN for access to a kubernetes cluster in a
private network in Google Cloud.

After getting everything setup, I noticed the performance of wireguard was
MUCH slower than a connection to the same cluster over OpenVPN.
To give an example, a request to list the nodes in the cluster over OpenVPN
was taking around half a second or less. The same request over wireguard
was taking between 4 and 6 seconds.
Eventually I tracked down the issue and it turned out to be the MTU on the
wireguard interface.
GCP have a lower default MTU for network interfaces "due to additional
header space required inside Google's network".
The network interface set up on my Mac was using the default (for most
unix-like systems) of 1500.
But the MTU on the network interface on the Google instance was only 1460
which meant the packets being sent from my Mac were too big for the network
interface on the Google instance, resulting in packet splitting and
increased latency. I reduced the MTU on the network interface on my mac and
immediately the latency had gone away and wireguard was probably faster
than OpenVPN.

To be honest, the linux network stack is not something I've really messed
about with in any great detail so most of this is new to me and I learnt a
lot from this old but useful article:
https://www.linuxjournal.com/content/queueing-linux-network-stack.

I couldn't find much documentation on the values that you're able to put
into the wireguard configs (used by wg-quick) so i tried adding MTU in
there and to my surprise it worked!

Hopefully my learnings here can help others and it'd be great to see a
common problems & solutions section in the docs and also improve the docs
around the wg-quick tool and associated configs.

Thanks

Anton

--0000000000008238f30581125fae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div><br></div><div>I want to share some problems I had =
in getting wireguard setup and the solutions I found.=C2=A0</div><div>It mi=
ght be good to have a &quot;common problems &amp; solutions&quot; section i=
n the wireguard documentation where things like this can be added to help u=
sers in the future.</div><div><br></div><div>We decided to try wireguard an=
d compare it to OpenVPN, well aware that wireguard&#39;s still considered a=
lpha/experimental.</div><div>Our use case was to have a VPN for access to a=
 kubernetes cluster in a private network in Google Cloud.</div><div><br></d=
iv><div>After getting everything setup, I noticed the performance of wiregu=
ard was MUCH slower than a connection to the same cluster over OpenVPN.</di=
v><div>To give an example, a request to list the nodes in the cluster over =
OpenVPN was taking around half a second or less. The same request over wire=
guard was taking between 4 and 6 seconds.</div><div>Eventually I tracked do=
wn the issue and it turned out to be the MTU on the wireguard interface.</d=
iv><div>GCP have a lower default MTU for network interfaces &quot;due to ad=
ditional header space required inside Google&#39;s network&quot;.</div><div=
>The network interface set up on my Mac was using the default (for most uni=
x-like systems) of 1500.=C2=A0</div><div>But the MTU on the network interfa=
ce on the Google instance was only 1460 which meant the packets being sent =
from my Mac were too big for the network interface on the Google instance, =
resulting in packet splitting and increased latency. I reduced the MTU on t=
he network interface on my mac and immediately the latency had gone away an=
d wireguard was probably faster than OpenVPN.</div><div><br></div><div>To b=
e honest, the linux network stack is not something I&#39;ve really messed a=
bout with in any great detail so most of this is new to me and I learnt a l=
ot from this old but useful article:=C2=A0<a href=3D"https://www.linuxjourn=
al.com/content/queueing-linux-network-stack">https://www.linuxjournal.com/c=
ontent/queueing-linux-network-stack</a>.</div><div><br></div><div>I couldn&=
#39;t find much documentation on the values that you&#39;re able to put int=
o the wireguard configs (used by wg-quick) so i tried adding MTU in there a=
nd to my surprise it worked!</div><div><br></div><div>Hopefully my learning=
s here can help others and it&#39;d be great to see a common problems &amp;=
 solutions section in the docs and also improve the docs around the wg-quic=
k tool and associated configs.</div><div><br></div><div>Thanks</div><div><b=
r></div><div>Anton</div></div>

--0000000000008238f30581125fae--

--===============5172727339794233263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5172727339794233263==--
