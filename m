Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD1EC67838
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:13:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A2A220989
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A2A220989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wenarab.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ff1de12;
	Thu, 6 Dec 2018 23:05:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71eb97d5
 for <wireguard@lists.zx2c4.com>; Mon, 3 Dec 2018 23:08:10 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99f7395d
 for <wireguard@lists.zx2c4.com>; Mon, 3 Dec 2018 23:08:09 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id n7so5093201uao.7
 for <wireguard@lists.zx2c4.com>; Mon, 03 Dec 2018 15:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1DBC23cFFOwwWecmi6tAUXWuxzqESw3xXP4KcABpRrc=;
 b=A1HHU24VqLlEmy9YMOZVQ1B4RTcIQISH+hS5htu2u4mjFUvyyeHJhE8LlsjF9yynmB
 z7wFqgPva4gAF9O4LxrFEiSsMSwUA8LtkUuhobwR5uL8NerSgUzEQbopovJetrhSnCrU
 QCTWDKUxNqz39BP+2rZPlj9Bf81834Up5YdDmHa55dRMPO05DnVJiXUPLrlaLWb+X3vu
 eHEPfT6+pFKe4d/yeyJPi3KX+rrJXEx47lrQRMvv5y87uXMbJXY45KgwIm8aCA5eBaNu
 ZgmsBYYsTHzMUtVCulqTQIg8fKgNuO/VSyrWIe38CCA/8raXGb7WsNgWAcUM0FggtvpQ
 keKw==
X-Gm-Message-State: AA+aEWbIRQXXUFC5CPPGvb2AjFhuAVAUkMZi55ykZhkCIKorfTJYI+WW
 FJFBRoFeF5n67GBma/4wcqe5LEKJmTejVfKnGHxr/g==
X-Google-Smtp-Source: AFSGD/WyqaO8q2LYyV4SCzNA137Lc0b+sdfkfh98BEy5x5hpKTD6ynkQQxSWV7VMMukGYdUbonKyxB2wqlEpdApAbgU=
X-Received: by 2002:ab0:145:: with SMTP id 63mr8382489uak.128.1543878959089;
 Mon, 03 Dec 2018 15:15:59 -0800 (PST)
MIME-Version: 1.0
From: Gawen ARAB <g@wenarab.com>
Date: Tue, 4 Dec 2018 00:15:46 +0100
Message-ID: <CADjxVNr0PnZm8ckYtSToOrgkn5DkJUAEqMKZyKULN8avNRcfQQ@mail.gmail.com>
Subject: [PATCH] contrib: handles peer version in embed-wireguard
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:05:17 +0100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

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
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
