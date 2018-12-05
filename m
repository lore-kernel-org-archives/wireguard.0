Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1308C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:14:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7321E20989
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7321E20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wenarab.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be593170;
	Thu, 6 Dec 2018 23:05:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b14c36e5
 for <wireguard@lists.zx2c4.com>; Wed, 5 Dec 2018 15:52:54 +0000 (UTC)
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1dfc5e31
 for <wireguard@lists.zx2c4.com>; Wed, 5 Dec 2018 15:52:54 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id z23so7285562uam.1
 for <wireguard@lists.zx2c4.com>; Wed, 05 Dec 2018 08:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=oM0slyHf6tCPlDW0pz3eyT74lTU6Ew71viRH/4Eb6Fw=;
 b=BavlhLLbGyEBCLwKeJA7XVy553x4tqGHAeR0gCEdcO9PHTdkMZO1cyl2O73RFIsJNP
 rj4EggdK5fMtZmr36LF9K68JhxEbz/9Fzzu4rOgm+kyCEM+nbj/Yf+ENGOgSKHxuLJjJ
 xyVAMpYTmZDUJZSBLNhWOptflxF3hW1rQIH1Lf5Lb1LuwL3nSBwynzoOsr86Uayiy2sf
 4DE36e60QUDK9nGqoR4APIuPwQACArKJqZwmhAnTfS9SRjB2T6osNJ0m6kVM4a/FNF4n
 PVrWf6Ja+7Xp9wiaam05m8+HHIFS5ZFKL75qqrK8/2QjHObMFlF7ivnO1bDTMYACkwd4
 yCHg==
X-Gm-Message-State: AA+aEWZ/10jzG2ato35ve0dTMohOKBnqbOYSjWtdbW8WiLcYSDqCUnjh
 XCZeUprJpyBWAxhkdWEy29WtrrsrqLy9gBajkjhNgQ==
X-Google-Smtp-Source: AFSGD/UAVdFeZ5LWqzShWFpfPKWHdRMYFv+S4MR3AIxJTcZjTnJXoxWX9nFEKT9Oq4w/tu+Nwl6lQ0EiI8njDiTpPY8=
X-Received: by 2002:ab0:145:: with SMTP id 63mr11663012uak.128.1544025656550; 
 Wed, 05 Dec 2018 08:00:56 -0800 (PST)
MIME-Version: 1.0
References: <CADjxVNr0PnZm8ckYtSToOrgkn5DkJUAEqMKZyKULN8avNRcfQQ@mail.gmail.com>
In-Reply-To: <CADjxVNr0PnZm8ckYtSToOrgkn5DkJUAEqMKZyKULN8avNRcfQQ@mail.gmail.com>
From: Gawen ARAB <g@wenarab.com>
Date: Wed, 5 Dec 2018 16:59:06 +0100
Message-ID: <CADjxVNrBuT9n9KEEvoOvVe6jkaza5pjZ4RrhiKrp61qp3POJ9A@mail.gmail.com>
Subject: [PATCH] contrib: handles peer version in embed-wireguard
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:05:18 +0100
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
Content-Type: multipart/mixed; boundary="===============3962499512604777084=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3962499512604777084==
Content-Type: multipart/alternative; boundary="000000000000c86a2b057c487c89"

--000000000000c86a2b057c487c89
Content-Type: text/plain; charset="UTF-8"

Commit bc84ba3a inserted a peer version placeholder. Embeddable
wireguard did not handle the flag WGPEER_A_PROTOCOL_VERSION and printed
the following warning:

    Warning: one or more unrecognized netlink attributes

This commit adds the field 'protocol_version' to the structure
'wg_peer'. It is equal to 0 if no protocol version were defined.
---
 contrib/examples/embeddable-wg-library/wireguard.c | 5 +++++
 contrib/examples/embeddable-wg-library/wireguard.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/contrib/examples/embeddable-wg-library/wireguard.c
b/contrib/examples/embeddable-wg-library/wireguard.c
index f0bdb5f..9610c50 100644
--- a/contrib/examples/embeddable-wg-library/wireguard.c
+++ b/contrib/examples/embeddable-wg-library/wireguard.c
@@ -66,6 +66,7 @@ enum wgpeer_attribute {
        WGPEER_A_RX_BYTES,
        WGPEER_A_TX_BYTES,
        WGPEER_A_ALLOWEDIPS,
+       WGPEER_A_PROTOCOL_VERSION,
        __WGPEER_A_LAST
 };

@@ -1326,6 +1327,10 @@ static int parse_peer(const struct nlattr
*attr, void *data)
                break;
        case WGPEER_A_ALLOWEDIPS:
                return mnl_attr_parse_nested(attr, parse_allowedips, peer);
+       case WGPEER_A_PROTOCOL_VERSION:
+               if (!mnl_attr_validate(attr, MNL_TYPE_U32))
+                       peer->protocol_version = mnl_attr_get_u32(attr);
+               break;
        default:
                warn_unrecognized("netlink");
        }
diff --git a/contrib/examples/embeddable-wg-library/wireguard.h
b/contrib/examples/embeddable-wg-library/wireguard.h
index e9210a4..2cee9ac 100644
--- a/contrib/examples/embeddable-wg-library/wireguard.h
+++ b/contrib/examples/embeddable-wg-library/wireguard.h
@@ -49,6 +49,7 @@ typedef struct wg_peer {
        struct timespec last_handshake_time;
        uint64_t rx_bytes, tx_bytes;
        uint16_t persistent_keepalive_interval;
+       uint32_t protocol_version;

        struct wg_allowedip *first_allowedip, *last_allowedip;
        struct wg_peer *next_peer;
--
2.19.2

--000000000000c86a2b057c487c89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr">=
Commit bc84ba3a inserted a peer version placeholder. Embeddable<br></div>
wireguard did not handle the flag WGPEER_A_PROTOCOL_VERSION and printed<br>
the following warning:<br>
<br>
=C2=A0 =C2=A0 Warning: one or more unrecognized netlink attributes<br>
<br>
This commit adds the field &#39;protocol_version&#39; to the structure<br>
&#39;wg_peer&#39;. It is equal to 0 if no protocol version were defined.<br=
>
---<br>
=C2=A0contrib/examples/embeddable-wg-library/wireguard.c | 5 +++++<br>
=C2=A0contrib/examples/embeddable-wg-library/wireguard.h | 1 +<br>
=C2=A02 files changed, 6 insertions(+)<br>
<br>
diff --git a/contrib/examples/embeddable-wg-library/wireguard.c<br>
b/contrib/examples/embeddable-wg-library/wireguard.c<br>
index f0bdb5f..9610c50 100644<br>
--- a/contrib/examples/embeddable-wg-library/wireguard.c<br>
+++ b/contrib/examples/embeddable-wg-library/wireguard.c<br>
@@ -66,6 +66,7 @@ enum wgpeer_attribute {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 WGPEER_A_RX_BYTES,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 WGPEER_A_TX_BYTES,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 WGPEER_A_ALLOWEDIPS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WGPEER_A_PROTOCOL_VERSION,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __WGPEER_A_LAST<br>
=C2=A0};<br>
<br>
@@ -1326,6 +1327,10 @@ static int parse_peer(const struct nlattr<br>
*attr, void *data)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case WGPEER_A_ALLOWEDIPS:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mnl_attr_par=
se_nested(attr, parse_allowedips, peer);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case WGPEER_A_PROTOCOL_VERSION:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mnl_attr_valid=
ate(attr, MNL_TYPE_U32))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0peer-&gt;protocol_version =3D mnl_attr_get_u32(attr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_unrecognized(&=
quot;netlink&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
diff --git a/contrib/examples/embeddable-wg-library/wireguard.h<br>
b/contrib/examples/embeddable-wg-library/wireguard.h<br>
index e9210a4..2cee9ac 100644<br>
--- a/contrib/examples/embeddable-wg-library/wireguard.h<br>
+++ b/contrib/examples/embeddable-wg-library/wireguard.h<br>
@@ -49,6 +49,7 @@ typedef struct wg_peer {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct timespec last_handshake_time;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t rx_bytes, tx_bytes;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t persistent_keepalive_interval;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t protocol_version;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct wg_allowedip *first_allowedip, *last_all=
owedip;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct wg_peer *next_peer;<br>
--<br>
2.19.2<br>
</div></div>

--000000000000c86a2b057c487c89--

--===============3962499512604777084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3962499512604777084==--
