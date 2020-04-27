Return-Path: <SRS0=Mtl/=6L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6476C4CECD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Apr 2020 21:17:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EF952072D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Apr 2020 21:17:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CKdHAcs9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EF952072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f025c37f;
	Mon, 27 Apr 2020 21:05:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b0e90f4
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Apr 2020 21:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588022208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sneFGCAKrXRSZ09CKiR/b3sP8YqziKnoIC4tFkv52tY=;
 b=CKdHAcs9KHFnAZahCGM4pvgF8vcRfTku1X10KjoKRzDemXklmZRR7V3GZAOMXCNnDBGR4X
 7hlumenLq7/rVwrT5z90uZDaiSTivUT86NTkT10tGgC0pUNL9/OqpZq+BVmfeu7HTUVKEy
 4xLLS4k2jXDRwsEeUOGmGxsWtX/b6sg=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-Sj-g75SbOuCz0i1RHy1kCw-1; Mon, 27 Apr 2020 17:16:46 -0400
X-MC-Unique: Sj-g75SbOuCz0i1RHy1kCw-1
Received: by mail-lf1-f69.google.com with SMTP id y19so8036923lfk.13
 for <wireguard@lists.zx2c4.com>; Mon, 27 Apr 2020 14:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pQ6cSQ4NOD/EcRYBTUoFzvtQJ8BE84XLNBUyGYQoWso=;
 b=K5FMLXaVuHgl+Ybqn/eOcr2on4QH9Ao/6/A5ABlt7kwbqbaDOBNoNAY2kB1rRKdCsI
 LwKCCYtyJGvcdZARfFsD61UsjTJvFDQASXonMwfBSswlXZSI8ZIJzP1CAMYaUxmjO3yI
 SqQkv6SnZZe6Mc1Jym5sQUZ0JwKNC7xdk8laDot83L/DXpswrj0ikYELOdT23fzUf6/p
 ggaPlXlXpH7KWoTsbRHAjR6bVQ1EUW3ggcVkLfgfE/lZTwcgpCW6T4e4J+60nsdUxRwm
 DCOTufBt6iOY5CpUkiTrmcYRsUCvl8bN13E2TzupaFjO/06OLqdDyG48Qa4Cm9Zemy77
 FYOg==
X-Gm-Message-State: AGi0PuZMntzS3nIgTJ8g7ZZEBRyEqRWSBFS3YnUp5NySA8wGGJ32U2xh
 te+d4jq7ADrsz8bVY5gPz0wki6KmPtnK9f0k6GOHORhK4Us3AXent5/+VI5F48xQcXsVtH54awD
 +mrgD//g/bDE3v/cuNjQ3
X-Received: by 2002:a19:ca13:: with SMTP id a19mr16639995lfg.68.1588022205012; 
 Mon, 27 Apr 2020 14:16:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ/PjJHImG1/fIdkB3vo5Rsw2djBqt6xiUD+PahDj4soiPyXITo1r2D1CiF2ttTEOwinPzcGw==
X-Received: by 2002:a19:ca13:: with SMTP id a19mr16639974lfg.68.1588022204716; 
 Mon, 27 Apr 2020 14:16:44 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
 by smtp.gmail.com with ESMTPSA id j13sm12080093lfb.19.2020.04.27.14.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 14:16:43 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id 4E1711814FF; Mon, 27 Apr 2020 23:16:43 +0200 (CEST)
From: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: davem@davemloft.net,
	jason@zx2c4.com
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 netdev@vger.kernel.org, wireguard@lists.zx2c4.com,
 Olivier Tilmans <olivier.tilmans@nokia-bell-labs.com>,
 Dave Taht <dave.taht@gmail.com>,
 "Rodney W . Grimes" <ietf@gndrsh.dnsmgr.net>
Subject: [PATCH net v2] wireguard: use tunnel helpers for decapsulating ECN
 markings
Date: Mon, 27 Apr 2020 23:16:19 +0200
Message-Id: <20200427211619.603544-1-toke@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <87d07sy81p.fsf@toke.dk>
References: <87d07sy81p.fsf@toke.dk>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
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

WireGuard currently only propagates ECN markings on tunnel decap according
to the old RFC3168 specification. However, the spec has since been updated
in RFC6040 to recommend slightly different decapsulation semantics. This
was implemented in the kernel as a set of common helpers for ECN
decapsulation, so let's just switch over WireGuard to using those, so it
can benefit from this enhancement and any future tweaks.

RFC6040 also recommends dropping packets on certain combinations of
erroneous code points on the inner and outer packet headers which shouldn't
appear in normal operation. The helper signals this by a return value > 1,
so also add a handler for this case.

Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Reported-by: Olivier Tilmans <olivier.tilmans@nokia-bell-labs.com>
Cc: Dave Taht <dave.taht@gmail.com>
Cc: Rodney W. Grimes <ietf@gndrsh.dnsmgr.net>
Signed-off-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
---
v2:
  - Don't log decap errors, and make sure they are recorded as frame errors=
,
    not length errors.

 drivers/net/wireguard/receive.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receiv=
e.c
index da3b782ab7d3..ad36f358c807 100644
--- a/drivers/net/wireguard/receive.c
+++ b/drivers/net/wireguard/receive.c
@@ -393,13 +393,15 @@ static void wg_packet_consume_data_done(struct wg_pee=
r *peer,
 =09=09len =3D ntohs(ip_hdr(skb)->tot_len);
 =09=09if (unlikely(len < sizeof(struct iphdr)))
 =09=09=09goto dishonest_packet_size;
-=09=09if (INET_ECN_is_ce(PACKET_CB(skb)->ds))
-=09=09=09IP_ECN_set_ce(ip_hdr(skb));
+=09=09if (INET_ECN_decapsulate(skb, PACKET_CB(skb)->ds,
+=09=09=09=09=09 ip_hdr(skb)->tos) > 1)
+=09=09=09goto ecn_decap_error;
 =09} else if (skb->protocol =3D=3D htons(ETH_P_IPV6)) {
 =09=09len =3D ntohs(ipv6_hdr(skb)->payload_len) +
 =09=09      sizeof(struct ipv6hdr);
-=09=09if (INET_ECN_is_ce(PACKET_CB(skb)->ds))
-=09=09=09IP6_ECN_set_ce(skb, ipv6_hdr(skb));
+=09=09if (INET_ECN_decapsulate(skb, PACKET_CB(skb)->ds,
+=09=09=09=09=09 ipv6_get_dsfield(ipv6_hdr(skb))) > 1)
+=09=09=09goto ecn_decap_error;
 =09} else {
 =09=09goto dishonest_packet_type;
 =09}
@@ -437,6 +439,7 @@ static void wg_packet_consume_data_done(struct wg_peer =
*peer,
 dishonest_packet_type:
 =09net_dbg_ratelimited("%s: Packet is neither ipv4 nor ipv6 from peer %llu=
 (%pISpfsc)\n",
 =09=09=09    dev->name, peer->internal_id, &peer->endpoint.addr);
+ecn_decap_error:
 =09++dev->stats.rx_errors;
 =09++dev->stats.rx_frame_errors;
 =09goto packet_processed;
--=20
2.26.2

