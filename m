Return-Path: <SRS0=Mtl/=6L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2099DC54FCB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Apr 2020 14:47:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87A1520661
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Apr 2020 14:47:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O1ey8BFX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87A1520661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 361709ac;
	Mon, 27 Apr 2020 14:35:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5f03ab9
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Apr 2020 14:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587998821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OzdVBsBHGstbMH1El02hvHi+0llQKRQoRh6OtGOt3Bc=;
 b=O1ey8BFXHK+vSLMHCXjiDYqy7u//U+dO3iCE6Ziyt6TYqCO9Ebj76uHFAIYrRBUqHChYeQ
 JnIQKA5W/eMO3HxSdNfyqTYgw4ANQT6wLtemSIQO8pypZKZdAGGZQNtjTiywMSpcCZhMJH
 lBGpMzpqI+k69+VJXgo0ED5Wj6XK3AA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-UwwjbncuPAauxGuokHtVaA-1; Mon, 27 Apr 2020 10:46:59 -0400
X-MC-Unique: UwwjbncuPAauxGuokHtVaA-1
Received: by mail-lf1-f69.google.com with SMTP id a14so7588389lfl.15
 for <wireguard@lists.zx2c4.com>; Mon, 27 Apr 2020 07:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ddiB4jMApVJxygpX0CgPIMlcKA3qPJtV24eu/rm0sQc=;
 b=NzUsK0id5b4pt5d2VVgDXimwOFOyLSoZ7hyyD0yYKOtZvpL1KSZcmDdz0AO0uxyovD
 p9fuLLGla/hxDm+Rq/uveJPT/mXkVNdwzDapAuffmp35sktNc49RiJZ2oFc0CdqI0CYO
 4ZXs6ECha4peP3stmaGMTv9vQq8djFanuvOjZi6qfA7m+YAnT++AUe+Xmpmdha5Al+y1
 tP90Uf+deFzV8kRSyf+DEUhxlR4spXunybZehZFc3nrsPoaqNazoMPY7RBqg8dRQAj1E
 Janz1XNI94yIhTodQEDXeqonFlzbfOnNq7lCViobG1dWTM3PlyVNkPsk/z5pUOtaAqkp
 rFUg==
X-Gm-Message-State: AGi0Pub1TX+w+GO3S7gXHLla8IUqcMLWCHOSqF6/2g2dA+43X3C5B0ho
 2xCW081yCrsQOgVPPW2CX0/2OvqSYalSGycYThWMLZCxwG9MNIYdkRfLzN14vxJV5yH2lLen7d3
 IwcfC19OsGijevPVzf70D
X-Received: by 2002:a2e:9d83:: with SMTP id c3mr13719997ljj.90.1587998817888; 
 Mon, 27 Apr 2020 07:46:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypLji2QumBqqpxNvq3ae2aYOimecX9XLqyNhWHzRGypgd/7nOtNmrxgSlj4rZhAGQXiENtVr1Q==
X-Received: by 2002:a2e:9d83:: with SMTP id c3mr13719962ljj.90.1587998817309; 
 Mon, 27 Apr 2020 07:46:57 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
 by smtp.gmail.com with ESMTPSA id z21sm10173772ljh.42.2020.04.27.07.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 07:46:56 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id AB6D91814FF; Mon, 27 Apr 2020 16:46:55 +0200 (CEST)
From: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: davem@davemloft.net,
	jason@zx2c4.com
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 netdev@vger.kernel.org, wireguard@lists.zx2c4.com,
 Olivier Tilmans <olivier.tilmans@nokia-bell-labs.com>,
 Dave Taht <dave.taht@gmail.com>,
 "Rodney W . Grimes" <ietf@gndrsh.dnsmgr.net>
Subject: [PATCH net] wireguard: Use tunnel helpers for decapsulating ECN
 markings
Date: Mon, 27 Apr 2020 16:46:25 +0200
Message-Id: <20200427144625.581110-1-toke@redhat.com>
X-Mailer: git-send-email 2.26.2
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
 drivers/net/wireguard/receive.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receiv=
e.c
index da3b782ab7d3..f33e476ad574 100644
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
@@ -446,6 +448,12 @@ static void wg_packet_consume_data_done(struct wg_peer=
 *peer,
 =09++dev->stats.rx_errors;
 =09++dev->stats.rx_length_errors;
 =09goto packet_processed;
+ecn_decap_error:
+=09net_dbg_ratelimited("%s: Non-ECT packet from peer %llu (%pISpfsc)\n",
+=09=09=09    dev->name, peer->internal_id, &peer->endpoint.addr);
+=09++dev->stats.rx_errors;
+=09++dev->stats.rx_length_errors;
+=09goto packet_processed;
 packet_processed:
 =09dev_kfree_skb(skb);
 }
--=20
2.26.2

